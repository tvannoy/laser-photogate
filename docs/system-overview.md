# System Design Overview

The photogate system comprises two main components: a *controller*, and a *responder*. At a high level, the controller is reponsible for
- managing the state of the system.
- measuring how much time passed between the car passing the start line and the finish line.
- displaying the car's run time.

The responder is responsible for reporting when the car passed the finish line; this is done by sending a message to the controller.

As shown in the diagram below, both the controller and reponder have an associated laser on the other side of the track. 
<figure>

![High-level block diagram of the photogate system](../assets/system-overview.svg)

<figcaption>High-level blaock diagram of the photogate system.</figcaption>
</figure>

When the controller's laser is blocked by the car, the timing starts. Once the car interrupts the responder's laser beam, the the timing stops.

<svg viewBox="-0.5 -0.5 692 526">
    <use href="../assets/system-overview.drawio.svg#svg" />
</svg>
