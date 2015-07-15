From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PULL gpio-for-next] gpio: make flags mandatory for gpiod_get
 functions
Date: Wed, 15 Jul 2015 08:28:25 +0200
Message-ID: <20150715062825.GC1426@pengutronix.de>
References: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150706090759.GS11824@pengutronix.de>
 <20150708105138.GD1426@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33616 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316AbbGOG23 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 02:28:29 -0400
Content-Disposition: inline
In-Reply-To: <20150708105138.GD1426@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de

Hello Linus, hello Alexandre,

On Wed, Jul 08, 2015 at 12:51:38PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Jul 06, 2015 at 11:07:59AM +0200, Uwe Kleine-K=F6nig wrote:
> > now that all patches that were in next hit Linus Torvalds' tree and
> > v4.2-rc1 is out here comes the promised pull request that makes usa=
ge of
> > the flags parameter mandatory for gpiod_get et al:
> >=20
> > The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d=
7d4f0754:
> >=20
> >   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.pengutronix.de/git/ukl/linux.git tags/gpiod-flags-for-4=
=2E3
> >=20
> > for you to fetch changes up to b17d1bf16cc72a374a48d748940f700009d4=
0ff4:
> >=20
> >   gpio: make flags mandatory for gpiod_get functions (2015-07-06 10=
:39:24 +0200)
> gentle ping!
the (or at least my) plan was to get this into next early after the
merge window for 4.2 closes. Now we're already at -rc2. Can you please
comment?

As of next-20150715 there don't seem to be any new users of gpiod
without flags btw.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
