package com.advmon.webapp.ui.controller;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.advmon.webapp.datamodel.content.AudioContent;

@RequestMapping("/audiocontents")
@Controller
@RooWebScaffold(path = "audiocontents", formBackingObject = AudioContent.class)
public class AudioContentController {
}
