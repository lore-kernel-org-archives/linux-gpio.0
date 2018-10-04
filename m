From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH v2] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Thu, 4 Oct 2018 15:47:14 +0000
Message-ID: <c7161f1258c7cd12093af1d8919a8a95e5e65a73.1538667700.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Andy Duan <fugang.duan@nxp.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Bindings for "fixed-regulator" only explicitly support "gpio" property,
not "gpios". Fix by correcting the property name.

The enet PHYs on imx6sx-sdb needs to be explicitly reset after a power
cycle, handle this by adding the phy-reset-gpios property.

Both phys share a single reset, a scenario similar to imx7d-sdb.

This issue was exposed by commit efdfeb079cc3 ("regulator: fixed:
Convert to use GPIO descriptor only") which causes the "gpios" property
to also be parsed. Before that commit the "gpios" property had no
effect, PHY reset was only handled in the the bootloader.

This fixes linux-next boot failures previously reported here:
 https://lore.kernel.org/patchwork/patch/982437/#1177900
 https://lore.kernel.org/patchwork/patch/994091/#1178304

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Fabio Estevam <festevam@gmail.com>

---
 arch/arm/boot/dts/imx6sx-sdb.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Changes since v1:
 * Use 0x10b0 for phy reset pinctrl value (Fabio)
 * Link to v1: https://lore.kernel.org/patchwork/patch/994871/

diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-s=
db.dtsi
index 53b3408b5fab..29196476ce0c 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
@@ -115,11 +115,11 @@
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&pinctrl_enet_3v3>;
 		regulator-name =3D "enet_3v3";
 		regulator-min-microvolt =3D <3300000>;
 		regulator-max-microvolt =3D <3300000>;
-		gpios =3D <&gpio2 6 GPIO_ACTIVE_LOW>;
+		gpio =3D <&gpio2 6 GPIO_ACTIVE_LOW>;
 	};
=20
 	reg_pcie_gpio: regulator-pcie-gpio {
 		compatible =3D "regulator-fixed";
 		pinctrl-names =3D "default";
@@ -178,10 +178,11 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_enet1>;
 	phy-supply =3D <&reg_enet_3v3>;
 	phy-mode =3D "rgmii";
 	phy-handle =3D <&ethphy1>;
+	phy-reset-gpios =3D <&gpio2 7 GPIO_ACTIVE_LOW>;
 	status =3D "okay";
=20
 	mdio {
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -371,10 +372,12 @@
 				MX6SX_PAD_RGMII1_RD1__ENET1_RX_DATA_1	0x3081
 				MX6SX_PAD_RGMII1_RD2__ENET1_RX_DATA_2	0x3081
 				MX6SX_PAD_RGMII1_RD3__ENET1_RX_DATA_3	0x3081
 				MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN	0x3081
 				MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M	0x91
+				/* phy reset */
+				MX6SX_PAD_ENET2_CRS__GPIO2_IO_7		0x10b0
 			>;
 		};
=20
 		pinctrl_enet_3v3: enet3v3grp {
 			fsl,pins =3D <
--=20
2.17.1
