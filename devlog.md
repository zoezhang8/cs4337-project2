## 05/05/2026 4:25PM
(side note, I realized that I put my previous 
entry before this (05/04 11:34PM at the very 
bottom of this devlog, under my first devlog 
session (05/04 10:11PM). scroll down to see that 
entry!)

yay finally got a simplified but working version 
of schedule.pl to load. 

what works:
- 'get_all_employees/1' to colect employees from 
test-imput.pl
- 'plan/1' to return a plan with all employees 
assignemd to workstation 1 on morning shift

what I learned:
- prolog syntax is very sensitive
- minimal version helped isolate syntax issues

next steps:
- add shift assignment to distribute across 
morning/evening/night
- add workstation assignment w min/max 
constraints
- add constraint checking

files so far:
- schedule.pl
- test-input.pl
- test-input2.pl - began working on a second test 
option, haven't completed yet

##Devlog Session 1 - 05/04/2026 10:11PM

##Initial thoughts
Hello, this is my first session working on CS4337 
project 2. this project requires me to create a 
prolog backend for work scheduling webapp. I need 
to implement plan/1 that takes schedules for 
morning, evening, and night shifts. each schedule 
is a list of workstation/2 structures.

input facts will include: 
- employee/1 will list all employees
- workstation/3 is workstation with min or max 
employees needed 
- workstation_idle/2 will be the workstations 
idle on certain shifts
- avoid_workstation/2 are employees who can't 
work certain workstations
- avoid_shift/2 are employees who can't work 
certain shifts

every employee needs to work exactly one shfit at 
exactly one workstation

##plan
1. set up git
2. create devlog
3. make initial commit
4. understand problem structure
5. start designing the approach for plan/1

##implementation plan
- collect all employees
- collect all workstations w their requirements
- assign employee to shift/workstation
- ensure all constraints are satisfied

will probably need helper predicates


## 05/04/2026 11:34PM -- start implementation
started creating schedule.pl, created skeleton 
for plan/1 to generate Morning,Evening,Night 
plan. 

