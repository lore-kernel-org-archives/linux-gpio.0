From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PULL gpio-for-next] gpio: make flags mandatory for gpiod_get
 functions
Date: Mon, 20 Jul 2015 09:51:29 +0200
Message-ID: <20150720075129.GQ7013@pengutronix.de>
References: <1434404169-4639-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150706090759.GS11824@pengutronix.de>
 <20150708105138.GD1426@pengutronix.de>
 <20150715062825.GC1426@pengutronix.de>
 <CAAVeFuKTwuO6O106oq0=f6eWAaa1NTiOJZ8Pw-VRG_i0E+4g+w@mail.gmail.com>
 <CACRpkdbDtg=Ssod4K881juitv4fu3iPO8TkE+ZqEALKMqeTwDA@mail.gmail.com>
 <20150720065605.GP7013@pengutronix.de>
 <CACRpkdYaY3vMjACCALwk9HNw-XV86Rm1anpCW3wb1Y0-FWwd=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:40902 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755675AbbGTHvb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2015 03:51:31 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYaY3vMjACCALwk9HNw-XV86Rm1anpCW3wb1Y0-FWwd=A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

Hello Linus,

On Mon, Jul 20, 2015 at 09:41:09AM +0200, Linus Walleij wrote:
> On Mon, Jul 20, 2015 at 8:56 AM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > Hello Linus,
> >
> > On Fri, Jul 17, 2015 at 02:28:25PM +0200, Linus Walleij wrote:
> >> On Wed, Jul 15, 2015 at 8:39 AM, Alexandre Courbot <gnurou@gmail.c=
om> wrote:
> >> > I'm all for taking this into -next ASAP then. Linus has control =
over
> >> > the tree though, so his action is required.
> >>
> >> I am pushing it today.
> >>
> >> I finally found this message in my messy inbox. I'm a bit up over =
my
> >> ears in patches...
> > This somehow failed.  My tag is merged in your devel branch, but th=
is
> > contains several commits missing in your for-next. Is this intended=
?
>=20
> No ... :(
>=20
> I just pulled it in. If anything is to blame, I hope it's not me, I j=
ust
> issued git pull.
>=20
> commit 2563606ce45314bfeae811edfa9984b1921fff06
> Merge: 015403145a65 b17d1bf16cc7
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Fri Jul 17 13:44:15 2015 +0200
>=20
>     Merge tag 'gpiod-flags-for-4.3' of
> git://git.pengutronix.de/git/ukl/linux into devel
>=20
>     The last patch in this series makes the flags parameter for the v=
arious
>     gpiod_get* functions mandatory and so allows to remove an ugly cp=
p hack
>     introduced in commit 39b2bbe3d715 (gpio: add flags argument to gp=
iod_get*()
>     functions) for v3.17-rc1.
>=20
>     The other nine commits fix the last remaining users of these func=
tions that
>     don't pass flags yet. (Only etraxfs-uart wasn't fixed; this
> driver's use of the
>     gpiod functions needs fixing anyhow.)
this is fine. It contains my signed data (you have to do

	git cat-file commit 2563606ce45314bfeae811edfa9984b1921fff06

to see that) and the usual =F6-Problem doesn't exist here, because it w=
as
me who created the commits.

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
