From: Timo Teras <timo.teras@iki.fi>
Subject: Re: [PATCH] gpio: mcp23s08: support setting pullups from device
 tree data
Date: Mon, 7 Dec 2015 09:22:59 +0200
Message-ID: <20151207092259.665dbeea@vostro>
References: <1449229573-25759-1-git-send-email-timo.teras@iki.fi>
	<5332318.fo424NgDVM@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:33651 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752776AbbLGHXI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2015 02:23:08 -0500
Received: by lbbkw15 with SMTP id kw15so51665027lbb.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2015 23:23:05 -0800 (PST)
In-Reply-To: <5332318.fo424NgDVM@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: linux-gpio@vger.kernel.org

On Mon, 07 Dec 2015 07:53:08 +0100
Alexander Stein <alexander.stein@systec-electronic.com> wrote:

> On Friday 04 December 2015 13:46:13, Timo Ter=C3=A4s wrote:
> > Make pullup configurable from device tree data.
> >=20
> > Signed-off-by: Timo Ter=C3=A4s <timo.teras@iki.fi>
> > ---
> > I'm not fully certain how the pullup data should be made
> > configurable via OF. gpio-twl4030.c uses similar approach as this,
> > but gpio-samsung.c makes the pullup configuration seems to be part
> > of the custom data in gpio specifiers. =20
>=20
> I think this should be specified for each individual GPIO. e.g.
> > gpios =3D <&gpio-ctrl 0 GPIO_ACTIVE_HIGH GPIO_PULLUP>; =20
>=20
> You don't know (yet) which pins might need a internal pull-up when
> specifying the mcp23s08 node itself. You might override the
> controller node in your dts, but so you need to adjust 2 entries, one
> for the user and one for the pullup, rather than have all options at
> one place.

I think this is debatable. So consider this as opening a bit wider
discussion about the preferred way of exposing pullup/down configuratio=
n
via OF. And hopefully documenting it. (As mentioned there's already
code in for either way.)

Agreeably one might want to override it on PIN basis. Perhaps the GPIO
function can be changed or similar.

The other side is: Why would my gpio-keys input mapping specification
need know to what kind of GPIO input it is connected to? What if I
switch the GPIO expander - or the hardware schema?  I need to edit 10
different places rather than one - places that are about the high-level
functionality, not the hardware. Normally the pullup settings are
hardware layout dependant, so GPIO configuration would be the logical
place.

One generally wants to configure pullups correctly for all GPIOs
regardless of if they are connected or not; or if the relevant
high-level gpio driver is loaded or not. And this should be done as
early as possible - even before the driver for that specific GPIO pin
functionality is loaded.

This seems to be the way most platform data things work for different
GPIOs.

Perphaps others have more arguments for the per-pin configuration?
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
