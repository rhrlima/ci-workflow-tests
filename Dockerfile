# Use the official .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the .fsproj file and restore dependencies
COPY src/myfsharpapp/myfsharpapp.fsproj .
RUN dotnet restore

# Copy the remaining source code and build the application
COPY src/myfsharpapp ./
RUN dotnet build -c Release -o out

# Create the runtime image
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS runtime

# Set the working directory in the container
WORKDIR /app

# Copy the build output from the build stage
COPY --from=build /app/out .

# Set the entry point for the application
ENTRYPOINT ["dotnet", "myfsharpapp.dll"]
