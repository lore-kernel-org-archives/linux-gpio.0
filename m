From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Wed, 01 Feb 2017 11:50:24 +1030
Message-ID: <1485912024.4137.36.camel@aj.id.au>
References: <20170127042442.28994-1-andrew@aj.id.au>
         <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
         <1485910329.4137.34.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-4vKmoMD7tHNRfhm7HjeG"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35296 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751131AbdBABUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Jan 2017 20:20:31 -0500
In-Reply-To: <1485910329.4137.34.camel@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--=-4vKmoMD7tHNRfhm7HjeG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-02-01 at 11:22 +1030, Andrew Jeffery wrote:
> On Tue, 2017-01-31 at 15:50 +0100, Linus Walleij wrote:
> > > > > > On Fri, Jan 27, 2017 at 5:24 AM, Andrew Jeffery <andrew@aj.id.a=
u> wrote:
> > > This is less straight-forward than one would hope, as some banks only
> > > have 4 pins rather than 8, others are output only, yet more (W and
> > > X, already supported) are input-only, and in the case of the g4 SoC b=
ank
> > > AC doesn't exist.
> > >=20
> > > Add some structs to describe the varying properties of different bank=
s
> > > and integrate mechanisms to deny requests for unsupported
> > > configurations.
> > >=20
> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >=20
> > > ---
> > >=20
> > > Since v2:
> >=20
> > Patch applied with some patch -p1 < fuzz
> > please check the result.
>=20

*snip*

> Regardless, I'll try to recreate it myself and inspect the fuzz damage.

Ah, I think I see what's happened. I didn't send "gpio: aspeed: Make
bank names strings" again because you claimed you had applied v1 in the
v2 thread[1]. This patch doesn't fuzz when "gpio: aspeed: Make bank
names strings" has been applied, so is it possible that you tried
applying it to a tree missing "gpio: aspeed: Make bank names strings"?

    $ git reset --hard gpio/for-next
    HEAD is now at f334eae9c4e9 Merge branch 'devel' into for-next
    $ git am "/home/andrew/patches/[PATCH_v2_1_2]_gpio:_aspeed:_Make_bank_n=
ames_strings.mbox"
    Applying: gpio: aspeed: Make bank names strings
    $ git am "/home/andrew/patches/[PATCH_v3]_gpio:_aspeed:_Add_banks_Y,_Z,=
_AA,_AB_and_AC.mbox"
    Applying: gpio: aspeed: Add banks Y, Z, AA, AB and AC
    $

    Sorry for the confusion. What should I be doing when sending an updated
    series where some of the patches have been applied? Send the whole
    series regardless?

    Andrew

    [1]     https://lkml.org/lkml/2017/1/26/334
--=-4vKmoMD7tHNRfhm7HjeG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYkTfYAAoJEJ0dnzgO5LT5SXEQAJpteCJhq/KHyH/mRo7ogbfu
HbxbFAYC3gtvPyf9+thDXU7jBBiOpAbgT5ScOoHx06ZS6RVJfh39dKZYTxyBVXXF
9NsWqj4LdgYJdgh1JmhYl2WC+mkI1bsTJqag1CeEGmumS5Au47h+ZTEPbCedeYJJ
3rhXBx/nJPzdwTxCyBIL/dsFyidSS6UgAGnWEYSIKwO5r+sOR98oY6p5RANCEQsY
NHC3IG4pCMnu2o5oYYUEdV089aA3Zhtg5bF1U3vKx2wO1+9j26kC/Imf+dXU/lBj
kGQwcq8j9aDV568imL43yyKs+7oAXYx/Ign4VKpdUJEeXnSgKFmPFePiBNELP2++
jGSLRvMHU827/+mtQnSo/F3jjG/OKsL4R0vcPcBVGdxA7QVBonjmyCLMBZX9c5Jm
Vom9KzJIIeFfvzOKcAoyQhgIFZABrbh12Kp2jOk4QAWrCpsL4KO9RE6OvmnOMqIx
EvHSmgOiop6UEAyVfZuqUAi/8xGk//mfsuUGMAwYWvCh6bZ0X6HJZ9T7tx1dEWd+
/2sDuB2M3sUObxAjEOokJfm5/frYXW5MufIMN0vDniX0JfO+CVfCixR5n4HFE3nu
a1tnFrAhbKMgTtZPVRyg1dIfRbFpqfS9rv0YVrWxwOaYFJ1UHoJmK8usg5o8shc0
yK0LLK92pt5SZMMX2YmR
=qoHU
-----END PGP SIGNATURE-----

--=-4vKmoMD7tHNRfhm7HjeG--

