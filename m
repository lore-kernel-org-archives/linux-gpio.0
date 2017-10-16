From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] [v5] pinctrl: qcom: disable GPIO groups with no pins
Date: Mon, 16 Oct 2017 10:01:17 +0200
Message-ID: <20171016080117.GA17369@ulmo>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
 <1504798409-32041-2-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:55343 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751714AbdJPIBV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 04:01:21 -0400
Content-Disposition: inline
In-Reply-To: <1504798409-32041-2-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, andy.gross@linaro.org, david.brown@linaro.org, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2017 at 10:33:28AM -0500, Timur Tabi wrote:
[...]
>  	ret =3D gpiochip_add_data(&pctrl->chip, pctrl);
>  	if (ret) {
>  		dev_err(pctrl->dev, "Failed register gpiochip\n");
>  		return ret;
>  	}
> =20
> -	ret =3D gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev), 0, 0=
, chip->ngpio);
> +	/*
> +	 * If irq_need_valid_mask is true, then gpiochip_add_data() will
> +	 * initialize irq_valid_mask to all 1s.  We need to clear all the
> +	 * GPIOs that are unavailable, and we need to find each block
> +	 * of consecutive available GPIOs are add them as pin ranges.
> +	 */
> +	if (chip->irq_need_valid_mask) {
> +		for (i =3D 0; i < ngpio; i++)
> +			if (!groups[i].npins)
> +				clear_bit(i, pctrl->chip.irq_valid_mask);
> +
> +		while ((count =3D msm_gpio_get_next_range(pctrl, &start))) {
> +			ret =3D gpiochip_add_pin_range(&pctrl->chip,
> +						     dev_name(pctrl->dev),
> +						     start, start, count);
> +			if (ret)
> +				break;
> +			start +=3D count;
> +		}
> +	} else {
> +		ret =3D gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> +					     0, 0, ngpio);
> +	}

This is the bit that I don't understand. If you only tell gpiolib about
the GPIOs that exist, then it won't be initializing the .irq_valid_mask
in a wrong way.

In other words, what I'm trying to say is that in your case, ngpio isn't
equal to the sum of .npins over all groups. If instead you make the chip
register only the lines that actually exist, .irq_valid_mask will only
contain bits that do exist.

The reason I'm bringing this up is because we had the same discussion
back in November last year (yes, that driver still isn't upstream...):

	https://lkml.org/lkml/2016/11/22/543

In a nutshell: the Tegra driver was assuming that each port had a fixed
number (8) of lines, but when gpiolib changed to query the direction of
GPIOs at driver probe time this broke badly because on of the instances
of the GPIO controller is very strict about what it allows access to.

This seems to be similar to what you're experiencing. In our case we'd
run into a hard hang trying to access a register for a non-existing
GPIO. One of the possibilities discussed in the thread was to introduce
something akin to what's being proposed here.

In the end it turned out to be easiest to just don't tell gpiolib about
any non-existing GPIOs, because then you don't get to deal with any of
these workarounds. The downside is that you need a little more code to
find out exactly what GPIO you're talking about, or to determine how
many you have. In the end I think it's all worth it by making it a lot
easier in general to deal with. I think it's really confusing if you
expose, say, 200 pins, and for 50 of them users will get -EACCES, or
-ENOENT or whatever if they try to use them.

Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnkZ0oACgkQ3SOs138+
s6EjgA//asi11NQzU3PpA6molHM85KBq7tpyMKK4OYzfEAeQy3NrVtPM2YVVSm4q
zGL/uP47j6cWfR/0/RWFACZQp4bb5Aii7XcWPu3qzsnvIIdfffeVJN/kWrusWNxo
vwJadX26u5Ab6ALXn4ZkeCJSQ75QphgxxejDQvejwym5lzzpyKxcEIW3gHAn6+0X
gF8rGX+SBejdBMRMYv69mtVH6I3u9zqp6YgDBTxIRIW1yFWSoE0qDlXc7fpeO7r0
YqVFc87nmiVD2kSXFL+37iRF/bsocCvkijN6Hyp/G/cSLNFh63Qs6Yz3+McZPp0B
+l54bLQjfUCt5/3zUiie+aLeDK1lPOG6Uy1DBl93eBbWaI3YDY3eTAqr07CEc4Bq
+H4yBzmQXvAN9exmOzFx36Tthjdno/56Z8+wcRjiwsVTlOsYHKF0NeV96XEtRbnZ
FMJxUGvPFhwLh7Oizozdv4uIxuUcMQz8o4sPYPz9GkxRhuEftHZTB+rBCK6rln9j
uSbqrp2WMMDBMAdudOciEoIVv1ScMPp6IFpeLquk7KHJhEHo5KiFJqViG09zS3pW
5daMR23cx4GnH/T3K1J+n9khgYqNwYtMrUVH8t9A92O2bLtulO8Uk6lAhRDaPHj7
zagOpT+87EgqdAFrinyeLac3DXEGYCMt6T5p6uDinUdrzYkXoqU=
=Wsek
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
