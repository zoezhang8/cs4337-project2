# CS4337 Project 2: Work Schedule Planner
## Zoe Zhang zqz220000
## Files
- 'schedule.pl'- main implementation of plan/1
- 'devlog.md' - devloper log

## How to Run
1. start SWI Prolog
```bash
swipl

2. load a test file
?- ['example-input-1'].

3. load schedule implementation
?- [schedule].

4. generate shedule
?- plan(Plan).

the plan/1 predicate returns a schedule in the format:
plan(MorningSchedule, EveningSchedule, NightSchedule)

each schedule is a list of workstation/2 structures:
workstation(StationID, [ListOfEmployees])

constraints:
- every employee works eactly one shift at exactly one workstation
- workstation min/max employee requirements are met
- idle workstations are not used in their idle shift
- avoid_workstation constraints are enforced
- avoid_shift constraints are enforced

## Example output:
116 ?- ['example-input-1.pl'].
true.

117 ?- [schedule].
true.

118 ?- plan(Plan).
Plan = plan([workstation(1, [ulysses, bob]), workstation(2, [zoey, ximena, jack, 
harry, mira])], [workstation(1, [erica, tim]), workstation(2, [peter, larry, ginny, 
daniel, yusuf]), workstation(3, [frank])], [workstation(1, [walter, charlie]), 
workstation(2, [ophelia, venessa, sarah, ryan, quinn]), workstation(3, [alice, 
kimberly, nick, iris])]) ;
false.

