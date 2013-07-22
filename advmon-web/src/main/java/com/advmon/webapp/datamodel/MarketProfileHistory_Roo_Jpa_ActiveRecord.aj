// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.MarketProfileHistory;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MarketProfileHistory_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager MarketProfileHistory.entityManager;
    
    public static final EntityManager MarketProfileHistory.entityManager() {
        EntityManager em = new MarketProfileHistory().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long MarketProfileHistory.countMarketProfileHistorys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MarketProfileHistory o", Long.class).getSingleResult();
    }
    
    public static List<MarketProfileHistory> MarketProfileHistory.findAllMarketProfileHistorys() {
        return entityManager().createQuery("SELECT o FROM MarketProfileHistory o", MarketProfileHistory.class).getResultList();
    }
    
    public static MarketProfileHistory MarketProfileHistory.findMarketProfileHistory(Long id) {
        if (id == null) return null;
        return entityManager().find(MarketProfileHistory.class, id);
    }
    
    public static List<MarketProfileHistory> MarketProfileHistory.findMarketProfileHistoryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MarketProfileHistory o", MarketProfileHistory.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void MarketProfileHistory.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void MarketProfileHistory.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            MarketProfileHistory attached = MarketProfileHistory.findMarketProfileHistory(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void MarketProfileHistory.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void MarketProfileHistory.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public MarketProfileHistory MarketProfileHistory.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MarketProfileHistory merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}