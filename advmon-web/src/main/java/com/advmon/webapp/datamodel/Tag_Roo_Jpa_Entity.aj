// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.Tag;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Tag_Roo_Jpa_Entity {
    
    declare @type: Tag: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Tag.id;
    
    @Version
    @Column(name = "version")
    private Integer Tag.version;
    
    public Long Tag.getId() {
        return this.id;
    }
    
    public void Tag.setId(Long id) {
        this.id = id;
    }
    
    public Integer Tag.getVersion() {
        return this.version;
    }
    
    public void Tag.setVersion(Integer version) {
        this.version = version;
    }
    
}
