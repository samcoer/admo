// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.TargetMarketProfile;
import com.advmon.webapp.datamodel.TargetMarketProfileDataOnDemand;
import com.advmon.webapp.datamodel.TargetMarketProfileIntegrationTest;
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

privileged aspect TargetMarketProfileIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TargetMarketProfileIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TargetMarketProfileIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TargetMarketProfileIntegrationTest: @Transactional;
    
    @Autowired
    TargetMarketProfileDataOnDemand TargetMarketProfileIntegrationTest.dod;
    
    @Test
    public void TargetMarketProfileIntegrationTest.testCountTargetMarketProfiles() {
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", dod.getRandomTargetMarketProfile());
        long count = TargetMarketProfile.countTargetMarketProfiles();
        Assert.assertTrue("Counter for 'TargetMarketProfile' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testFindTargetMarketProfile() {
        TargetMarketProfile obj = dod.getRandomTargetMarketProfile();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to provide an identifier", id);
        obj = TargetMarketProfile.findTargetMarketProfile(id);
        Assert.assertNotNull("Find method for 'TargetMarketProfile' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TargetMarketProfile' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testFindAllTargetMarketProfiles() {
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", dod.getRandomTargetMarketProfile());
        long count = TargetMarketProfile.countTargetMarketProfiles();
        Assert.assertTrue("Too expensive to perform a find all test for 'TargetMarketProfile', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TargetMarketProfile> result = TargetMarketProfile.findAllTargetMarketProfiles();
        Assert.assertNotNull("Find all method for 'TargetMarketProfile' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TargetMarketProfile' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testFindTargetMarketProfileEntries() {
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", dod.getRandomTargetMarketProfile());
        long count = TargetMarketProfile.countTargetMarketProfiles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TargetMarketProfile> result = TargetMarketProfile.findTargetMarketProfileEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TargetMarketProfile' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TargetMarketProfile' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testFlush() {
        TargetMarketProfile obj = dod.getRandomTargetMarketProfile();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to provide an identifier", id);
        obj = TargetMarketProfile.findTargetMarketProfile(id);
        Assert.assertNotNull("Find method for 'TargetMarketProfile' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTargetMarketProfile(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'TargetMarketProfile' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testMergeUpdate() {
        TargetMarketProfile obj = dod.getRandomTargetMarketProfile();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to provide an identifier", id);
        obj = TargetMarketProfile.findTargetMarketProfile(id);
        boolean modified =  dod.modifyTargetMarketProfile(obj);
        Integer currentVersion = obj.getVersion();
        TargetMarketProfile merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'TargetMarketProfile' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", dod.getRandomTargetMarketProfile());
        TargetMarketProfile obj = dod.getNewTransientTargetMarketProfile(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TargetMarketProfile' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'TargetMarketProfile' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TargetMarketProfileIntegrationTest.testRemove() {
        TargetMarketProfile obj = dod.getRandomTargetMarketProfile();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TargetMarketProfile' failed to provide an identifier", id);
        obj = TargetMarketProfile.findTargetMarketProfile(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TargetMarketProfile' with identifier '" + id + "'", TargetMarketProfile.findTargetMarketProfile(id));
    }
    
}
