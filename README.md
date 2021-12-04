# Elevator

The aim of the master's thesis is to present the elevator control algorithm and its implementation as an integrated circuit in the top-down technique. The behavioral description of the digital circuit is written in the Verilog hardware description language. The controller is based on a finite state machine, where the individual states are instructions executed by the elevator.

Features of the designed algorithm:
- modular architecture (possible use for any number of floor)
- simple algorithm, easy to extend
- fast response time
- ressetable buttons
- easy to translate to other programming languages (implemented in verilog)

<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/all.png" width="1000"/>

## Summary 

The subject of the thesis is the elevator control system, which was designed for fabrication as an ASIC system. The software was written in a methodology focused on the development of features. The system architecture has been implemented in the Verilog language using the Aldec Active-HDL and Iverilog tools. One of the main assumptions of the project was to create a system based on existing solutions. An in-depth analysis of the topic of modern elevator management strategies in the first chapter of the work indicates the selection of a zone strategy. The user sends requests using buttons located outside the shaft and inside the cabin as in a standard elevator. 

In addition, there were assumptions about future improvements in elevator systems based on advanced shipping algorithms used in the top high-rise buildings. In the second chapter, the author focuses on the architecture of the designed system and about the methods used to develop and test the software. The process based on features was chosen because of the initial assumption of the elevator. The base of the elevator is a state machine that supports moving over floors and control over the elevator door. 

The modularity of the code was achieved thanks to the analogy of system control on each of the floors. Designed resettable buttons inside the cab allow the passenger to change the choice of destination in the event of a mistake. The last step in building a behavioral description is to check all the added features. Testing is a key issue when designing the ASIC system, as these systems do not have the ability to change the structure after fabrication. 

After receiving satisfactory results, the system was synthesized for a structural description of digital circuits in 50nm CMOS technology. The topography design is made in the Cadence Innovus program in the order described in detail in the paper. The final point in creating an integrated circuit is adding a frame with leads. The completed circuit is ready for fabrication. 

## Algorithm design

<!-- Idea -->
### Idea
Based on the features of the collective control strategy model, an elevator controller algorithm was developed. The main part in the system is the state machine that handles the movement of the floors and the control of the elevator doors. The basic assumption for the project is to propose a system for eight floors.

The vertical movement is done by switching between the floors where the elevator stops and serves passengers and on the floors where the doors are closed and the elevator cart moves in an orderly direction. Based on these observations, an algorithm was proposed consisting of: 8 states of "full" floors, 7 states of transition between floors and the remaining 4 states for servicing the elevator door, waiting and inactivity.

<img src="https://github.com/Fysek/Elevator/blob/master/pictures/state_machine_ends.png" width="600"/>

Following a feature-driven development programming methodology, the first tasks were to create movement across the end floors. Another aspect was the stopping of the intermediate floors when moving from the beginning to the end of the building line. The last two traits were the ability to anticipate a single or multiple change of direction in the middle floors before reaching the second floor to avoid unnecessary driving to the top floor. The state machine was modified with each iteration, which finally took the form shown in the figure below.

<img src="https://github.com/Fysek/Elevator/blob/master/pictures/state_machine_floors.png" width="400"/>

Despite its intricate appearance, vertical movement is very natural. The lift trolley moves along the transitional floors along the entire length of the line, stopping at the appropriate floors. The direction of movement is controlled in each state to avoid unnecessary stops.

### Inside the state machine

#### Floor module (F0, F1, ..., Fx)
The primary function of the elevator is to handle passenger commands. The first stage after reaching the platform is opening the door. It is implemented by setting the _letout_ flag on opening after the first iteration of the algorithm. When executing the open function, the state changes and the door is opened with the appropriate time to leave the cabin. The system reverts to the FLOORx (F0, F1, F2, ... etc.) state and checks the existing requests.

<img src="https://github.com/Fysek/Elevator/blob/master/pictures/elevator_algorithm.png" width="500"/>

