FROM mcr.microsoft.com/dotnet/sdk:8.0 
LABEL author="aravindh" 
LABEL project=".netsdk8.0" 
RUN apt update && apt install unzip 
RUN adduser nop 
RUN mkdir app && chown nop /app 
USER nop 
WORKDIR /app 
ARG Download_url="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.70.4/nopCommerce_4.70.4_NoSource_linux_x64.zip" 
RUN wget ${Download_url} 
RUN unzip nopCommerce_4.70.4_NoSource_linux_x64.zip 
RUN mkdir bin && mkdir logs 
EXPOSE 5000 
CMD [ "dotnet","Nop.Web.dll","--urls","http://0.0.0.0:5000" ]