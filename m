From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Fri, 29 Aug 2014 10:15:14 +0200
Message-ID: <20140829081514.GA1329@katana>
References: <25983307.ZjJOfz2Kpg@pcimr>
 <CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
 <20140731071235.GH3407@book.gsilab.sittig.org>
 <12452684.GmmEHEPXzu@pcimr>
 <CACRpkdZnzVqNm8EoKDSt_LsP0bta8FQYnif4ou+ngFyD-4x-YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:44016 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752746AbaH2IPM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Aug 2014 04:15:12 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZnzVqNm8EoKDSt_LsP0bta8FQYnif4ou+ngFyD-4x-YQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rojhalat Ibrahim <imr@rtschenk.de>, Gerhard Sittig <gsi@denx.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > So, Linus, would a patched version of one of the mentioned drivers qual=
ify as
> > a user that would allow you to merge my patch?
>=20
> I think so. My concern is with code that doesn't get exercised, anywhere.

If we have a gpio-chardev somewhen, I know a bunch of industrial
customers who will love it. It always feels a bit awkward to tell them
they have to fiddle with bits individually if they want to read out an
ID byte or have paired GPIO for other reasons.


--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUADaRAAoJEBQN5MwUoCm2C5sQAKAAG1E27lPbDow6a0i/lIvi
9/XorUEyXvj5LKq9j4qy6X+dxwXReqMNT7vmqpiNgb4kEu/YCPefgUzf3rx+lxZ8
W+jM2r8yVkEJwI9cBXMU1C1srEZfKqQDZe4bI8nCZdzWVc2BCx821Z0tjaZXtFKP
tAiZPcrAic/NXiCxAfuD435Sg95kb1GftWSU/vQfh4WA31jwSfclnUwdTMM7Y8KK
Ud51GRvf5eZas80MiZqTp4hbdr9KZeGASwOvVRw8BHXKCBaQJ6xewktTer9SGG2H
RarwgJVgmUUZTPzokj1ZXOHV2dsQ80Y69Z4ODbbBGIyUHmqFFpQdeBEy3BQGusoC
0npEr5hlYYh2Rm331VEcMHHwa0gB/6Pi82gRPdv3QaMcy13kEaeBcWl1uQboZyIh
2k6iVpA/cdf4PsYV9IqzExYxEz/tMZHwYI3wBWSm1UuOq//nmSZ8IQQ2UgU3t3dK
/C6e2oe0p6byq/wNTkRR3SYDLO+uNyhXsxzECQc1LA7xAQSm0auQ26XidQ8BRywJ
ND7WP/tz98qJlaUYBci8gwHDn2pYjVU/pgMW3uc23W9fqLGDKrOqtPjnm1UWoyeU
QHYV28F0I0ZXQpOikt3n8eHPWQpFS7Nvcx9Uys+aBZCCej3PmDRO/YKtbarT1gjW
880Iw4lcIv4DZKVmZ5Bq
=C900
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
