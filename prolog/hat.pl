% Define the hats
hats([red, green, blue]).

% Define the logic grid solver
solve :-
    hats(Hats),
    % Assign hats to each person
    member(AliceHat, Hats),
    member(BobHat, Hats),
    member(CarolHat, Hats),
    
    % Ensure no two people have the same hat
    AliceHat \= BobHat,
    AliceHat \= CarolHat,
    BobHat \= CarolHat,
    
    % Constraints for favorite colors
    AliceHat \= red,   % Alice doesn't like red
    BobHat \= blue,    % Bob doesn't like blue
    CarolHat \= green, % Carol doesn't like green
    
    % Print the solution
    write('Alice: '), write(AliceHat), nl,
    write('Bob: '), write(BobHat), nl,
    write('Carol: '), write(CarolHat), nl.
