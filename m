From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 08:28:18 -0800
Message-ID: <20171208162818.GA24344@atomide.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com>
 <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-gpio@vger.kernel.org

* Charles Keepax <ckeepax@opensource.cirrus.com> [171208 14:31]:
> From the implementation so far the pinctrl-single stuff appears to
> target systems where there isn't really a concept of groups. Each
> pin is just a completely separate entry and you can only configure
> things one pin at a time. In that case it almost makes more sense
> to model each pin as an individual group such that it is clearly
> distinct from the others.

Maybe check again or else I don't follow you :)

The pinctrl groups are created dynamically with pinctrl-single
based on how the pins are grouped in the dts file:

mmc1_pins: pinmux_mmc1_pins {
	pinctrl-single,pins = <
		OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)
		OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)
	>;
};

Then on a booted system we have the following under
/sys/kernel/debug/pinctrl/4a100040.pinmux/pingroups:

group: pinmux_mmc1_pins
pin 81 (PIN81)
pin 82 (PIN82)
pin 83 (PIN83)
pin 84 (PIN84)
pin 85 (PIN85)
pin 86 (PIN86)

Regards,

Tony
