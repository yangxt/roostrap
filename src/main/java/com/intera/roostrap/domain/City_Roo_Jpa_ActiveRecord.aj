// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.intera.roostrap.domain;

import com.intera.roostrap.domain.City;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect City_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager City.entityManager;
    
    public static final EntityManager City.entityManager() {
        EntityManager em = new City().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    @Transactional
    public static long City.countCitys() {
        return findAllCitys().size();
    }
    
    @Transactional
    public static List<City> City.findAllCitys() {
        return entityManager().createQuery("SELECT o FROM City o", City.class).getResultList();
    }
    
    @Transactional
    public static City City.findCity(String id) {
        if (id == null || id.length() == 0) return null;
        return entityManager().find(City.class, id);
    }
    
    @Transactional
    public static List<City> City.findCityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM City o", City.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void City.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void City.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            City attached = City.findCity(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void City.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void City.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public City City.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        City merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
