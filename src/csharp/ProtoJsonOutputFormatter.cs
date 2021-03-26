using System;
using System.Text;
using System.Threading.Tasks;
using Google.Protobuf;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Net.Http.Headers;

namespace protobuf_playground
{
    public class ProtoJsonOutputFormatter : TextOutputFormatter
    {
        public ProtoJsonOutputFormatter()
        {
            SupportedMediaTypes.Add(MediaTypeHeaderValue.Parse("application/json+protobuf"));
            SupportedEncodings.Add(Encoding.UTF8);
            SupportedEncodings.Add(Encoding.Unicode);
        }

        protected override bool CanWriteType(Type type)
        {
            return typeof(IMessage).IsAssignableFrom(type);
        }

        public override async Task WriteResponseBodyAsync(OutputFormatterWriteContext context, Encoding selectedEncoding)
        {
            switch (context.Object)
            {
                case IMessage msg:
                    if (!msg.IsInitialized())
                    {
                        throw new ProtoJsonOutputFormatterException($"Proto '{msg.Descriptor.Name}' was not initialized correctly.");
                    }

                    var json = JsonFormatter.Default.Format(msg);
                    await context.HttpContext.Response.WriteAsync(json, selectedEncoding);
                    break;
                default:
                    throw new NotSupportedException();
            }
        }
    }
}