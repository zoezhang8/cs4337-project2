get_all_employees(Employees) :-
    findall(E, employee(E), Employees).

plan(plan(Morning, Evening, Night)) :-
    get_all_employees(AllEmployees),
    Morning = [workstation(1, AllEmployees)],
    Evening = [],
    Night = [].
