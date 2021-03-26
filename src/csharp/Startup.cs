using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace protobuf_playground
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services
                .AddMvc(o =>
                {
                    o.InputFormatters.Add(new ProtoJsonInputFormatter());
                    o.OutputFormatters.Add(new ProtoJsonOutputFormatter());
                    o.OutputFormatters.Add(new ProtoOutputFormatter());
                })
                .AddFluentValidation();

            services.AddTransient<IValidator<Person>, PersonValidator>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.Use(async (context, func) =>
            {
                try
                {
                    await func();
                }
                catch (ProtoJsonInputFormatterException e)
                {
                    context.Response.StatusCode = 400;
                }
                catch (ProtoJsonOutputFormatterException e)
                {
                    context.Response.StatusCode = 500;
                }
            });

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
