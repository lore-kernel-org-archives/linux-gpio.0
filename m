From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: Salvator-X ravb failure with v4.5-rc3 due to irqchip power down
Date: Mon, 8 Feb 2016 21:04:30 +0100
Message-ID: <20160208200430.GB1997@tetsubishi>
References: <CAMuHMdUHiBfYDrA_=wq3DwyN1dOb-af_cuhCNaWZjvHSmMfg2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHiBfYDrA_=wq3DwyN1dOb-af_cuhCNaWZjvHSmMfg2Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The real problem is that the PHY interrupt is wired to an on-chip GPIO
> controller, which is disabled by PM Runtime if no GPIOs are in use, and
> interrupts are not taken into account (the irqchip subsystem is not (yet) PM
> Runtime aware) for GPIO use.
>
> Adding a call to
>
>     pm_runtime_get_sync(dev);
>
> to gpio_rcar_probe() fixes the problem, but keeps the GPIO modules enabled
> all the time.
>
> IIRC, we have a similar issue with HDMI on r8a7791/koelsch...

Exactly, the interrupt for 'EDID read done' never arrived because of
this.


--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWuPTNAAoJEBQN5MwUoCm2zRwP/RPSYPc/rLcf5P4JEjzLcock
gZZTAJtpewC7FqTlbdvPkEXr3IbU2n+yp7kmUVOMFk1PV/RvzttUgNte6ySPUrpG
jmzfUSPZDMkeSQKPhyvKSYvhvSoNFguQcv7lTm8k3XuvCGofhdstHPqrKOIds3ed
6nlioLNouvjK2wf/MlTGvQnrQ683fgKqaTBch5UG8mH4MEl5yAsLoI/4RqTdHzK7
dDBFND/PoHqZJS6oVU2kWZjsXvxYwsdnzKjxvO8zjNX9pVmtyFGZ/fEK1gDu8IhA
2rPVXFi8X6weqhwfLpyxuiTnBMlAuA0Dvd8ukGXBI27bMU6ieblRtW5T9BAVf50I
Kv/W741q5WvxS5SotfPAgQgk/Bd5hISIfMjXcCxUHqKIbOBfXtl2k1ohCUNSJKAw
UjgIX+P9nUMVnWtiDPIH606KfqT9hTosOF8MxsQhzBztpsM4PjSAuqarO6ouUoP0
TNpShPE3taWICmwS3ta/CrbJ/C8IaOYzCXreYa2s2YcZTpzDEDMtEpy5J3C5KvWZ
pqoVbZhaqQ4YjUAgzDpJ8XWnoUIP5rGM+c9vRU/OetCGlSyQ+DPjXXx9k/nCTQF4
jqYW22ijLzFLWwYYARrWhylibc2cFd4o1Nw2zBJV2smK3HvIZrRlGA3/mItdYVvT
p1MVlLmZxyTRlAr5UuEN
=UuD0
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
