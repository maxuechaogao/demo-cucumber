package fun;

import java.io.*;
import java.util.Properties;

/**
 * Created by hanminggui on 6/2/2016.
 */
public class Proper {

    //配置文件目录
    private final String source = System.getProperty("user.dir") + "/build/resources/test/";

    /**
     * 读取配置文件
     * @param fileName 文件名称
     * @return  读取完成的Properties对象
     */
    public Properties getProperties(String fileName){
        System.out.println();
        Properties pro = null;
        try {
            InputStream is = new BufferedInputStream(new FileInputStream(source+fileName));
            pro = new Properties();
            pro.load(is);
            is.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return pro;
    }
}
