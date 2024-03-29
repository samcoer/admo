// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.advmon.webapp.ui.controller;

import com.advmon.webapp.datamodel.Advertisement;
import com.advmon.webapp.datamodel.content.AudioContent;
import com.advmon.webapp.ui.controller.AudioContentController;
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

privileged aspect AudioContentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AudioContentController.create(@Valid AudioContent audioContent, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, audioContent);
            return "audiocontents/create";
        }
        uiModel.asMap().clear();
        audioContent.persist();
        return "redirect:/audiocontents/" + encodeUrlPathSegment(audioContent.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AudioContentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AudioContent());
        return "audiocontents/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AudioContentController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("audiocontent", AudioContent.findAudioContent(id));
        uiModel.addAttribute("itemId", id);
        return "audiocontents/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AudioContentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("audiocontents", AudioContent.findAudioContentEntries(firstResult, sizeNo));
            float nrOfPages = (float) AudioContent.countAudioContents() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("audiocontents", AudioContent.findAllAudioContents());
        }
        return "audiocontents/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AudioContentController.update(@Valid AudioContent audioContent, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, audioContent);
            return "audiocontents/update";
        }
        uiModel.asMap().clear();
        audioContent.merge();
        return "redirect:/audiocontents/" + encodeUrlPathSegment(audioContent.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AudioContentController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AudioContent.findAudioContent(id));
        return "audiocontents/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AudioContentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AudioContent audioContent = AudioContent.findAudioContent(id);
        audioContent.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/audiocontents";
    }
    
    void AudioContentController.populateEditForm(Model uiModel, AudioContent audioContent) {
        uiModel.addAttribute("audioContent", audioContent);
        uiModel.addAttribute("advertisements", Advertisement.findAllAdvertisements());
    }
    
    String AudioContentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
