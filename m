From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Thu, 07 Aug 2014 11:52:57 +0200
Message-ID: <2709746.qxeoZQ4oRv@pcimr>
References: <25983307.ZjJOfz2Kpg@pcimr> <12452684.GmmEHEPXzu@pcimr> <20140806124544.GE28369@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:59975 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754057AbaHGJxE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Aug 2014 05:53:04 -0400
In-Reply-To: <20140806124544.GE28369@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>

On Wednesday 06 August 2014 14:45:44 Gerhard Sittig wrote:
> 
> Could you spot the LCD driver mentioned by Mark?  There are
> displays that implement a typically four or optionally eight bit
> data bus plus some three control lines (E/RW/RS), usually GPIO
> bitbanged -- so in total it's 7 or 11 software controlled pins.
> One of the controller chips is HD44780, compatibles have KS...
> and SED... names.
> 

I found a few display drivers using GPIOs for enable and/or reset lines,
but none using GPIOs for the data lines.

> It's a pity that drivers/auxdisplay/ and drivers/staging/panel/
> only support parport(4) and not GPIO.
> 

That could be an interesting application.

> 
> Why is your FPGA netlist download driver not acceptable for
> mainline?  Because it uses many GPIOs instead of a parallel or
> serial bus?  Doesn't your code submission make parallel busses
> done by many GPIOs "more acceptable"?  If your netlist download
> follows the ususal passive parallel approach, there should not be
> an issue.  There are some FPGA netlist download drivers in
> drivers/misc/ and you might follow that pattern.
> 
> 

Thanks for the suggestion. I have no problem with submitting that driver.
Right now it's probably a little too board-specific for mainline, but
I think I could improve on that. The result would be a driver to configure
an Altera FPGA via the passive parallel configuration scheme using a number
of GPIOs specified via DT. The driver would depend on the gpiod_set_array
function and for now it would be the only user.

Do you think this has a chance to get merged? Should I post an extended
patch set including the FPGA configuration driver?

   Rojhalat

