From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: mcp23s08: support setting pullups from device tree data
Date: Mon, 07 Dec 2015 07:53:08 +0100
Message-ID: <5332318.fo424NgDVM@ws-stein>
References: <1449229573-25759-1-git-send-email-timo.teras@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:58838 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751361AbbLGGxN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 7 Dec 2015 01:53:13 -0500
In-Reply-To: <1449229573-25759-1-git-send-email-timo.teras@iki.fi>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timo =?ISO-8859-1?Q?Ter=E4s?= <timo.teras@iki.fi>
Cc: linux-gpio@vger.kernel.org

On Friday 04 December 2015 13:46:13, Timo Ter=E4s wrote:
> Make pullup configurable from device tree data.
>=20
> Signed-off-by: Timo Ter=E4s <timo.teras@iki.fi>
> ---
> I'm not fully certain how the pullup data should be made configurable=
 via OF.
> gpio-twl4030.c uses similar approach as this, but gpio-samsung.c make=
s the
> pullup configuration seems to be part of the custom data in gpio spec=
ifiers.

I think this should be specified for each individual GPIO. e.g.
> gpios =3D <&gpio-ctrl 0 GPIO_ACTIVE_HIGH GPIO_PULLUP>;

You don't know (yet) which pins might need a internal pull-up when spec=
ifying the mcp23s08 node itself.
You might override the controller node in your dts, but so you need to =
adjust 2 entries, one for the user and one for the pullup, rather than =
have all options at one place.

Best regards,
Alexander
--=20
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
