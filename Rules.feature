Feature: Game rules

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

Scenario Outline: user cannot move opponents figure in his turn
    Given <color> user turn
    When <color> user moves <opponents color> "<position>" figure to "<end position>"
    Then <opponents color> "<position>" figure should not be shifted
    And "<position>" cell should contain <opponent color> "<position>" figure
    And Appears notification «Wrong turn»

Examples:
    | color | opponents color | position | end position |
    | White | Black           | E7       | E6           |
    | Black | White           | E2       | E3           |

Scenario Outline: user cannot move opponents figure in opponents turn
    Given <opponents color> user turn
    When <color> user moves <opponents color> "<position>" knight to "<end position>"
    Then <opponents color> "<position>" knight should not be shifted
    And "<position>" cell should contain <opponent color> "<position>" knight
    And Appears notification «Wrong turn»

Examples:
    | opponents color | color | position | end position |
    | Black           | White | G8       | H6           |
    | Black           | White | G8       | F6           |
    | White           | Black | B1       | C3           |
    | White           | Black | B1       | A3           |

Scenario Outline: user cannot move figures in opponents turn
    Given <opponents color> user turn
    When <color> user moves <color> "<position>" pawn to "<end position>"
    Then <color> "<position>" pawn should not be shifted
    And "<position>" cell should contain <color> "<position>" pawn
    And Appears notification «Wrong turn»

Examples:
    | opponents color | color | position | end position |
    | White           | Black | G7       | G6           |
    | Black           | White | G2       | G3           |

Scenario Outline: move transition
    Given <color> user turn 
    When <color> user makes a move
    Then move is passed to <opponent color> user

Examples:
    | color | opponent color |
    | White | Black          |
    | Black | White          |

Scenario Outline: pawn reaches edge of a desk
    Given <color> user turn
    And "<end position>" cell is empty
    When <color> user makes a <color> "<position>" pawn move to "<end position>"
    Then <color> "<position>" pawn should not be located on "<end position>"
    And <color> "<position>" pawn should be not visible
    And "<position>" cell should be empty
    And for <color> user appears a pop-up window where user can choose a figure exept king and pawn
    And on "<end position>" cell appears chosen figure

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

Scenario Outline: attack on king
    Given <color> king is located on "<position>"
    And <opponent color> rook is located on "<position 2>"
    And <opponent color> turn
    When <opponent color> moves <opponent color> "<position 2>" rook to "<end position>"
    Then <opponent color>"<position 2>" should be located on "<end position>"
    And "<end position>" cell should contain <opponent color> "<position 2>" rook
    And "<position 2>" cell should be empty
    And appears notification "Check"

Examples:
    | color | opponent color | position | position 2 | end posiiton |
    | White | Black          | E3       | G6         | E6           |
    | Black | White          | F7       | G3         | F3           |

Scenario Outline: checkmate
    Given <color> king is located on "<position>"
    And <opponent color> rook is located on "<position 2>"
    And <opponent color> queen is located on "<position 3>"
    And <opponent color> user turn
    When <opponent color> moves <opponent color> "<position 2>" rook to "<end position>"
    Then <opponent color>"<position 2>" rook should be located on "<end position>"
    And "<position 2>" cell should be empty
    And appears pop-up window for both users "Checkmate"
    And move is should not transit to <color> user

Examples:
    | color | opponent color | position | position 2 | position 3 | end posiiton |
    | White | Black          | H3       | B5         | G6         | H5           |
    | Black | White          | A8       | E1         | H7         | E8           |