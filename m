From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write
 logic
Date: Wed, 23 Aug 2017 09:24:08 +0930
Message-ID: <1503446048.7266.28.camel@aj.id.au>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
         <CACRpkdaXreebGTf_cxrttwmdcRqYfaHx8WrQ64KA+o3AijBYfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-B45AcKom5OeECxhnnNlV"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaXreebGTf_cxrttwmdcRqYfaHx8WrQ64KA+o3AijBYfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yong Li <sdliyong@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Rick Altherr <raltherr@google.com>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--=-B45AcKom5OeECxhnnNlV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 2017-08-22 at 14:52 +0200, Linus Walleij wrote:
> > On Tue, Aug 15, 2017 at 6:21 PM, Yong Li <sdliyong@gmail.com> wrote:
>=C2=A0
> > On AST2500, the hardware strap register(SCU70) only accepts write =E2=
=80=981=E2=80=99,
> > to clear it to =E2=80=980=E2=80=99, must set bits(write=C2=A0=C2=A0=E2=
=80=981=E2=80=99) to SCU7C
> >=C2=A0
> > Signed-off-by: Yong Li <sdliyong@gmail.com>
>=C2=A0
> Patch applied with Andrew's review/test tags.

I realised after I sent the tags on v3 that I'd made a mistake: There's a
slightly awkward to test bug in the v3 implementation. I followed up on v3 =
with
this:

	https://lkml.org/lkml/2017/8/16/905

And Yong sent out a corresponding v4:

	https://patchwork.ozlabs.org/patch/802946/

I see you've pushed Yong's v3 in pinctrl/devel - can we revert/remove that =
and
apply v4?

Sorry for the confusion.

Andrew

>=C2=A0
> Yours,
> Linus Walleij
--=-B45AcKom5OeECxhnnNlV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnMQgAAoJEJ0dnzgO5LT5qp4P/RuZXTb7II5WsMNfwVetiNDY
ol4D+znHefCU4dONVMgO4auUJomTyBNpQGE57iR7GFOg03kZdciynr0GfZlEh6FO
NtHJGHikEeBNxBjgNnGJm1yqJfmJL4UgJFQbqXS5r3ps3P6y5U+tjbqkWapz6443
EIHv4JAQfWOtUzLvQvW26dzGczvZLr3o7YDi0yFLI8y8N86/ENwtFu16fzCmxKnt
+Tdws7ukgDwHZOyQ1aBTJ8V5hApPkf7yuGfb6nYg7M1UERkWMsjXXmh6nDrrOdKc
B/344VixRFt83gNp0376L/1pfrtcC3Cs6G01jws8HEKQU7ciBr4CHFPJ/cyjXrmo
h2o7cNDhlfQ/iUlVmxQut4Iui8s0fNcdyQRQysN6lK8wekECY1w1r90U00SLfBKn
wAmtFS2hLPBa3TyBLda+yTWDWdJNaEaiz6QW+gX+ZRFYI4MJbXM6iz7OuPR44qKY
uGPnXB+EgSO2tDI1ZCUWImIdkUsDKBs2U/+hXFxvCwn4X9Tp853wManR9kZp3VjO
cpcL5eK0i9Jhj6QTmOeMtGFv99b8fU5bAgBYlD3wJzsOq9qzPtI5NRF2gerPVhQQ
jNAhZ+dQ5YogN16df1L7MeatFUOyyOcm/QI8hDRfcTkonHK+ZQQfvYsElf5PdQyy
l0LdNfGW/b5CAbBo5T/V
=APSc
-----END PGP SIGNATURE-----

--=-B45AcKom5OeECxhnnNlV--
