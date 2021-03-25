using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace protobuf_playground
{
    [Route("api/person")]
    [Consumes("application/json+protobuf")]
    [Produces("application/json+protobuf", "application/x-protobuf")]
    public class PersonController : Controller
    {
        private readonly ILogger<PersonController> _logger;

        public PersonController(ILogger<PersonController> logger)
        {
            _logger = logger;
        }

        [HttpPost("echo-person")]
        public async Task<IActionResult> GetPerson([FromBody]Person person)
        {
            await Task.CompletedTask;
            if (!ModelState.IsValid)
            {
                var desc = string.Join(", ",
                    ModelState
                        .SelectMany(s => s.Value.Errors.Select(e => (s.Key, e.ErrorMessage))));
                return BadRequest(new Error() { Description = desc, });
            }

            Console.WriteLine(person.DateOfBirth.ToDateTimeOffset());
            return Ok(person);
        }

        [HttpGet("get-person")]
        public async Task<IActionResult> GetPerson()
        {
            await Task.CompletedTask;
            var p = new Person(
                42,
                "Håvar Nøvik",
                "havar.novik@gmail.com",
                DateTimeOffset.Parse("1987-10-05T00:00:00+02:00"));
            return Ok(p);
        }
    }
}