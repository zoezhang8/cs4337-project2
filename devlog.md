## May 10, 2025 10:26PM
(corrected previous devlog entry (May 9) because I realized my code was 
actually working improperly

status: debugging and refinement complete -- project complete!

issues encountered and fixed:
1. avoid_shift not being enforced in workstation assignment
employees were being scheduled for shifts they should avoid
the assign_shift predicate wasn't receiving the shift parameter to filter 
elegible workers
I added shift parameter to assign_shift and valid_workers to check both 
avoid_workstation AND avoid_shift to select eligible employees

2. had issues with program hanging on inputs 2 and 3
problem: infinite loops
the custom choose/3 predicate was generating too many combinations and 
caused innefficient backtracking
fix: I replaced choose/3 with append(Workers, _, Candidates) which selects 
workers in order from candidates list, improved efficiency

3. removed unsued predicates
removed filter_idle/3, is_idle/2, can_work_shift/2, can_work_at/2 as 
separate predicates
consolidated logic into get_shift_workstations/2
consolidated worker validation into valid_workers/4 to check both 
workstation and shift constraints together

what I learned:
- append/3 can be used to select N elements from a list by pattern 
matching
- combining constraints early in findall is more efficient than filter 
later

files in this project:
- schedule.pl -- main scheduling  implementation
- devlog.md -- development log
- README

## May 9, 2025

what works:
- plan/1 returns valid schedules for example inputs 1,3,4,5
- plan/1 returns false for impossible example 2
- all employees assigned eactly once
- no double assignments(double_work false)
- avoid_shift constraints are respected (daniel not in night shift)
- avoid_workstation constraints are respected (ophelia not in station 1 or 3)
- workstation_idle respected (station 3 not used in morning)
- min/max workstation constraints satisfied

test results from example-input-1.pl:
?- plan(Plan), no_work(Plan,_).
false.

?- plan(Plan), double_work(Plan,_).
false.

?- plan(Plan), works_at(Plan,_,ophelia,1).
false.

?- plan(Plan), works_at(Plan,_,ophelia,3).
false.

?- plan(Plan), works_at(Plan,night,daniel,_).
false.

?- plan(Plan), works_at(Plan,morning,_,3).
false.

files:
- schedule.pl
- devlog.md
- readme.md
(- example-inpupt-1-5)

lessons learned:
- prolog syntax is very sensitive- proper period placement is needed
- comments can cause syntax errors if not used correctly
- cut operator and fail can be used to ctrl backtracking


## May 8, 2026 3:43PM

Current status: 
- working schedule.pl with shift 
assignnment that respects avoid_shift 
constraints
- all 26 employees successfully assigned 
to shifts
- avoid_shift(daniel, night) works 
- testing.pl fixed and loading w/o errors
- no_work(Plan, Worker) returns empty list

limitations so far:
- still need min/max constraints
- workstation 1 has min = 2, max = 4 but 
holds 26 employees
- workstations 2 and 3 not used yet



 ## 05/06/2026 1:17PM
-implemented assign shifts that distributes 
employees across morning/evening/night
- avoid_shift constraints are properly enforced 
and verified with test-shift-only.pl
- multiple valid shift assignments pressing ;

test results w shift-only.pl:
- employee a avoids night
- employee b avoids evening
- employee c has no constraints, appears in all 
shfits
- found 10+ valid shift distributions

next steps:
- implement workstation with min/max constraints
- add avoid_workstation filtering
- test w example-input1.pl 

files updated:
- schedule.pl
- test-shift-only.pl: test for shift constraints
- test-input1.pl: updated the test file to have 
the full data given from the assignment

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

## 05/04/2026 10:11PM
FIRST DEVLOG SESSION

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

