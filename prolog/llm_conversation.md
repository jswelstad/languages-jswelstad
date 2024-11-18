
# Enhanced Prolog Hat Puzzle

## Problem Description
Three friends, Alice, Bob, and Carol, are wearing hats of three different colors: red, green, and blue. Here are the constraints:
1. Each person dislikes one color:
   - Alice dislikes **red**.
   - Bob dislikes **blue**.
   - Carol dislikes **green**.
2. Additional rules:
   - Alice must wear a hat that is **different** from Bob's hat.
   - Carol cannot wear a hat that is the **same** color as Bob's.
   - The combination of Alice's and Carol's hat colors cannot both be `red` or both be `blue`.

## Prolog Code
```prolog
% Define the hats
hats([red, green, blue]).

% Define the enhanced logic grid solver
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

    % Dislike constraints
    AliceHat \= red,   % Alice doesn't like red
    BobHat \= blue,    % Bob doesn't like blue
    CarolHat \= green, % Carol doesn't like green

    % New constraints
    AliceHat \= BobHat, % Alice's hat must be different from Bob's
    CarolHat \= BobHat, % Carol's hat must be different from Bob's
    \+ (AliceHat = red, CarolHat = red), % Alice and Carol cannot both wear red
    \+ (AliceHat = blue, CarolHat = blue), % Alice and Carol cannot both wear blue

    % Print the solution
    write('Alice: '), write(AliceHat), nl,
    write('Bob: '), write(BobHat), nl,
    write('Carol: '), write(CarolHat), nl.
```

## How Prolog Solves the Enhanced Puzzle
1. **Backtracking**:
   - Prolog starts assigning values from the list `[red, green, blue]` to each variable (`AliceHat`, `BobHat`, `CarolHat`).
   - It checks all constraints, including the new ones.
2. **Constraint Checking**:
   - Every time Prolog assigns a value, it verifies that the constraints are satisfied.
   - If a constraint is violated, Prolog backtracks to try a different assignment.

## How to Run the Enhanced Puzzle
### Step 1: Save the Code
Save the code to a file, e.g., `hat_puzzle.pl`.

### Step 2: Install SWI-Prolog (if needed)
On **Ubuntu**, run the following commands:
```bash
sudo apt update
sudo apt install swi-prolog
```

### Step 3: Run the Puzzle
1. Open the Prolog interpreter:
   ```bash
   swipl
   ```
2. Load the Prolog file:
   ```prolog
   ?- consult('hat_puzzle.pl').
   ```
3. Run the solver:
   ```prolog
   ?- solve.
   ```

## Sample Output
For the enhanced puzzle, Prolog might output:
```
Alice: green
Bob: red
Carol: blue
```

## How to Add More Constraints
To increase complexity, consider adding:
- **Primary Color Rule**: Alice must wear a primary color (red or blue).
- **Lightness Rule**: Bob’s hat must be lighter than Carol’s hat (e.g., green is lighter than blue).
- **More Participants**: Add more people or hat colors.

Prolog will adapt and find solutions based on the additional rules.
