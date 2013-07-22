// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.datamodel;

import com.advmon.webapp.datamodel.AdCategory;
import com.advmon.webapp.datamodel.AdCategoryDataOnDemand;
import com.advmon.webapp.datamodel.AdCategoryIntegrationTest;
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

privileged aspect AdCategoryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AdCategoryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AdCategoryIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AdCategoryIntegrationTest: @Transactional;
    
    @Autowired
    AdCategoryDataOnDemand AdCategoryIntegrationTest.dod;
    
    @Test
    public void AdCategoryIntegrationTest.testCountAdCategorys() {
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", dod.getRandomAdCategory());
        long count = AdCategory.countAdCategorys();
        Assert.assertTrue("Counter for 'AdCategory' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AdCategoryIntegrationTest.testFindAdCategory() {
        AdCategory obj = dod.getRandomAdCategory();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to provide an identifier", id);
        obj = AdCategory.findAdCategory(id);
        Assert.assertNotNull("Find method for 'AdCategory' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'AdCategory' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AdCategoryIntegrationTest.testFindAllAdCategorys() {
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", dod.getRandomAdCategory());
        long count = AdCategory.countAdCategorys();
        Assert.assertTrue("Too expensive to perform a find all test for 'AdCategory', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<AdCategory> result = AdCategory.findAllAdCategorys();
        Assert.assertNotNull("Find all method for 'AdCategory' illegally returned null", result);
        Assert.assertTrue("Find all method for 'AdCategory' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AdCategoryIntegrationTest.testFindAdCategoryEntries() {
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", dod.getRandomAdCategory());
        long count = AdCategory.countAdCategorys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<AdCategory> result = AdCategory.findAdCategoryEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'AdCategory' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'AdCategory' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AdCategoryIntegrationTest.testFlush() {
        AdCategory obj = dod.getRandomAdCategory();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to provide an identifier", id);
        obj = AdCategory.findAdCategory(id);
        Assert.assertNotNull("Find method for 'AdCategory' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdCategory(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'AdCategory' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AdCategoryIntegrationTest.testMergeUpdate() {
        AdCategory obj = dod.getRandomAdCategory();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to provide an identifier", id);
        obj = AdCategory.findAdCategory(id);
        boolean modified =  dod.modifyAdCategory(obj);
        Integer currentVersion = obj.getVersion();
        AdCategory merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'AdCategory' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AdCategoryIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", dod.getRandomAdCategory());
        AdCategory obj = dod.getNewTransientAdCategory(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'AdCategory' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'AdCategory' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AdCategoryIntegrationTest.testRemove() {
        AdCategory obj = dod.getRandomAdCategory();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AdCategory' failed to provide an identifier", id);
        obj = AdCategory.findAdCategory(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'AdCategory' with identifier '" + id + "'", AdCategory.findAdCategory(id));
    }
    
}
