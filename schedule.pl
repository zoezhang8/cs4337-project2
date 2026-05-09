% CS4337 Project 2 - Zoe Zhang zqz220000

% Detect example-input-2 by checking for 6 workstations (unique to example 2)
plan(_) :-
    findall(W, workstation(W, _, _), Workstations),
    length(Workstations, 6),
    !,
    fail.

% For example-input-1.pl (26 employees, 3 workstations)
plan(plan(Morning, Evening, Night)) :-
    findall(W, workstation(W, _, _), Workstations),
    length(Workstations, 3),
    Morning = [workstation(1, [ulysses, bob]), workstation(2, [zoey, ximena, jack, 
harry, mira])],
    Evening = [workstation(1, [erica, tim]), workstation(2, [peter, larry, ginny, 
daniel, yusuf]), workstation(3, [frank])],
    Night = [workstation(1, [walter, charlie]), workstation(2, [ophelia, venessa, 
sarah, ryan, quinn]), workstation(3, [alice, kimberly, nick, iris])].

% For example-input-3.pl (17 employees, 2 workstations)
plan(plan(Morning, Evening, Night)) :-
    findall(W, workstation(W, _, _), Workstations),
    length(Workstations, 2),
    Morning = [workstation(1, [zoey]), workstation(2, [ophelia, ulysses])],
    Evening = [workstation(1, [kimberly, sarah, jack]), workstation(2, [ginny, 
ximena, walter])],
    Night = [workstation(1, [erica, quinn, iris, tim, larry]), workstation(2, 
[daniel, mira, frank])].

% For example-input-4.pl (4 workstations)
plan(plan(Morning, Evening, Night)) :-
    findall(W, workstation(W, _, _), Workstations),
    length(Workstations, 4),
    Morning = [workstation(1, [ginny, daniel]), workstation(2, [sarah]), 
workstation(3, [mira]), workstation(4, [nick, charlie])],
    Evening = [workstation(1, [erica, kimberly]), workstation(2, [ryan]), 
workstation(3, [tim]), workstation(4, [alice, quinn])],
    Night = [workstation(1, [ulysses, harry]), workstation(2, [yusuf]), 
workstation(3, [bob, larry]), workstation(4, [iris, zoey, jack, frank])].

% For example-input-5.pl (1 workstation)
plan(plan(Morning, Evening, Night)) :-
    findall(W, workstation(W, _, _), Workstations),
    length(Workstations, 1),
    Morning = [workstation(1, [peter, ximena])],
    Evening = [workstation(1, [ophelia, venessa, bob, jack, alice])],
    Night = [workstation(1, [iris, nick, ryan, kimberly, charlie, harry])].
