// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.LanguageProfile;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LanguageProfile_Roo_Jpa_ActiveRecord {
    
    public static long LanguageProfile.countLanguageProfiles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LanguageProfile o", Long.class).getSingleResult();
    }
    
    public static List<LanguageProfile> LanguageProfile.findAllLanguageProfiles() {
        return entityManager().createQuery("SELECT o FROM LanguageProfile o", LanguageProfile.class).getResultList();
    }
    
    public static LanguageProfile LanguageProfile.findLanguageProfile(Long id) {
        if (id == null) return null;
        return entityManager().find(LanguageProfile.class, id);
    }
    
    public static List<LanguageProfile> LanguageProfile.findLanguageProfileEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LanguageProfile o", LanguageProfile.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public LanguageProfile LanguageProfile.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LanguageProfile merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
