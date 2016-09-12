From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: fix regmap error handling
Date: Mon, 12 Sep 2016 11:25:01 +0930
Message-ID: <1473645301.10397.39.camel@aj.id.au>
References: <20160909092715.403663-1-arnd@arndb.de>
         <CACPK8XeLYDjm+vkdoM7Lv5pK4+Ls9tTyfV2j3HuE=vaAsWav5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-53hE1nR36sXQOCoSJlf5"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46944 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756510AbcILBzN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Sep 2016 21:55:13 -0400
In-Reply-To: <CACPK8XeLYDjm+vkdoM7Lv5pK4+Ls9tTyfV2j3HuE=vaAsWav5w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, colin.king@canonical.com


--=-53hE1nR36sXQOCoSJlf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-09-12 at 10:52 +0930, Joel Stanley wrote:
> On Fri, Sep 9, 2016 at 6:56 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> >=20
> > The newly added aspeed driver tries to check for a negative return
> > value from a pinctrl function, but stores the intermediate value in
> > a 'bool' variable, which cannot work:
> >=20
> > drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function 'aspeed_sig_expr_s=
et':
> > drivers/pinctrl/aspeed/pinctrl-aspeed.c:192:11: error: comparison of co=
nstant '0' with boolean expression is always false [-Werror=3Dbool-compare]
> >=20
> > This slightly reworks the logic to use an explicit comparison with zero
> > before assigning to the temporary variable.
> Thanks for finding this Arnd.
>=20
> Colin also found the issue. Thanks Colin!
>=20
> I think we should take this version of the fix. Linus, can you put
> this in your tree please?

+1 on each point above.

I made a change to the loop body in response to feedback in one of the
earlier iterations and unfortunately this looks to have slipped past
me. I will look at adding a bit more static analysis to my patch
submission checklist!

>=20
> >=20
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Cheers,
>=20
> Joel
>=20
> >=20
> > ---
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
> > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/=
aspeed/pinctrl-aspeed.c
> > index 7d461fc30d3c..0391f9f13f3e 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> > @@ -187,10 +187,10 @@ static bool aspeed_sig_expr_set(const struct aspe=
ed_sig_expr *expr,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
continue;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D regmap_update_bits(map, desc->reg, desc-=
>mask,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pattern << __ffs(desc->mask));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pattern << __ffs(desc->mask)) =3D=
=3D 0;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (ret < 0)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=
 false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (!ret)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=
 ret;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return aspeed_sig_expr_=
eval(expr, enable, map);
> > --
> > 2.9.0
> >=20
--=-53hE1nR36sXQOCoSJlf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX1gr2AAoJEJ0dnzgO5LT5vhYP/iM4da5XOuoj7nbiaz6DPZbj
DYlC1MououjvIx07y6OVNMuMsBdZDRC7H2vbnFop+9AW2GDyWbQ6baU+r/UmljVK
Ft4og5dyonbgJvVbQpDGNnrtwp3e6Srm30b8uI11ZMw9ZZN5h/57BMwFY/onDCNN
8ypA/ZntiXg56kBubQv6TzZqfq70C9zRyNE6gHHa3ye8l4SgjxeLEeUxpzp83XI+
AFY2wMQ6o7FWXop8iRApNPNQZLFtK4YZEpGRZG35Ds2yrRSisVC/ZPiqLEqVjJSE
R+Z/VqSd47q/IQxbMQ81yyaEs23uAqZhEtH/7jjuhb8eDvoGJ+pG51Z2ex44F41n
JOfEwxxDNObtPfHy7X7XpU0bC9i9S8KuJfcKsrp/L0SMdyw0c1njC+aIKEkSDNWR
/knxXJAOf6py+9SehF/5O59X5cLkD723FEynEqyfkJNC46yfpMeY0o2NWbJXMrJQ
75Mz8QQeEvUan9NFpv+5z13Bv72EhfEeT4PaKnwvlN/LjOrdM550SF7Z5Fbu7EAQ
PoOLrxGNLqjZqBJcqAURutzlj5Yr/o5yPmw5V4PvA3n1BKMFNB5xqS45Ut2gjRLF
Ix6aPPKBwbyoRfIRFcyi6s19VD+b2HVsH9D9s3vNWpUr+7xkGSZ0r1AvyMA3Zz1T
ZJI/t3IKt9mCG80Iv30i
=nsDk
-----END PGP SIGNATURE-----

--=-53hE1nR36sXQOCoSJlf5--

