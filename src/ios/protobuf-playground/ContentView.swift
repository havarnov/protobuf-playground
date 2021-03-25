//
//  ContentView.swift
//  protobuf-playground
//
//  Created by Håvar Nøvik on 25/03/2021.
//

import SwiftUI
import Foundation
import Alamofire

struct OptionalView<Value, Content>: View where Content: View {
    var content: (Value) -> Content
    var value: Value
    
    init?(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        guard let value = value else {
            return nil
        }
        self.value = value
        self.content = content
    }
    
    var body: some View {
        content(value)
    }
}

extension Optional where Wrapped: View {
    func fallbackView<T: View>(_ transform: () -> T) -> AnyView? {
        switch self {
            case .none:
                return AnyView(transform())
            case .some(let view):
                return AnyView(view)
        }
    }
    
    func fallbackView<T: View, Value>(_ value: Value?, _ transform: (Value) -> T) -> AnyView? {
        switch self {
            case .none:
                if let unwrapped = value {
                    return AnyView(transform(unwrapped))
                } else {
                    return nil
            }
            case .some(let view):
                return AnyView(view)
        }
    }
}

extension Person {
    func getDateOfBirthString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return  dateFormatter.string(from: self.dateOfBirth.date)
    }
}

enum ContentType {
    case protobuf
    case protobufJson
}

extension ContentType {
    func to_contet_type_string() -> String {
        switch self {
        case .protobuf:
            return "application/x-protobuf"
        case .protobufJson:
            return "application/json+protobuf"
        }
    }
}

class ContentViewModel : ObservableObject {
    @Published var person: Person? = nil
    
    func fetch(contentType: ContentType) {
        self.person = nil
        
        let headers: HTTPHeaders = [.accept(contentType.to_contet_type_string())]
        AF.request(
            "http://localhost:5000/api/person/get-person",
            method: .get,
            headers: headers)
            .response() { response in
                guard let data = response.data else {
                    return
                }
                do {
                    let ct = response.response?.headers["content-type"]
                    if ct == ContentType.protobuf.to_contet_type_string() {
                        let person: Person = try Person(serializedData: data)
                        self.person = person
                    } else {
                        let person: Person = try Person(jsonUTF8Data: data)
                        self.person = person
                    }
                } catch {
                    return
                }
            }
    }
}

struct PersonView: View {
    var person: Person
    
    var body: some View {
        VStack {
            Text(String(person.id))
            Text(person.name)
            Text(person.email)
            Text(person.getDateOfBirthString())
        }
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        OptionalView(self.viewModel.person) { person in
            PersonView(person: person)
        }
        .fallbackView() {
            Text("no person downloaded.")
        }

        Button(action: {self.viewModel.fetch(contentType: .protobufJson) }) {
            Text("Download Person as json")
        }
        Button(action: {self.viewModel.fetch(contentType: .protobuf) }) {
            Text("Download Person as protobuf (binary)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
