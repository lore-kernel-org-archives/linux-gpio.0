From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] added ams AS3722 gpio support
Date: Fri, 16 Aug 2013 20:00:19 +0100
Message-ID: <20130816190019.GR30073@sirena.org.uk>
References: <1376492358-16005-1-git-send-email-florian.lobmaier@ams.com>
 <CACRpkdbMUz3ujrb-QP4d_Mrc7SxKUsNLOF9_qsBphfqp5nF76w@mail.gmail.com>
 <20130816182052.GP30073@sirena.org.uk>
 <CACRpkdZLuEnYn35GGk-DJSLE64tHzQnRRw-1YmLsC1kcKc+Lcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9lPOKfY2vCV97ybw"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47687 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752373Ab3HPWdW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 18:33:22 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZLuEnYn35GGk-DJSLE64tHzQnRRw-1YmLsC1kcKc+Lcw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Lobmaier <florian.lobmaier@ams.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>


--9lPOKfY2vCV97ybw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2013 at 08:28:08PM +0200, Linus Walleij wrote:
> On Fri, Aug 16, 2013 at 8:20 PM, Mark Brown <broonie@kernel.org> wrote:

> > It's common to have inline wrappers for the regmap ops which take the
> > device specific struct and fish the regmap pointer out of it.

> I had no clue ... hm this is another side effect of not getting the
> whole patch set I guess.

Yeah.  I think from a subsystem point of view it's probably best to just
not worry about this sort of functions and just assume it'll get caught
in the review of the MFD driver.  If there's regmap helpers for the
subsystem it's a bit different of course.

> Hmmm I've been irritated about the "v" in "virq" because these
> interrupt numbers are and have always been Linux interrupt
> numbers, that they sometimes, on some systems, for the low
> IRQs, correspond to the hardware IRQ numbers is pure pattern
> matching and luck.

> They are no more "virtual" than any other IRQ numbers in the
> kernel. They are all "virtual" in a sense.

> Well nevermind that, it's probably just another try at tilting
> windmills to get it changed anyway.

Yeah, I agree with you there.  If I'd seen irqdomain when I wrote the
function I'd probably have called it _create_mapping() but as it was I
wanted to distinguish which of the IRQ number spaces was being looked up
in.  Possibly more trouble than it's worth to do the rename now though.

--9lPOKfY2vCV97ybw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDnbAAAoJELSic+t+oim9mWgP/1rILhGER9RgC8Q9LkCwYSnP
e+UcjuJ/0OlykOyli8mgp+NI3eGV6n7WZqSavm/6UYV9c1BeMGbEtR1J+ld7jKNR
pPrhKMiNsvegz2Gxrelll07+38h0QdqTI7+j3vpIQUZpfGj8RVP8aVW3VQkldyH0
hGOcZokxNAe38yDVMLD9w+q/tT3BErcMkw27MluIl6QuMFRcYGLCdn6LajCP8DZW
aSs0sSbOnzcdrz+avo51xfyfK262bS4WUYa1J4XILc7ciIw2LFDTa3NfvOHSN3Tr
S+bI6KcFuznZqhNbXJMJ/bIbJJ50Bt5fJAngRxa1AFESckdrxFX4gknC9ekdXYtv
lYdlvIL7Dcnbsy77qvqomRziKTuqYcvpltyxhVHa0D+nGNu1ilkbMxc4kC5vKWfs
ScFFm0Els0D/ERvWtHhi3bCjUXck6iotMtaTqYuCkaybP7YJuC005YdY/r8bBuvg
zwyTISxjSTTMvDFDJsB7LTmKr0MOCACsIeiOI86VkCMxWNOSZKAWSBi7hdzuGsgJ
qvHtLzzOmq4ESuxBhn9Tlrykyl5zF5kTT0PrHr5a8VJAHCiUbcaumORuR37g5OFf
5GuoI5oF5ZRnM1zlPnziblz9x7qsT1JyOS+4BhTZGVUdMhvV1St1i21IN7IqAEC1
nPyl3UdSV8VYNbIDJJZG
=T95E
-----END PGP SIGNATURE-----

--9lPOKfY2vCV97ybw--
