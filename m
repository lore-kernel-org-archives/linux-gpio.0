From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: consumer: Remove WARN_ON(1) when GPIOLIB is
 disabled
Date: Mon, 31 Jul 2017 13:17:49 +0200
Message-ID: <20170731111749.GL26667@ulmo>
References: <1501258886-12376-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qgd2S+2VS1hsWwXW"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36627 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbdGaLRx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 07:17:53 -0400
Received: by mail-wm0-f66.google.com with SMTP id d40so6146957wma.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 04:17:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1501258886-12376-1-git-send-email-fabio.estevam@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: linus.walleij@linaro.org, sergei.shtylyov@cogentembedded.com, andrew@lunn.ch, dmitry.torokhov@gmail.com, linux-gpio@vger.kernel.org, festevam@gmail.com


--Qgd2S+2VS1hsWwXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 01:21:26PM -0300, Fabio Estevam wrote:
> gpiod_get_optional() returns NULL when GPIOLIB is disabled since
> commit 22c403676dbbb7c6 ("gpio: return NULL from gpiod_get_optional when
> GPIOLIB is disabled").
>=20
> However, many gpiod functions still have WARN_ON(1) in their
> GPIOLIB=3Dn stubs, which causes warnings in drivers even if the
> GPIO descriptor is requested via gpiod_get_optional().
>=20
> Prior to commit 22c403676dbbb7c6 ("gpio: return NULL from
> gpiod_get_optional when GPIOLIB is disabled") it was indeed true
> the comment: "GPIO can never have been requested" as gpiod_get_optional()
> used to return an error.
>=20
> After this commit the returned value is NULL, so the comment and
> WARN_ON(1) are no longer accurate.
>=20
> An example of this kernel warning can be see in this report:
> https://www.spinics.net/lists/kernel/msg2563045.html
>=20
> Remove the WARN_ON(1) so that drivers can silently work fine
> without kernel warnings when GPIOLIB is disabled.
>=20
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since RFC:
> - Expand a bit on the commit log
> - Include the kernel warning example
>=20
>  include/linux/gpio/consumer.h | 59 -------------------------------------=
------
>  1 file changed, 59 deletions(-)

How about cases where the GPIO was not optional? Do we still want those
to be silently ignored? I guess in some way that makes sense as well,
but after this patch we're deviating from existing behaviour for non-
optional GPIOs.

Also, if we do decide that we want to silently ignore all GPIO calls if
GPIOLIB is disabled, maybe it would still be a good idea to warn users
about this at least once, so that they don't go chasing wild geese?

In either case, I think the commit message is still confusing because
you're arguing that gpiod_get_optional() now returns NULL and therefore
it is fine to remove WARN_ON(), whereas the WARN_ON() would still be
valid for non-NULL GPIO descriptors (such as requested via gpiod_get()
when GPIOLIB=3Dn.

Thierry

--Qgd2S+2VS1hsWwXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/EdsACgkQ3SOs138+
s6HkKg//U7XzNZIaZMu1/1YbBegO97e8cITChgCK7Yhw1SsUX5VOKnsj/8wgJOzv
k8MEZq8I/tQMpoo0izFKjXeYz4WjITjFOSJi1CNAdQDgkGBX30OXIgHn5TxhhGxw
Art9hHB0LFwN3yaUhjcOzKIsy8x2Rd7K1W5E2uMNTuMIRK3sEUIaXqulmWFdnDS8
/WYzflT+T55dpcmVaYDulK6wmd5cwn4QMzm+M5jeeTpE0CjlkbbvT5bljtKF7qr8
bFwFIzPfSTmeV2fDROmW+dYliCM52sIN8mf605SFwc1I1ly1MskN6q/DDMJfAS5h
fqANNxAE1IrN0jfZ1A6jdJNBxtuW30RRNxVg1D/hq39LRjUQbv8Mfoy6aj18rkDo
+XfA9btcBBzb5aOakGS5TiceMW+QLFAQF518duHJpJ+Lh9J8A/FvfWgdYAF6BlNT
XxqyFjZNMtubaV0Wn6TeJUwPJezf3XbaEY1R6ubyopEEbCx9EBpapMz1iFuMFhhw
BSVLrbZS+Qpeg1WJAUlCAh/2IYyPDb1LpU3NsyP9XN+z3IjVQa4cOhMy+WJLciAT
pSMn4VraZYFULmheACID2kaKHyofATqaGN/loxxb+2zt7jysi5d9GEMLGtYWs//c
CoqCq0cl9pp+BVmr/TSw7wq2yH7G5m0mBzIl+CFtcXzNCZiw9+Q=
=JV7d
-----END PGP SIGNATURE-----

--Qgd2S+2VS1hsWwXW--
