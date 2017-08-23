From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write
 logic
Date: Wed, 23 Aug 2017 23:17:02 +0930
Message-ID: <1503496022.7266.40.camel@aj.id.au>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
         <CACRpkdaXreebGTf_cxrttwmdcRqYfaHx8WrQ64KA+o3AijBYfQ@mail.gmail.com>
         <1503446048.7266.28.camel@aj.id.au>
         <CACRpkdbBjfi-=oEu+pXgqy_kcVaP85Dy=C6_VnwNjBe89yXFMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-XxKMkMZp9rMsVa4g1trH"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbBjfi-=oEu+pXgqy_kcVaP85Dy=C6_VnwNjBe89yXFMg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yong Li <sdliyong@gmail.com>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Rick Altherr <raltherr@google.com>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--=-XxKMkMZp9rMsVa4g1trH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-23 at 10:23 +0200, Linus Walleij wrote:
> > On Wed, Aug 23, 2017 at 1:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > On Tue, 2017-08-22 at 14:52 +0200, Linus Walleij wrote:
> > > > > > > > On Tue, Aug 15, 2017 at 6:21 PM, Yong Li <sdliyong@gmail.co=
m> wrote:
> > > > On AST2500, the hardware strap register(SCU70) only accepts write =
=E2=80=981=E2=80=99,
> > > > to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=
=E2=80=981=E2=80=99) to SCU7C
> > > >=C2=A0
> > > > Signed-off-by: Yong Li <sdliyong@gmail.com>
> > >=C2=A0
> > > Patch applied with Andrew's review/test tags.
> >=C2=A0
> > I realised after I sent the tags on v3 that I'd made a mistake: There's=
 a
> > slightly awkward to test bug in the v3 implementation. I followed up on=
 v3 with
> > this:
> >=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://lkml.org/lkml/2=
017/8/16/905
> >=C2=A0
> > And Yong sent out a corresponding v4:
> >=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://patchwork.ozlab=
s.org/patch/802946/
>=C2=A0
> Ah. I got confused and picked the wrong version.

Entirely my fault. Apologies again for the confusion. I owe you a few drink=
s if
we ever meet :)

>=C2=A0
> > I see you've pushed Yong's v3 in pinctrl/devel - can we revert/remove t=
hat and
> > apply v4?
>=C2=A0
> No I would have to revert the patch.
>=C2=A0
> Can't we simply make a small fixup patch?

I couldn't recall what the rebase policy was for pinctrl/devel.

I have sent the fixup patch:

	http://patchwork.ozlabs.org/patch/804981/

Cheers,

Andrew

>=C2=A0
> Yours,
> Linus Walleij
--=-XxKMkMZp9rMsVa4g1trH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnYdWAAoJEJ0dnzgO5LT51rwP/jJwigBrkYbTw852FRFlCQjF
2vcce3dSvuGJf60xPzQhtSu/Pxz06FQKfNamIavJOQT1rVluBeLwsWD/41QpFsIF
hTMnIOQz2IClsmITPHaDrHc0bc7dFruTnwDHJ1XdJAYxgRiOjZQcn5XmIzPoLY4b
OtDpuRHxys0wDPymFT4EsJJ6xR7wtATNJYO9ywv/0NHDJEwQKEe7gEYjpbIaMtrL
XVmhLGlhYDK+U/Es+8hnNc6dv0J0vS8vRhy0EnmNZZnkca8PF8U24ZhnJ09gbrEE
gtnilzxDWQTgKfIVn2W9oSef5XWfcYicd6oWhtO2QLWOBWJat/wa0HD9/MREm1CK
Z3oylKjFeSKvwtjJTYmHAWnPOMtGaxLpa6fOgGpkE9sK8NY4ydvRiJx99R/iGEve
d+daTOjbbrpkb77W8ah3N6/iKV2PyMDLpCjaijTvp+roREeN7X/gZV1CeccPvtgt
H7MJBoykGSS/q8scpYVVD/zYMJ1wGkKqhOUT9d+sPqpdEifOZHng2uCFuEw4+Rm0
BLOMhfzpUWFZMyEQH06BRnlUIO2E1dEWQL+P5kis/5Q1ocycq/ermOg/Y3218byP
aDAqQ58zlgKrQRu2HgoE9ahhZrkzfoimB1+jsX/PCOkYNXxO69tDWYMIg+sg130+
gjC5KYhUl2fcOm8f3Fg2
=2fdX
-----END PGP SIGNATURE-----

--=-XxKMkMZp9rMsVa4g1trH--
