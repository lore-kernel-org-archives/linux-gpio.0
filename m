From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2][v3] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Sun, 1 Jun 2014 20:31:50 +0100
Message-ID: <20140601193150.GS5099@sirena.org.uk>
References: <7079851.LZm0BOlnTs@pcimr>
 <CACRpkdZq1N-C=rowPt3t1gf24Dio0LUK4HULvZ-47jHVm1pVwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iJe1uyGc1/1h0P8m"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50230 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbaFATcE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Jun 2014 15:32:04 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZq1N-C=rowPt3t1gf24Dio0LUK4HULvZ-47jHVm1pVwA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>


--iJe1uyGc1/1h0P8m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 29, 2014 at 12:10:02PM +0200, Linus Walleij wrote:
> On Tue, May 27, 2014 at 1:14 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> > +       void                    (*set_multiple)(struct gpio_chip *chip,
> > +                                               u32 *mask, u32 *bits);

> This sets the chunk size to 32bits which means that any GPIO
> controller with say 8bit registers will get a complex demuxing
> scheme.

> But thinking of it I think it's a reasonable compromise given that
> so many GPIO drivers are actually 32bit.

> However some of the real slow I2C expander GPIOs are 8bit.

We can probably librify the demuxing code if we need it, though a lot of
those devices only have 8 GPIOs in the first place which makes life a
lot simpler since everything will always be in the same register anyway.

Overall the interface here looks good modulo your concerns about
ARCH_NR_GPIOs.

--iJe1uyGc1/1h0P8m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTi3+jAAoJELSic+t+oim90WwP/3b5gAQARNQzkyZoU2GpPDt7
I2v5PjcK79Kl0asRdF1oQ5laYcak1VsVPuaGXRY14asT/9HHarWIR809eZfHJazL
JDEFkXarqwxQPCsWGfLReVvr8MBzVIWQDGXYMrtY2ySunXDSJ8N2kPmOemIj9pMD
f87FJl3eNj0Aa0p7pewc/6G+aWB1fv4AUC0wi3nGSII7aLESl4x4ZTpxqpv4qnti
8KjQcoWcYFBhTtWX5tO5eTOOIwT6h3XY9P9DIxiXh02812mwBMzh8dj1RKNGpfj9
PsDawbmpX22NBGzV++bE6IBTdid4rW70I8UsO3Ad4HHmfeutnXHXwBeFJL6jLsTl
8GPKBdJbg78YdSGbNlR076RzxqdJxBIBIwL7b+IiFegWjP6rL5en1W5MrwonMn4v
h+b8IhbtTv5MO8GPOL2guZK3g9ogfydkkOL6E4NbB3gJNlkFq7AZoz6KYofSkLEj
JzYo48VorcC4w5Upia5IQ0W7tCp47HK2Hg0dKgVHloC36P9spgVCOy7lbCQz/4ti
7KiqmoYKmz2DPCN4pRES0DqZs2jXaeUHIcyy2pMmiY3UM/UIG/QVI8oF3g27YQg6
rCiiUZYr+MsBB1WnOaDtZ51eFA6UHm8jcZ7I6/0EHFf5VEp9xobAyauNxwHtrr6+
DEKnRVooengJmPWLgE3z
=b3fX
-----END PGP SIGNATURE-----

--iJe1uyGc1/1h0P8m--
