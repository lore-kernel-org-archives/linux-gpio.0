From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Mon, 4 Jan 2016 17:12:57 +0000
Message-ID: <20160104171257.GO16023@sirena.org.uk>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
 <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
 <20151230172212.GZ16023@sirena.org.uk>
 <CAGS+omA9AarzE2sp1Ry3RuOt8EOa-sL=DL1iDA2OeVVdjn=xgg@mail.gmail.com>
 <20151231220712.GD16023@sirena.org.uk>
 <CAGS+omDesPTYHhVLv_EtQsYxa6MNuSi06MwcXz6RcY=uAcEtnQ@mail.gmail.com>
 <DBFC9B9B-5E81-44FD-9E26-8B50545004C1@gmail.com>
 <CACRpkdZsQc_Jug1dy-qist4Dv7HTDDx-fBjXTxj+s7W0sgJSuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Wg1ddIY7KV0vpwL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZsQc_Jug1dy-qist4Dv7HTDDx-fBjXTxj+s7W0sgJSuw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org


--0Wg1ddIY7KV0vpwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2016 at 06:29:15PM +0100, Linus Walleij wrote:
> On Fri, Jan 1, 2016 at 3:27 PM, Matthias Brugger <matthias.bgg@gmail.com> wrote:

> > I think what Mark means is, that we define some pinctrl_initcall which
> > is a macro to subsys_initcall (or arch_initcall or similar). We apply this
> > to all pinctrl drivers including the one from Mediatek. This way at least
> > we have a common method and changing the behaviour in the future is
> > easier to handle.

> That would be pinctrl_soc_initcall() in that case. Just pinctrl_initcall()
> would assume it's for all drivers and there is a bunch of them that are just
> fine with simple device_initcall()s.

OTOH it might be easier to just have an initcall (or fiddle with the
link order) for everything to avoid having to think about which drivers
things apply to.

--0Wg1ddIY7KV0vpwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWiqgZAAoJECTWi3JdVIfQpQgH/12pMEZ5qu6WTqBMY1CTjyw5
839VULBFUFbheInVXh3vE+U4c351yOVb4oao8PCra1ksnOPgdkYEB6OvjmnF+pcK
bfDe15TcX9JKYdhY3WVl3IhUJWslvKuXgxuS2FYVpcP/1vsnGsXR8R0YWZfElsMI
e3htl33qOmOTSXZiGyAm0A5PCLvnfkeKhI9M+b7sOY1uUOOcjNAiTWHv5ENXWg5h
9wqK5rRvPU/+HvAyZ+c1lINns/YK2yCcbMuvvcfenFO9AGcQLAd1shTYyDCP7h8D
83RdZ1PwGgmKUm+ETmXegHvgjwKb8IJnhoKFutl2qDm9ZOF+S4gai9Uyv0hhtg4=
=D5WS
-----END PGP SIGNATURE-----

--0Wg1ddIY7KV0vpwL--
