From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: mcp23s08: support setting pullups from device tree data
Date: Tue, 15 Dec 2015 09:09:04 +0100
Message-ID: <1922527.uScxQGmYqz@ws-stein>
References: <1449229573-25759-1-git-send-email-timo.teras@iki.fi> <5332318.fo424NgDVM@ws-stein> <20151207092259.665dbeea@vostro>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:51349 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753194AbbLOIJI convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 15 Dec 2015 03:09:08 -0500
In-Reply-To: <20151207092259.665dbeea@vostro>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timo Teras <timo.teras@iki.fi>
Cc: linux-gpio@vger.kernel.org

On Monday 07 December 2015 09:22:59, Timo Teras wrote:
> On Mon, 07 Dec 2015 07:53:08 +0100
> Alexander Stein <alexander.stein@systec-electronic.com> wrote:
>=20
> > On Friday 04 December 2015 13:46:13, Timo Ter=E4s wrote:
> > > Make pullup configurable from device tree data.
> > >=20
> > > Signed-off-by: Timo Ter=E4s <timo.teras@iki.fi>
> > > ---
> > > I'm not fully certain how the pullup data should be made
> > > configurable via OF. gpio-twl4030.c uses similar approach as this=
,
> > > but gpio-samsung.c makes the pullup configuration seems to be par=
t
> > > of the custom data in gpio specifiers. =20
> >=20
> > I think this should be specified for each individual GPIO. e.g.
> > > gpios =3D <&gpio-ctrl 0 GPIO_ACTIVE_HIGH GPIO_PULLUP>; =20
> >=20
> > You don't know (yet) which pins might need a internal pull-up when
> > specifying the mcp23s08 node itself. You might override the
> > controller node in your dts, but so you need to adjust 2 entries, o=
ne
> > for the user and one for the pullup, rather than have all options a=
t
> > one place.
>=20
> I think this is debatable. So consider this as opening a bit wider
> discussion about the preferred way of exposing pullup/down configurat=
ion
> via OF. And hopefully documenting it. (As mentioned there's already
> code in for either way.)
>=20
> Agreeably one might want to override it on PIN basis. Perhaps the GPI=
O
> function can be changed or similar.

I think for this you need only to add an additional cell entry or just =
add an additional mask bit like active low/high.
This would add the pull up/down feature to each GPIO user.

> The other side is: Why would my gpio-keys input mapping specification
> need know to what kind of GPIO input it is connected to? What if I
> switch the GPIO expander - or the hardware schema?  I need to edit 10
> different places rather than one - places that are about the high-lev=
el
> functionality, not the hardware. Normally the pullup settings are
> hardware layout dependant, so GPIO configuration would be the logical
> place.

gpio-keys need to know this when selecting active low or active high. Y=
ou usually need the corresponding pull up/down for this to work.

> One generally wants to configure pullups correctly for all GPIOs
> regardless of if they are connected or not; or if the relevant
> high-level gpio driver is loaded or not. And this should be done as
> early as possible - even before the driver for that specific GPIO pin
> functionality is loaded.

This is also a valid point.

> Perphaps others have more arguments for the per-pin configuration?

I get the impression both ways would be needed... which is kinda error-=
prone.

Best regards,
Alexander
--=20
-----
Please note our closure period for Christmas vacation and turn of the y=
ear
We are closed from 21st December 2015 to 3rd January 2016
-----
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
=46ax:    +49 (0) 3765 38600-4100
=20
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
