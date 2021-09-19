Feature: Pawn moves

Scenario Outline: standard pawn move
    Given <color> pawn is located on "D4"
    And <color> user turn
    When <color> user moves "D4" <color> pawn to "<position>" 
    Then "D4" <color> pawn should be located on "<position>"

Examples:  
    | color | position |
    | White | D5       |
    | Black | D3       |

Scenario Outline: extended pawn move
    Given <color> user turn
    When <color> user moves <color> "<start position>" pawn to the "<end position>"
    Then <color> pawn should be located on the "<position>"
    And "<start position>" cell should be empty

Examples: 
    | color | start position | end position |
    | White | E2             | E4           |
    | Black | E7             | E5           | 

Scenario Outline: pawns attack
    Given <color> pawn is located on "<position>"
    And <opponent color> pawn is located on "<attack position>"
    And <color> user turn
    When <color> user moves <color> "<position>" pawn to "<attack position>"
    Then <color> "<position>" pawn should be located on "<attack position>"
    And <opponent color> "<attack position>" pawn should be not visible
    And "<position>" cell should be empty

Examples:
    | color | opponent color | positon | attack position |
    | White | Black          | E4      | D5              |
    | White | Black          | E4      | F5              |
    | Black | White          | E5      | D4              |
    | Black | White          | E5      | F4              |

Scenario Outline: pawn cannot move in incorret directions
    Given <color> pawn is located on "<position>"
    And <color> user turn
    When <color> user moves "<position>" <color> pawn to "<end position>" 
    Then "<position>" <color> pawn should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" pawn
    And Appears notification «Wrong turn»

Examples:
    | color | position | end position |
    | White | D3       | C4           |
    | White | D3       | E4           |
    | White | D3       | E3           |
    | White | D3       | E2           |
    | White | D3       | D2           |
    | White | D3       | C2           |
    | White | D3       | C3           |
    | Black | D5       | C6           |
    | Black | D5       | D6           |
    | Black | D5       | E6           |
    | Black | D5       | E5           |
    | Black | D5       | E4           |
    | Black | D5       | C4           |
    | Black | D5       | C5           |

Scenario Outline: pawn cannot do extended move if there is in front another figure
    Given <color> pawn is located on "<start position>"
    And <color> knight is located on "<position 1>"
    And <color> user turn
    When <color> user moves <color> pawn to "<position 2>"
    Then <color> pawn should not be located on "<position 2>" 
    And "<start position>" cell should contain <color> "<start position>" pawn
    And Appears notification «Wrong turn»

Examples:
    | color | start position | position 1 | position 2 |
    | White | C2             | C3         | C4         |
    | Black | C7             | C6         | C5         |

Scenario Outline: pawn cannot attack figure with the same color
    Given <color> pawn is located on position "F4" 
    And <color> pawn is located on "<position>"
    And <color> user turn
    When <color> user moves "F4" <color> pawn to "<position>"
    Then "F4" <color> pawn should not be located on "<position>" 
    And <color> "<position>" pawn should be visible
    And "F4" cell should contain <color> "F4" pawn
    And Appears notification «Wrong turn»

Examples:
    | color | position |
    | White | E5       |
    | Black | E3       |
    | White | G5       |
    | Black | G3       |

Scenario Outline: pawn cannot attack opponents figure from behind 
    Given <color> pawn is located on position "<position>" 
    And <opponent color> pawn is located on "<position 2>"
    And <color> user turn
    When <color> user moves "<position>" <color> pawn to "<position 2>"
    Then "<position>" <color> pawn should not be located on "<position 2>" 
    And <opponent color> "<position 2>" pawn should be visible
    And "<position>" cell should contain <color> "<position>" pawn
    And Appears notification «Wrong turn»

Examples:
    | color | opponent color | position | position 2|
    | White | Black          | F4       | E3        |
    | White | Black          | F4       | G3        |
    | Black | White          | E5       | D6        |
    | Black | White          | E5       | F6        |