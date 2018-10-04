From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Thu, 4 Oct 2018 11:02:10 +0200
Message-ID: <CACRpkda_Jhoiq12wtUA9s1hfsypfVztgmPQWCgmdOZE-Ct0CUg@mail.gmail.com>
References: <1147be600733a1bcde194f7df61866019f34a531.1538504729.git.leonard.crestez@nxp.com>
 <CACRpkdajdjLUEwv8ABSBuy4dVMXqrUfxVDmu55aEiRAK877urQ@mail.gmail.com> <234ccbfccc26701bd0b9fd9cf2ffb5ad2414adec.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <234ccbfccc26701bd0b9fd9cf2ffb5ad2414adec.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 3, 2018 at 1:49 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:
> On Tue, 2018-10-02 at 21:56 +0200, Linus Walleij wrote:

> > I guess I could hack to make "gpios" be ignored by the
> > regulator GPIO quirks in gpiolib, but I take it you probably
> > prefer to fix up the real issue like this.
>
> Maybe you could document in fixed-regulator bindings that it now
> supports the standard "gpios" property as well? There still seems to be
> a restriction that the list must contain a single element.

OK you're right, fixing the docs to be more standards compliant
is indeed better.

> Anyway, what my patch fixes is a board-specific issue which exists even
> outside your patch: the enet phy regulator never worked as expected.

Indeed.

Yours,
Linus Walleij
