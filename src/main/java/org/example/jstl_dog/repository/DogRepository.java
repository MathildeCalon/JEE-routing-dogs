package org.example.jstl_dog.repository;

import org.example.jstl_dog.entity.Dog;
import org.example.jstl_dog.utils.SessionFactorySingleton;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

public class DogRepository {
        private SessionFactory sessionFactory;
        private Session session;

        public DogRepository() {
            sessionFactory = SessionFactorySingleton.getSessionFactory();
        }

        public Dog create (Dog dog){
            try {
                session = sessionFactory.openSession();
                session.beginTransaction();
                session.save(dog);
                session.getTransaction().commit();
                return dog;
            } catch (Exception e) {
                session.getTransaction().rollback();
                return null;
            } finally {
                session.close();
            }
        }

        public Dog findById(int id){
            session = sessionFactory.openSession();
            Dog dog = session.get(Dog.class, id);
            session.close();
            return dog;
        }

        public List<Dog> findAll(){
            session = sessionFactory.openSession();
            Query<Dog> query = session.createQuery("from Dog");
            List<Dog> dogs = query.getResultList();
            session.close();
            return dogs;
        }
}
