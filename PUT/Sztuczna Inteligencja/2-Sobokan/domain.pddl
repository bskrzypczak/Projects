(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
        (robot ?x)
        (poziomo ?x ?y)
        (pionowo ?x ?y)
        (paczka ?x)
	)

    (:action idz
        :parameters(?x ?y)
        :precondition
            (and
                (robot ?x)
                (not (paczka ?y))
                (or 
                    (pionowo ?x ?y)
                    (poziomo ?x ?y)
                )
            )
        :effect
            (and
                (robot ?y)
                (not (robot ?x))
            )
    )
    
    (:action pchaj
            :parameters(?x ?y ?z)
            :precondition
                (and
                    (robot ?x)
                    (paczka ?y)
                    (not (paczka ?z))
                    (not (robot ?z))
                    (or
                        (and
                            (pionowo ?x ?y)
                            (pionowo ?y ?z)
                        )
                        (and
                            (poziomo ?x ?y)
                            (poziomo ?y ?z)
                        )
                    )
                )

            :effect
                (and
                    (robot ?y)
                    (paczka ?z)
                    (not (paczka ?y))
                    (not (robot ?x))
                )
    )

)