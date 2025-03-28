(define
	(domain hanoi)
	(:requirements :adl)
    (:types klocek wieza)
	(:predicates
        (na-wiezy ?k - klocek ?w - wieza)
        (mniejszy ?k1 ?k2 - klocek)
	)

    (:action przesun-na-pusty
        :parameters(?w1 ?w2 - wieza ?k - klocek)
        :precondition
            (and
                (not(exists (?k2 - klocek) (na-wiezy ?k2 ?w2)))
                (na-wiezy ?k ?w1)
                (not(exists (?k2 - klocek) (and (mniejszy ?k2 ?k) (na-wiezy ?k2 ?w1))))
            )
        :effect
            (and
                (na-wiezy ?k ?w2)
                (not(na-wiezy ?k ?w1))
            )
    )
    
    (:action przesun
        :parameters(?w1 ?w2 - wieza ?k1 ?k2 - klocek)
        :precondition
            (and
                (na-wiezy ?k1 ?w1)
                (na-wiezy ?k2 ?w2)
                (mniejszy ?k1 ?k2)
                (not(exists(?k3 - klocek) (and (mniejszy ?k3 ?k2) (na-wiezy ?k3 ?w2))))
                (not(exists(?k3 - klocek) (and (mniejszy ?k3 ?k1) (na-wiezy ?k3 ?w1))))
            )
        :effect
            (and
                (not(na-wiezy ?k1 ?w1))
                (na-wiezy ?k1 ?w2)
            )
    )

)