using System;

namespace protobuf_playground
{
    public class ProtoJsonOutputFormatterException : Exception
    {
        public ProtoJsonOutputFormatterException(string message)
            : base(message)
        {
        }
    }
}