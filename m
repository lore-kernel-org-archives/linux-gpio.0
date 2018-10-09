From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Tue, 9 Oct 2018 09:09:07 +0800
Message-ID: <20181009010905.GY3587@dragon>
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

So this is a fix we only need to apply for 4.20-rc, right?

Shawn

> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> 
> ---
> I attempted to fix by asserting phy-reset-gpios on resume but apparently
> phy fixups are still lost and need to be reapplied (not sure why/how).
> 
> Changes since v2:
>  * Mark as always-on boot-enable-on because phy power cycling is hard
>  * Clear Reviewed-by because of large behavior change
>  * Link to v2: https://lore.kernel.org/patchwork/patch/995520/
> 
> Changes since v1:
>  * Use 0x10b0 for phy reset pinctrl value (Fabio)
>  * Link to v1: https://lore.kernel.org/patchwork/patch/994871/
> 
>  arch/arm/boot/dts/imx6sx-sdb.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-sdb.dtsi
> index 53b3408b5fab..7d7d679945d2 100644
> --- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
> +++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
> @@ -115,11 +115,13 @@
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_enet_3v3>;
>  		regulator-name = "enet_3v3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
> -		gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> +		gpio = <&gpio2 6 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;
> +		regulator-always-on;
>  	};
>  
>  	reg_pcie_gpio: regulator-pcie-gpio {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -178,10 +180,11 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_enet1>;
>  	phy-supply = <&reg_enet_3v3>;
>  	phy-mode = "rgmii";
>  	phy-handle = <&ethphy1>;
> +	phy-reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  
>  	mdio {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -371,10 +374,12 @@
>  				MX6SX_PAD_RGMII1_RD1__ENET1_RX_DATA_1	0x3081
>  				MX6SX_PAD_RGMII1_RD2__ENET1_RX_DATA_2	0x3081
>  				MX6SX_PAD_RGMII1_RD3__ENET1_RX_DATA_3	0x3081
>  				MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN	0x3081
>  				MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M	0x91
> +				/* phy reset */
> +				MX6SX_PAD_ENET2_CRS__GPIO2_IO_7		0x10b0
>  			>;
>  		};
>  
>  		pinctrl_enet_3v3: enet3v3grp {
>  			fsl,pins = <
> -- 
> 2.17.1
> 
