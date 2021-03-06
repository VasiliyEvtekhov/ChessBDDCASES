Feature: Bishop moves

#In examples i am have used the following techniques

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
    Given <color> bishop is located on "<position>"
    And <opponent color> pawn is located on "<attack position>"
    And <color> user turn
    When <color> user moves <color> "<position>" bishop to "<attack position>"
    Then <color> "<position>" bishop should be located on "<attack position>"
    And <opponent color> "<attack position>" pawn should be not visible
    And "<position>" cell should be empty

Examples:
    | color | opponent color | position | attack position |      
    | White | Black          | E5       | F6              |
    | White | Black          | E5       | F4              |
    | White | Black          | E5       | D4              |
    | White | Black          | E5       | D6              |
    | White | Black          | E5       | G7              |
    | White | Black          | E5       | G3              |
    | White | Black          | E5       | C3              |
    | White | Black          | E5       | C7              |
    | Black | White          | D5       | C6              |
    | Black | White          | D5       | E6              |
    | Black | White          | D5       | E4              |
    | Black | White          | D5       | C4              |
    | Black | White          | D5       | F3              |
    | Black | White          | D5       | B3              |
    | Black | White          | D5       | C7              |
    | Black | White          | D5       | F7              |

Scenario Outline: bishop cannot move in incorret directions
    Given <color> bishop is located on "<position>"
    And <color> user turn
    When <color> user moves <color> "<position>" bishop to "<end position>" 
    Then <color> "<position>" bishop should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" bishop
    And Appears notification ??Wrong turn??

Examples:
    | color | position | end position |
    | White | C4       | C5           |
    | White | C4       | C3           |
    | White | C4       | D4           |
    | White | C4       | B4           |
    | White | C4       | A4           |
    | White | C4       | C8           |
    | White | C4       | C1           |
    | White | C4       | H4           |
    | Black | E5       | E6           |
    | Black | E5       | E4           |
    | Black | E5       | F5           |
    | Black | E5       | D5           |
    | Black | E5       | A5           |
    | Black | E5       | H5           |
    | Black | E5       | E1           |
    | Black | E5       | E8           |

Scenario Outline: bishop cannot move through other figures
    Given <color> bishop is located on "<position>"
    And <color to go through> pawn is located on "<position 2>"
    And <color> user turn
    When <color> user moves <color> "<position>" bishop to "<end position>" 
    Then <color> bishop should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" bishop
    And Appears notification ??Wrong turn??

Examples:
    | color | color to go through | position | position 2 | end position |
    | White | White               | F4       | E3         | D2           |
    | White | White               | F4       | E3         | C1           |
    | Black | Black               | F5       | E6         | D7           |
    | Black | Black               | F5       | E6         | C8           |