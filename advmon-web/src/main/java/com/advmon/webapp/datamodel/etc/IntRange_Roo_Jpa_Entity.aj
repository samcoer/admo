// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.etc;

import com.advmon.webapp.datamodel.etc.IntRange;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect IntRange_Roo_Jpa_Entity {
    
    declare @type: IntRange: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long IntRange.id;
    
    @Version
    @Column(name = "version")
    private Integer IntRange.version;
    
    public Long IntRange.getId() {
        return this.id;
    }
    
    public void IntRange.setId(Long id) {
        this.id = id;
    }
    
    public Integer IntRange.getVersion() {
        return this.version;
    }
    
    public void IntRange.setVersion(Integer version) {
        this.version = version;
    }
    
}