using System;

namespace protobuf_playground
{
    public class ProtoJsonInputFormatterException : Exception
    {
        public ProtoJsonInputFormatterException(string message)
            : base(message)
        {
        }
    }
}