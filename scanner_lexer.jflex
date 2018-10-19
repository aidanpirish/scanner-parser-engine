Authors: Aidan Irish, Aidan Crump, Muhammad Hassan Rao

import java_cup.runtime.Symbol;

%%

%class AlgebraScanner
%unicode
%type Symbol

%eofval{
    return new Symbol(AlgebraParserSym.EOF);
%eofval}
%eofclose

%%

<YYINITIAL> {
    \+ {
        System.out.println("+");
        return new Symbol(AlgebraParserSym.PLUS);
    }

    - {
        System.out.println("-");
        return new Symbol(AlgebraParserSym.MINUS);
    }

    \* {
        System.out.println("*");
        return new Symbol(AlgebraParserSym.MULT);
    }

    \/ {
        System.out.println("/");
        return new Symbol(AlgebraParserSym.DIV);
    }

    \^ {
        System.out.println("^");
        return new Symbol(AlgebraParserSym.PWR);

    }

    \( {
        System.out.println("(");
        return new Symbol(AlgebraParserSym.LPAREN);
    }

    \) {
        System.out.println(")");
        return new Symbol(AlgebraParserSym.RPAREN);
    }

    [0-9]+(\.[0-9]+)? {
        System.out.println("Number: " + yytext());
        return new Symbol(AlgebraParserSym.NUMBER,
            Double.parseDouble(yytext()));
    }

    [a-zA-Z_][0-9a-zA-Z_]* {
        System.out.println("Identifier: " + yytext());
        return new Symbol(AlgebraParserSym.IDENTIFIER, yytext());
    }

    \s+ {
        return yylex();
    }

    . {
        System.out.println("Invalid character: " + yytext());
    }
}
