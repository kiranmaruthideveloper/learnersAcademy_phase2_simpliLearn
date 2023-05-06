package com.controler;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.model.ELogin;
import com.util.HibernateUtil;





public class ValidateLogin {
	List<ELogin> loginList;
	
	
	public String validateUser(String uname, String password) {
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		System.out.println("uname: "+uname);
		System.out.println("password: "+password);
		
		List<ELogin> loginList = session.createQuery("from ELogin where email='"+uname+"' and password='"+password+"'").list();
		System.out.println(loginList);
		setLoginList(loginList);
		
		if(uname.length() == 0 || uname == null) {
			return ("Uname Can't be Empty");
		}else if(password.length() == 0 || password == null) {
			return "password Can't be Empty";
		}else {
			if(loginList.size()!=0) {
				return "1";
			}else {				
				return "0";
			}
		}
	}


	public void setLoginList(List<ELogin> loginList) {
		this.loginList = loginList;
	}


	public List<ELogin> getLoginList() {
		return loginList;
	}
	
	

}
