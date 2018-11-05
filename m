From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Mon, 5 Nov 2018 10:18:24 +0800
Message-ID: <20181105021821.GA24464@tiger>
References: <c4478a98b0d2c69d58b4ba5cad3c13d73c5b387f.1539012355.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c4478a98b0d2c69d58b4ba5cad3c13d73c5b387f.1539012355.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Andy Duan <fugang.duan@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 08, 2018 at 03:28:01PM +0000, Leonard Crestez wrote:
> Bindings for "fixed-regulator" only explicitly support "gpio" property,
> not "gpios". Fix by correcting the property name.
> 
> The enet PHYs on imx6sx-sdb needs to be explicitly reset after a power
> cycle, this can be handled by the phy-reset-gpios property. Sadly this
> is not handled on suspend: the fec driver turns phy-supply off but
> doesn't assert phy-reset-gpios again on resume.
> 
> Since additional phy-level work is required to support powering off the
> phy in suspend fix the problem by just marking the regulator as
> "boot-on" "always-on" so that it's never turned off. This behavior is
> equivalent to older releases.
> 
> Keep the phy-reset-gpios property on fec anyway because it is a correct
> description of board design.
> 
> This issue was exposed by commit efdfeb079cc3 ("regulator: fixed:
> Convert to use GPIO descriptor only") which causes the "gpios" property
> to also be parsed. Before that commit the "gpios" property had no
> effect, PHY reset was only handled in the the bootloader.
> 
> This fixes linux-next boot failures previously reported here:
>  https://lore.kernel.org/patchwork/patch/982437/#1177900
>  https://lore.kernel.org/patchwork/patch/994091/#1178304
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
