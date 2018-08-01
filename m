From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Date: Wed, 1 Aug 2018 23:01:28 +0200
Message-ID: <CACRpkdYNYzqcdb33JgFCB0cHvDPddmnXJESfhQUAR3gMQG9tqA@mail.gmail.com>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
 <CACRpkdaBM1tvbL9k7ZepEgnSC00_iLOStyb9B2t2=DipVgEW_A@mail.gmail.com> <20180731085243.v3g3vrjrngs4ib3y@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180731085243.v3g3vrjrngs4ib3y@pengutronix.de>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: stable <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, kernel-janitors@vger.kernel.org, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 31, 2018 at 10:52 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, Jul 30, 2018 at 05:43:43PM +0200, Linus Walleij wrote:
> > On Fri, Jul 13, 2018 at 4:55 PM Dan Carpenter <dan.carpenter@oracle.com=
> wrote:
> >
> > > The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
> > > has info->ngroups elements.  Thus the > here should be >=3D to preven=
t
> > > reading one element beyond the end of the array.
> > >
> > > Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Patch applied.
> >
> > I am not tagging for stable as it is debug code and does not
> > affect end users.
>
> Not sure this is a valid reason. Distro kernels usually enable debugfs.
> I'd say an out-of-bounds access that can only be triggered by root
> should still be fixed. I won't argue but added stable to the addressees
> of this mail to at least raise awareness.

I won't argue either, I will just tag it for stable.
If it matters for my friends, it matters to me, so: stable it is.

Yours,
Linus Walleij
