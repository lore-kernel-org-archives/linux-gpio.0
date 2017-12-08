From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 11:41:51 -0800
Message-ID: <20171208194151.GC24344@atomide.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
 <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
 <20171208162818.GA24344@atomide.com>
 <20171208171648.sbznughahicmklcs@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58900 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752259AbdLHTlz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Dec 2017 14:41:55 -0500
Content-Disposition: inline
In-Reply-To: <20171208171648.sbznughahicmklcs@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

* Charles Keepax <ckeepax@opensource.cirrus.com> [171208 17:19]:
> On Fri, Dec 08, 2017 at 08:28:18AM -0800, Tony Lindgren wrote:
> > * Charles Keepax <ckeepax@opensource.cirrus.com> [171208 14:31]:
> > > From the implementation so far the pinctrl-single stuff appears to
> > > target systems where there isn't really a concept of groups. Each
> > > pin is just a completely separate entry and you can only configure
> > > things one pin at a time. In that case it almost makes more sense
> > > to model each pin as an individual group such that it is clearly
> > > distinct from the others.
> > 
> > Maybe check again or else I don't follow you :)
> > 
> > The pinctrl groups are created dynamically with pinctrl-single
> > based on how the pins are grouped in the dts file:
> > 
> > mmc1_pins: pinmux_mmc1_pins {
> > 	pinctrl-single,pins = <
> > 		OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLUP | MUX_MODE0)
> > 		OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)
> > 		OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)
> > 		OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)
> > 		OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)
> > 		OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)
> > 	>;
> > };
> > 
> > Then on a booted system we have the following under
> > /sys/kernel/debug/pinctrl/4a100040.pinmux/pingroups:
> > 
> > group: pinmux_mmc1_pins
> > pin 81 (PIN81)
> > pin 82 (PIN82)
> > pin 83 (PIN83)
> > pin 84 (PIN84)
> > pin 85 (PIN85)
> > pin 86 (PIN86)
> > 
> 
> Hmm... apologies, I suspect this is me that needs to review the
> code some more. So this is actually creating a group per user
> rather than per controller.
> 
> Although I guess my original point still stands that I am not
> clear how this would benefit from my patches to allow muxing of
> individual pins within a group. Since I guess each user will just
> get a group created for the pins they use regardless. Or am I
> missing something here too?

Yeah it seems pinctrl-single does not need anything specific
for muxing individual pins within a group. You can already do
that quite easily by creating multiple groups in the dts for
the device. Let's assume you need to dynamically remux MMC dat1
line between GPIO and MMC mode (similar to what we do on am335x
for dat1 wake-up interrupts). In that case you would just modify
the grouping example above with:

mmc1_dat1_pin: pinmux_mmc1_dat1_pin {
	pinctrl-single,pins = <
		OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)
	>;
};

mmc1_pins: pinmux_mmc1_pins {
	pinctrl-single,pins = <
		OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)
	>;
};

And that allows you to dynamically change dat1 pin only.

Not sure if that helps in your case though, just trying to clarify
how it currently works :)

Regards,

Tony
