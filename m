From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFD] gpiolib: gpiochip is always dangling after remove
Date: Fri, 26 Feb 2016 23:05:42 +0900
Message-ID: <20160226140542.GU18327@sirena.org.uk>
References: <1456491974-26997-1-git-send-email-bamv2005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DZdUYvCK+8GRLMJe"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39306 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932197AbcBZOFr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 09:05:47 -0500
Content-Disposition: inline
In-Reply-To: <1456491974-26997-1-git-send-email-bamv2005@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamv2005@gmail.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>


--DZdUYvCK+8GRLMJe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 09:06:14PM +0800, Bamvor Jian Zhang wrote:

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -452,7 +452,6 @@ static void gpiodevice_release(struct device *dev)
>  {
>  	struct gpio_device *gdev =3D dev_get_drvdata(dev);
> =20
> -	cdev_del(&gdev->chrdev);

This seems weird - we're moving the deletion of the chardev (which is
the route userspace has to opening the device) later which seems like it
isn't relevant to the issue and is likely to create problems since it
means userspace can start to try to use the device while we're in the
process of trying to tear it down.  If this is needed it should probably
be explicitly discussed in the changelog, it may be worth splitting into
a separate patch.

> @@ -633,7 +632,6 @@ int gpiochip_add_data(struct gpio_chip *chip, void *d=
ata)
> =20
>  	/* From this point, the .release() function cleans up gpio_device */
>  	gdev->dev.release =3D gpiodevice_release;
> -	get_device(&gdev->dev);
>  	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
>  		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
>  		 dev_name(&gdev->dev), chip->label ? : "generic");

> +	device_del(&gdev->dev);

We're removing a get but adding a delete?  Again this is surprising,
explicitly saying what took the reference we're going to delete would
probably make this a lot clearer.

In general I'd say your changelog for a change like this should be in
the form of "When $THING happens $PROBLEM occurs because $REASON,
instead do $FIX which avoids that because $REASON".

--DZdUYvCK+8GRLMJe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW0Fu1AAoJECTWi3JdVIfQeNQH/0ej6iKP46uS2xmOwGLxMiKE
7Lx81NBzI7RJnnuHjwdiJMSYvL8/BRwe/mkMgrHbgP5hOD/E7ENjlydV+Y5qNd05
lcdU2h83o6q2rU0se6FmzhqDm1k+/KN4TvtrSEm6zEjOcyoU4n613jnvCmtSuPEZ
jxj3BxXNj//FEbLrGFMS9+NM6WTMDVCZ/AmDv9GkmmiXsFYEQQ+k68Lgqv/b0bfY
h3hkP/ldH6fXs/0L7QdDy+O+1P6p3JaO9/rOdbcdOm+7V4CrP/arRffTLgF75pgk
4AFq/zMoAhUUtiPpNyosPZ8cbfXz2Jk5uqN3+2fLx1jMQgnKBK0YZ+ub18U13Ng=
=DSN0
-----END PGP SIGNATURE-----

--DZdUYvCK+8GRLMJe--
