// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.etc;

import com.advmon.webapp.datamodel.etc.IntRange;
import com.advmon.webapp.datamodel.etc.IntRangeDataOnDemand;
import com.advmon.webapp.datamodel.etc.IntRangeIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect IntRangeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: IntRangeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: IntRangeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: IntRangeIntegrationTest: @Transactional;
    
    @Autowired
    IntRangeDataOnDemand IntRangeIntegrationTest.dod;
    
    @Test
    public void IntRangeIntegrationTest.testCountIntRanges() {
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", dod.getRandomIntRange());
        long count = IntRange.countIntRanges();
        Assert.assertTrue("Counter for 'IntRange' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void IntRangeIntegrationTest.testFindIntRange() {
        IntRange obj = dod.getRandomIntRange();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to provide an identifier", id);
        obj = IntRange.findIntRange(id);
        Assert.assertNotNull("Find method for 'IntRange' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'IntRange' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void IntRangeIntegrationTest.testFindAllIntRanges() {
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", dod.getRandomIntRange());
        long count = IntRange.countIntRanges();
        Assert.assertTrue("Too expensive to perform a find all test for 'IntRange', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<IntRange> result = IntRange.findAllIntRanges();
        Assert.assertNotNull("Find all method for 'IntRange' illegally returned null", result);
        Assert.assertTrue("Find all method for 'IntRange' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void IntRangeIntegrationTest.testFindIntRangeEntries() {
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", dod.getRandomIntRange());
        long count = IntRange.countIntRanges();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<IntRange> result = IntRange.findIntRangeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'IntRange' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'IntRange' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void IntRangeIntegrationTest.testFlush() {
        IntRange obj = dod.getRandomIntRange();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to provide an identifier", id);
        obj = IntRange.findIntRange(id);
        Assert.assertNotNull("Find method for 'IntRange' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIntRange(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'IntRange' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void IntRangeIntegrationTest.testMergeUpdate() {
        IntRange obj = dod.getRandomIntRange();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to provide an identifier", id);
        obj = IntRange.findIntRange(id);
        boolean modified =  dod.modifyIntRange(obj);
        Integer currentVersion = obj.getVersion();
        IntRange merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'IntRange' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void IntRangeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", dod.getRandomIntRange());
        IntRange obj = dod.getNewTransientIntRange(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'IntRange' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'IntRange' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'IntRange' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void IntRangeIntegrationTest.testRemove() {
        IntRange obj = dod.getRandomIntRange();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntRange' failed to provide an identifier", id);
        obj = IntRange.findIntRange(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'IntRange' with identifier '" + id + "'", IntRange.findIntRange(id));
    }
    
}
