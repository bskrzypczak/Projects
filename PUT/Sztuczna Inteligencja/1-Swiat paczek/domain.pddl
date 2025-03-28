(define
	(domain world-of-blocks)
	(:requirements :adl)
	(:predicates
		(on-top ?x ?y)
		(on-floor ?x)
		(clear ?x)
        (lifted ?x)
        (empty)
        (base ?x)
	)

    ; podnies z podlogi
	(:action podnies-z-podlogi
		:parameters (?x)
		:precondition
		(and
			(clear ?x)
			(on-floor ?x)
            (empty)
		)
		:effect
		(and
			(not (on-floor ?x))
			(lifted ?x)
            (not (empty))
		)
	)

    ; podnies z klocka
	(:action podnies-z-paczki
		:parameters (?x ?y)
		:precondition
		(and
			(clear ?x)
			(on-top ?x ?y)
            (empty)
		)
		:effect
		(and
            (clear ?y)
            (not (clear ?x))
			(not (on-top ?x ?y))
			(lifted ?x)
            (not (empty))
		)
	)

    ; opusc na podloge
	(:action opusc-na-podloge
		:parameters (?x)
		:precondition
		(and
			(lifted ?x)
            (not (empty))
		)
		:effect
		(and
            (clear ?x)
			(on-floor ?x)
			(not (lifted ?x))
            (empty)
		)
	)

    ; opusc na paczke
	(:action opusc-na-paczke
		:parameters (?x ?y)
		:precondition
		(and
            (clear ?x)
			(lifted ?y)
            (not (empty))
		)
		:effect
		(and
            (not (clear ?x))
            (clear ?y)
            (not (lifted ?y))
            (on-top ?y ?x)
            (empty)
		)
	)

)