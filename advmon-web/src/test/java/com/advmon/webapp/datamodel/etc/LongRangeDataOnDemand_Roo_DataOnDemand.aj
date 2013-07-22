// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.etc;

import com.advmon.webapp.datamodel.etc.LongRange;
import com.advmon.webapp.datamodel.etc.LongRangeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect LongRangeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LongRangeDataOnDemand: @Component;
    
    private Random LongRangeDataOnDemand.rnd = new SecureRandom();
    
    private List<LongRange> LongRangeDataOnDemand.data;
    
    public LongRange LongRangeDataOnDemand.getNewTransientLongRange(int index) {
        LongRange obj = new LongRange();
        setDescription(obj, index);
        setMax(obj, index);
        setMin(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void LongRangeDataOnDemand.setDescription(LongRange obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void LongRangeDataOnDemand.setMax(LongRange obj, int index) {
        Long max = new Integer(index).longValue();
        obj.setMax(max);
    }
    
    public void LongRangeDataOnDemand.setMin(LongRange obj, int index) {
        Long min = new Integer(index).longValue();
        obj.setMin(min);
    }
    
    public void LongRangeDataOnDemand.setName(LongRange obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public LongRange LongRangeDataOnDemand.getSpecificLongRange(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        LongRange obj = data.get(index);
        Long id = obj.getId();
        return LongRange.findLongRange(id);
    }
    
    public LongRange LongRangeDataOnDemand.getRandomLongRange() {
        init();
        LongRange obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return LongRange.findLongRange(id);
    }
    
    public boolean LongRangeDataOnDemand.modifyLongRange(LongRange obj) {
        return false;
    }
    
    public void LongRangeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = LongRange.findLongRangeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'LongRange' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<LongRange>();
        for (int i = 0; i < 10; i++) {
            LongRange obj = getNewTransientLongRange(i);
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