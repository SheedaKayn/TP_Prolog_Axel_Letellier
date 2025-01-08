% Faits
homme(pierre).
homme(marc).
homme(paul).
homme(jacques).
femme(marie).
femme(sophie).
femme(julie).

parent(pierre, paul).
parent(marie, paul).
parent(marc, sophie).
parent(jacques, marc).
parent(julie, sophie).

% Règles
pere(X, Y) :- homme(X), parent(X, Y), write(X), write(' est le pere de '), write(Y), nl.
mere(X, Y) :- femme(X), parent(X, Y), write(X), write(' est la mere de '), write(Y), nl.

grandparent(X, Y) :- parent(X, Z), parent(Z, Y), write(X), write(' est le grand-parent de '), write(Y), nl.

frere_ou_soeur(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, write(X), write(' est le frere ou la soeur de '), write(Y), nl.

oncle_ou_tante(X, Y) :- parent(Z, Y), frere_ou_soeur(X, Z), write(X), write(' est l oncle ou la tante de '), write(Y), nl.

cousin(X, Y) :- parent(Z, X), parent(W, Y), frere_ou_soeur(Z, W), write(X), write(' est le cousin de '), write(Y), nl.
% Calculer la longueur d'une liste
longueur([], 0).
longueur([_|Queue], N) :- longueur(Queue, N1), N is N1 + 1.

% Vérifier si un élément est présent dans une liste
element(X, [X|_]).
element(X, [_|Queue]) :- element(X, Queue).

/* Partie 3 

        Exercice 1

            Qui est le père de Marc? jacques

            Marc a-t-il des enfants? non

        Exercice 2

            Qui est le grand-parent de Paul ? Aucun

            Jacques est-il grand-parent de Sophie ? Oui

        Exercice 3

            Paul a-t-il des frères ou des sœurs ? Oui, Sophie

        Exercice 4
        
            Trouvez tous les hommes dans la base de données :
                ?- homme(X).
                X = pierre ;
                X = marc ;
                X = paul ;
                X = jacques.

            Recherchez tous les parents de Sophie :
                ?- parent(X, sophie).
                X = marie.

        Exercice 5

            Déclarez une liste en Prolog :
                ?- L = [pierre, marie, paul, sophie].
                L = [pierre, marie, paul, sophie].
            
            Décomposer une liste :
                ?- [Tête | Queue] = [pierre, marie, paul].
                Tête = pierre,
                Queue = [marie, paul].

        Exercice 6

            Ajoutez une règle pour calculer la longueur d'une liste :
                ?- longueur([pierre, marie, paul], N).
                N = 3.

        Exercice 7

            Ajoutez une règle pour vérifier si un élément est présent dans une liste :
                ?- element(marie, [pierre, marie, paul]).
                true.

        Exercice 8

            Marc est-il l'oncle de Paul ? Non, ?- oncle_ou_tante(marc, paul).
                                               false.

            Quels sont les oncles de Sophie ? Aucun, ?- oncle_ou_tante(X, sophie).
                                                    false.
        Exercice 9

            Interrogez la base de connaissances pour trouver les cousins de Paul : Aucun, ?- cousin(X, paul).
                                                                                         false.
*/