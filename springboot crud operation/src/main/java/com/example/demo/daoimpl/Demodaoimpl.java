package com.example.demo.daoimpl;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scala.annotation.meta.setter;

import com.example.demo.Model.DemoModel;
import com.example.demo.Service.Demoservice;

@Repository
public class Demodaoimpl implements Demoservice 
{
	@Autowired
	EntityManager entityManager;
	
	/*@Autowired
	SessionFactory sf;*/
	
	@Override
	@Transactional
	public void save(DemoModel insobj)
	{
		entityManager.persist(insobj);
		/*Session session=sf.getCurrentSession();
		session.save(insobj);*/
	}

	@Override
	@Transactional
	public List<DemoModel> demodetails() {
		@SuppressWarnings("unchecked")
		List<DemoModel> listobj = entityManager.createQuery("from DemoModel").getResultList();
		return listobj;
	}

	@Override
	public DemoModel demoedit(int id)
	{
		DemoModel editobj = (DemoModel)entityManager.createQuery("from DemoModel where id=:id").setParameter("id", id).getSingleResult();
		return editobj;
	}

	@Override
	@Transactional
	public void update(DemoModel updateobj)
	{
		entityManager.merge(updateobj);	
	}

	@Override
	@Transactional
	public void delete(int id) 
	{
		entityManager.createQuery("delete from DemoModel where id=:id").setParameter("id", id).executeUpdate();		
	}

	

}
