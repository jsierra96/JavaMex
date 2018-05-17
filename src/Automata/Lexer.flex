package Automata;
import java_cup.runtime.*;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
%%
%{
/*-*
* funciones y variables
*/
private void imprimir(String descripcion, String lexema,JTable tabla) {
//System.out.println(lexema + " - " + descripcion);
   DefaultTableModel modelo = (DefaultTableModel)tabla.getModel();
   Object[] object = new Object[2];
   object[0] = lexema;
   object[1] = descripcion;
   modelo.addRow(object);
   tabla.setModel(modelo);
}
%}
/*-*
* Información sobre la clase generada
*/
%public
%class AnalizadorLexico
%type void
%unicode
/*-*
* Ajustes regulares
*/
IGUAL = "="
SALTO = \n|\r|\r\n
BLANCO= " "
SIGNO = ("+" | "-" | "*" | "/")
TXT = ","|"?"|"¿"|"$"|"."|"#"|"("|")"|"["|"]"|"{"|"}"|"%"|"#"|"!"|"¡"|[_|a-z|A-Z][a-z|A-Z|0-9|_]*
ENTERO = 0|[1-9][0-9]*
COMILLA="\""
BLANCO = [\n| |\t]
MS= {COMILLA}({TXT})+{COMILLA} | {COMILLA}({TXT})+{OTRO}+{COMILLA}
OTRO = ({BLANCO}({TXT})+)+
DECIMAL = [0-9][0-9]*"."[0-9]+
RESERVADO = "metodo" | "numero" | "imprime"

%%

";" {imprimir("Fin de instruccion",yytext(),tabla);}
{MS} { imprimir("Mensaje", yytext(),tabla); }
{SALTO} { imprimir("Salto de linea", yytext(),tabla); }
{RESERVADO} { imprimir("Palabra reservada", yytext(),tabla); }
{BLANCO} { imprimir("Blanco", yytext(),tabla); }
{TXT} { imprimir("Identificador", yytext(),tabla); }
{ENTERO} { imprimir("Numero entero", yytext(),tabla); }
{COMILLA} {imprimir("Comillas",yytext(),tabla);}
{DECIMAL} { imprimir("Punto flotante", yytext(),tabla); }
{IGUAL} { imprimir("Signo de igual", yytext(),tabla); }
{SIGNO} { imprimir("Operadores matemáticos", yytext(),tabla); }
"==" { imprimir("Operador igualdade", yytext(),tabla); }
. {imprimir("Caracter inválido",yytext(),tabla); }