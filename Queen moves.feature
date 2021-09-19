#QUEENMOVES


Scenario Outline: standard queen move
    Given <color> bishop is located on "<position>"
    And <color> users turn
    When <color> user moves <color> "<position>" bishop to "<end position>"
    Then <color> > "<position>" bishop should be located on "<end position>"
    And "<position>" cell should be empty


Examples:
| color | position | end position |
| White | F4       | F5           |
| White | F4       | F3           |
| White | F4       | E4           |
| White | F4       | G4           |
| White | F4       | F8           |
| White | F4       | F1           |
| White | F4       | A4           |
| White | F4       | H4           |
| White | F4       | B8           |
| White | F4       | H6           |
| White | F4       | H2           |
| White | F4       | C1           |
| White | F4       | G5           |
| White | F4       | G3           |
| White | F4       | E3           |
| White | F4       | E5           |
| White | F4       | D6           |
| White | F4       | D2           |
| Black | E6       | G8           |
| Black | E6       | F7           |
| Black | E6       | C8           |
| Black | E6       | D7           |
| Black | E6       | A2           |
| Black | E6       | C4           |
| Black | E6       | D5           |
| Black | E6       | H3           |
| Black | E6       | G4           |
| Black | E6       | F5           |
| Black | E6       | E5           |
| Black | E6       | E7           |
| Black | E6       | F6           |
| Black | E6       | D6           |
| Black | E6       | E1           |
| Black | E6       | E8           |
| Black | E6       | H6           |
| Black | E6       | A6           |


Scenario Outline: queens attack move
    Given <color> queen is located on "E4"
    And <opponent color> pawn is located on "D5"
    And <color> users turn
    When <color> user moves <color> "E4" queen to "D5"
    Then <color> "E4" queen should be located on "D5"
    And <opponent color> "D5" pawn should be not visible
    And "E4" cell should be empty


Examples:
| color | opponent color |       
| White | Black          |
| Black | White          |


Scenario Outline: queen can not do standard move if there is in front another figure
    Given <color> queen is located on "D5"
    And <color> knight is located on "<position>"
    And <color> users turn
    When <color> user moves <color> "D5" queen to "<end position>" 
    Then <color> "D5" queen should not be located on "<end position>"
    And "D5" cell should contain <color> "D5" queen
    And Appears notification «Wrong turn»


Examples:
| color | position | end position |
| White | D4       | D4           |
| Black | D7       | D7           |