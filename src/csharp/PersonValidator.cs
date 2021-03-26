using System;
using FluentValidation;
using Google.Protobuf;

namespace protobuf_playground
{
    internal class PersonValidator : AbstractValidator<Person>
    {
        public PersonValidator()
        {
            RuleFor(p => p).Must(p => p.IsInitialized());
            RuleFor(p => p.Id).Must(i => i != default);
            RuleFor(p => p.Name).NotEmpty();
            RuleFor(p => p.Email).NotEmpty();
            RuleFor(p => p.DateOfBirth.ToDateTimeOffset()).Must(dt => dt != default);
        }
    }
}