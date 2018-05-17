package Automata;
import java.io.*;
/**
 * @author Joanan
 */
public class GenerarLex {
    public static void main(String []args){
        String archivo=System.getProperty("user.dir")+"/src/Automata/Lexer.flex";
        File file=new File(archivo);
	jflex.Main.generate(file);
    }
    
}
