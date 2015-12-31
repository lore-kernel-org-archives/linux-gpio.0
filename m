From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Thu, 31 Dec 2015 22:07:12 +0000
Message-ID: <20151231220712.GD16023@sirena.org.uk>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
 <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
 <20151230172212.GZ16023@sirena.org.uk>
 <CAGS+omA9AarzE2sp1Ry3RuOt8EOa-sL=DL1iDA2OeVVdjn=xgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SSQrXjJAjSvYS5Wm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57912 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003AbbLaWHa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Dec 2015 17:07:30 -0500
Content-Disposition: inline
In-Reply-To: <CAGS+omA9AarzE2sp1Ry3RuOt8EOa-sL=DL1iDA2OeVVdjn=xgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>


--SSQrXjJAjSvYS5Wm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 31, 2015 at 09:45:51PM +0800, Daniel Kurtz wrote:
> On Thu, Dec 31, 2015 at 1:22 AM, Mark Brown <broonie@kernel.org> wrote:

> > I really don't think we should be applying this sort of stuff unless
> > things are actively broken right now.  It's a bit of a rabbit hole we
> > could spend a long time going down tweaking things for different
> > systems in the same way that tweaking the link order can be and it masks
> > the underlying issues.

> Things are actively broken right now, in the sense that there are many
> needless probe deferrals on boot.

That's just noisy, everything does end up loading OK.  If the noise is a
problem working on fixing the underlying problem with not being able to
figure out dependencies seems like a better thing.  When we discussed
this on the kernel summit list it wasn't clear everyone was convinced
this was even a problem (I think it is since it obscures real
information).  Actual breakage to me is something that never sorts
itself out.

> These are pinctrl drivers, which are required to load before every
> other driver that requests a gpio.
> AFAICT, the pinctrl is part of the platform "architecture", hence why
> I suggest we move this to arch_initcall().

This is exactly the sort of hacking that leads to problems - you can
also make the same argument for a bunch of other things like regulators
but then you find there's circular dependencies or extra devices with
different requirements on some systems that cause further issues and
need more special casing, or you find that some other device gets pushed
earlier so you have to go round tweaking everything it uses.  It's not
that the device is magic, it's that we don't understand how to handle
dependencies well enough.  Raphael did say he was going to work on
something for this, I'm not sure where it got to though.

> arch_initcall() is also consistent with 39 other pinctrl drivers in
> drivers/pinctrl.
> 19 others use subsys_initcall(), core_initcall() or
> postcore_initcall(), any of which would also work.

It's fairly clear that there's at least a case for simplifying the
existing practice here, for example by moving everything into a single
(perhaps aliased) initcall rather than by randomly picking a level per
system or by actually fiddling with the link ordering if the case is
sufficiently clear that pinctrl in general ought to load earlier than it
does.

--SSQrXjJAjSvYS5Wm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWhacQAAoJECTWi3JdVIfQL+AH/iKqe8h38IrrA5wRdAuPq22g
MJSgAdDSapma7nWQOhyDf3q5vYDD+0i5e8sZQWzL7V9Wfjdjc1FJWfgHqmhikTHe
xWD48pnf3zqRqW3pre64Ic95dGnmpgd06OMj0ZPuFJoQi99XUFBCoNz71WKmyeUG
GqgbYHIx8UXJGIrjP2IcRaqzLRQyZXKNaufDf42adEipK3M4bOMW/7nEV2gEqTKJ
3qQFP8heXjQdYQXeAxuAd7PK+Bp4qUCWFYglbw4SfCD4LBk70/+WWB6KMvV2cUSo
rC6tC9nvqKpi1wCQPXpWiqORMbWFus9n+RPCXXNkLrX7SyE44/fg8r2bTKXcvQA=
=7+JS
-----END PGP SIGNATURE-----

--SSQrXjJAjSvYS5Wm--
