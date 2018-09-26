From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18
 device
Date: Wed, 26 Sep 2018 11:51:37 +0200
Message-ID: <20180926095137.cpzxxzbbuz3347tt@pengutronix.de>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-2-m.felsch@pengutronix.de>
 <0a82c152-b296-479e-998a-9de3b1cf6c3c@cesnet.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0a82c152-b296-479e-998a-9de3b1cf6c3c@cesnet.cz>
Sender: stable-owner@vger.kernel.org
To: Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 18-09-26 09:39, Jan Kundrát wrote:
> On úterý 25. září 2018 16:56:14 CEST, Marco Felsch wrote:
> > This patch fixes 'commit 9b3e4207661e ("pinctrl: mcp23s08: spi: Fix regmap
> > debugfs entries")'. For sure the MCP23S18 device has only 1 address pin
> > but this will get decoded into three internally ([1], section 1.4).
> > 
> > [1] http://ww1.microchip.com/downloads/en/DeviceDoc/22103a.pdf
> 
> Hi Marco, Section 1.4 only applies to I2C devices. Quoting the first
> paragraph:
> 
> > The ADDR pin is used to set the slave address of the MCP23018 (I2C only)
> > to allow up to eight devices on the bus using only a single pin.
> > Typically, this would require three pins.

Hi Jan,

sorry I mixed up different versions of the MCP RMs.

> 
> Here's my summary of how it works among the whole family of these chips:
> 
> - MCP23O18 is an I2C device. Its address selection is a bit unusual, but it
> can still provide 8 different addresses. In Linux, these are separate I2C
> clients as usual.
> 
> - MCP23S18, on the other hand, is an SPI device. It does not support any
> extra addressing apart from the SPI CS pin (see page 13 of the datasheet you
> linked to). As far as I can tell, it's always just one device on a given SPI
> CS signal.
> 
> - MCP23S17 is also a SPI device, but it supports a creative/hacky
> "addressing" scheme where up to eight devices can share the same SPI CS
> signal. On Linux, this opens an ugly can of warms with several "gpiochip"
> instances within the same SPI client, but that's not relevant in the context
> of this patch.
> 
> I know that the current code works with MCP23S17 -- we have a board with two
> chips with a shared SPI CS, but a different "address" prefix. Looking at the
> datasheet, MCP23S18 works in a different manner. I therefore don't think
> that this patch which effectively unifies handling of both ...S18 and ...S17
> is correct.
> 
> Can you please clarify what doesn't work for you, and how it should work?
> Did my patch 9b3e4207661e broke something?

Sorry as I mentioned to Phil I mixed up different things: fixing and
uniforming. The fixing patch should only remove this:

8<---

case MCP_TYPE_S18:
-	if (!one_regmap_config)
-		return -ENOMEM;

8<---

Or is there a corner point I didn't saw?

Kind Regards,
Marco

> 
> With kind regards,
> Jan
> 
