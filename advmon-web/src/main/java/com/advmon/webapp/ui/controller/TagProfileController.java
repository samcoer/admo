package com.advmon.webapp.ui.controller;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.advmon.webapp.datamodel.profiles.TagProfile;

@RequestMapping("/tagprofiles")
@Controller
@RooWebScaffold(path = "tagprofiles", formBackingObject = TagProfile.class)
public class TagProfileController {
}
