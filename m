From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Sat, 30 Sep 2017 18:02:51 +0200
Message-ID: <100458277.LJ9hcby5He@debian64>
References: <AM5PR0701MB2657A33A85F675C4A0175CE0E4670@AM5PR0701MB2657.eurprd07.prod.outlook.com> <CACRpkda39LU8hynYtnMyKxm+A8Behkam8CWBTSkt+0U_Fw_VtQ@mail.gmail.com> <8da7f1f2-7934-0b88-6eb1-8cdce8d5a7ea@hotmail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:46090 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbdI3QCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Sep 2017 12:02:55 -0400
Received: by mail-wm0-f65.google.com with SMTP id m72so3983092wmc.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Sep 2017 09:02:54 -0700 (PDT)
In-Reply-To: <8da7f1f2-7934-0b88-6eb1-8cdce8d5a7ea@hotmail.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello,

On Saturday, September 30, 2017 1:15:38 PM CEST Bernd Edlinger wrote:
> Absolutely it looks and feels like a general-purpose I/O facility.
> It can be used to control arbitrary logic functions.
Hm, Is it possible to differenciate it from a "syscon" device?

"System controller node represents a register region containing a set
of miscellaneous registers. The registers are not cohesive enough to
represent as any specific type of device. The typical use-case is for
some other node's driver, or platform-specific code, to acquire a
reference to the syscon node (e.g. by phandle, node path, or search
using a specific compatible value), interrogate the node (or associated
OS driver) to determine the location of the registers, and access the
registers directly."

<http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/mfd/syscon.txt>

> >> Instantiate this in the device tree as:
> >>
> >>     gpio3: gpio@ff706010 {
> >>      #address-cells = <1>;
> >>      #size-cells = <0>;
> >>      compatible = "altr,fpgamgr-gpio";
> >>      reg = <0xff706010 0x8>;
> >>      status = "okay";
> >>
> >>      portd: gpio-controller@0 {
> >>       compatible = "altr,fpgamgr-gpio-output";
> >>       gpio-controller;
> >>       #gpio-cells = <2>;
> >>       reg = <0>;
> >>      };
> >>
> >>      porte: gpio-controller@1 {
> >>       compatible = "altr,fpgamgr-gpio-input";
> >>       gpio-controller;
> >>       #gpio-cells = <2>;
> >>       reg = <1>;
> >>      };
> > 
> > So one port is output-only and one is input-only?
> > 
> > Fair enough.

The driver seemd fairly simple. So, You could actually get
away with just adding the "altr,fpgamgr-gpio" compatible string
to gpio-mmio.c's bgpio_of_match struct at [0] and change the dt
to something like this:

	portd: gpio@ff706010 {
		compatible = "altr,fpgamgr-gpio";
		reg = <0xff706010 0x4>;
		reg-names = "dat";
		gpio-controller;
		#gpio-cells = <2>;
   }

   	porte: gpio@ff706014 {
		compatible = "altr,fpgamgr-gpio";
		reg = <0xff706014 0x4>;
		reg-names = "dat";
		gpio-controller;
		#gpio-cells = <2>;
		no-output;
   }

I added "no-output" property to the "porte" gpio definition.
This property will force the direction of all of porte gpios
to "in". (Which based on the "input", is what you want?)

Note: If you need any insperation for the missing Device-tree
binding document, you can look at:

wd,mbl-gpio.txt [1] and ni,169445-nand-gpio.txt [2].

Regards,
Christian

[0] <https://github.com/torvalds/linux/blob/master/drivers/gpio/gpio-mmio.c#L575>
[1] <https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/gpio/wd%2Cmbl-gpio.txt
[2] <https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/gpio/ni%2C169445-nand-gpio.txt>


