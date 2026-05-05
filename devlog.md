Devlog Session 1 - 05/04/2026 10:11PM

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

