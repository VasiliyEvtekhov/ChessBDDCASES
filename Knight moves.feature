Feature: Knights moves

Scenario Outline: standard knight move
    Given <color> knight is located on "E4"
    And <color> user turn
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
    Given <color> knight is located on "<position>"
    And <opponent color> pawn is located on "<attack position>"
    And <color> user turn
    When <color> user moves <color> "<position>" knight to "<attack position>"
    Then <color> "<position>" knight should be located on "<attack position>"
    And <opponent color> "<attack position>" pawn should be not visible
    And "<position>" cell should be empty

Examples:
    | color | opponent color | position | attack position |      
    | White | Black          | E5       | F7              |
    | White | Black          | E5       | G6              |
    | White | Black          | E5       | G4              |
    | White | Black          | E5       | F3              |
    | White | Black          | E5       | D3              |
    | White | Black          | E5       | C4              |
    | White | Black          | E5       | C6              |
    | White | Black          | E5       | D7              |
    | Black | White          | C4       | D6              |
    | Black | White          | C4       | E5              |
    | Black | White          | C4       | E3              |
    | Black | White          | C4       | D2              |
    | Black | White          | C4       | B2              |
    | Black | White          | C4       | A3              |
    | Black | White          | C4       | A5              |
    | Black | White          | C4       | B6              |

Scenario Outline: knight cannot move backwards
    Given <color> knight is located on "D5"
    And <color> user turn
    When <color> user moves <color> "D5" knight to "<end position>" 
    Then <color> "D5" knight should not be located on "<end position>"
    And "D5" cell should contain <color> "D5" knight
    And Appears notification «Wrong turn»

Examples:
    | color | end position |
    | White | D4           |
    | Black | D6           |

Scenario Outline: knight cannot move on holden position
    Given <color> knight is located on "<position>"
    And <color> pawn is located on "<end position>"
    And <color> user turn
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