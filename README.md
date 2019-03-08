# OCTOsmart
[PureQML](https://pureqml.com/) based SmartTV application with chip8 games from [octojam](http://www.awfuljams.com/octojam-v) event. This app is published at [LG Content Store](https://www.lgappstv.com/) for WebOS TV and at Samsung TV Apps for Tizen TV

# Build & Run
First of all don't forget to init and update submodules:

`
git submodule init && git submodule update
`

To build the app locally just call PureQML build script:

`
./qmlvore/build
`
The result files will be in `build.<PLATFORM>` folder where platform can be:

`web|webos|netcast|tizen|androidtv`

If you want to run it on TV you can use [SmartTV deployer](https://github.com/comrat/smart-tv-deployer) which is added in project as submodule:
For examples to run it on WebOS TV with name "MyTV" use this command:

`
./smart-tv-deployer/build.py -p webos -p MyTV
`
