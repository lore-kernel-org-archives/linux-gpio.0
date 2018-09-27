From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: fix debugfs entry for mcp23s18 =?iso-8859-1?Q?device?=
Date: Thu, 27 Sep 2018 14:45:09 +0200
Message-ID: <8ecfca26-9dc0-437e-adf4-3a3d2f4ef29a@cesnet.cz>
References: <20180925145616.12610-1-m.felsch@pengutronix.de>
 <20180925145616.12610-2-m.felsch@pengutronix.de>
 <02d7e7b6-6dd4-1f3d-eeaa-07e38b427428@electromag.com.au>
 <20180926094225.xpm4mkxlmkjg2d5x@pengutronix.de>
 <252ce4f2-ccd2-2983-0a28-103801eeb21c@electromag.com.au>
 <20180927085511.uarkv4kkou4crr3e@pengutronix.de>
 <3cc5ba12-5296-4c80-8e54-eab13f43823a@cesnet.cz>
 <20180927123131.mu67egnvz426vhm7@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180927123131.mu67egnvz426vhm7@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Phil Reid <preid@electromag.com.au>, stable@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-gpio@vger.kernel.org

On =C4=8Dtvrtek 27. z=C3=A1=C5=99=C3=AD 2018 14:31:31 CEST, Marco Felsch wrot=
e:
> Can you give me some feedback for
> patch "pinctrl: mcp23s08: fix irq and irqchip setup order"?

I don't understand kernel's IRQ subsystem, so I cannot review correctness=20
of that one, sorry.

Do you want me to test it (just the default path, I cannot easily trigger=20
the error-handling one)?

Cheers,
Jan
