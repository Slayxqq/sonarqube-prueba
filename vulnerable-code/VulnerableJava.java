import java.io.*;
import java.sql.*;
import java.util.*;

public class VulnerableJava {
    
    // VULNERABILIDAD 1: SQL Injection
    public void getUserData(String userId, Connection conn) throws SQLException {
        String query = "SELECT * FROM users WHERE id = " + userId;
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            System.out.println(rs.getString("name"));
        }
    }
    
    // VULNERABILIDAD 2: Hardcoded Credentials
    private static final String DB_PASSWORD = "admin123456";
    private static final String API_KEY = "sk-1234567890abcdefghijk";
    
    // VULNERABILIDAD 3: Path Traversal
    public void readFile(String filename) throws IOException {
        File file = new File("/uploads/" + filename);
        FileReader fr = new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        String line;
        while ((line = br.readLine()) != null) {
            System.out.println(line);
        }
        br.close();
    }
    
    // VULNERABILIDAD 4: Weak Cryptography
    import java.security.MessageDigest;
    
    public String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] messageDigest = md.digest(password.getBytes());
        String hexString = "";
        for (byte b : messageDigest) {
            hexString += Integer.toHexString(0xFF & b);
        }
        return hexString;
    }
    
    // VULNERABILIDAD 5: Null Pointer
    public int processArray(int[] arr) {
        return arr[0] + arr[1];
    }
    
    // VULNERABILIDAD 6: Command Injection
    public void executeCommand(String userInput) throws IOException {
        String[] cmd = {"/bin/sh", "-c", "ls " + userInput};
        Runtime.getRuntime().exec(cmd);
    }
    
    // VULNERABILIDAD 7: XXE (XML External Entity)
    import javax.xml.parsers.DocumentBuilder;
    import javax.xml.parsers.DocumentBuilderFactory;
    import org.w3c.dom.Document;
    
    public void parseXML(String xmlString) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(new java.io.ByteArrayInputStream(xmlString.getBytes()));
    }
    
    // VULNERABILIDAD 8: Weak Random
    import java.util.Random;
    
    public int generateToken() {
        Random rand = new Random();
        return rand.nextInt(10000);
    }
}
