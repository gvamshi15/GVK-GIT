
package uk.org.nt.converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * @author Vamshi Gulapally
 *
 */
public class Windows64bitDateConverter {
    /**
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
        DateFormat formatter = new SimpleDateFormat("d-MMM-yyyy");
        Date fromDate = formatter.parse("30-Sep-2016");
        Date toDate = formatter.parse("01-Nov-2016");
        System.out.println("From Date(human readable):" + fromDate);
        System.out.println("From Date(windows 64bit):" + new Windows64bitDateConverter().convert(fromDate));
        System.out.println("To Date(human readable)" + toDate);
        System.out.println("To Date(windows 64bit):" + new Windows64bitDateConverter().convert(toDate));
    }
    private long convert(Date dateToBeConverted) {
        long javaTime = dateToBeConverted.getTime();
        long windowsTime = (javaTime * 10000) + 116444736000000000L;
        return windowsTime;
    }
}