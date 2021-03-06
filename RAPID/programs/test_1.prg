%%%
VERSION:1
LANGUAGE:ENGLISH
%%%
! IN ORDER TO SIMULATE THE PROGRAM:
!   A) FIRST, LOAD A ROBOT
!       robot = load_robot('abb','irb140');
!   B) NEXT, LOAD SOME EQUIPMENT.
!       robot.equipment = load_robot('equipment','tables/table_small');
!       OR
!       robot.equipment = load_robot('equipment','bumper_cutting');
!   C) NOW, LOAD AN END TOOL
!       robot.tool= load_robot('equipment','end_tools/parallel_gripper_0');
!   D) FINALLY, LOAD A PIECE TO GRAB BY THE ROBOT
!       robot.piece=load_robot('equipment','cylinders/cylinder_tiny');
!
!   E) IF NECESSARY, CHANGE THE POSITION AND ORIENTATION OF THE ROBOT'S
!   BASE
!       robot.piece.T0= [1 0 0 -0.35;
!                        0 1 0 -0.55;
!                        0 0 1 0.2;
!                        0 0 0 1]; 
!
! during the simulation, call simulation_open_tool; to open the tool and 
! simulation_close_tool; to close it.
! To grip the piece, call simulation_grip_piece; and
! simulation_release_piece to release it.
! The call to each function must be correct, thus, typically the correct
! sequence is:
! simulation_open_tool;
! approach the piece to grab.
! simulation_close_tool;
! simulation_grip_piece; --> the piece will be drawn with the robot
! move to a different place
! simulation_open_tool;
! simulation_release_piece

MODULE TEST_1

CONST robtarget RT_tp1:=[[400,300,700],[1,-0,-0,-0],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp2:=[[100,-400,700],[0,-0,0,1],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

!definition of the end effector.
PERS tooldata TD_tool0:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];

!finally, call the main function

PROC main()

ConfJ \Off;
ConfL \Off;

MoveJ    RT_tp1  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp2  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveL    RT_tp1  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0;
MoveL    RT_tp2  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0;

ENDPROC

ENDMODULE