From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 0/9] gpiolib: Add GPIO name support
Date: Fri, 31 Jul 2015 12:42:51 +0200
Message-ID: <20150731104251.GC1994@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
 <CAAVeFuL5F=Y2boCWp_TZEAN-kdT-Ob9r-h1-eNVDjBHftFYkeg@mail.gmail.com>
 <20150721095457.GA9981@pengutronix.de>
 <20150721101037.GB20023@pengutronix.de>
 <CAGmoSHt0Kg-cxe3U6uV40=ttmFbDruRcJZNxtmSZ=gmZQN5fTw@mail.gmail.com>
 <20150731094928.GQ28535@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:45973 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137AbbGaKmz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2015 06:42:55 -0400
Content-Disposition: inline
In-Reply-To: <20150731094928.GQ28535@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Arun Bharadwaj <arun@gumstix.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 11:49:28AM +0200, Johan Hovold wrote:
> On Thu, Jul 30, 2015 at 05:13:37PM -0700, Arun Bharadwaj wrote:
>=20
> > 2) Some times I get a kernel dump when I try to unexport the gpio or ev=
en
> > when I try to read the "name" file. This is not very repeatable and see=
ms
> > to happen at random. I haven't had the time to look into this in more
> > detail yet, but here's the dump FWIW: http://pastebin.com/xq9cpCQE
>=20
> This is probably because of patch 8/9 erroneously taking the sysfs_lock
> in gpio_name_show.

Arun, thank you for testing. I will send a fixed series at the beginning
of next week.

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVu1ErAAoJEEpcgKtcEGQQMMsP/3/Vmkch7UTyP7RMPjaoEi8j
RnwyVTwCCGDHiAh61vjo6OfposuK+3yK6l2BvusIAkx90j+xItWYjMLY22uGwP4C
1J/1lhaCdgLuGiWCJap4UdtrN6gAc9LZU3EGzjjDYtwfRwx3NN5HvCUrXHCkjDUH
Db+xVQLXRkW8cdI5qv6KVZW88X+73DDq++F2OAn7ycGSMy/hC058adV2EBBPKSwe
dekqqLMJcRmzialF3j8xIUNozFsrY9dF4yeXycbhOpRCLsUdBgSm7KQ1RL7IPUrC
Ke8wLv9txiGCtPbac7AMoOAJWmcUcnh7Ro355fQ1Ir3IHA05syAqu2PxMiQpjvpa
zOcSZzStvig85nUBlreUY3MD77c9w5vnwNbb+anNxSVRHM9p/ePO4JP3K6dd1meR
jgWOzU8ukHZwtQHmrWS3juKvMw7fk8rJYq/Wj366xvIsxW8PeXFuqrvQODf2kMIJ
PenNDSEXo6q+E7B2Nme2oFr+CxtPN+EBf8TDrlcsTkM+pyiZT7PXKiyOqth8tjGN
ynWDwGL++J2c/uSZjkMCPfCKxPL+abxjnzhAsbg/BNaNMYsFVIW/ONc3DjdjuF3w
/31nbexC+XJiqIw00mM8kVD8zJwYQRnVY02UF6Qmo2AgRioMa1ndIr2elBbuNXqm
u0vvrXKJumlKwbSgFAYk
=957j
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
