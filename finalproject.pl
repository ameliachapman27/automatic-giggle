prereqs(cs15, []).
prereqs(cs16, [cs15]).
prereqs(cs17, []).
prereqs(cs18, [cs17]).
prereqs(cs22, []).
prereqs(cs32, [cs16, cs18]).
    /* dotted line (either course) */
prereqs(cs33, [cs16, cs18]).
    /* dotted line (either course) */
prereqs(cs126, [cs22, cs22]).
    /* solid line (both courses) */
prereqs(cs141, [cs22, cs16, cs18]).
    /* solid line for cs22 and dotted lines for cs16/cs18 so I'm not really sure what's going on */
prereqs(cs166, [cs33]).


offered(fall,[cs15, cs17, cs33, cs141, cs126]).
fall(Course) :- offered(fall, Courses), member(Course, Courses).
offered(spring,[cs16, cs18, cs22, cs32, cs166]).
spring(Course) :- offered(spring, Courses), member(Course, Courses).

has_prereqs(Course, Prerequisite) :- prereqs(Course, Prerequisites), member(Prerequisite, Prerequisites).
no_prereqs(Course) :- not(has_prereqs(Course, Prerequisite)).

intro(Course) :- 
    (fall(Course), no_prereqs(Course));
    (spring(Course), has_prereqs(Course, Prerequisite), no_prereqs(Prerequisite)).
    /* is intro if offered fall AND no prerequisite OR offered spring AND prerequisite has no prerequisite */

intermediate(Course) :- 
    not(intro(Course)), 
    has_prereqs(Course, Prerequisite), 
    intro(Prerequisite). 
    /* is intermediate if not intro and if prereqs are intros */

upper_level(Course) :-
    (has_prereqs(Course, Prerequisite), not(intro(Prerequisite)));
    
    (has_prereqs(Course, cs22), 
    has_prereqs(Course, Prerequisite), intro(Prerequisite)).
    /* is upper level if the prereqs are not intros, or if its prereqs are cs22 and intros */



student(mark, []).
student(elon, []).
student(sheryl, []).
student(jeff, []).

has_taken(Student, Course) :- 
    (student(Student, Courses), member(Course, Courses));
    (has_prereqs(CanTakeClass, Course), can_take(Student, CanTakeClass)).
    /* If student can take a certain class, then they have taken its prerequisites and its prerequisite's prerequisites */
can_take(Student, Course) :- 
    has_prereqs(Course, Prerequisite),
    has_taken(Student, Prerequisite).
    /* Student can take class if they have taken its prerequisites */
can_take(Student, cs141) :- 
    has_taken(Student, cs22),
    (has_taken(Student, cs16); has_taken(Student, cs)).
can_take(Student, cs126) :- has_taken(Student, cs22), has_taken(Student, cs32).

has_taken(mark, cs141).
can_take(elon, [cs32, cs18]).
can_take(sheryl, Course) :- upper_level(Course).
has_taken(jeff, not(cs32)).
can_take(jeff, cs32).