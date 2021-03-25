// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: playground.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Error {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var description_p: String {
    get {return _description_p ?? String()}
    set {_description_p = newValue}
  }
  /// Returns true if `description_p` has been explicitly set.
  var hasDescription_p: Bool {return self._description_p != nil}
  /// Clears the value of `description_p`. Subsequent reads from it will return its default value.
  mutating func clearDescription_p() {self._description_p = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _description_p: String? = nil
}

struct Person {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String {
    get {return _name ?? String()}
    set {_name = newValue}
  }
  /// Returns true if `name` has been explicitly set.
  var hasName: Bool {return self._name != nil}
  /// Clears the value of `name`. Subsequent reads from it will return its default value.
  mutating func clearName() {self._name = nil}

  var id: Int32 {
    get {return _id ?? 0}
    set {_id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  var hasID: Bool {return self._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  mutating func clearID() {self._id = nil}

  var email: String {
    get {return _email ?? String()}
    set {_email = newValue}
  }
  /// Returns true if `email` has been explicitly set.
  var hasEmail: Bool {return self._email != nil}
  /// Clears the value of `email`. Subsequent reads from it will return its default value.
  mutating func clearEmail() {self._email = nil}

  var dateOfBirth: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _dateOfBirth ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_dateOfBirth = newValue}
  }
  /// Returns true if `dateOfBirth` has been explicitly set.
  var hasDateOfBirth: Bool {return self._dateOfBirth != nil}
  /// Clears the value of `dateOfBirth`. Subsequent reads from it will return its default value.
  mutating func clearDateOfBirth() {self._dateOfBirth = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _name: String? = nil
  fileprivate var _id: Int32? = nil
  fileprivate var _email: String? = nil
  fileprivate var _dateOfBirth: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Error: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Error"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "description"),
  ]

  public var isInitialized: Bool {
    if self._description_p == nil {return false}
    return true
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self._description_p) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._description_p {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Error, rhs: Error) -> Bool {
    if lhs._description_p != rhs._description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Person: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Person"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "id"),
    3: .same(proto: "email"),
    4: .standard(proto: "date_of_birth"),
  ]

  public var isInitialized: Bool {
    if self._name == nil {return false}
    if self._id == nil {return false}
    if self._email == nil {return false}
    if self._dateOfBirth == nil {return false}
    return true
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self._name) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self._id) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self._email) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._dateOfBirth) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._name {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }
    if let v = self._id {
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 2)
    }
    if let v = self._email {
      try visitor.visitSingularStringField(value: v, fieldNumber: 3)
    }
    if let v = self._dateOfBirth {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Person, rhs: Person) -> Bool {
    if lhs._name != rhs._name {return false}
    if lhs._id != rhs._id {return false}
    if lhs._email != rhs._email {return false}
    if lhs._dateOfBirth != rhs._dateOfBirth {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
