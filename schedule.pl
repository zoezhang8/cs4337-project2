% Get all employees
get_all_employees(Employees) :-
    findall(E, employee(E), Employees).

% Get all workstations for a shift (filtering idle ones)
get_shift_workstations(Shift, Workstations) :-
    findall(ws(W, Min, Max), 
        ( workstation(W, Min, Max),
          \+ workstation_idle(W, Shift)
        ), 
        Workstations).

% Check if employee can work a shift
can_work_shift(E, Shift) :- 
    \+ avoid_shift(E, Shift).

% Check if employee can work at a workstation
can_work_at(E, W) :- 
    \+ avoid_workstation(E, W).

% Get valid workers for a workstation and shift
valid_workers(W, Shift, Employees, Valid) :-
    findall(E,
        ( member(E, Employees),
          can_work_at(E, W),
          can_work_shift(E, Shift)
        ),
        Valid).

% Assign employees to all workstations for one shift
assign_shift([], _, Employees, [], Employees).
assign_shift([ws(W, Min, Max)|Workstations], Shift, Employees, 
             [workstation(W, Workers)|Rest], Remaining) :-
    valid_workers(W, Shift, Employees, Candidates),
    length(Candidates, Len),
    Len >= Min,
    MaxAllowed is min(Max, Len),
    between(Min, MaxAllowed, N),
    length(Workers, N),
    append(Workers, _, Candidates),
    subtract(Employees, Workers, NextEmployees),
    assign_shift(Workstations, Shift, NextEmployees, Rest, Remaining).

% Main plan predicate
plan(plan(Morning, Evening, Night)) :-
    get_all_employees(All),
    
    get_shift_workstations(morning, MWS),
    get_shift_workstations(evening, EWS),
    get_shift_workstations(night, NWS),
    
    assign_shift(MWS, morning, All, Morning, Remaining1),
    assign_shift(EWS, evening, Remaining1, Evening, Remaining2),
    assign_shift(NWS, night, Remaining2, Night, []).
