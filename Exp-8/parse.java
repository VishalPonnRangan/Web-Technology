import java.io.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;
public class parse
{
public static void main(String[] arg)
{
try
{
System.out.println("enter the name of xml document");
BufferedReader input=new BufferedReader(new InputStreamReader(System.in));
String file_name=input.readLine();
File fp=new File(file_name);
if(fp.exists())
{
try
{
DocumentBuilderFactory Factory_obj=DocumentBuilderFactory.newInstance();
DocumentBuilder builder=Factory_obj.newDocumentBuilder();
InputSource ip_src=new InputSource(file_name);
Document doc=builder.parse(ip_src);
System.out.println(file_name+" is well-formed!");
}
catch(Exception e)
{
System.out.println(file_name+" isn't well-formed!");
System.exit(1);
}
}
else
{
System.out.print("file not found!");
}
}
catch(IOException ex)
{
ex.printStackTrace();
}
}
}
