using System;
using Google.Protobuf.WellKnownTypes;

namespace protobuf_playground
{
    public sealed partial class Person
    {
        public Person(int id, string name, string email, DateTimeOffset dateOfBirth)
        {
            Id = id;
            Name = name;
            Email = email;
            DateOfBirth = Timestamp.FromDateTimeOffset(dateOfBirth);
        }
    }
}