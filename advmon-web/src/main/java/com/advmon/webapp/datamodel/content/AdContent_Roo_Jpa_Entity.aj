// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.content;

import com.advmon.webapp.datamodel.content.AdContent;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect AdContent_Roo_Jpa_Entity {
    
    declare @type: AdContent: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long AdContent.id;
    
    @Version
    @Column(name = "version")
    private Integer AdContent.version;
    
    public Long AdContent.getId() {
        return this.id;
    }
    
    public void AdContent.setId(Long id) {
        this.id = id;
    }
    
    public Integer AdContent.getVersion() {
        return this.version;
    }
    
    public void AdContent.setVersion(Integer version) {
        this.version = version;
    }
    
}
