From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Thu, 22 Sep 2016 13:48:52 +0300
Message-ID: <20160922104852.GO8719@lukather>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
 <20160921203435.GA14965@sysresccd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VRppCkiwz5ce4F2G"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:54253 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933276AbcIVKsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2016 06:48:55 -0400
Content-Disposition: inline
In-Reply-To: <20160921203435.GA14965@sysresccd>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>


--VRppCkiwz5ce4F2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 03:34:35PM -0500, Michael Welling wrote:
> On Wed, Sep 21, 2016 at 10:51:28PM +0300, Maxime Ripard wrote:
> > Hi Linus,
> >=20
> > Thanks for your reply.
> >=20
> > On Sun, Sep 18, 2016 at 01:30:24PM +0200, Linus Walleij wrote:
> > > On Fri, Sep 16, 2016 at 3:58 PM, Maxime Ripard
> > > <maxime.ripard@free-electrons.com> wrote:
> > >=20
> > > > However, things are getting weird when you have that requested pin
> > > > assigned to one device, and you try to export the GPIO on that pin
> > > > (through sysfs for example,
> > >=20
> > > DON'T use sysfs. Use the new chardev ABI which is by the way enabled
> > > by default.
> > >=20
> > > (But you will face the same issue there I guess.)
> >=20
> > Yeah, well, we could re-do the discussion on ksummit-discuss :)
>=20
> Are you guys trolling me?

No, the point I was trying to make is that not every system and
product kernel out there has been switched to a 4.8+ kernel, for
exactly the reasons that are discussed right now on ksummit-discuss.

I don't really get how that is trolling.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--VRppCkiwz5ce4F2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX47cUAAoJEBx+YmzsjxAgppUQAKozCBsChiGK/kPsl5Jn3/7z
9ivWUXMWRZcsIQdInW+VD0jLsDWxaeclpdJ5W8L1KA4STdzARW4lhJs6IOkoPZbe
6iYeWG9d0vSRo8UQP73izViD4Ru0SiYOcO3sYJ0Ce7kcmbychpiJmM9MsGTXUW4u
pwFLriGB0SrBFYyfxZ9OS8FAxbJHNujDyuo4+OLkGMKe/rTNGqmNyxEa1bfRsypa
RcNX0S1fD2VLjN6EKS/A+pxWBe7GaxszUht2CbNK16T2ve9wvNFwLK3oAMKKAWrJ
pQbpw7ZLM4XenJ8ZGsxPz0hCqsnokX/0PCT+plVa4jisC9E6KHnTEY25f50Dde2T
t1NzjYqD8OTX7MXK2mlJ0UxliZG3Uf4FbU8JGTOl++jE0WvWnzWNT6WMpke3aWr/
lhrEQ4FDKlnagkwF/72EtBLiTX4kQYgrI+PI8gi+rk6MFig9Uj2Rn9QtIgdbW23Y
DQ9p2KQFdpagl/L97Rmx8HJ+BOkN0jhBHQLy2hofD4x5t2fLrpCzBioAyy8wfkOO
tsIprywNiPRa0CUuhqE+Ka/WLZZAgEylSva+IKBOG1eLxzmY1zpET/7IUuCgE/1O
ahbTxbtYdWrJSkna0Yd5S1EcCpyRmfGxtgQNrLYTzxkbc4aGavw1HK6B1b+yxAug
jG7thqHlvaLuB2IJODSn
=0y7y
-----END PGP SIGNATURE-----

--VRppCkiwz5ce4F2G--
