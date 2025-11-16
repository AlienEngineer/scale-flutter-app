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

This doesn't mean the framework should reinvent the wheel or reimplement existing libraries. Instead, it must create an abstraction layer over these external dependencies (for example, by providing a unified interface for state management).

Why?
1. Having an abstraction layer means that updating an external library only needs to be done once in the framework. Adapting to new versions has zero impact on feature libraries. This is especially important when bumping major versions.
2. This enforces consistency across feature libraries. There will be a single, consistent approach to handling concerns such as state management.

## Feature Libraries

This is the home of all feature work. Feature libraries need to be independent from each other. That means the only dependency in their pubspec.yaml should be the framework library and nothing else.
