From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Mon, 4 Jan 2016 18:23:15 +0000
Message-ID: <20160104182315.GP16023@sirena.org.uk>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
 <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
 <20151230172212.GZ16023@sirena.org.uk>
 <CAGS+omA9AarzE2sp1Ry3RuOt8EOa-sL=DL1iDA2OeVVdjn=xgg@mail.gmail.com>
 <20151231220712.GD16023@sirena.org.uk>
 <CAGS+omDesPTYHhVLv_EtQsYxa6MNuSi06MwcXz6RcY=uAcEtnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/F2XdnRjS8y2HUtp"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35733 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148AbcADSXg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2016 13:23:36 -0500
Content-Disposition: inline
In-Reply-To: <CAGS+omDesPTYHhVLv_EtQsYxa6MNuSi06MwcXz6RcY=uAcEtnQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>


--/F2XdnRjS8y2HUtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2016 at 09:56:01AM +0800, Daniel Kurtz wrote:
> On Fri, Jan 1, 2016 at 6:07 AM, Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Dec 31, 2015 at 09:45:51PM +0800, Daniel Kurtz wrote:

> >> Things are actively broken right now, in the sense that there are many
> >> needless probe deferrals on boot.

> > That's just noisy, everything does end up loading OK.

> It's not just noisy, it also adds to boot time.

If you've got meaningful boot time numbers from practical systems it'd
be good to share them, nobody was able to show any actual problem there.

> >> These are pinctrl drivers, which are required to load before every
> >> other driver that requests a gpio.
> >> AFAICT, the pinctrl is part of the platform "architecture", hence why
> >> I suggest we move this to arch_initcall().

> > This is exactly the sort of hacking that leads to problems

> What problems?
> More patches as people adjust / tune / optimize boot time, or something else?

There's that and also general fragility when multiple drivers interact -
it can get really problematic when different systems end up with
different requirements for the sasme driver and disrupt each other or
conflict with each other.

> > you can
> > also make the same argument for a bunch of other things like regulators
> > but then you find there's circular dependencies or extra devices with
> > different requirements on some systems that cause further issues and
> > need more special casing, or you find that some other device gets pushed
> > earlier so you have to go round tweaking everything it uses.

> For regulators, I think things are a bit more subtle.  Most regulators
> are external components that can be used on different boards for
> different purposes, so I can see an argument for treating them in a
> more generic way by using a later device_initcall.  The exception
> being architecture specific PMICs that only make sense when paired
> with a specific small set of CPUs - and if you look, there are many
> PMIC regulator drivers that are at earlier initcall levels, presumably
> because they are required by cpufreq drivers, and/or their initcall
> level is set as the same as the rest of the functions exposed by the
> same PMIC MFD.

The reason the regulator drivers are earlier is that cpufreq and a
couple of other things are broken and don't use the device model so we
have to use link order hacks.  I'm pushing any driver that doesn't
specifically have problems with those to just use normal initcall.

> >> arch_initcall() is also consistent with 39 other pinctrl drivers in
> >> drivers/pinctrl.
> >> 19 others use subsys_initcall(), core_initcall() or
> >> postcore_initcall(), any of which would also work.

> > It's fairly clear that there's at least a case for simplifying the
> > existing practice here, for example by moving everything into a single
> > (perhaps aliased) initcall rather than by randomly picking a level per
> > system or by actually fiddling with the link ordering if the case is
> > sufficiently clear that pinctrl in general ought to load earlier than it
> > does.

> Nothing above sounds like a reason not to merge this patch, however.
> Why should we block useful patches that use existing tools to fix real
> architecture-specific issues until new infrastructure is merged that
> solves general problems?

Some of the infrastructure here is really trivial if we are saying that
basically all drivers do this.  That way you don't end up so much with
things like wondering why different drivers made different decisions so
much.

--/F2XdnRjS8y2HUtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWiriTAAoJECTWi3JdVIfQfCMH/iIpqLXso7jfP2CLIYK8qX1k
sPYptZ0q87gwjDSinlZvCjaRAds+DsjtljoVK+xdw7PPOpnNR2K37JPWBn/AA4VH
xK6S8kz0Z60oTlRjEqgLPfyOLMXlUtbw/GeT0KGn73hRW/MtvNgHjL1g2Fw+dVsC
xdl+HeSE3y/I9kGgvS+xnLrlVKyDPv01xsovwjbgU8QDqDztL16HicCKWoxajGBA
LKgQEQpi85FOncLzPzf+WEw48D5eTZpKVKgu416YtL7AQeFSqmk7j+RlOGYWmsJG
xJzAJn0k1qhjv+VkimKDuRfOaabWjZop5Y050tUCtrBenbZH0KutMSBq0PSCsHM=
=QARv
-----END PGP SIGNATURE-----

--/F2XdnRjS8y2HUtp--
