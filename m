From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Thu, 26 Jan 2017 14:19:40 +0000
Message-ID: <SG2PR06MB1165815FB376075BC9B7406F8A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165F5A3E97EF8381288EDC18A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <718c2f23-c627-628a-dd27-a52a32afaee4@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <718c2f23-c627-628a-dd27-a52a32afaee4@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Thursday, January 26, 2017, jacopo mondi wrote:
> > I think we should try to avoid the rz naming as much as possible since
> > this driver will hopefully be useful for other future Renesas devices
> > if they move to a similar pin-control type method. Maybe future "R-car"
> SoCs?
> > Or, maybe Renesas Marketing decides to come up with a new name for SoCs=
.
> >
> > Otherwise, you could end up with a directly like "mach-shmobile"
> > filled with a bunch of...well...not SH-Mobile parts.
> >
> > Maybe just
> >   drivers/pinctrl/renesas/pinctrl-renesas.c
> >
>=20
> Wouldn't this be confusing, as most of renesas SoC are supported through
> drivers/pinctrl/sh-pfc instead?

It's already confusing that a bunch of ARM parts use a "sh" pin controller.

In reality, any Renesas device could be a peripheral mix of ex-Mitsubishi,
ex-Hitachi, ex-NEC or Renesas original. Or, some IP was licensed from a 3rd
party (ie, the SDHI/TMIO controller).
The only thing consistent is "Renesas".

> I agree on dropping the rz name, if more SoC will come and join the pin-
> based PFC realm...

I will suggest it for the next generation of SoCs, so we'll see what happen=
s...

Thanks,
Chris
