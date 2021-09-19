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

Scenario Outline: king cannot move on two and more cells
    Given <color> king is located on "<position>"
    And <color> user turn
    When <color> user moves <color> "<position>" king to "<end position>" 
    Then <color> king should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" king
    And Appears notification «Wrong turn»

Examples:
    | color | position | end position |
    | White | D4       | B4           |
    | White | D4       | H4           |
    | White | D4       | D6           |
    | White | D4       | D1           |
    | Black | F4       | F6           |
    | Black | F4       | F2           |
    | Black | F4       | H4           |
    | Black | F4       | C4           |

Scenario Outline: castle move
    Given <color> king is located on "<start position>"
    And <color> rook is located on "<position>"
    And between <color> "<start position>" king and <color> "<position>" rook there are no other figures
    And <color> user turn
    When <color> user initiate a castle move
    Then <color> "<start position>" king should be located on "<end position>"
    And <color> "<position>" rook should be located on "<position 2>"
    And "<start position>" cell should not contain <color> "<start position>" king
    And "<position>" cell should not contain <color> "<position>" rook

Examples:
    | color | start position | position | end position | position 2 |
    | White | E1             | A1       | C1           | D1         |
    | White | E1             | H1       | G1           | F1         |
    | Black | E8             | A8       | C8           | D8         |
    | Black | E8             | H8       | G8           | F8         |

Scenario Outline: user cannot do a castle move if between king and rook color figure
    Given <color> king is located on "<start position>"
    And <color> rook is located on "<position 2>"
    And <color> queen is located on "<position>"
    And <color> user turn
    When <color> user initiate a castle move
    Then <color> "<start position>" king should not be located on "<end position>"
    And <color> "<position 2>" rook should not be located on "<position 3>"
    And "<start position>" cell should contain <color> "<start position>" king
    And "<position 2>" cell should contain <color> "<position>" rook
    And "<position>" cell should contain <color> "<position>" queen
    And Appears notification «Wrong turn»

Examples:
    | color | start position | position | end position | position 2 | position 3 |
    | White | E1             | D1       | C1           | H1         | D1         |
    | White | E1             | B1       | C1           | H1         | D1         |
    | White | E1             | C1       | C1           | H1         | D1         |
    | White | E1             | F1       | G1           | A1         | F1         |
    | White | E1             | G1       | G1           | A1         | F1         |
    | Black | E8             | D8       | C8           | H8         | D8         |
    | Black | E8             | B8       | C8           | H8         | D8         |
    | Black | E8             | C8       | C8           | H8         | D8         |
    | Black | E8             | F8       | G8           | A8         | F8         |
    | Black | E8             | G8       | G8           | A8         | F8         |

Scenario Outline: user cannot do a castle move if between king and rook opponent color figure
    Given <color> king is located on "<start position>"
    And <color> rook is located on "<position 2>"
    And <opponent color> bishop is located on "<position>"
    And <color> user turn
    When <color> user initiate a castle move
    Then <color> "<start position>" king should not be located on "<end position>"
    And <color> "<position 2>" rook should not be located on "<position 3>"
    And "<start position>" cell should contain <color> "<start position>" king
    And "<position 2>" cell should contain <color> "<position>" rook
    And "<position>" cell should contain <opponent color> "<position>" bishop
    And Appears notification «Wrong turn»

Examples:
    | color | opponent color | start position | position | end position | position 2 | position 3 |
    | White | Black          | E1             | D1       | C1           | H1         | D1         |
    | White | Black          | E1             | B1       | C1           | H1         | D1         |
    | White | Black          | E1             | C1       | C1           | H1         | D1         |
    | White | Black          | E1             | F1       | G1           | A1         | F1         |
    | White | Black          | E1             | G1       | G1           | A1         | F1         |
    | Black | White          | E8             | D8       | C8           | H8         | D8         |
    | Black | White          | E8             | B8       | C8           | H8         | D8         |
    | Black | White          | E8             | C8       | C8           | H8         | D8         |
    | Black | White          | E8             | F8       | G8           | A8         | F8         |
    | Black | White          | E8             | G8       | G8           | A8         | F8         |

    Scenario Outline: user cannot do a castle move if king is under attack
    Given <color> king is located on "<start position>"
    And <color> rook is located on "<position 2>"
    And <opponent color> queen is located on "<position>"
    And <color> user turn
    When <color> user initiate a castle move
    Then <color> "<start position>" king should not be located on "<end position>"
    And <color> "<position 2>" rook should not be located on "<position 3>"
    And "<start position>" cell should contain <color> "<start position>" king
    And "<position 2>" cell should contain <color> "<position>" rook
    And "<position>" cell should contain <opponent color> "<position>" queen
    And Appears notification «Wrong turn»

Examples:
    | color | opponent color | start position | position | end position | position 2 | position 3 |
    | White | Black          | E1             | E4       | C1           | H1         | D1         |
    | White | Black          | E1             | E4       | G1           | A1         | F1         |
    | Black | White          | E8             | E5       | C8           | H8         | D8         |
    | Black | White          | E8             | E5       | G8           | A8         | F8         |