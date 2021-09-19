Feature: Queen moves

Scenario Outline: standard queen move
    Given <color> bishop is located on "<position>"
    And <color> user turn
    When <color> user moves <color> "<position>" bishop to "<end position>"
    Then <color> > "<position>" bishop should be located on "<end position>"
    And "<position>" cell should be empty

Examples:
    | color | position | end position |
    | White | F4       | F5           |
    | White | F4       | F3           |
    | White | F4       | E4           |
    | White | F4       | G4           |
    | White | F4       | F8           |
    | White | F4       | F1           |
    | White | F4       | A4           |
    | White | F4       | H4           |
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
    | Black | E6       | E5           |
    | Black | E6       | E7           |
    | Black | E6       | F6           |
    | Black | E6       | D6           |
    | Black | E6       | E1           |
    | Black | E6       | E8           |
    | Black | E6       | H6           |
    | Black | E6       | A6           |

Scenario Outline: queens attack
    Given <color> queen is located on "<position>"
    And <opponent color> pawn is located on "<attack position>"
    And <color> user turn
    When <color> user moves <color> "<position>" queen to "<attack position>"
    Then <color> "<position>" queen should be located on "<attack position>"
    And <opponent color> "<attack position>" pawn should be not visible
    And "<position>" cell should be empty

Examples:
    | color | opponent color | position | attack position |      
    | White | Black          | F4       | F5              |
    | White | Black          | F4       | F3              |
    | White | Black          | F4       | E4              |
    | White | Black          | F4       | G4              |
    | White | Black          | F4       | F8              |
    | White | Black          | F4       | F1              |
    | White | Black          | F4       | A4              |
    | White | Black          | F4       | H4              |
    | White | Black          | F4       | B8              |
    | White | Black          | F4       | H6              |
    | White | Black          | F4       | H2              |
    | White | Black          | F4       | C1              |
    | White | Black          | F4       | G5              |
    | White | Black          | F4       | G3              |
    | White | Black          | F4       | E3              |
    | White | Black          | F4       | E5              |
    | White | Black          | F4       | D6              |
    | White | Black          | F4       | D2              |
    | Black | White          | E6       | G8              |
    | Black | White          | E6       | F7              |
    | Black | White          | E6       | C8              |
    | Black | White          | E6       | D7              |
    | Black | White          | E6       | A2              |
    | Black | White          | E6       | C4              |
    | Black | White          | E6       | D5              |
    | Black | White          | E6       | H3              |
    | Black | White          | E6       | G4              |
    | Black | White          | E6       | F5              |
    | Black | White          | E6       | E5              |
    | Black | White          | E6       | E7              |
    | Black | White          | E6       | F6              |
    | Black | White          | E6       | D6              |
    | Black | White          | E6       | E1              |
    | Black | White          | E6       | E8              |
    | Black | White          | E6       | H6              |
    | Black | White          | E6       | A6              |

Scenario Outline: queen cannot attacks figure with the same color
    Given <color> queen is located on "<start position>"
    And <color> knight is located on "<end position>"
    And <color> user turn
    When <color> user moves <color> "<start position>" queen to "<end position>" 
    Then <color> "<start position>" queen should not be located on "<end position>"
    And "<start position>" cell should contain <color> "<start position>" queen
    And Appears notification «Wrong turn»

Examples:
    | color | start position | end position |
    | White | F4             | E5           |
    | White | F4             | F5           |
    | White | F4             | G5           |
    | White | F4             | E4           |
    | White | F4             | G4           |
    | White | F4             | E3           |
    | White | F4             | F3           |
    | White | F4             | G3           |
    | White | F4             | H4           |
    | White | F4             | H2           |
    | White | F4             | F1           |
    | White | F4             | C1           |
    | White | F4             | A4           |
    | White | F4             | B2           |
    | White | F4             | F8           |
    | White | F4             | H6           |
    | Black | E6             | D7           |
    | Black | E6             | E7           |
    | Black | E6             | F7           |
    | Black | E6             | D6           |
    | Black | E6             | F6           |
    | Black | E6             | D5           |
    | Black | E6             | E5           |
    | Black | E6             | F5           |
    | Black | E6             | C8           |
    | Black | E6             | E8           |
    | Black | E6             | G8           |
    | Black | E6             | H6           |
    | Black | E6             | H3           |
    | Black | E6             | E1           |
    | Black | E6             | A2           |
    | Black | E6             | A6           |

Scenario Outline: queen cannot move in incorret directions
    Given <color> queen is located on "<position>"
    And <color> user turn
    When <color> user moves <color> "<position>" queen to "<end position>" 
    Then <color> "<position>" queen should not be located on "<end position>"
    And "<position>" cell should contain <color> "<position>" queen
    And Appears notification «Wrong turn»

Examples:
    | color | position | end position |
    | White | D4       | E6           |
    | White | D4       | F5           |
    | White | D4       | F3           |
    | White | D4       | E2           |
    | White | D4       | C2           |
    | White | D4       | B3           |
    | White | D4       | B5           |
    | White | D4       | C6           |
    | Black | D5       | C7           |
    | Black | D5       | E7           |  
    | Black | D5       | F6           |  
    | Black | D5       | F4           |  
    | Black | D5       | E3           |  
    | Black | D5       | C3           |  
    | Black | D5       | B4           |  
    | Black | D5       | B6           |     