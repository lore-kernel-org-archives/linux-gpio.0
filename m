From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18 =?iso-8859-1?Q?device?=
Date: Wed, 26 Sep 2018 09:39:11 +0200
Message-ID: <0a82c152-b296-479e-998a-9de3b1cf6c3c@cesnet.cz>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180925145616.12610-2-m.felsch@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On =C3=BAter=C3=BD 25. z=C3=A1=C5=99=C3=AD 2018 16:56:14 CEST, Marco Felsch w=
rote:
> This patch fixes 'commit 9b3e4207661e ("pinctrl: mcp23s08: spi: Fix regmap
> debugfs entries")'. For sure the MCP23S18 device has only 1 address pin
> but this will get decoded into three internally ([1], section 1.4).
>
> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/22103a.pdf

Hi Marco, Section 1.4 only applies to I2C devices. Quoting the first=20
paragraph:

> The ADDR pin is used to set the slave address of the MCP23018 (I2C only)=20=

> to allow up to eight devices on the bus using only a single pin.=20
> Typically, this would require three pins.

Here's my summary of how it works among the whole family of these chips:

- MCP23O18 is an I2C device. Its address selection is a bit unusual, but it=20=

can still provide 8 different addresses. In Linux, these are separate I2C=20
clients as usual.

- MCP23S18, on the other hand, is an SPI device. It does not support any=20
extra addressing apart from the SPI CS pin (see page 13 of the datasheet=20
you linked to). As far as I can tell, it's always just one device on a=20
given SPI CS signal.

- MCP23S17 is also a SPI device, but it supports a creative/hacky=20
"addressing" scheme where up to eight devices can share the same SPI CS=20
signal. On Linux, this opens an ugly can of warms with several "gpiochip"=20
instances within the same SPI client, but that's not relevant in the=20
context of this patch.

I know that the current code works with MCP23S17 -- we have a board with=20
two chips with a shared SPI CS, but a different "address" prefix. Looking=20
at the datasheet, MCP23S18 works in a different manner. I therefore don't=20
think that this patch which effectively unifies handling of both ...S18 and=20=

...S17 is correct.

Can you please clarify what doesn't work for you, and how it should work?=20
Did my patch 9b3e4207661e broke something?

With kind regards,
Jan
