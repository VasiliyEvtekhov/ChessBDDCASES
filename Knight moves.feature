Feature: knights moves

Scenario Outline: standard knight move
    Given <color> knight is located on "E4"
    And <color> users turn
    When <color> user moves <color> "E4" knight to "<end position>"
    Then <color> > "E4" knight should be located on "<end position>"
    And "E4" cell should be empty

Examples:
    | color | end position |
    | White | F6           |
    | White | G5           |
    | White | G3           |
    | White | F2           |
    | White | D2           |
    | White | C3           |
    | White | C5           |
    | White | D6           |             
    | Black | G5           |
    | Black | G3           |
    | Black | F2           |
    | Black | D2           |
    | Black | C3           |
    | Black | C5           |
    | Black | D6           |
    | Black | F6           |

Scenario Outline: knights attack
    Given <color> knight is located on "E4"
    And <opponent color> pawn is located on "F6"
    And <color> users turn
    When <color> user moves <color> "E4" knight to "F6"
    Then <color> "E4" knight should be located on "F6"
    And <opponent color> "F6" pawn should be not visible
    And "E4" cell should be empty

Examples:
    | color | opponent color |       
    | White | Black          |
    | Black | White          |

Scenario Outline: knight can not move backwards
    Given <color> knight is located on "D5"
    And <color> users turn
    When <color> user moves <color> "D5" knight to "<end position>" 
    Then <color> "D5" knight should not be located on "<end position>"
    And "D5" cell should contain <color> "D5" knight
    And Appears notification «Wrong turn»

Examples:
    | color | end position |
    | White | D4           |
    | Black | D6           |

Scenario Outline: knight can not move on holden position
    Given <color> knight is located on "<position>"
    And <color> pawn is located on "<end position>"
    And <color> users turn
    When <color> user moves <color> "<position>" knight to "<end position>" 
    Then <color> "<position>" knight should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" knight
    And Appears notification «Wrong turn»

Examples:
    | color | position | end position |
    | White | D4       | C2           |
    | White | D4       | E2           |
    | Black | C6       | A7           |
    | Black | C6       | E7           |