Initially, it is checked if the direction continues with the condition _dir == i_dir_, where dir is the direction in that state and i_dir is the direction of the previous state. Depending on the direction, the button combination for request **up (btn_up)** or **down (btn_dn)** is checked. If such commands exist, the next state is established and the door closes. In the event that there are no individual requests, the counter is incremented, which will change the direction of movement in this state when overflowed. The system assumes 5 seconds for a passenger to enter and press a button. Additionally, 500 milliseconds are counted down before changing the direction.

After changing the direction inside the state, the algorithm goes to the right side of the algorithm's path. The first one is the combination of the up buttons, although in this situation the order can be arbitrary, as we assume that the continuation of the direction has already been abandoned. 

Eventually, in the absence of any commands, the system goes into a power saving state. In the case of the first or last floor, the algorithm is simplified because there are no more floors. Note that the idle state is only possible for a full floor and occurs after 5.5 seconds if no buttons have been pressed.

#### Transition-between-floors module (F01, F12, ..., Fxy)

The condition of the passage between the floors depends mainly on the position of the cabin in relation to the platform on the first floor. As shown in the figure, the next state is not decided until the signal _reached_ is set. This means that the elevator has reached the next floor. Each cycle of the sequence follows a rising edge of the clock. Taking into account the 1kHz clock speed and the standard elevator speed equal to 1m/s, it means that the elevator will only travel one millimeter and the system will decide whether to stop or continue the movement.

<img src="https://github.com/Fysek/Elevator/blob/master/pictures/algo_between_floors.png" width="500"/>

In the figure, the transition floors have been marked with the name **FLOORx**, for example **FLOOR45** is a passage between the fourth and fifth floors. The notation does not indicate the direction of travel, it can be an upward movement from the fourth floor to the fifth or vice versa. After receiving information from the sensors that they have reached the floor, the direction of movement is checked. 

If the value is _1_ then the elevator moves up, if it is _0_ then it goes down. The _change_dir()_ function means a change of direction. This can happen when there are no more requests above a given floor, but there are requests from below, and a passenger on that floor has called the elevator down with a request. In this case, the elevator cart on the next platform will process calls with priority in the opposite direction. Finally, if there are no calls on a given floor, the elevator continues without stopping and proceeds to the next transitional state **(up FLOOR56, down FLOOR34)**. 

The solution of polling by the algorithm about the state of the buttons at the final stage of the drive allows for a flexible change of the state of the buttons inside the cabin. The next section introduces the functionality of these **resettable buttons**, which can be changed until you reach the floor. This action allows the passenger to correct the destination and remove unnecessary stops on the floors. It is also worth mentioning that when polling for requests, a strain gauge is taken into account. According to the standards, if the weight measurement exceeds 90% of the permissible weight, the elevator should not accept new passengers. 

The implementation consists in checking whether there is a command to move in the current direction without the desire to get out of passengers during an overloaded elevator.

<!-- Process -->
## Process of making an ASIC

1. Substrate planning with power ring
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/1.png" width="600"/>

2. Power lines 
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/2.png" width="600"/>

3. Entry version with standard cells
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/3.png" width="600"/>

4. Final version after the clock tree synthesis and routing
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/4.png" width="600"/>

5. Exported design from Innovus to Virtuoso
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/5.PNG" width="600"/>

6. Prepared frame with pads
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/6.png" width="600"/>

7. Added the chip to the frame
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/7.png" width="600"/>

8. Wire-bonding connections from ASIC to the pads
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/8.PNG" width="600"/>

9. Final ASIC with poly layers
<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/9.PNG" width="600"/>


<!-- CONTACT -->
## Contact

Mateusz Dyrdol - [@Mateusz Dyrdol](https://www.linkedin.com/in/mateusz-dyrdol/) - mateusz.dyrdol@gmail.com

Project Link: [https://github.com/Fysek/Elevator](https://github.com/Fysek/Elevator/)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Cadence NanoRoute Advanced Digital Router](https://www.cadence.com/content/dam/cadence-www/global/en_US/documents/tools/digital-design-signoff/nano-route-advanced-digital-router-ds.pdf)


