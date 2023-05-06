package com.controler;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.EClasses;
import com.model.EFaculty;
import com.model.EStudent;
import com.util.HibernateUtil;

public class ClassControler {
	public static boolean addData(EClasses sclass){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(sclass);
		tx.commit();
		return true;
	}
	public static boolean update(EClasses sclass){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(sclass);
		tx.commit();
		return true;
	}
	
	public static List<EClasses> getClasses(){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<EClasses> classList = session.createQuery("from EClasses ").list();
		return classList;
	}
	public static EClasses getClassesById(String id){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<EClasses> classList = session.createQuery("from EClasses where id="+Integer.parseInt(id)).list();
		return classList.get(0);
	}
	public static boolean isClassMappedToFacultyOrStudent(String classId){
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session = factory.openSession();
		List<EStudent> studentList = session.createQuery("from EStudent where classID="+Integer.parseInt(classId)).list();
		List<EFaculty> facultyList = session.createQuery("from EFaculty where classID="+Integer.parseInt(classId)).list();
		
		if(studentList.size()!=0 || facultyList.size()!=0) {
			return true;
		}else {
			
			return false;
		}
	}
	
	
	public static boolean remove(int id) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		
		Session session_db = factory.openSession();
		//List<ECourse> courseList = session_db.createQuery("from EClasses where").list();
		Query q = session_db.createQuery("delete EClasses where id="+id);
		Transaction tx = session_db.beginTransaction();
		q.executeUpdate();
		tx.commit();
		
		return true;
	}
	
}
