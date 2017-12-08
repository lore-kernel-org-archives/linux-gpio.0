From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 17:16:48 +0000
Message-ID: <20171208171648.sbznughahicmklcs@localhost.localdomain>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
 <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
 <20171208162818.GA24344@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:48090 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751204AbdLHRQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Dec 2017 12:16:53 -0500
Content-Disposition: inline
In-Reply-To: <20171208162818.GA24344@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

On Fri, Dec 08, 2017 at 08:28:18AM -0800, Tony Lindgren wrote:
> * Charles Keepax <ckeepax@opensource.cirrus.com> [171208 14:31]:
> > From the implementation so far the pinctrl-single stuff appears to
> > target systems where there isn't really a concept of groups. Each
> > pin is just a completely separate entry and you can only configure
> > things one pin at a time. In that case it almost makes more sense
> > to model each pin as an individual group such that it is clearly
> > distinct from the others.
> 
> Maybe check again or else I don't follow you :)
> 
> The pinctrl groups are created dynamically with pinctrl-single
> based on how the pins are grouped in the dts file:
> 
> mmc1_pins: pinmux_mmc1_pins {
> 	pinctrl-single,pins = <
> 		OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLUP | MUX_MODE0)
> 		OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)
> 		OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)
> 		OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)
> 		OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)
> 		OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)
> 	>;
> };
> 
> Then on a booted system we have the following under
> /sys/kernel/debug/pinctrl/4a100040.pinmux/pingroups:
> 
> group: pinmux_mmc1_pins
> pin 81 (PIN81)
> pin 82 (PIN82)
> pin 83 (PIN83)
> pin 84 (PIN84)
> pin 85 (PIN85)
> pin 86 (PIN86)
> 

Hmm... apologies, I suspect this is me that needs to review the
code some more. So this is actually creating a group per user
rather than per controller.

Although I guess my original point still stands that I am not
clear how this would benefit from my patches to allow muxing of
individual pins within a group. Since I guess each user will just
get a group created for the pins they use regardless. Or am I
missing something here too?

Thanks,
Charles
