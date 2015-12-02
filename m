From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the gpio tree
Date: Wed, 2 Dec 2015 23:38:33 +0000
Message-ID: <20151202233833.18b17d72a5fda99c5a877788@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_23_38_33_+0000_kBM/5fbCnHa=2=iQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

--Signature=_Wed__2_Dec_2015_23_38_33_+0000_kBM/5fbCnHa=2=iQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (x86 allmodconfig)
failed like this:

make[1]: Leaving directory '/home/broonie/next/x86_64_allmodconfig'
/home/broonie/next/next/sound/soc/soc-ac97.c: In function 'snd_soc_ac97_ini=
t_gpio':
/home/broonie/next/next/sound/soc/soc-ac97.c:145:22: error: 'struct gpio_ch=
ip' has no member named 'dev'
  gpio_priv->gpio_chip.dev =3D codec->dev;
                      ^
/home/broonie/next/next/scripts/Makefile.build:258: recipe for target 'soun=
d/soc/soc-ac97.o' failed
/home/broonie/next/next/scripts/Makefile.build:407: recipe for target 'soun=
d/soc' failed
make[3]: *** [sound/soc/soc-ac97.o] Error 1

We need to cross merge the AC'97 GPIO chip into your tree for you to do the
conversion, I'll send you a pull request later (or in the mornining). For n=
ow
I used the last gpio tree that was included in a -next.

--Signature=_Wed__2_Dec_2015_23_38_33_+0000_kBM/5fbCnHa=2=iQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX4D5AAoJECTWi3JdVIfQ9+MH/iKr2BxaXihxY9x9bTDiMq0F
E8Hz6bsd8sfVSPse/MPjxV4V43qAkf4F+K4wVDBXkKF6w21RE4JBZBQWM0ADMdgG
tpF9dujHLrdvhf4aMOp1pEFRH6q+j+NBJRE3miS896+e/tbhOXEr1vNMJGLcUHwF
+ec7NBWBRGFst3Ka+MVz+E64Jw1II5fSq4I1rduq1f32kQprN5iToFtrKeyLCCgZ
bJBbgUto/sMhen+l/MvlY5YAgdWOaZTZVP/7vGXVefpnPFGYwW6b9K2x5finoOTv
XavMMZQ1+Urmb3ShleJAjhPqKK7ttL+kMVz3pGlju0+RAWHC5dwMLhU6MTeD7y8=
=2rG+
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_23_38_33_+0000_kBM/5fbCnHa=2=iQ--
