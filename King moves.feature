Feature: King moves

Scenario Outline: standard king move
    Given <color> king is located on "D4"
    And <color> user turn
    When <color> user moves <color> "D4" king to "<end position>" 
    Then <color> king should be located on "<end position>"
    And "D4" cell should be empty

Examples: 
    | color | end position |
    | White | D5           |
    | White | D3           |
    | White | C4           |
    | White | E4           |
    | White | E5           |
    | White | E3           |
    | White | C5           |
    | White | E4           |
    | Black | D5           |
    | Black | D3           |
    | Black | C4           |
    | Black | E4           |
    | Black | E5           |
    | Black | E3           |
    | Black | C5           |
    | Black | E4           |

Scenario Outline: kings attack
    Given <color> king is located on "<position>"
    And <opponent color> pawn is located on "<attack position>"
    And <color> user turn
    When <color> user moves <color> "<position>" king to "<attack position>" 
    Then <color> king should be located on "<attack position>"
    And <opponent color> "<attack position>" pawn should be not visible
    And "<position>" cell should be empty

Examples:
    | color | opponent color | position       | attack position |
    | White | Black          | E4             | D5              |
    | White | Black          | E4             | E5              |
    | White | Black          | E4             | F5              |
    | White | Black          | E4             | D4              |
    | White | Black          | E4             | F4              |
    | White | Black          | E4             | D3              |
    | White | Black          | E4             | E3              |
    | White | Black          | E4             | F3              |
    | Black | White          | E5             | D4              |
    | Black | White          | E5             | E4              |
    | Black | White          | E5             | F4              |
    | Black | White          | E5             | D5              |
    | Black | White          | E5             | F5              |
    | Black | White          | E5             | D6              |
    | Black | White          | E5             | E6              |
    | Black | White          | E5             | F6              | 

Scenario Outline: king cannot attacks figure with the same color
    Given <color> king is located on "<start position>"
    And <color> pawn is located on "<position>"
    And <color> user turn
    When <color> user moves "<start position>" <color> king to "<position>"
    Then "<start position>" <color> king should not be located on "<position>" 
    And <color> "<position>" pawn should be visible
    And "<start position>" cell should contain <color> "<start position>" king
    And Appears notification «Wrong turn»

Examples:
    | color | start position | position |
    | White | E1             | E2       |
    | Black | E8             | E7       |

Scenario Outline: castle move
    Given <color> king is located on "<start position>"
    And <color> rook is located on "<position>"
    And between <color> "<start position>" king and <color> "<position>" rook there are no other figures
    And <color> user turn
    When <color> user moves <color> "<start position>" king to "<end position>"
    Then <color> "<start position>" king should be located on "<end position>"
    And <color> <position> rook should be located on "<position 2>"
    And "<start position>" cell should not contain <color> "<start position>" king
    And "<position>" cell should not contain <color> "<position>" rook

Examples:
    | color | start position | position | end position | position 2 |
    | White | E1             | A1       | C1           | D1         |
    | White | E1             | H1       | G1           | F1         |
    | Black | E8             | A8       | C8           | D8         |
    | Black | E8             | H8       | G8           | F8         |