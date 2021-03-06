// Authors: Aidan Irish, Aidan Crump, Muhammad Hassan Rao

import java_cup.runtime.Symbol;

// We are using LangScanner instead of AlgebraScanner
// Additonal token types: COMMA, PRINT, INPUT, SEMI, EQUAL, QUOTE
%%

%class LangScanner
%unicode
%type Symbol

%eofval{
    return new Symbol(LangParserSym.EOF);
%eofval}
%eofclose

%%

<YYINITIAL> {
    \+ {
        System.out.println("+");
        return new Symbol(LangParserSym.PLUS);
    }

    - {
        System.out.println("-");
        return new Symbol(LangParserSym.MINUS);
    }

    \* {
        System.out.println("*");
        return new Symbol(LangParserSym.MULT);
    }

    \/ {
        System.out.println("/");
        return new Symbol(LangParserSym.DIV);
    }

    \^ {
        System.out.println("^");
        return new Symbol(LangParserSym.PWR);

    }

    \( {
        System.out.println("(");
        return new Symbol(LangParserSym.LPAREN);
    }

    \) {
        System.out.println(")");
        return new Symbol(LangParserSym.RPAREN);
    }

    \, {
      System.out.println(",");
        return new Symbol(LangParserSym.COMMA);
    }

    \; {
      System.out.println(";");
        return new Symbol(LangParserSym.SEMI);
    }

    \= {
      System.out.println("=");
        return new Symbol(LangParserSym.EQUAL);
    }

    \"(.*?)\" {
      System.out.println("Word: " + yytext());
        return new Symbol(LangParserSym.WORD, yytext());
    }

    (print)+ {
      System.out.println("Print");
        return new Symbol(LangParserSym.PRINT);
    }

    [0-9]+(\.[0-9]+)? {
        System.out.println("Number: " + yytext());
        return new Symbol(LangParserSym.NUMBER,
            Double.parseDouble(yytext()));
    }

    [a-zA-Z_][0-9a-zA-Z_]* {
        System.out.println("Identifier: " + yytext());
        return new Symbol(LangParserSym.IDENTIFIER, yytext());
    }

    \s+ {
        return yylex();
    }

    . {
        System.out.println("Invalid character: " + yytext());
    }
}
