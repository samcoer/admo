package com.advmon.webapp.ui.controller;
import com.advmon.webapp.datamodel.profiles.IntRangeProfile;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/intrangeprofiles")
@Controller
@RooWebScaffold(path = "intrangeprofiles", formBackingObject = IntRangeProfile.class)
public class IntRangeProfileController {
}
