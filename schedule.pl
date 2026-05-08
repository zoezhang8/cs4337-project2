get_all_employees(Employees) :-
    findall(E, employee(E), Employees).

assign_shifts([], [], [], []).

assign_shifts([E|Rest], [E|MorningRest], 
Evening, Night) :-
    \+ avoid_shift(E, morning),
    assign_shifts(Rest, MorningRest, 
Evening, Night).

assign_shifts([E|Rest], Morning, 
[E|EveningRest], Night) :-
    \+ avoid_shift(E, evening),
    assign_shifts(Rest, Morning, 
EveningRest, Night).

assign_shifts([E|Rest], Morning, Evening, 
[E|NightRest]) :-
    \+ avoid_shift(E, night),
    assign_shifts(Rest, Morning, Evening, 
NightRest).

plan(plan(Morning, Evening, Night)) :-
    get_all_employees(AllEmployees),
    assign_shifts(AllEmployees, 
MorningEmps, EveningEmps, NightEmps),
    Morning = [workstation(1, 
MorningEmps)],
    Evening = [workstation(1, 
EveningEmps)],
    Night = [workstation(1, NightEmps)].
