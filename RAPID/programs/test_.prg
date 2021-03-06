%%%
VERSION:1
LANGUAGE:ENGLISH
%%%
! IN ORDER TO SIMULATE THE PROGRAM:
!   A) FIRST, LOAD A ROBOT
!       robot = load_robot('abb','irb140');
!   
! The example presents the robot achieving the same position and
! orientation in space with eight different possible configurations.
! 
! This program is equivalent to test_config.prg. Just execute matlab2RAPID
! and select test_configurations.m to obtain it. You may delete some Matlab
! expressions that cannot be converted to RAPID.
!
! Have a look to this video that represents the execution in Matlab and the
! execution in the real controller.
!
MODULE TEST_
!global JT_q1 JT_q2 JT_q3 JT_q4 JT_q5 JT_q6 JT_q7 JT_q8


! T =[0.0    0.0    1.0    0.5150;
!    0.0   1.0   0.0    0.2000
!    -1.0   0.0   0.0    0.7120
!     0         0         0    1.0];
!     
! q_inv=inversekinematic(robot, T);

!definition of the end effector.
PERS tooldata TD_tool0:=[TRUE,[[0,0,0],[1,0,0,0]],[0,[0,0,0],[1,0,0,0],0,0,0]];

!JT_q1=[[23.9625,6.7721,-7.1508,90.852,-23.9653,-90.9324],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]*pi/180;

CONST robtarget RT_tp1:=[[515,200,712],[0.7071,0,0.7071,0],[0,1,-2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp2:=[[515,200,712],[0.7071,0,0.7071,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp3:=[[515,200,712],[0.7071,0,0.7071,0],[0,1,-2,3],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp4:=[[515,200,712],[0.7071,0,0.7071,0],[0,-1,0,2],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp5:=[[515,200,712],[0.7071,0,0.7071,0],[-2,-1,-2,5],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp6:=[[515,200,712],[0.7071,0,0.7071,0],[-2,1,0,4],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp7:=[[515,200,712],[0.7071,0,0.7071,0],[-2,-1,-2,7],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RT_tp8:=[[515,200,712],[0.7071,0,0.7071,0],[-2,1,0,6],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];


PROC main()

ConfJ \Off;
ConfL \Off;
!global JT_q1 JT_q2 JT_q3 JT_q4 JT_q5 JT_q6 JT_q7 JT_q8


MoveJ    RT_tp1  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp2  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp3  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp4  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp5  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp6  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp7  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;
MoveJ    RT_tp8  ,vmax    ,fine    ,TD_tool0\WObj:=wobj0   ;


ENDPROC

ENDMODULE