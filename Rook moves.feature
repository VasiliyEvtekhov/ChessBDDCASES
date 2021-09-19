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
   
Scenario Outline: rook cannot move in incorret directions
    Given <color> rook is located on "<position>"
    And <color> user turn
    When <color> user moves <color> "<position>" rook to "<end position>" 
    Then <color> "<position>" rook should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" rook
    And Appears notification «Wrong turn»

Examples:
    | color | position | end position |
    | White | E4       | F5           |
    | White | E4       | F3           |
    | White | E4       | D3           |
    | White | E4       | D5           |
    | White | E4       | H7           |
    | White | E4       | H1           |
    | White | E4       | B1           |
    | White | E4       | A8           |
    | Black | E5       | F6           |
    | Black | E5       | F4           |
    | Black | E5       | D4           |
    | Black | E5       | D6           |
    | Black | E5       | H8           |
    | Black | E5       | H2           |
    | Black | E5       | A1           |
    | Black | E5       | B8           |

Scenario Outline: rook cannot attack figure with the same color
    Given <color> rook is located on "<start position>"
    And <color> knight is located on "<end position>"
    And <color> user turn
    When <color> user moves <color> "<start position>" rook to "<end position>" 
    Then <color> "<start position>" rook should not be located on "<end position>"
    And "<start position>" cell should contain <color> "<start position>" rook
    And Appears notification «Wrong turn»

Examples:
    | color | start position | end position |
    | White | F4             | G4           |
    | White | F4             | F3           |
    | White | F4             | E4           |
    | White | F4             | F5           |
    | White | F4             | H4           |
    | White | F4             | A4           |
    | White | F4             | F1           |
    | White | F4             | F8           |
    | Black | C6             | C5           |
    | Black | C6             | B6           |
    | Black | C6             | C7           |
    | Black | C6             | D6           |
    | Black | C6             | C1           |
    | Black | C6             | A6           |
    | Black | C6             | C8           |
    | Black | C6             | H6           |