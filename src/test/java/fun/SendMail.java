package fun;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class SendMail {
	private String host = "172.17.3.15"; // smtp服务器
	private String user = "chai.dan"; // 用户名
	private String pwd = "315672aBc"; // 密码
	private String from = null; // 发件人地址
	private String to[] = null; // 收件人地址
	
	public SendMail(String from, String to[]) {
		this.from = from;
		this.to = to;
	}

	/**
	 * 群发邮件
	 * 
	 * @param recipients
	 * @param subject
	 * @param content
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public void send(String subject,String content,String file,String fileName) {
		Properties props = new Properties();
		// 设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）
		props.put("mail.smtp.host", host);
		// 需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）
		props.put("mail.smtp.auth", "true");
		// 用刚刚设置好的props对象构建一个session
		Session session = Session.getDefaultInstance(props);
		// 有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使
		// 用（你可以在控制台（console)上看到发送邮件的过程）
		session.setDebug(false);
		// 用session为参数定义消息对象
		MimeMessage message = new MimeMessage(session);
		try {
			// 设置发信人
			message.setFrom(new InternetAddress(from));
			// 设置收件人们
			final int num = to.length;
			InternetAddress[] addresses = new InternetAddress[num];
			for (int i = 0; i < num; i++) {
				addresses[i] = new InternetAddress(to[i]);
			}
			// 加载收件人地址
			message.setRecipients(RecipientType.TO, addresses);
			// 加载标题
			message.setSubject(subject);
			// 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
			Multipart multipart = new MimeMultipart();

			// 设置邮件的文本内容
			BodyPart contentPart = new MimeBodyPart();
			contentPart.setText(content);
			multipart.addBodyPart(contentPart);
		
			if(fileName!="" && fileName!=null){//有附件 
				//添加附件
	            BodyPart messageBodyPart= new MimeBodyPart();
	            DataSource source = new FileDataSource(file);
	            //添加附件的内容
	            messageBodyPart.setDataHandler(new DataHandler(source));
	            //添加附件的标题
	            messageBodyPart.setFileName(MimeUtility.encodeText(fileName, "GBK","B"));
	            multipart.addBodyPart(messageBodyPart);   
         	}
        
			// 将multipart对象放到message中
			message.setContent(multipart);
			// 保存邮件
			message.saveChanges();
			// 发送邮件
			Transport transport = session.getTransport("smtp");
			// 连接服务器的邮箱
			transport.connect(host, user, pwd);
			// 把邮件发送出去
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String [] args) throws AddressException, MessagingException{
		String to[] = {"chai.dan@zhaopin.com.cn"};
		SendMail mail = new SendMail("chai.dan@zhaopin.com.cn",to);
		mail.send("主题","测试", "D:\\UFT12破解.txt","UFT12破解.txt");
		
	}

}
