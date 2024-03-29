// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.AdCategory;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdCategory_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager AdCategory.entityManager;
    
    public static final EntityManager AdCategory.entityManager() {
        EntityManager em = new AdCategory().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AdCategory.countAdCategorys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AdCategory o", Long.class).getSingleResult();
    }
    
    public static List<AdCategory> AdCategory.findAllAdCategorys() {
        return entityManager().createQuery("SELECT o FROM AdCategory o", AdCategory.class).getResultList();
    }
    
    public static AdCategory AdCategory.findAdCategory(Long id) {
        if (id == null) return null;
        return entityManager().find(AdCategory.class, id);
    }
    
    public static List<AdCategory> AdCategory.findAdCategoryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AdCategory o", AdCategory.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void AdCategory.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AdCategory.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AdCategory attached = AdCategory.findAdCategory(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AdCategory.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AdCategory.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public AdCategory AdCategory.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AdCategory merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
