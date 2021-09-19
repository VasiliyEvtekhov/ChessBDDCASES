Feature: Rook moves

Scenario Outline: standard rook move
    Given <color> rook is located on "E5"
    And <color> user turn
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
    Given <color> rook is located on "<position>"
    And <opponent color> pawn is located on "<attack position>"
    And <color> user turn
    When <color> user moves <color> "<position>" rook to "<attack position>"
    Then <color> "<position>" rook should be located on "<attack position>"
    And <opponent color> "<attack position>" pawn should be not visible
    And "<position>" cell should be empty

Examples:
    | color | opponent color | position | attack position |      
    | White | Black          | F4       | F5              |
    | White | Black          | F4       | F3              |
    | White | Black          | F4       | E4              |
    | White | Black          | F4       | G4              |
    | White | Black          | F4       | C4              |
    | White | Black          | F4       | F7              |
    | White | Black          | F4       | F2              |
    | White | Black          | F4       | H4              |
    | Black | White          | C5       | C6              |
    | Black | White          | C5       | D5              |
    | Black | White          | C5       | C4              |
    | Black | White          | C5       | B5              |
    | Black | White          | C5       | A5              |
    | Black | White          | C5       | C1              |
    | Black | White          | C5       | C7              |
    | Black | White          | C5       | F5              |
   
Scenario Outline: rook cannot move diagonale
    Given <color> rook is located on "D5"
    And <color> user turn
    When <color> user moves <color> "D5" rook to "<end position>" 
    Then <color> "D5" rook should not be located on "<end position>"
    And "D5" cell should contain <color> "D5" rook
    And Appears notification «Wrong turn»

Examples:
    | color | end position |
    | White | E4           |
    | Black | E6           |

Scenario Outline: rook cannot move through figure with the same color
    Given <color> rook is located on "E4"
    And <color> bishop is located on "C4"
    And <color> user turn
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