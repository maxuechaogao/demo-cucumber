package fun;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;



public class DateUtil {
	
	/**
	 * 获取当前日期(不包含时分秒)的时间戳
	 * @return
	 */
	public static Long getDayTime(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    String dateStr= sdf.format(new Date());
	    Date date=null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date.getTime();
	}

    /**
     * 精确到毫秒，获取当前时间
     * @return
     */
    public static Long getMillTime(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyMMddHHmmssssss");
        String dateStr= sdf.format(new Date());
        Date date=null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return date.getTime();
    }

	/** 
     * 时间戳转换成日期格式字符串 
     * @param seconds 精确到秒的字符串 
     * formatStr
     * @return 
     */  
    public String timeStampToDate(String seconds,String format) {  
        if(seconds == null || seconds.isEmpty() || seconds.equals("null")){  
            return "";  
        }  
        if(format == null || format.isEmpty()) format = "yyyyMMddHHmmss";
        //format = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(format);  
        return sdf.format(new Date(Long.valueOf(seconds+"000")));  
    }
    
    public String timeStampToDate(int seconds,String format) {  
        if(seconds == 0){  
            return "";  
        }  
        if(format == null || format.isEmpty()) format = "yyyyMMddHHmmss";
        //format = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(format);  
        return sdf.format(new Date(Long.valueOf(seconds+"000")));  
    }
    
    /** 
     * 日期格式字符串转换成时间戳 
     * @param date 字符串日期 
     * @param format 如：yyyy-MM-dd HH:mm:ss 
     * @return 
     */  
    public String dateToTimeStamp(String date_str,String format){  
        try {  
            SimpleDateFormat sdf = new SimpleDateFormat(format);  
            return String.valueOf(sdf.parse(date_str).getTime()/1000);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return "";  
    }  
      
    /** 
     * 取得当前时间戳（精确到秒） 
     * @return 
     */  
    public static int getTimeStamp(){
    	long timel = System.currentTimeMillis();
    	int time = (int)(timel/1000);
        return time;
    }  
	
	/**
	 * 返回某个日期格式的当前时间
	 * @param format
	 * @return
	 */
	public static String getCurrentDate(String format) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String currentDate = sdf.format(date);
		return currentDate;
	}

	
	
}