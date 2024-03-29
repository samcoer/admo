// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel.profiles;

import com.advmon.webapp.datamodel.profiles.LanguageProfile;
import com.advmon.webapp.datamodel.profiles.LanguageProfileDataOnDemand;
import com.advmon.webapp.datamodel.profiles.LanguageProfileIntegrationTest;
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

privileged aspect LanguageProfileIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LanguageProfileIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LanguageProfileIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LanguageProfileIntegrationTest: @Transactional;
    
    @Autowired
    LanguageProfileDataOnDemand LanguageProfileIntegrationTest.dod;
    
    @Test
    public void LanguageProfileIntegrationTest.testCountLanguageProfiles() {
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", dod.getRandomLanguageProfile());
        long count = LanguageProfile.countLanguageProfiles();
        Assert.assertTrue("Counter for 'LanguageProfile' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testFindLanguageProfile() {
        LanguageProfile obj = dod.getRandomLanguageProfile();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to provide an identifier", id);
        obj = LanguageProfile.findLanguageProfile(id);
        Assert.assertNotNull("Find method for 'LanguageProfile' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'LanguageProfile' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testFindAllLanguageProfiles() {
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", dod.getRandomLanguageProfile());
        long count = LanguageProfile.countLanguageProfiles();
        Assert.assertTrue("Too expensive to perform a find all test for 'LanguageProfile', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<LanguageProfile> result = LanguageProfile.findAllLanguageProfiles();
        Assert.assertNotNull("Find all method for 'LanguageProfile' illegally returned null", result);
        Assert.assertTrue("Find all method for 'LanguageProfile' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testFindLanguageProfileEntries() {
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", dod.getRandomLanguageProfile());
        long count = LanguageProfile.countLanguageProfiles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<LanguageProfile> result = LanguageProfile.findLanguageProfileEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'LanguageProfile' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'LanguageProfile' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testFlush() {
        LanguageProfile obj = dod.getRandomLanguageProfile();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to provide an identifier", id);
        obj = LanguageProfile.findLanguageProfile(id);
        Assert.assertNotNull("Find method for 'LanguageProfile' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyLanguageProfile(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'LanguageProfile' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testMergeUpdate() {
        LanguageProfile obj = dod.getRandomLanguageProfile();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to provide an identifier", id);
        obj = LanguageProfile.findLanguageProfile(id);
        boolean modified =  dod.modifyLanguageProfile(obj);
        Integer currentVersion = obj.getVersion();
        LanguageProfile merged = (LanguageProfile)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'LanguageProfile' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", dod.getRandomLanguageProfile());
        LanguageProfile obj = dod.getNewTransientLanguageProfile(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'LanguageProfile' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'LanguageProfile' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LanguageProfileIntegrationTest.testRemove() {
        LanguageProfile obj = dod.getRandomLanguageProfile();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'LanguageProfile' failed to provide an identifier", id);
        obj = LanguageProfile.findLanguageProfile(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'LanguageProfile' with identifier '" + id + "'", LanguageProfile.findLanguageProfile(id));
    }
    
}
