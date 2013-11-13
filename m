From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Wed, 13 Nov 2013 09:56:18 -0500
Message-ID: <87a9h8z6y5.fsf@gmail.com>
References: <874n7i4a7x.fsf@gmail.com> <52834327.9060308@aksignal.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f182.google.com ([209.85.216.182]:41470 "EHLO
	mail-qc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759277Ab3KMO4Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2013 09:56:25 -0500
Received: by mail-qc0-f182.google.com with SMTP id n7so288335qcx.41
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2013 06:56:24 -0800 (PST)
In-Reply-To: <52834327.9060308@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jiri.prchal@aksignal.cz, linux-gpio@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adding the author of gpio-of-helper.

Also, conversations flow more smoothly if you avoid top-posting.


Ji=C5=99=C3=AD Prchal <jiri.prchal@aksignal.cz> writes:

> Dne 12.11.2013 03:36, Ben Gamari napsal(a):
>> On Thu, Oct 17, 2013 at 6:03 PM, Alexandre Courbot wrote:
>>> But maybe I'm missing your point - could you describe a concrete
>>> use-case for this feature that can *not* be achieved using
>>> gpio_export_with_link()?
>>
>> For what it's worth, it seems that the gpio-of-helper[1] driver found in
>> BeagleBoard kernels targets a use-case similar to that intended by this
>> patch.
>>
> Hi Ben,
> probably it's what I' trying to do.
> Why it is not in master tree?
>
I'm not entirely sure. It doesn't seem fit for upstream at the moment
given it seems to take a very similar approach to your patch and lacks
any form of documentation.

> Please, send me some example of DT usage.
>=20
Here[1] is one that Google turned up. There is plenty more to be found
as well.

Cheers,

=2D Ben


[1] https://github.com/beagleboard/linux/blob/3.8/firmware/capes/cape-bebop=
r-brdg-R2.dts#L95

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSg5MTAAoJEErkyLZmeNiDxPUIAJhlRgyLsu0EIYm1edPRMNg+
+4UzGQO2pJSVzD89+8yWxqy7eZ7s3iZan9ZCwDWEeXA69J160/OjsBYE0EaZ/jTM
6dV5LfJMnQdLE+CLRNSuMItUNsOXm+huSDqizn6CrxdSEWkKGW2a3Ud92vQDjysg
C0Dwr6wfOmPEfP3j4l8/wDFVtjaw0UvQCVwzzuvm19lWG3MVKxKyEjJQx0qreMGh
De6o1xVjpOnvJZt+uzE/AZioBcuGLj2ftop77td19ucR/QZF2UiLkRNPsw9fQcGy
xpaOZanlwH0ao1FnkavalsjQKfuqEQG4Mn33BF+ScE06HXJvUU0Owr1mtOp+Asw=
=Ro5s
-----END PGP SIGNATURE-----
--=-=-=--
