# Writing Prompt

A writing prompt application designed to showcase an approach to a "Clean"er architecture in Flutter with Bloc and RxDart, including Unit, Widget and Integration Testing

## Project Overview

![](https://media.giphy.com/media/2uIfed7omEos98lXST/giphy.gif)

This app fetches data from `https://ineedaprompt.com` API and displays it on screen. The user can then ask for a new prompt, or see a history of prompts.

## Project Structure

The project is structured as follows:

```
|_data
 \__local
 \__remote
|_domain
 \__bloc
 \__managers
 \__mappers
 \__models
|_presentation
 \__styles
 \__ui
 \__utils
 main.dart
```

### Data

The data stores both the API and local database information that will be displayed in the app.
All the API endpoints, models, serialized classes and database helpers should be put here.

### Domain

This layer connects the data layer to the presentation, preparing the information received from the local database or the server and managing the app state (i.e., if we need to fetch new data, fetch new data)

To communicate with the widgets, we use the [BLOC architecture](https://medium.com/flutter-io/build-reactive-mobile-apps-in-flutter-companion-article-13950959e381) and `StreamBuilders`.

### Presentation

Since Flutter does not have a `resources` folder as we see in Android, we need to declare each resource on a file. As such, I created the `styles` (naming to be changed) folder which include information about colors, strings and dimensions used in the app.

Here we have all the widgets of the app, and their connection to the domain layer via the `bloc`.

### main.dart

Since I chose not to use a dependency injection framework, this is where I create all the classes to be used in the app, inherited by each widget.

## Testing

Though the app is not fully tested, I strived to show how to:
- `Write Unit Tests` that test a small module (in this case method) of a class. They tested the network layer and domain layer
- `Widget Tests` that assure that the `bloc` is providing the correct information to the widgets
- `Integration Test` that test a normal app use, expecting a new prompt to be shown on screen.

## To-Do List
- [ ] Create more App animations
- [ ] Include more app features, such as share
- [ ] Create more tests
