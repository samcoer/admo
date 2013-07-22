// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.IncomeProfile;
import com.advmon.webapp.datamodel.profiles.IncomeProfileDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect IncomeProfileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: IncomeProfileDataOnDemand: @Component;
    
    private Random IncomeProfileDataOnDemand.rnd = new SecureRandom();
    
    private List<IncomeProfile> IncomeProfileDataOnDemand.data;
    
    public IncomeProfile IncomeProfileDataOnDemand.getNewTransientIncomeProfile(int index) {
        IncomeProfile obj = new IncomeProfile();
        setDescription(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void IncomeProfileDataOnDemand.setDescription(IncomeProfile obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void IncomeProfileDataOnDemand.setName(IncomeProfile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public IncomeProfile IncomeProfileDataOnDemand.getSpecificIncomeProfile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        IncomeProfile obj = data.get(index);
        Long id = obj.getId();
        return IncomeProfile.findIncomeProfile(id);
    }
    
    public IncomeProfile IncomeProfileDataOnDemand.getRandomIncomeProfile() {
        init();
        IncomeProfile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return IncomeProfile.findIncomeProfile(id);
    }
    
    public boolean IncomeProfileDataOnDemand.modifyIncomeProfile(IncomeProfile obj) {
        return false;
    }
    
    public void IncomeProfileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = IncomeProfile.findIncomeProfileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'IncomeProfile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<IncomeProfile>();
        for (int i = 0; i < 10; i++) {
            IncomeProfile obj = getNewTransientIncomeProfile(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}