using System;
using System.IO;
using System.Threading.Tasks;
using Google.Protobuf;
using Microsoft.AspNetCore.Mvc.Formatters;

namespace protobuf_playground
{
    public class ProtoOutputFormatter : OutputFormatter
    {
        public ProtoOutputFormatter()
        {
            SupportedMediaTypes.Add("application/x-protobuf");
        }

        protected override bool CanWriteType(Type type)
        {
            return typeof(IMessage).IsAssignableFrom(type);
        }

        public override async Task WriteResponseBodyAsync(OutputFormatterWriteContext context)
        {
            switch (context.Object)
            {
                case IMessage msg:
                    // TODO: can we get do this without the extra allocation in MemoryStream?
                    var ms = new MemoryStream();
                    msg.WriteTo(ms);
                    var b = ms.GetBuffer().AsMemory(0, (int)ms.Length);
                    await context.HttpContext.Response.Body.WriteAsync(b);
                    break;
                default:
                    throw new NotSupportedException();
            }
        }
    }
}