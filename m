From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write
 logic
Date: Thu, 17 Aug 2017 12:49:52 +0930
Message-ID: <1502939992.681.9.camel@aj.id.au>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
         <1502891140.681.6.camel@aj.id.au>
         <CADO9-pdF6ZP1me=h9ZzTNNk+ue02dJrf8h=yBk2fsJnWqGKmhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-yJsFPuh96aLWiLupucbS"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44685 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751965AbdHQDUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Aug 2017 23:20:03 -0400
In-Reply-To: <CADO9-pdF6ZP1me=h9ZzTNNk+ue02dJrf8h=yBk2fsJnWqGKmhg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, joel@jms.id.au, arnd@arndb.de, Rick Altherr <raltherr@google.com>, robh@kernel.org, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--=-yJsFPuh96aLWiLupucbS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yong,

On Wed, 2017-08-16 at 08:05 -0700, Yong Li wrote:
> Hi Andrew,
>=C2=A0
> Thanks for your review. I checked the patch before I sent out, but the
> tool did not report any problems. Could you help to share your
> checking commands?
>=C2=A0
> scripts/checkpatch.pl
> 0001-pinctrl-aspeed-Fix-ast2500-strap-register-write-logi.patch
> total: 0 errors, 0 warnings, 38 lines checked

Gah, turns out it was a problem with my mail client, which violates RFC4155=
 and
writes an mbox with CRLF. Awesome.

I grabbed the mbox from patchwork and it was fine. Sorry for the noise.

Separately, I slept on this and think there's a remaining issue. I'll outli=
ne
it below in context.

>=C2=A0
> Thanks,
> Yong
>=C2=A0
> > 2017-08-16 6:45 GMT-07:00 Andrew Jeffery <andrew@aj.id.au>:
> > Hi Yong,
> >=C2=A0
> > On Wed, 2017-08-16 at 00:21 +0800, Yong Li wrote:
> > > On AST2500, the hardware strap register(SCU70) only accepts write =E2=
=80=981=E2=80=99,
> > > to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=
=E2=80=981=E2=80=99) to SCU7C
> > >=C2=A0
> > > Signed-off-by: Yong Li <sdliyong@gmail.com>
> >=C2=A0
> > ./scripts/checkpatch.pl complains about DOS line-endings thoughout -
> > you should fix your editor to use Unix line endings (at least for
> > kernel work). Maybe if Linus is feeling charitable he can fix it up for
> > you. Regarding the meat of the change:
> >=C2=A0
> > > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > > > Tested-by: Andrew Jeffery <andrew@aj.id.au>
> >=C2=A0
> > Thanks for the patch!
> >=C2=A0
> > Andrew
> >=C2=A0
> > > ---
> > > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 19 +++++++++++++++++-=
-
> > > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A01 +
> > > =C2=A02 files changed, 18 insertions(+), 2 deletions(-)
> > >=C2=A0
> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctr=
l/aspeed/pinctrl-aspeed.c
> > > index a86a4d6..f2d5133 100644
> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > > @@ -183,6 +183,7 @@ static int aspeed_sig_expr_set(const struct aspee=
d_sig_expr *expr,
> > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0int i;
> > > > +=C2=A0=C2=A0=C2=A0unsigned int rev_id;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < expr->ndescs; i++) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0const struct aspeed_sig_desc *desc =3D &expr->descs[i];
> > >=C2=A0
> > > @@ -213,8 +214,22 @@ static int aspeed_sig_expr_set(const struct aspe=
ed_sig_expr *expr,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP2)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0continue;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
desc->mask, val);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D regmap_read(maps[AS=
PEED_IP_SCU],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0HW_REVISION_ID, &rev_id);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret < 0)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ret;
> > >=C2=A0
> > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (0x04 =3D=3D ((rev_id >>=
 24) & 0xff))
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D regmap_write(maps[desc->ip],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0HW_REV=
ISION_ID, (~val & desc->mask));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else

Looking back at v2 what you had was correct for the single-bit field case (=
if
'val =3D=3D 0' was false we went and wrote the set bit to HW_STRAP1), and i=
t seems
I didn't think through my suggestion enough to catch the problem I created.

Essentially we should drop the 'else' above and always perform the
regmap_update_bits() HW_STRAP1 because it is write-1-set. Otherwise we can
only clear bits in the strapping register on the AST2500 and not set them.
However, given the duplication pointed out below, I've suggested a further
rearrangement.

> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D regmap_update_bits(maps[desc->ip],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0desc->=
reg, desc->mask, val);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
} else
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D regmap_update_bits(=
maps[desc->ip], desc->reg,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0desc->mask, val);

I note that we're doing the same regmap_update_bits() operation twice in tw=
o
separate branches of the code. How about this (note: it's a sketch, and is
untested)?

