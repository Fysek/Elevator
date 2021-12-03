# Elevator

The aim of the master's thesis is to present the elevator control algorithm and its implementation as an integrated circuit in the top-down technique. The behavioral description of the digital circuit is written in the Verilog hardware description language. The controller is based on a finite state machine, where the individual states are instructions executed by the elevator.


<img src="https://github.com/Fysek/Elevator/blob/master/pictures/asic/all.png" width="1000"/>

## Summary 

The subject of the thesis is the elevator control system, which was designed for fabrication as an ASIC system. The software was written in a methodology focused on the development of features. The system architecture has been implemented in the Verilog language using the Aldec Active-HDL and Iverilog tools. One of the main assumptions of the project was to create a system based on existing solutions. An in-depth analysis of the topic of modern elevator management strategies in the first chapter of the work indicates the selection of a zone strategy. The user sends requests using buttons located outside the shaft and inside the cabin as in a standard elevator. 

In addition, there were assumptions about future improvements in elevator systems based on advanced shipping algorithms used in the top high-rise buildings. In the second chapter, the author focuses on the architecture of the designed system and about the methods used to develop and test the software. The process based on features was chosen because of the initial assumption of the elevator. The base of the elevator is a state machine that supports moving over floors and control over the elevator door. 

The modularity of the code was achieved thanks to the analogy of system control on each of the floors. Designed resettable buttons inside the cab allow the passenger to change the choice of destination in the event of a mistake. The last step in building a behavioral description is to check all the added features. Testing is a key issue when designing the ASIC system, as these systems do not have the ability to change the structure after fabrication. 

After receiving satisfactory results, the system was synthesized for a structural description of digital circuits in 50nm CMOS technology. The topography design is made in the Cadence Innovus program in the order described in detail in the paper. The final point in creating an integrated circuit is adding a frame with leads. The completed circuit is ready for fabrication. 
