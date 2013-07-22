// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.ui.controller;

import com.advmon.webapp.datamodel.AdCategory;
import com.advmon.webapp.datamodel.Advertisement;
import com.advmon.webapp.datamodel.Tag;
import com.advmon.webapp.ui.controller.AdCategoryController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AdCategoryController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AdCategoryController.create(@Valid AdCategory adCategory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, adCategory);
            return "adcategorys/create";
        }
        uiModel.asMap().clear();
        adCategory.persist();
        return "redirect:/adcategorys/" + encodeUrlPathSegment(adCategory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AdCategoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AdCategory());
        return "adcategorys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AdCategoryController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("adcategory", AdCategory.findAdCategory(id));
        uiModel.addAttribute("itemId", id);
        return "adcategorys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AdCategoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("adcategorys", AdCategory.findAdCategoryEntries(firstResult, sizeNo));
            float nrOfPages = (float) AdCategory.countAdCategorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("adcategorys", AdCategory.findAllAdCategorys());
        }
        return "adcategorys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AdCategoryController.update(@Valid AdCategory adCategory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, adCategory);
            return "adcategorys/update";
        }
        uiModel.asMap().clear();
        adCategory.merge();
        return "redirect:/adcategorys/" + encodeUrlPathSegment(adCategory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AdCategoryController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AdCategory.findAdCategory(id));
        return "adcategorys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AdCategoryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AdCategory adCategory = AdCategory.findAdCategory(id);
        adCategory.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/adcategorys";
    }
    
    void AdCategoryController.populateEditForm(Model uiModel, AdCategory adCategory) {
        uiModel.addAttribute("adCategory", adCategory);
        uiModel.addAttribute("advertisements", Advertisement.findAllAdvertisements());
        uiModel.addAttribute("tags", Tag.findAllTags());
    }
    
    String AdCategoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
