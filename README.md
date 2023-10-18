#  Photos App

This is the first iteration of the Photos App using CLEAN, SOLID and MVVM architecture.

## Video



https://github.com/jmuthialu/Photos/assets/10758530/ea2379f8-a6da-4b9f-8b50-a063f461d676



## CLEAN architecture

There are 3 layers to this architecture with inner layers not aware of the outer layer and code dependency always points inwards.

**Domain**

This is the inner most core layer which has app-wide reusable components for networking, persistence etc.
Network stack, uses a factory pattern which either returns a HTTP network instance or mock instance. This can be scaled to get Persistence service if needed.

**Services**

This houses wrappers around domain components and also can host other services such as Analytics, Notifications etc.
In this example, PhotosAPI uses a factory method to get network service to get remote Photos data.

**Presentation**
This layer handles user facing views organized by Module along with its ViewModels.

## Future iterations

There are many things that can be considered in a real production app which is not applicable for this Photos app because it is simplistic in nature. For example:

- App orchestration for app launch sequencing
- Coordination pattern for SwiftUI is debateable but can be considered based on business need.
- The images should be cached locally with the ability to clear the cache when there is a memory pressure.
- Network stack scales to extend persistence mechanism to provide offline capaibility if neded by business.

## Final thoughts

- I have taken a simplistic approach because of the nature of the app.  "Do not build an ocean to make a tea cup."
- Pragmatic use of patterns and architecturtal style is critical than following bunch of fancy pattern is my approach which has served me well in delivering high quality and high performance apps at GM and at CNN.
