import java.io.*;
//import java.nio.channels.*;




class FileBackupClass{
	
	public FileBackupClass(File /*InputStream*/ what, File where){
		FileInputStream  fis = null;
		FileOutputStream fos = null;
		try {
			fis = new FileInputStream(what);
			//fis = what;
		    fos = new FileOutputStream(where);
		} catch (FileNotFoundException fNFExc) {
			System.out.println(fNFExc);
		}    
		    
	    try {
	        byte[] buf = new byte[1024];
	        int i = 0;
	        while ((i = fis.read(buf)) != -1) {
	            fos.write(buf, 0, i);
	        }
	    } 
	    catch (Exception e) {
	        System.out.println( e );
	    }
	    finally {
		    try {
		        if (fis != null) fis.close();
		        if (fos != null) fos.close();
		    } 
		    catch (Exception e) {
		        System.out.println( e );
		    }
	    }
	   System.out.println("File '"+what+"' is archived"); 
  	}//public FileBackupClass(File what, File where){
	
	public FileBackupClass(String whichFile){
		System.out.println("File '"+ whichFile + "' must be backuped here.");
	}
	
	
} //class FileBackupClass

/*
[JDK1.4 using the java.nio package (faster)]

import java.io.*;
import java.nio.channels.*;

public class FileUtils{
    public static void copyFile(File in, File out) 
        throws IOException 
    {
        FileChannel inChannel = new
            FileInputStream(in).getChannel();
        FileChannel outChannel = new
            FileOutputStream(out).getChannel();
        try {
            inChannel.transferTo(0, inChannel.size(),
                    outChannel);
        } 
        catch (IOException e) {
            throw e;
        }
        finally {
            if (inChannel != null) inChannel.close();
            if (outChannel != null) outChannel.close();
        }
    }

    public static void main(String args[]) throws IOException{
        FileUtils.copyFile(new File(args[0]),new File(args[1]));
  }
}

*/
/*
NOTE:
In win2000 , the transferTo() does not transfer files > than 2^31-1 bytes. it throws an exception of "java.io.IOException: The parameter is incorrect"
In solaris8 , Bytes transfered to Target channel are 2^31-1 even if the source channel file is greater than 2^31-1
In LinuxRH7.1 , it gives an error of java.io.IOException: Input/output error

ref : http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4643189

On the Windows plateform, you can't copy a file bigger than 64Mb, an Exception in thread "main" java.io.IOException: Insufficient system resources exist to complete the requested service is thrown.

For a discussion about this see : http://forum.java.sun.com/thread.jspa?threadID=439695&messageID=2917510

The workaround is to copy in a loop 64Mb each time until there is no more data.

Replace

        ...
        try {
            inChannel.transferTo(0, inChannel.size(),
                    outChannel);
        } 
        ...

by

        ...
        try {
           // magic number for Windows, 64Mb - 32Kb)
           int maxCount = (64 * 1024 * 1024) - (32 * 1024);
           long size = inChannel.size();
           long position = 0;
           while (position < size) {
              position += 
                inChannel.transferTo(position, maxCount, outChannel);
        } 
        ...
*/



