FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
RUN ls
COPY sampleNetCoreAPI.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "sampleNetCoreAPI.dll"]
EXPOSE 5000