(1)	if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1) {
		unsigned int rev_id;

(2)		ret =3D regmap_read(maps[ASPEED_IP_SCU], HW_REVISION_ID, &rev_id);
		if (ret < 0)
			return ret;

(3)		if (((rev_id >> 24) =3D=3D 0x04) {
(4)			if (~val & desc->mask) {
(5)				ret =3D regmap_write(maps[desc->ip],
						=C2=A0=C2=A0=C2=A0HW_REVISION_ID,
						=C2=A0=C2=A0=C2=A0(~val & desc->mask));
				if (ret < 0)
					return ret;
			}
		}
	}

(6)	ret =3D regmap_update_bits(maps[desc->ip], desc->reg, desc->mask, val);

So we have a few cases we need to deal with, AST2500 or not, writing to
HW_STRAP1 or not, and assuming AST2500/HW_STRAP1, setting and clearing bits=
. So:

A. AST25xx, only clearing bits in HW_STRAP1:
The condition at (1) ensures we only perform (2) if we need to, which becau=
se
we're modifying HW_STRAP1 state on an AST25xx we do. Thus (3) evaluates tru=
e
as does (4) due to clearing bits, and we perform a straight regmap_write() =
at
(5) due to W1C behaviour. We take a performance penalty by always writing
HW_STRAP1 at (6) which has no effect as we're only clearing bits. HW_STRAP1=
 is
modified as desired.

B. AST25xx, only setting bits in HW_STRAP1:
We pass the conditions at (1) and (3), however (4) evaluates false as we're
only setting bits. Thus we reach (6), which modifies HW_STRAP1 as desired.

C. AST25xx, both setting and clearing bits in HW_STRAP1 (e.g. multi-bit fie=
ld):
We pass the conditions at (1), (3) and (4), issue (5) to clear the bits the=
n
hit (6) to write the set bits. HW_STRAP1 is modified as desired.

D. AST25xx, modifying non-HW_STRAP1 registers:
The condition at (1) fails, we jump straight to (6) and update the register=
.

E. AST24xx, clearing bits in HW_STRAP1:
F. AST24xx, setting bits in HW_STRAP1:
G. AST24xx, setting and clearing bits in HW_STRAP1:
We pass the condition at (1), but the value read at (2) gives a failure at =
(3).
We jump to (6) and update HW_STRAP1.

H. AST24xx, modifying non-HW_STRAP1 registers:
The condition at (1) fails, we jump straight to (6) and update the register

I don't think I've missed any cases there. Can you shoot holes in it? If no=
t I
think that's the approach we should take, despite the redundant write for c=
ase
A. Otherwise the code gets messy.

Sorry that this has turned a small problem into such an exercise. I Hope I
haven't extinguished your drive to get a fix integrated :/ Apologies again =
for
the oversight in my comment on v2.

Cheers,

Andrew

> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (ret)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > >=C2=A0
> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctr=
l/aspeed/pinctrl-aspeed.h
> > > index fa125db..d4d7f03 100644
> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > > @@ -251,6 +251,7 @@
> > > =C2=A0#define SCU3C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x3C /* System Reset Control/Status Register */
> > > =C2=A0#define SCU48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x48 /* MAC Interface Clock Delay Setting */
> > > =C2=A0#define HW_STRAP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x70=
 /* AST2400 strapping is 33 bits, is split */
> > > +#define HW_REVISION_ID=C2=A0=C2=A00x7C /* Silicon revision ID regist=
er */
> > > =C2=A0#define SCU80=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x80 /* Multi-function Pin Control #1 */
> > > =C2=A0#define SCU84=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x84 /* Multi-function Pin Control #2 */
> > > =C2=A0#define SCU88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00x88 /* Multi-function Pin Control #3 */
--=-yJsFPuh96aLWiLupucbS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZlQtYAAoJEJ0dnzgO5LT5A0QP/0xcn+5StSsLoG0WPU8yrD7n
WgKLGVmD/hFivmcPWKIfTaTZeSVYh8Y0GPz2oqYRWigsuJkeJ6kC7pe9/VhTJmn9
T/5k9DKeR3XR6I80fsa2J0l2BRPReETanJLN8QbylOxcbGTv+5IwVG4HQNgPU6/s
pZuHLVx70XggWZ4vsMpqfODXwrhoDhZCIIKxnQcQKVqpupKjMfYILn0tVeMJwwG2
S0E5dzVCPK4JoZQGvoXXV2NTgJP+ay0K2gDJL2vFZ3jmSMHFdTnRtyYmLmxncGJj
iSTFg4thtPqqDRr/gZv4kt8Wy39D1qWTK+DyohSuRuQ1WA+Ti0RgPDfg8d42z4f3
u54SEUsf5mSuHRhvA1TlYWF/JdM7cJGbnfzFUHuJU8e/by35VFtc3JVgx54tiZcb
whqb9qeNlAovov3Ht/HGU6mxIEmrPWe9WWtEbOT8R/8OmQae7+CTG8hESa3O8jiv
QZc8d3Q4UtT2EixOUR/dwXzi9uc2XTp06XiEwWyV/b6PMP65OaJuuFUeAFZSwAKC
B7zDsnOu3vgLjkK8GIBJWwZPp3yMG9w8ZeTRykENk7+zkS/07AEObJPysEVHXp/7
zb0NMiJkJuzEsM6Tzw6Yu8+P84cqCYNFWGVw2/UlTN5k84aKWURLSu7/cd+X/sF/
x5VkwtOsfEsEja3bGXuN
=nV7r
-----END PGP SIGNATURE-----

--=-yJsFPuh96aLWiLupucbS--

