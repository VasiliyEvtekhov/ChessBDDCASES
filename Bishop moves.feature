Feature: bishop moves

Scenario Outline: standard bishop move
    Given <color> bishop is located on "<position>"
    And <color> user turn
    When <color> user moves <color> "<position>" bishop to "<end position>"
    Then <color> "<position>" bishop should be located on "<end position>"
    And "<position>" cell should be empty

Examples:
    | color | position | end position |
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

Scenario Outline: bishops attack
    Given <color> bishop is located on "E4"
    And <opponent color> pawn is located on "D5"
    And <color> user turn
    When <color> user moves <color> "E4" bishop to "D5"
    Then <color> "E4" bishop should be located on "D5"
    And <opponent color> "D5" pawn should be not visible
    And "E4" cell should be empty

Examples:
    | color | opponent color |        
    | White | Black          |
    | Black | White          |

Scenario Outline: bishop can not move backwards
    Given <color> bishop is located on "D5"
    And <color> user turn
    When <color> user moves <color> "D5" bishop to "<end position>" 
    Then <color> "D5" bishop should not be located on "<end position>"
    And "D5" cell should contain <color> "D5" bishop
    And Appears notification «Wrong turn»

Examples:
    | color | end position |
    | White | D4           |
    | Black | D7           |

Scenario Outline: bishop can not move through figure with the same color
    Given <color> bishop is located on "<position>"
    And <color> pawn is located on "<position 2>"
    And <color> user turn
    When <color> user moves <color> "<position>" bishop to "<end position>" 
    Then <color> bishop should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" bishop
    And Appears notification «Wrong turn»

Examples:
    | color | position | position 2 | end position |
    | White | F4       | E3         | D2           |
    | White | F4       | E3         | C1           |
    | Black | F5       | E6         | D7           |
    | Black | F5       | E6         | C8           |