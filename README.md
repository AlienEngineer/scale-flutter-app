# scale-flutter-app (WIP)

This repo is one of four repositories for a proof-of-concept (POC). The POC aims to explore ways to develop Flutter apps at scale, where multiple teams contribute daily to add new features and maintain the codebase. 

## Overall Architecture

The app only knows about its direct dependencies: feature libraries and the framework. External libraries are always used by the framework and never directly by feature libraries.

<img width="582" height="257" alt="image" src="https://github.com/user-attachments/assets/ba0ca9c6-0ffc-4143-ba19-247c8c606fe1" />

## Breaking Changes

The handling of breaking changes must always be planned in advance. Breaking changes should be scheduled to allow feature libraries time to adapt. Any unplanned breaking change must be reverted and reintroduced in a planned way.

Unplanned breaking changes create a lot of alignment work between feature libraries and put pressure on teams to keep up with the latest version. This must never happen.

## Framework Library

The framework library is meant to provide cross‑cutting functionality to be used by all feature libraries. Examples include state managers (Bloc, get_it, etc.), HTTP requests, inversion-of-control containers, and so on.

This doesn't mean the framework should reinvent the wheel or reimplement existing libraries. Instead, it must create an abstraction layer over these external dependencies (for example, by providing a unified interface for state management). Yet, this is not meant to be a simple indirection to external libraries. Using just indirections would not prevent as effectively breaking changes or adaptations. The focus should be: what do feature libraries need to achieve and define how they can acomplish their goals.

Why?
1. Having an abstraction layer means that updating an external library only needs to be done once in the framework. Adapting to new versions has zero impact on feature libraries. This is especially important when bumping major versions.
2. This enforces consistency across feature libraries. There will be a single, consistent approach to handling concerns such as state management.

## Feature Libraries

This is the home of all feature work. Feature libraries need to be independent from each other. That means the only dependency in their pubspec.yaml should be the framework library and nothing else.

How many features one Feature Library should contain it's still something that needs definition, I would argue that it should only be business related features. Yet, more definition guidelines must be created. One or more teams can contribute to a feature library, yet, only one team can own a feature library. Ownership means responsibility, the owners must make sure guidelines are applied and all quality aspects are being taken into consideration.

## Semantic Versioning

This needs to be applied to all feature libraries and framework. Semantic Versioning is specially important for Flutter as it is the basis for version updates in pubspec.yaml. References to libraries must be made using ^x.x.x to ensure updating libraries is smooth as possible.

The only time x.x.x should be use is when a given version is broken and therefore we must use the previous one. This of course is a temporary measure.

## Ownership & Collaboration

Each Library, Framework and App must have a owner team. Other teams can collaborate under the guidance of the owner team. This is meant to ensure, that teams hold each other accountable. Not accepting breaking changes, nor accepting under quality code.
