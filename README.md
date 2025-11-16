# scale-flutter-app
This repo is 1 out of 4 repos for a POC creation. The POC itself aims to explore ways to develop Flutter Apps in large scale, where multiple teams contribute daily to develop new features and maintain previously developed features.

## Overall Architecture
The App only knows about it's direct dependencies, feature libraries and frameworks. External libraries are always used by the Framework and never directly.

<img width="582" height="257" alt="image" src="https://github.com/user-attachments/assets/ba0ca9c6-0ffc-4143-ba19-247c8c606fe1" />

## Breaking Changes
The way to deal with breaking changes must always be planned. Meaning, it always have to be done with time to allow for feature libraries adaptation. Any unplanned breaking change must be reverted and a plan needs to be created. One way would be to deprecate any type that needs a breaking change, and then in time plan the date to bump the major version.

Unplanning breaking changes will create a lot of work in alignmente between all feature libraries which will put pressure on those teams to keep up with the latest version. **This must never happen.** If this happens by mistake it needs to be fixed, not aligned.

## Framework Library
The framework library, is meant to provide cross funcionaly to be used by all feature libraries. Examples are: state managers (Bloc, get it, etc), http requests, Inversion Of Control containers, etc. 
This doesn't mean that the framework needs to reinvent the weel, it shouldn't redo existing libraries, but instead it must create an abstraction layer for these external dependendies. e.g. using Bloc library can be used only indirectly by features, the framework needs to create a layer of abstraction that can have the necessary funcionalities that feature libraries need to control state. 

Why? There are 2 main reasons for this:
1. Having an abstract layer means that updating an external library only once, adapting to new versions has 0 impact on feature libraries. This is specially important, when we want to bump major versions of external libraries.
2. This will force feature libraries to be more consistent in the way they develop their code bases. Meaning, there will be only 1 way to handle state.

## Feature Libraries
This is the home of all feature work. These need to be independent from each other. This means, the only dependency in the pubspec.yaml file is the Framework Library and nothing else.
