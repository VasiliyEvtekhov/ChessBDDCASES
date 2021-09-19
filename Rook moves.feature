Feature: rook moves

Scenario Outline: standard rook move
    Given <color> rook is located on "E5"
    And <color> users turn
    When <color> user moves <color> "E5" rook to "<end position>" 
    Then <color> "E5" rook should be located on "<end position>"
    And "E5" cell should be empty

Examples:
    | color | end position|
    | White | A5          |
    | White | H5          |
    | White | F5          |
    | White | E4          |
    | White | G5          |
    | White | C5          |
    | White | E7          |
    | White | E3          |
    | White | E6          |
    | White | D5          |
    | White | E8          |
    | White | E1          | 
    | Black | A5          |
    | Black | H5          |
    | Black | F5          |
    | Black | E4          |
    | Black | E6          |
    | Black | D5          |
    | Black | E8          |
    | Black | E1          | 
    | Black | G5          |
    | Black | C5          |
    | Black | E7          |
    | Black | E3          |

Scenario Outline: rooks attack                               
    Given <color> rook is located on "E5"
    And <opponent color> pawn is located on "A5"
    And <color> users turn
    When <color> user moves <color> "E5" rook to "A5"
    Then <color> "E5" rook should be located on "A5"
    And <opponent color> "A5" pawn should be not visible
    And "E5" cell should be empty

Examples:
    | color | opponent color |
    | White | Black          |
    | Black | White          |

Scenario Outline: rook can not move diagonale
    Given <color> rook is located on "D5"
    And <color> users turn
    When <color> user moves <color> "D5" rook to "<end position>" 
    Then <color> "D5" rook should not be located on "<end position>"
    And "D5" cell should contain <color> "D5" rook
    And Appears notification «Wrong turn»

Examples:
    | color | end position |
    | White | E4           |
    | Black | E6           |

Scenario Outline: rook can not move through figure with the same color
    Given <color> rook is located on "E4"
    And <color> bishop is located on "C4"
    And <color> users turn
    When <color> user moves <color> "E4" rook to "<end position>" 
    Then <color> rook should not be located on "<end position>"
    And "E4" cell should contain <color> "E4" rook
    And Appears notification «Wrong turn»

Examples:
    | color | end position |
    | White | A4           |
    | White | B4           |
    | Black | A4           |
    | Black | B4           |