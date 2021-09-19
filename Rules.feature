Feature: game rules

Scenario: user starts a new game with computer  
    When user clicks on button «Start a new game with computer»
    Then board is visible
    And the following figures are visible

| Name of figure | Color of figure| Initial position on the board |
| Rook	         | White	      | A1                            |
| Rook	         | White	      | H1                            |
| Rook	         | Black	      | A8                            | 
| Rook	         | Black	      | H8                            |      
| Knight	     | White	      | B1                            |
| Knight	     | White          | G1                            |
| Knight	     | Black	      | B8                            |
| Knight	     | Black          | G8                            |
| Bishop	     | White	      | C1                            |
| Bishop	     | White	      | F1                            |
| Bishop	     | Black	      | C8                            |
| Bishop	     | Black	      | F8                            |
| Queen          | White          | D1                            |  
| Queen	         | Black	      | D8                            |
| King	         | White	      | E1                            |
| King	         | Black          | E8                            |
| Pawn	         | White	      | A2                            |
| Pawn	         | White	      | B2                            |
| Pawn	         | White	      | C2                            |
| Pawn	         | White	      | D2                            |
| Pawn	         | White	      | E2                            |
| Pawn	         | White	      | F2                            |
| Pawn	         | White	      | G2                            |
| Pawn	         | White          | H2                            |
| Pawn	         | Black	      | A7                            |
| Pawn	         | Black	      | B7                            |
| Pawn	         | Black	      | C7                            |
| Pawn	         | Black	      | D7                            |
| Pawn	         | Black	      | E7                            |
| Pawn	         | Black	      | F7                            |
| Pawn	         | Black	      | G7                            |
| Pawn	         | Black	      | H7                            |

Scenario Outline: user can not move opponents figure
    Given <color> users turn
    When <color> user moves <opponents color> "<position>" figure to "<end position>"
    Then <opponents color> "<position>" figure should not be shifted
    And "<position>" cell should contain <opponent color> "<position>" figure
    And Appears notification «Wrong turn»

Examples:
    | color | opponents color | position | end position |
    | White | Black           | E7       | E6           |
    | Black | White           | E2       | E3           |

Scenario Outline: user can not move figures in opponents turn
    Given <opponents color> users turn
    When <color> user moves <color> "<position>" pawn to "<end position>"
    Then <color> "<position>" pawn should not be shifted
    And "<position>" cell should contain <color> "<position>" pawn
    And Appears notification «Wrong turn»

Examples:
    | opponents color | color | position | end position |
    | White           | Black | G7       | G6           |
    | Black           | White | G2       | G3           |

Scenario Outline: move transition
    Given <color> users turn 
    When <color> user makes a move
    Then move is passed to <opponent color> user

Examples:
    | color | opponent color |
    | White | Black          |
    | Black | White          |

Scenario Outline: pawn reaches edge of a desk
    Given <color> users turn
    When <color> user makes a <color> "<position>" pawn move to "<end position>"
    Then <color> "<position>" pawn should not be located on "<end position>"
    And <color> "<position>" pawn should be not visible
    And "<position>" cell should be empty
    And on "<end position>" cell appears chosen other <color> figure exept pawn and king

Examples:
    | color | position | end position |
    | White | A7       | A8           |
    | White | B7       | B8           |
    | White | C7       | C8           |
    | White | D7       | D8           |
    | White | E7       | E8           |
    | White | F7       | F8           |
    | White | G7       | G8           |
    | White | H7       | H8           |
    | Black | A2       | A1           |
    | Black | B2       | B1           |
    | Black | C2       | C1           |
    | Black | D2       | D1           |
    | Black | E2       | E1           |
    | Black | F2       | F1           |
    | Black | G2       | G1           |
    | Black | H2       | H1           |

Scenario Outline attack on king
    Given <color> king is located on "<position>"
    And <opponent color> rook is located on "<position 2>"
    And <opponent color> turn
    When <opponent color> moves <opponent color> rook to <end position>
    Then 