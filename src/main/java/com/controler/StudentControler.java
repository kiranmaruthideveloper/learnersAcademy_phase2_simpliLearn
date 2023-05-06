package com.controler;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.ELogin;
import com.model.EStudent;
import com.util.HibernateUtil;

public class StudentControler {
	public static boolean addData(EStudent student) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Transaction tx = session_db.beginTransaction();
		session_db.save(student);
		tx.commit();
		return true;
	}
	
	public static List<EStudent> getStudents(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<EStudent> studentList = session.createQuery("from EStudent ").list();
		return studentList;
	}
	
	public static boolean remove(int id) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Query q = session_db.createQuery("delete EStudent where id="+id);
		Transaction tx = session_db.beginTransaction();
		q.executeUpdate();
		tx.commit();
		
		return true;
	}
	
	public static boolean update(EStudent student) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		Transaction tx = session_db.beginTransaction();
		session_db.update(student);
		tx.commit();
		return true;
	}

}
