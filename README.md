# inline-host-carthage

run this
```bash
cd .carthage
carthage build --platform iOS --no-use-binaries --use-xcframeworks
```

### use local built Carthage in inlineHost
```bash
cd .carthage
# clean build
rm -rf ./Carthage/Build/*
carthage build --platform iOS --no-use-binaries --use-xcframeworks

# backup ./Carthage/Build/* if needed

# complete overwrite Carthage in inlineHost repo
rm -rf {root_of_inlineHost}/Carthage/Build/*
cp -r ./Carthage/Build/* {root_of_inlineHost}/Carthage/Build/
```
