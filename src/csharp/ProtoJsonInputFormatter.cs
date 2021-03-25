using System;
using System.IO;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Google.Protobuf;
using Google.Protobuf.Reflection;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Net.Http.Headers;

namespace protobuf_playground
{
    public class ProtoJsonInputFormatter : TextInputFormatter
    {
        public ProtoJsonInputFormatter()
        {
            SupportedMediaTypes.Add(MediaTypeHeaderValue.Parse("application/json+protobuf"));
            SupportedEncodings.Add(Encoding.UTF8);
            SupportedEncodings.Add(Encoding.Unicode);
        }

        protected override bool CanReadType(Type type)
        {
            return typeof(IMessage).IsAssignableFrom(type);
        }

        public override async Task<InputFormatterResult> ReadRequestBodyAsync(InputFormatterContext context, Encoding encoding)
        {
            var descriptor = context
                    .ModelType
                    .GetProperty(
                        "Descriptor",
                        BindingFlags.Public | BindingFlags.Static)
                    .GetValue(null, null)
                as MessageDescriptor;
            var httpContext = context.HttpContext;
            using var reader = new StreamReader(httpContext.Request.Body, encoding);
            var json = await reader.ReadToEndAsync();
            var res = JsonParser.Default.Parse(json, descriptor);
            return InputFormatterResult.Success(res);
        }
    }
}