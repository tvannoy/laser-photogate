# System Design Overview

The photogate system comprises two main components: a *controller*, and a *responder*. At a high level, the controller is reponsible for
- managing the state of the system.
- measuring how much time passed between the car passing the start line and the finish line.
- displaying the car's run time.

The responder is responsible for reporting when the car passed the finish line; this is done by sending a message to the controller.

As shown in the diagram below, both the controller and reponder have an associated laser on the other side of the track. 

![High-level block diagram of the photogate system](../assets/system-overview.svg)

When the controller's laser is blocked by the car, the timing starts. Once the car interrupts the responder's laser beam, the the timing stops.


## Algorithm

The following state diagrams show the overall flow of the algorithm.


```mermaid
---
title: Controller
---
stateDiagram-v2
    [*] --> idle
    idle --> idle
    idle --> waitForCar: button pressed
    waitForCar --> waitForCar
    waitForCar --> startTimer: laser triggered
    startTimer --> notifyResponder
    notifyResponder --> waitForResponder
    waitForResponder --> waitForResponder
    waitForResponder --> calculateRunTime: notifcation receieved
    calculateRunTime --> idle
```

```mermaid
---
title: Responder
---
stateDiagram-v2
    [*] --> waitForNotification
    waitForNotification --> waitForNotification
    waitForNotification --> waitForCar: notification receieved
    waitForCar --> waitForCar
    waitForCar --> notifyController: laser triggered
    notifyController --> waitForNotification

```
