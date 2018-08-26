package com.dao;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.bean.Receiptbean;
import com.bean.alerts;

public class AlertDao {

	public void SendReceipt(Receiptbean a) {
		final String Senderid = "amn.tms2017@gmail.com";
		final String password = "9714670032";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.starttls.enable", "true");

		props.put("mail.smtp.host", "smtp.gmail.com");

		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(Senderid, password);

			}

		});

		try {


			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(Senderid));

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(a.getMail())); // mail
			message.setSubject("Amn Tuition Management System");

			String msg1 = "<html><head><meta charset='ISO-8859-1'><title>invoice</title><style type='text/css'>table {width: 80%;border-collapse: collapse;}</style></head><body><h1 align='center'>Student Receipt</h1>" + 
					"<center><table border='1'><tr><td colspan='2' align='left'><b>TMS Tuition Management System</b> <br> Address : Krushnanagar society,Ahemdabad-13<br>Phone : 9714670032 <br>Email : amn.tms2017@gmail.com</td>" + 
					"</tr><tr><td colspan='2' align='center'><b><font size='5'>Receipt</font></b></td></tr><tr><td colspan='2' align='right'><b>Date :</b>"+a.getDate()+"<br><b>Payment Id :</b> "+a.getPaymentid()+"</td></tr><tr><th align='left'>Name</th>" + 
					"<td>"+a.getName()+"</td></tr><tr><th align='left'>Course</th><td>"+a.getCourse()+"</td></tr><tr><th align='left'>Ammount</th><td>"+a.getAmmount()+"</td></tr><tr><th align='left'>Payment Type</th><td>"+a.getPaymenttype()+"</td></tr><tr><th align='left'>Installment No</th><td>"+a.getInstallmentno()+"</td></tr><tr><td colspan='2' align='right'><b>Total :</b> "+a.getAmmount()+"</td>" + 
					"</tr><tr><td colspan='2'><b>By</b><br> <br> AMN Tuition Management System<br> 1) Subject to Ahemdabad Juridiction.<br>2) Fees Once Paid Will Not be Refunded.<br> 3) Rules & Regulations of the Company Will have to Obeyed.<br></td></tr> " + 
					"</table></center></body>" + 
					"</html>";

			message.setContent(msg1, "text/html; charset=utf-8");
			Transport.send(message);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
	public void SendEmail(alerts a, String email) {
		final String Senderid = "amn.tms2017@gmail.com";
		final String password = "9714670032";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.starttls.enable", "true");

		props.put("mail.smtp.host", "smtp.gmail.com");

		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(Senderid, password);

			}

		});

		try {


			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(Senderid));

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // mail
			message.setSubject(a.getSubject());

			String msg1 = "<!DOCTYPE html><html><head></head><body><center><div style='background-color:#f1f1f1; width:500px; height:200px'><div style='background-color:#1db1fa; width:500px; height:50px'><h3 style='color:white; padding-top:10px;'>"
					+ a.getHeader() + "</h3></div><p style='color:gray; margin-left:-300px;'>Dear "

					+ email + ",</p><br><p style='color:gray; margin-top:-10px;'>" + a.getMessage()
					+ "</p><div></center></body></html>";

			message.setContent(msg1, "text/html; charset=utf-8");
			Transport.send(message);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

}
