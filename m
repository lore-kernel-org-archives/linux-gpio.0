From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Wed, 6 Aug 2014 14:45:44 +0200
Message-ID: <20140806124544.GE28369@book.gsilab.sittig.org>
References: <25983307.ZjJOfz2Kpg@pcimr>
 <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
 <20140731071235.GH3407@book.gsilab.sittig.org>
 <12452684.GmmEHEPXzu@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:55988 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751913AbaHFMpu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Aug 2014 08:45:50 -0400
Content-Disposition: inline
In-Reply-To: <12452684.GmmEHEPXzu@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>

On Thu, 2014-07-31 at 10:42 +0200, Rojhalat Ibrahim wrote:
> 
> On Thursday 31 July 2014 09:12:35 Gerhard Sittig wrote:
> > On Thu, 2014-07-31 at 11:35 +0900, Alexandre Courbot wrote:
> > > 
> > > I'd be surprised if at least *one* such driver was not in mainline
> > > though. Had a quick look but could not find anything that would be an
> > > obvious candidate to use these new functions.
> > 
> > What about drivers/mtd/nand/gpio.c, the GPIO bitbanged NAND
> > controller driver?  Most of the latch, control, and data lines
> > groups are set at the same time.  It should be a perfect example.
> > 
> 
> Well, not so perfect, since AFAIUI only a few control signals are managed
> by GPIOs (Chip Enable, Command Latch Enable, Address Latch Enable), but not
> the actual data lines. But granted, at least at one place in the driver three
> lines are set at the same time.

For some reason I mistook the driver's description and was under
the impression that it would completely bitbang the NAND
protocol.  But I was wrong, it's a "GPIO _assisted_ NAND flash"
driver.  I am sorry for the confusion.  Have sent patches to the
MTD list to have the documentation updated for clarity.


> There are a few other drivers which also do that:
> - drivers/tty/serial/serial_mctrl_gpio.c controls multiple modem lines via GPIO
> - drivers/net/phy/mdio-mux-gpio.c a GPIO controlled MDIO bus multiplexer driver
> - drivers/regulator/gpio-regulator.c controls voltage regulators
> 
> All of the above do set multiple GPIOs at the same time, but in all cases
> performance does not really matter. Moreover they all seem a bit obscure to me.
> 
> Nevertheless, IMHO they are still better candidates for using the new functions
> than the i2c-gpio or spi-gpio drivers.

Could you spot the LCD driver mentioned by Mark?  There are
displays that implement a typically four or optionally eight bit
data bus plus some three control lines (E/RW/RS), usually GPIO
bitbanged -- so in total it's 7 or 11 software controlled pins.
One of the controller chips is HD44780, compatibles have KS...
and SED... names.

It's a pity that drivers/auxdisplay/ and drivers/staging/panel/
only support parport(4) and not GPIO.


Why is your FPGA netlist download driver not acceptable for
mainline?  Because it uses many GPIOs instead of a parallel or
serial bus?  Doesn't your code submission make parallel busses
done by many GPIOs "more acceptable"?  If your netlist download
follows the ususal passive parallel approach, there should not be
an issue.  There are some FPGA netlist download drivers in
drivers/misc/ and you might follow that pattern.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
