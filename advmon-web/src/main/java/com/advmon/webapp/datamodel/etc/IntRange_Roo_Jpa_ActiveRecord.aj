// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.etc;

import com.advmon.webapp.datamodel.etc.IntRange;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect IntRange_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager IntRange.entityManager;
    
    public static final EntityManager IntRange.entityManager() {
        EntityManager em = new IntRange().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long IntRange.countIntRanges() {
        return entityManager().createQuery("SELECT COUNT(o) FROM IntRange o", Long.class).getSingleResult();
    }
    
    public static List<IntRange> IntRange.findAllIntRanges() {
        return entityManager().createQuery("SELECT o FROM IntRange o", IntRange.class).getResultList();
    }
    
    public static IntRange IntRange.findIntRange(Long id) {
        if (id == null) return null;
        return entityManager().find(IntRange.class, id);
    }
    
    public static List<IntRange> IntRange.findIntRangeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM IntRange o", IntRange.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void IntRange.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void IntRange.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            IntRange attached = IntRange.findIntRange(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void IntRange.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void IntRange.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public IntRange IntRange.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        IntRange merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}