From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 1/9] pinctrl: walk into bcm subdir unconditionally
Date: Tue, 14 Jun 2016 10:37:10 -0700
Message-ID: <87porjoent.fsf@eliezer.anholt.net>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com> <1464934708-24769-2-git-send-email-kraxel@redhat.com> <CACRpkdZ+RnCo=GhsRrY0+VxLYcETrUZZGrbH-O3rwO7rRSG-ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:49130 "EHLO anholt.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751345AbcFNRhO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 14 Jun 2016 13:37:14 -0400
In-Reply-To: <CACRpkdZ+RnCo=GhsRrY0+VxLYcETrUZZGrbH-O3rwO7rRSG-ow@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Fri, Jun 3, 2016 at 8:18 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>> There is no ARCH_BCM on arm64, and we need pinctrl-bcm2835 for the rpi3.
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>
> I see I got an identical patch from Florian Fainelli and applied it.
> Sorry for my clashes, confusion and screwups... Added Eric's
> ACK on the applied patch.

Florian's had a nice commit message, and I'm just happy to see patches
land.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXYEDGAAoJELXWKTbR/J7oijEP/3yW+ZJ0gd9+AwHoX0U2ULu3
JONpwCxDJbTx23/vBp5wgSxItHyqBm7tTXOXZYHV3utB1NvgxABRMKtycCqZVjfd
PHOXcx1lmJsiaWwGkjYEb8KLAESlhKvm17ZT86AIkt+S3/HOzL3xZmo8lzhXeiQT
pbtscLiLpqbNImzUdJ/5oSiXeS7XFX3LUB4FjjFbPhNKDpLsHtKsPB97Qv2Ga1jH
emBVyTOdpgFO4+4/9s3qOm86PuxOU55UKItVeluUvvZI71NSyVVhodZra6ZQOfZZ
aUwKQy5AjWr3odML3AYuFOk1JzStT9WP5WLPLqvGe+ehD2RJHsciGQbtrMLZwENI
58tHxIXu7cX4Lq9Vh+RCyRezxcwAJtip+qewcB/uKuNp+Urmagny2x97UOlR5JtE
+orq8AAhXjKUE4/1sghI4qSZHyqazh4eqD1eqcEP+mDxob0Sunjc1wzCLLkrqmMw
xgL3j8u9i/glHI+Gug+rdsOra1DzIqPtyN7EzLsI2cwpW2qaIVjDoU+SfG/jjedU
6+NBpC14I9lvDuAMoDq6GrV7FahbAXGn+B8jaDECdyUX3R+6Of7vVfNugMMF0DHP
QZ1/IpJe0od9e8iKi/SR/WPq6bZHx0o6uOGuO6XAyXtvFHMFTXBCWPMccn/7UYNQ
rJ15yGCd/Kk9KjI/U/xY
=qlpr
-----END PGP SIGNATURE-----
--=-=-=--
