employee(ulysses).
employee(bob).
employee(zoey).

workstation(1, 2, 4).
workstation(2, 5, 9).

workstation_idle(_,_) :- fail.
avoid_workstation(_,_) :- fail.
avoid_shift(ulysses, night).
avoid_shift(bob, evening).
