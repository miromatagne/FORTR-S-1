public class Main{
    public static void main(String[] argv) {
    if (argv.length == 0) {
      System.out.println("Usage : java LexicalAnalyzer <inputfile(s)>");
    }
    else {
      int firstFilePos = 0;
      LexicalAnalyzer scanner = null;
      try {
        java.io.FileInputStream stream = new java.io.FileInputStream(argv[0]);
        java.io.Reader reader = new java.io.InputStreamReader(stream, "UTF-8");
        scanner = new LexicalAnalyzer(reader);
        Symbol receivedSymbol = scanner.nextToken();
        while (receivedSymbol.getType() != LexicalUnit.EOS ) {
            System.out.println(receivedSymbol.toString());
            receivedSymbol = scanner.nextToken();
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