// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.MarketProfileHistory;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect MarketProfileHistory_Roo_Jpa_Entity {
    
    declare @type: MarketProfileHistory: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long MarketProfileHistory.id;
    
    @Version
    @Column(name = "version")
    private Integer MarketProfileHistory.version;
    
    public Long MarketProfileHistory.getId() {
        return this.id;
    }
    
    public void MarketProfileHistory.setId(Long id) {
        this.id = id;
    }
    
    public Integer MarketProfileHistory.getVersion() {
        return this.version;
    }
    
    public void MarketProfileHistory.setVersion(Integer version) {
        this.version = version;
    }
    
}
