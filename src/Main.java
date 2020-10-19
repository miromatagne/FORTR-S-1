import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Iterator;

public class Main{
    public static void main(String[] argv) {
    if (argv.length == 0 || argv.length > 1) {
      System.out.println("Invalid number of arguments. One argument is expected.");
    }
    else {
      int firstFilePos = 0;
      LexicalAnalyzer scanner = null;
      try {
        java.io.FileInputStream stream = new java.io.FileInputStream(argv[0]);
        java.io.Reader reader = new java.io.InputStreamReader(stream, "UTF-8");
        scanner = new LexicalAnalyzer(reader);

        Map<String,Integer> variables = new LinkedHashMap<String,Integer>();
        Symbol receivedSymbol = scanner.nextToken();
        while (receivedSymbol.getType() != LexicalUnit.EOS ) {
          if(receivedSymbol.getType() == LexicalUnit.VARNAME) {
            if(!variables.containsKey(receivedSymbol.getValue().toString())) {
              variables.put(receivedSymbol.getValue().toString(),receivedSymbol.getLine());
            }
          }
          System.out.println(receivedSymbol.toString());
          receivedSymbol = scanner.nextToken();
        }
        Iterator it = variables.entrySet().iterator();
        System.out.println("\nVariables");
        while (it.hasNext()) {
          Map.Entry pair = (Map.Entry)it.next();
          System.out.println(pair.getKey() + "\t" + pair.getValue());
          it.remove(); // avoids a ConcurrentModificationException
        }
      }
        catch (java.io.FileNotFoundException e) {
          System.out.println("File not found : \""+argv[0]+"\"");
        }
        catch (java.io.IOException e) {
          System.out.println("IO error scanning file \""+argv[0]+"\"");
          System.out.println(e);
        }
        catch (Exception e) {
          System.out.println("Unexpected exception:");
          e.printStackTrace();
        }
      }
    }
}