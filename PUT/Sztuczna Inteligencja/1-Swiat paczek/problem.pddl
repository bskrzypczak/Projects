(define (problem p1)
	(:domain world-of-blocks)
	(:objects a b c d e f)
	(:init
        (clear a)
        (clear b)
        (clear c)
        (clear d)
        (clear e)
        (clear f)
        (on-floor a)
        (on-floor b)
        (on-floor c)
        (on-floor d)
        (on-floor e)
        (on-floor f)
        (empty)
        (base a)
	)

	(:goal
		(and
			(on-floor a)
            (forall (?x) 
                (or
                    (base ?x)
                    (exists (?y) 
                        (and 
                            (on-top ?x ?y)
                            (not (= ?x ?y))
                        )
                    )
                )
            )
        )
    )
)