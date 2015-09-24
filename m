From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v3 6/9] gpiolib-sysfs: Show gpio-name in
 /sys/class/gpio/gpio*/name
Date: Thu, 24 Sep 2015 09:14:03 +0200
Message-ID: <20150924071403.GW32203@pengutronix.de>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
 <1439561466-14350-7-git-send-email-mpa@pengutronix.de>
 <CACRpkdZ4C25NsrCEHS0hxFx+AkjGfC7cyZeMvixOyoADtcvbmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tm6VLls/w6NsRApE"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:39573 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753549AbbIXHOH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 03:14:07 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZ4C25NsrCEHS0hxFx+AkjGfC7cyZeMvixOyoADtcvbmA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>


--Tm6VLls/w6NsRApE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 06:07:51PM -0700, Linus Walleij wrote:
> On Fri, Aug 14, 2015 at 7:11 AM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
>=20
> > This patch adds a sysfs attribute 'name' to gpios that were exported. It
> > exposes the newly added name property of gpio descriptors.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>=20
> The previous hunk adding the name to the sysfs ABI should
> be in this patch.
>=20
> But I have a problem with this. What is the rationale? The directory
> that contains the file already has this name. Why should this
> information be duplicated?

No reason for that. As described in the summary, I wasn't sure if this
makes sense but included it anyway from the last series version. So it
can simply be dropped.

Thanks,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Tm6VLls/w6NsRApE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA6K7AAoJEEpcgKtcEGQQyjEP/R1QSu+OMz8ZV7lUdaWEKJcA
s8B4RMYy6QDbvmsQV0G08+X3tBrClbFlxKUDHTcBqUKeuQPh5d9hYzxM98zEmoFz
3eqaifv/603BWZf4xtXSTjAPMcH4TtqQoG9TybXc66pSZmLpYsYPFHqsCBg8wDMk
TXXozC8aZEGohVseqTdlt631ZTpNOdD08CpehjWr2WsRZls1ed/xvdNJJ2Zv+iTt
M1EbzvoQ7758NeKRbCKWlc7HHBxHWvSMWM6tsudahaQQtVEsOPGtkHbsEfdnLu4p
f4fL6mpNflK8EyrcYF5PA45D2y9U2zYIWflPpZQDjeudsyLHNfxIqzk6/pviU+IR
7oh3WLj32M/ko9FmUHsZENOnisI+bMONJGxd4IxgwISZGvEOgsQDQZ7+IDDNbvDb
+xChnGGwDVsUZvXN3nqQXC4vjgO3YGEAfUAAVhYoqhHa+cNDxkzbgIrHwQ281XQT
rczjlwvmZsAdjU03g51ZJLOLM4NPO+VWsjT9HGJPYjLOFfjZYOcZP7tJwfMcM9dA
ibDDJ3pXJ/Ff/LwP0mBCAAV6MylA2oDDdwHi4TDpSCMxFc0oXVLtbdRPazaUMLaG
/k8iZi2bBnWGGTeSWe9tgZXuBDz3EptIM4Zi9RJk8AO2FHmzWmAOnVepcs13dw2q
d1cckNZW6B8bxH9u8VTJ
=1bQk
-----END PGP SIGNATURE-----

--Tm6VLls/w6NsRApE--
