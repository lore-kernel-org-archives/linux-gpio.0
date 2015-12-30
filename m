From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Wed, 30 Dec 2015 17:22:12 +0000
Message-ID: <20151230172212.GZ16023@sirena.org.uk>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
 <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8M+BMcg+0CmQ2H7L"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56151 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754889AbbL3RWa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2015 12:22:30 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>


--8M+BMcg+0CmQ2H7L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 22, 2015 at 04:11:47PM +0100, Linus Walleij wrote:
> On Tue, Dec 22, 2015 at 2:46 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:

> > Move pinctrl initialization earlier in boot so that real devices can find
> > their pctldev without probe deferring.
> (...)
> > -module_init(mtk_pinctrl_init);
> > +arch_initcall(mtk_pinctrl_init);

> So I see why you're doing this (because of wanting to avoid nasty boot
> probe deferrals, right?) and I'm going to apply it, because the work
> with probe ordering is still in the works, but I'd like some general
> ARM people to come in with opinions.

I really don't think we should be applying this sort of stuff unless
things are actively broken right now.  It's a bit of a rabbit hole we
could spend a long time going down tweaking things for different
systems in the same way that tweaking the link order can be and it masks
the underlying issues.

--8M+BMcg+0CmQ2H7L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWhBLDAAoJECTWi3JdVIfQLYIH/jZbT5iHyC9Ab6s5PIomZwyZ
q7OrVof89o5dikybusX0NTwUsX8INaJ9t3tR37q9euWV8wCCQ7EVodddM+t1PzTy
AEt4LC5hdJAg5eDUlduMRm9pY1HaDGL9joeI7ieEIC5QY7BHKEXFuhwX2umvivRs
zo50qo/9S4T+6xnqnYWJE+GHMc8L4vAAgd95cGB09fUEruerZCE76gu4i8nVLXQg
hgdFBhRfm7njoJmUYJbquuR6GebpyEi0Kem/Rpl2rbV59d2lBdhDUtPzYkP0u76a
lCDHLuXHIu/bCW7tVmHrWAtFZ+7VmuukpIvsyuxCEHXNsYdkCNScN6cbedGQa9E=
=/zRB
-----END PGP SIGNATURE-----

--8M+BMcg+0CmQ2H7L--
