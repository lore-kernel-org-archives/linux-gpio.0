From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Tue, 2 Oct 2018 21:56:39 +0200
Message-ID: <CACRpkdajdjLUEwv8ABSBuy4dVMXqrUfxVDmu55aEiRAK877urQ@mail.gmail.com>
References: <1147be600733a1bcde194f7df61866019f34a531.1538504729.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1147be600733a1bcde194f7df61866019f34a531.1538504729.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 2, 2018 at 8:37 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> This issue was exposed by commit efdfeb079cc3 ("regulator: fixed:
> Convert to use GPIO descriptor only") which causes the "gpios" property
> to also be parsed. Before that commit the "gpios" property had no
> effect and PHY reset was only handled in the bootloader.

Wow that was a very interesting one.
Turning over these stones sometimes expose the weirdest
things.

This is one of the reasons why we need formal validation of
DTS files: things look OK to the human eye and get merged
but they are just syntactically wrong.

I guess I could hack to make "gpios" be ignored by the
regulator GPIO quirks in gpiolib, but I take it you probably
prefer to fix up the real issue like this.

Anyways, good job!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
