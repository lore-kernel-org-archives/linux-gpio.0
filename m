From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 092/182] pinctrl: bcm2835: use gpiochip data pointer
Date: Mon, 14 Dec 2015 10:03:02 -0800
Message-ID: <87y4cwvrft.fsf@eliezer.anholt.net>
References: <1449667836-1932-1-git-send-email-linus.walleij@linaro.org> <566A5D30.2040401@wwwdotorg.org> <CACRpkdZxzin43oHNo9dcwq8br=ibFyPdsAZYi8cULZ9vQ7Ng4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:44984 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752928AbbLNSDF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 13:03:05 -0500
In-Reply-To: <CACRpkdZxzin43oHNo9dcwq8br=ibFyPdsAZYi8cULZ9vQ7Ng4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Fri, Dec 11, 2015 at 6:20 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On 12/09/2015 06:30 AM, Linus Walleij wrote:
>>> This makes the driver use the data pointer added to the gpio_chip
>>> to store a pointer to the state container instead of relying on
>>> container_of().
>>
>> This looks like it's fine, but I wonder what is the justification for
>> the change? It might be good to mention that in the commit description.
>
> It is in patch 000/182:
> http://marc.info/?l=linux-gpio&m=144966662402660&w=2

Thanks, that helps.

I don't think it makes much sense to remove a module for a device that's
opened, but I don't really have any stake in the discussion.  So, for
the bcm2835 part:

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWbwRWAAoJELXWKTbR/J7oq7YP/R+Oql6K/uto5rJDrAzW4Ojp
uFn5Fe2wXZQw/DLj+o8ERWEGHrlvzKlgCuWtg1LysOtT6DMd9K9f4+zTjwV+eC26
DISqfzkd2D/E/WEW6rhUePv3dFvqAIBkBJLGZh1wQGMHGW13NErdROzyu/3M/TRi
toabAzI+2SirC42vrArQvccBMewiU1Ytgg+F/AmwlKUJvJsKTVbFTylo/mRC7YW1
G6+22EgcLW30OOG5qtLoiga0vym2A3dGcR+ETFHWGNdtzrmdDEJrFDlcm/qTVLvm
kovx5vVWpC8DPLExmEYLml0oaMEpzFRX/dAeB8KH+DiGD90x24EkPXMJ/ebKl71C
9EBnWoJdCt7t1v4w/KWKE5PPgChxXEGlmsgSmLgH6TTxfkPg27ybaK8/Y3hbfBxO
tJvR3AvC9emg5RNP3hrbX581vVRXG1FSfDg8dlGigtFkg9ZG65wctBOQJDZfsTg8
t8se2b92faGiithl6msRUoSD+cGSwvsGAXWAriVb1HRBaORBfz/hNZNsCgYbvs7N
egK7IFXcrCYJYYGRjTJCNF+RJBiJ3pC70sOpaHlTlij8QdCnBZ9xfw2KLVHuChSy
ZB2towke2hrbYy7n7rT97iOcmLSatUbXv3aVe2zvGR0M/Jb4pr+uonPei+iQYazi
lBc/JbtNV5DF45kKSsSp
=RnvT
-----END PGP SIGNATURE-----
--=-=-=--
