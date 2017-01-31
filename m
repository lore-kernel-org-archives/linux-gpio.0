From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC 2/5] pinctrl: rz-pfc: Add Renesas RZ/A1 pinctrl driver
Date: Tue, 31 Jan 2017 14:11:21 +0000
Message-ID: <SG2PR06MB11659F7F6F4164565032D9A28A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165C49393EAA4027B020B448A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <5091561.JdaHPde81y@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:61849 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751994AbdAaOM1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Jan 2017 09:12:27 -0500
In-Reply-To: <5091561.JdaHPde81y@avalon>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Laurent,

On Tuesday, January 31, 2017, Laurent Pinchart wrote:
> On Monday 30 Jan 2017 19:19:18 Chris Brandt wrote:
> > On Wednesday, January 25, 2017, Jacopo Mondi wrote:
> > > +	/* Port 5 */
> > > +	RZ_PIN_NAME(5, 0), RZ_PIN_NAME(5, 1), RZ_PIN_NAME(5, 2),
> > > +	RZ_PIN_NAME(5, 3), RZ_PIN_NAME(5, 4), RZ_PIN_NAME(5, 5),
> > > +	RZ_PIN_NAME(5, 6), RZ_PIN_NAME(5, 7), RZ_PIN_NAME(5, 8),
> > > +	RZ_PIN_NAME(5, 9), RZ_PIN_NAME(5, 10),
> >
> > The RZ/A1L (basically a subset of RZ/A1H to reduce cost) uses all 16
> > port pins on "port 5" so I'd like to include them as well.
> >
> > > +static const struct of_device_id rza1_pinctrl_of_match[] =3D {
> > > +	{ .compatible =3D "renesas,rza1-pinctrl", },
> > > +	{ }
> > > +};
> >
> > Since this PFC driver file is specifically for RZ/A1, I think a better
> > compatible string would be:
> >
> >   .compatible =3D "renesas,r7s72100-renesas-pinctrl",
>=20
> Do we need to repeat "renesas" in the name ? And given that the datasheet
> names the hardware "ports", how about "renesas,r7s72100-ports" ? The IP
> core handles both pinctrl and GPIO, so "pinctrl" is a bit restrictive.


Personally, I do not like "renesas,r7s72100-renesas-pinctrl". I was simply
trying to follow the naming guidelines for DT.

I like your suggestion of "renesas,r7s72100-ports" better.


Cheers

Chris
