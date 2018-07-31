From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: freescale: off by one in
 imx1_pinconf_group_dbg_show()
Date: Tue, 31 Jul 2018 10:52:43 +0200
Message-ID: <20180731085243.v3g3vrjrngs4ib3y@pengutronix.de>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
 <CACRpkdaBM1tvbL9k7ZepEgnSC00_iLOStyb9B2t2=DipVgEW_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaBM1tvbL9k7ZepEgnSC00_iLOStyb9B2t2=DipVgEW_A@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, kernel-janitors@vger.kernel.org, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

On Mon, Jul 30, 2018 at 05:43:43PM +0200, Linus Walleij wrote:
> On Fri, Jul 13, 2018 at 4:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
> > has info->ngroups elements.  Thus the > here should be >= to prevent
> > reading one element beyond the end of the array.
> >
> > Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Patch applied.
> 
> I am not tagging for stable as it is debug code and does not
> affect end users.

Not sure this is a valid reason. Distro kernels usually enable debugfs.
I'd say an out-of-bounds access that can only be triggered by root
should still be fixed. I won't argue but added stable to the addressees
of this mail to at least raise awareness.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
