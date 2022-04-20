# flutter-demo-application-with-go-server


dart pub global activate protoc_plugin

export PATH="$PATH:$HOME/.pub-cache/bin"

protoc --dart_out=grpc:chat -Iprotos protos/helloworld.proto

Chat folder in which generated files will be saved 
And protos folder in which proto file is saved
