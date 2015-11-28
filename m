From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: gpio-mxc: gpiod_get_value returns INT_MIN when the GPIO is off
Date: Sun, 29 Nov 2015 00:02:01 +0100
Message-ID: <20151128230200.GA21951@archie.tuxnet.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:34957 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbbK1XIp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Nov 2015 18:08:45 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

Hi,

I am writing a module which reads several GPIO input states from a
Freescale i.MX6Q. I can control the input states through hardware
buttons attached to my development board. They are all connected exactly
the same, with external pull up resistors.
I am using the current torvalds/linux master branch.

The list in my DT looks like this:
my-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>,
	<&gpio1 8 GPIO_ACTIVE_LOW>,
	/* .... */
	<&gpio6 31 GPIO_ACTIVE_LOW>,
	<&gpio7 11 GPIO_ACTIVE_LOW>;

In my platform driver module, I first call gpiod_get_array(dev, "my",
GPIOD_IN);

Then I can successfully read in the input states of my GPIOs and get
"correct" values for all but one of them: GPIO6_31
Meaning: When no button is pressed, every call to
gpiod_get_value(my_gpios->desc[i]) returns 0 and if one of the buttons
is pressed, it returns 1.
Except for gpio6 31: It returns -2^31 (INT_MIN) when no button is
pressed and 1 if a button is pressed.

I double checked the pinmuxing and the hardware, the input state should
be off / 0 and not -2^31. The internal pull up is also enabled.
Muxing: fsl,pins = <MX6QDL_PAD_EIM_BCLK__GPIO6_IO31 0x1b099>;

I read through the source of gpio-generic.c and came across
bgpio_get_set. If I interpret the code correctly, it is set as the get
function of the gpio chip. (because BGPIOF_READ_OUTPUT_REG_SET is passed
as flags argument when bgpio_init is called from gpio-mxc.c)
In the case of gpio6_31, the pin2mask function would return 1 << 31 as
unsigned long, meaning 2^31 and then the unsigned long return value of
read_reg is bitmasked with 2^31 which would result in 2^31 if it is on
and 0 if it is off.
But because gpiod_get_value returns an int, the 2^31 unsigned long is
casted to a signed int, which means it returns -2^31 if it is active.
But in this case, it returns -2^31 if it is inactive and 1 if it is
active...

I can workaround by checking gpiod_get_value(desc) == 1 but I'd really
like to know what's causing this (odd?) behavior.

Am I doing something wrong here?

Thanks,
Clemens
