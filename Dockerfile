FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base

# Use hardcoded amd64 SDK image: https://github.com/dotnet/dotnet-docker/issues/1537#issuecomment-755351628
FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim-amd64 AS publish
WORKDIR /app
COPY CovidPassApiNet/ .

RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish

COPY CovidPassApiNet/appsettings.json /app/publish/appsettings.json
COPY CovidPassApiNet/AppleCaCertificate.pem /app/publish/AppleCaCertificate.pem
COPY CovidPassApiNet/AppleDeveloperCertificate.pem /app/publish/AppleDeveloperCertificate.pem
COPY CovidPassApiNet/AppleDeveloperPassword /app/publish/AppleDeveloperPassword

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "CovidPassApiNet.dll"]
