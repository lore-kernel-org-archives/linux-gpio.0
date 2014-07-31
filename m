From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Thu, 31 Jul 2014 10:42:03 +0200
Message-ID: <12452684.GmmEHEPXzu@pcimr>
References: <25983307.ZjJOfz2Kpg@pcimr> <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com> <20140731071235.GH3407@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:60804 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756062AbaGaImH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Jul 2014 04:42:07 -0400
In-Reply-To: <20140731071235.GH3407@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>

On Thursday 31 July 2014 09:12:35 Gerhard Sittig wrote:
> On Thu, 2014-07-31 at 11:35 +0900, Alexandre Courbot wrote:
> > 
> > I'd be surprised if at least *one* such driver was not in mainline
> > though. Had a quick look but could not find anything that would be an
> > obvious candidate to use these new functions.
> 
> What about drivers/mtd/nand/gpio.c, the GPIO bitbanged NAND
> controller driver?  Most of the latch, control, and data lines
> groups are set at the same time.  It should be a perfect example.
> 

Well, not so perfect, since AFAIUI only a few control signals are managed
by GPIOs (Chip Enable, Command Latch Enable, Address Latch Enable), but not
the actual data lines. But granted, at least at one place in the driver three
lines are set at the same time.

There are a few other drivers which also do that:
- drivers/tty/serial/serial_mctrl_gpio.c controls multiple modem lines via GPIO
- drivers/net/phy/mdio-mux-gpio.c a GPIO controlled MDIO bus multiplexer driver
- drivers/regulator/gpio-regulator.c controls voltage regulators

All of the above do set multiple GPIOs at the same time, but in all cases
performance does not really matter. Moreover they all seem a bit obscure to me.

Nevertheless, IMHO they are still better candidates for using the new functions
than the i2c-gpio or spi-gpio drivers.

So, Linus, would a patched version of one of the mentioned drivers qualify as
a user that would allow you to merge my patch?

   Rojhalat


