package fun;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.Random;

public class Rand {

    public int phoneNumberTitle[] = {
        134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,178,
            147,130,131,132,155,156,185,186,176,145,133,153,180,181,189,177,170
    };//中国手机号段

	/**
	 * 功能描述：判断一个日期是否在一个日期段内
	 *   参数：date 被判断日期
	 *       dateBefore 小日期
	 *       dateAfter  大日期
	 *  返回值：boolean值（true or false）
	 */
	public boolean dateCompare(Date date,Date dateBefore,Date dateAfter){
		if(date.before(dateAfter)&&date.after(dateBefore)){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 功能描述：产生一个随机数
	 *    参数：int型整数
	 *   返回值：小于number的正整数
	 */
	public int getRandom(int number) {
		Random rnd = new Random();
		if (number == 1 || number == 0) {
			return number;
		}
		return rnd.nextInt(number);	
    }

	/**
	 * 功能描述：获取本机的IP地址
	 *  返回值：本机IP地址
	 */
	public String getIp(){
		InetAddress address = null;
		try {
			address = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address.getHostAddress();
	}

    /**
     * 生成随机ip
     * @return
     */
    public String getRandomIp(){
        String ip = "";
        for(int i=0; i<3; i++){
            ip += getRandom(256);
            ip += ".";
        }
        return ip += getRandom(256);
    }

	/**
	 * 生成随机手机号
	 * @return
     */
	public String getTimeOrderPhoneNumber(){
		StringBuilder str=new StringBuilder();//定义变长字符串
		Random random=new Random();
		//随机生成数字，并添加到字符串
		for(int i=0;i<8;i++){
		    str.append(random.nextInt(10));
		}
		//将字符串转换为数字并输出
//		int num=Integer.parseInt(str.toString());
//		System.out.println(num);
        String phoneNumber = phoneNumberTitle[getRandom(phoneNumberTitle.length)] + "";
//        String tmp = DateUtil.getTimeStamp()+"";
//        tmp = tmp.substring(2);
        return phoneNumber + str;
	}

	/**
	 * 供b端app生产key ；
	 * r :当前时间戳（精确到毫秒）String rtime = String.valueOf(DateUtil.getMillTime());
	 */
	public static final String[] APPKEY={"tet!DSSGE433", "23HFHDfdsfs", "sfssdf#$DS03", "KGHGsa44@*(", "34Snbd3SSFL)(", "fh409gdM%MS", "879ELK(Biop", "4axbu0T)QI29", "ri^f906kpIOEG", "Pq#O19453iQYN"};
	public  static String getMD5Key(String r,String Path,String did){
		int app = Integer.valueOf(r.substring(7, 8));
		String key=APPKEY[app];
		String url = Path;
		String md5Key=MD5Util.md5(r+url+did+key);
		//去除15~20位
		md5Key= md5Key.substring(0, 15)+md5Key.substring(20);
		return md5Key;
	}



    public static void main(String args[]){
        System.out.println(new Rand().getTimeOrderPhoneNumber());
        for(int i=0; i<10; i++){
            System.out.println(new Rand().getRandomIp());
        }
    }


}
