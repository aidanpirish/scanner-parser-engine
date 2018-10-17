program:    statements

statement:  command ';' 
            | assignment ';'

assignment: name '=' expr 
            | name '=' command

command:    keyword expr

keyword:    'print'
            | 'input'
