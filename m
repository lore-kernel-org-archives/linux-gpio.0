From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: reason for Allwinner SoC specific pinctrl drivers?
Date: Mon, 4 Jan 2016 11:02:37 +0000
Message-ID: <568A514D.7070102@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBYFCVG2AKGQEC5HNRUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

while looking at the Allwinner A64 SoC support, I was wondering why we
would actually need a pinctrl driver (file) for each and every Allwinner
SoC that we support.
Looking at both the A20 and the A64 doc I don't see any differences in
the port controller implementation apart from the actual
muxval <-> subsystem assignment, which is just data, right?
Comparing the code files in drivers/pinctrl/sunxi seems to support this,
as those drivers only consist of the table and some boilerplate code.

Now I was wondering whether we could get away with one generic Allwinner
pinctrl driver and put the SoC specific pin assignments in DT instead.
It looks like adding an "allwinner,muxval" property in addition to the
existing "allwinner,function" in the SoC's .dtsi would give us all the
information we need. This could look like:

	uart0_pins_a: uart0@0 {
		allwinner,pins =   "PB22", "PB23";
+		allwinner,muxval = <0x02    0x02>;
		allwinner,function = "uart0";
		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
	};

Would it make sense that I sit down and prototype such a driver?

We should keep compatibility with older DTs by keeping the existing
drivers in (or maybe emulating the current behaviour by providing just
those tables as a fallback) , but newer SoCs (like the A64?) would not
need a SoC specific driver, but just go with that generic driver and
appropriate DT properties.

I appreciate any comments on this, especially if I missed something
which would render this approach impossible or tedious.

Cheers,
Andre.
