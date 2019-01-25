From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH] pinctrl: berlin: as370: use generic "pwm" as pwm function
 name
Date: Fri, 25 Jan 2019 07:45:47 +0000
Message-ID: <20190125153934.3dc818b6@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <04FB5ED0A3209A4C90B36EE317683494@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

So that we could use the generic "pwm" for two or more pins, e.g

	pwm0_pmux: pwm0-pmux {
		groups =3D "PWM0", "PWM1";
		function =3D "pwm";
	};

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/pinctrl/berlin/pinctrl-as370.c | 58 +++++++++++++-------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/berlin/pinctrl-as370.c b/drivers/pinctrl/berli=
n/pinctrl-as370.c
index d2bb811fc5fa..44f8ccdbeeff 100644
--- a/drivers/pinctrl/berlin/pinctrl-as370.c
+++ b/drivers/pinctrl/berlin/pinctrl-as370.c
@@ -36,13 +36,13 @@ static const struct berlin_desc_group as370_soc_pinctrl=
_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("I2S1_DO2", 0x0, 0x3, 0x0c,
 			BERLIN_PINCTRL_FUNCTION(0x0, "por"), /* CORE RSTB */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s1"), /* DO2 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm4"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM4 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "gpio"), /* GPIO4 */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG4 */
 	BERLIN_PINCTRL_GROUP("I2S1_DO3", 0x0, 0x3, 0x0f,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO5 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s1"), /* DO3 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm5"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM5 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "spififib"), /* SPDIFIB */
 			BERLIN_PINCTRL_FUNCTION(0x4, "spdifo"), /* SPDIFO */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG5 */
@@ -61,24 +61,24 @@ static const struct berlin_desc_group as370_soc_pinctrl=
_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("I2S2_DI0", 0x0, 0x3, 0x1b,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO9 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s2"), /* DI0 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm2"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM2 */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG9 */
 	BERLIN_PINCTRL_GROUP("I2S2_DI1", 0x4, 0x3, 0x00,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO10 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s2"), /* DI1 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm3"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM3 */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG10 */
 	BERLIN_PINCTRL_GROUP("I2S2_DI2", 0x4, 0x3, 0x03,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO11 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s2"), /* DI2 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm6"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM6 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "spdific"), /* SPDIFIC */
 			BERLIN_PINCTRL_FUNCTION(0x4, "spdifo"), /* SPDIFO */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG11 */
 	BERLIN_PINCTRL_GROUP("I2S2_DI3", 0x4, 0x3, 0x06,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO12 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "i2s2"), /* DI3 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm7"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM7 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "spdifia"), /* SPDIFIA */
 			BERLIN_PINCTRL_FUNCTION(0x4, "spdifo"), /* SPDIFO */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG12 */
@@ -98,14 +98,14 @@ static const struct berlin_desc_group as370_soc_pinctrl=
_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("PDM_DI2", 0x4, 0x3, 0x12,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO16 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "pdm"), /* DI2 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm4"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM4 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "spdifid"), /* SPDIFID */
 			BERLIN_PINCTRL_FUNCTION(0x4, "spdifo"), /* SPDIFO */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG16 */
 	BERLIN_PINCTRL_GROUP("PDM_DI3", 0x4, 0x3, 0x15,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO17 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "pdm"), /* DI3 */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm5"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM5 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "spdifi"), /* SPDIFI */
 			BERLIN_PINCTRL_FUNCTION(0x4, "spdifo"), /* SPDIFO */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG17 */
@@ -139,11 +139,11 @@ static const struct berlin_desc_group as370_soc_pinct=
rl_groups[] =3D {
 			BERLIN_PINCTRL_FUNCTION(0x1, "emmc")), /* DATA7 */
 	BERLIN_PINCTRL_GROUP("NAND_ALE", 0x8, 0x3, 0x12,
 			BERLIN_PINCTRL_FUNCTION(0x0, "nand"), /* ALE */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm6"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM6 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "gpio")), /* GPIO18 */
 	BERLIN_PINCTRL_GROUP("NAND_CLE", 0x8, 0x3, 0x15,
 			BERLIN_PINCTRL_FUNCTION(0x0, "nand"), /* CLE */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm7"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM7 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "gpio")), /* GPIO19 */
 	BERLIN_PINCTRL_GROUP("NAND_WEn", 0x8, 0x3, 0x18,
 			BERLIN_PINCTRL_FUNCTION(0x0, "nand"), /* WEn */
@@ -169,12 +169,12 @@ static const struct berlin_desc_group as370_soc_pinct=
rl_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("SPI1_SS1n", 0xc, 0x3, 0x0c,
 			BERLIN_PINCTRL_FUNCTION(0x0, "spi1"), /* SS1n */
 			BERLIN_PINCTRL_FUNCTION(0x2, "gpio"), /* GPIO26 */
-			BERLIN_PINCTRL_FUNCTION(0x3, "pwm2")),
+			BERLIN_PINCTRL_FUNCTION(0x3, "pwm")), /* PWM2 */
 	BERLIN_PINCTRL_GROUP("SPI1_SS2n", 0xc, 0x3, 0x0f,
 			BERLIN_PINCTRL_FUNCTION(0x0, "uart0"), /* RXD */
 			BERLIN_PINCTRL_FUNCTION(0x1, "spi1"), /* SS2n */
 			BERLIN_PINCTRL_FUNCTION(0x2, "gpio"), /* GPIO27 */
-			BERLIN_PINCTRL_FUNCTION(0x3, "pwm3")),
+			BERLIN_PINCTRL_FUNCTION(0x3, "pwm")), /* PWM3 */
 	BERLIN_PINCTRL_GROUP("SPI1_SS3n", 0xc, 0x3, 0x12,
 			BERLIN_PINCTRL_FUNCTION(0x0, "uart0"), /* TXD */
 			BERLIN_PINCTRL_FUNCTION(0x1, "spi1"), /* SS3n */
@@ -182,11 +182,11 @@ static const struct berlin_desc_group as370_soc_pinct=
rl_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("SPI1_SCLK", 0xc, 0x3, 0x15,
 			BERLIN_PINCTRL_FUNCTION(0x0, "spi1"), /* SCLK */
 			BERLIN_PINCTRL_FUNCTION(0x1, "gpio"), /* GPIO29 */
-			BERLIN_PINCTRL_FUNCTION(0x3, "pwm4")),
+			BERLIN_PINCTRL_FUNCTION(0x3, "pwm")), /* PWM4 */
 	BERLIN_PINCTRL_GROUP("SPI1_SDO", 0xc, 0x3, 0x18,
 			BERLIN_PINCTRL_FUNCTION(0x0, "spi1"), /* SDO */
 			BERLIN_PINCTRL_FUNCTION(0x1, "gpio"), /* GPIO30 */
-			BERLIN_PINCTRL_FUNCTION(0x3, "pwm5")),
+			BERLIN_PINCTRL_FUNCTION(0x3, "pwm")), /* PWM5 */
 	BERLIN_PINCTRL_GROUP("SPI1_SDI", 0xc, 0x3, 0x1b,
 			BERLIN_PINCTRL_FUNCTION(0x0, "spi1"), /* SDI */
 			BERLIN_PINCTRL_FUNCTION(0x1, "gpio")), /* GPIO31 */
@@ -209,51 +209,51 @@ static const struct berlin_desc_group as370_soc_pinct=
rl_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("TMS", 0x10, 0x3, 0x0f,
 			BERLIN_PINCTRL_FUNCTION(0x0, "jtag"), /* TMS */
 			BERLIN_PINCTRL_FUNCTION(0x1, "gpio"), /* GPIO37 */
-			BERLIN_PINCTRL_FUNCTION(0x4, "pwm0")),
+			BERLIN_PINCTRL_FUNCTION(0x4, "pwm")), /* PWM0 */
 	BERLIN_PINCTRL_GROUP("TDI", 0x10, 0x3, 0x12,
 			BERLIN_PINCTRL_FUNCTION(0x0, "jtag"), /* TDI */
 			BERLIN_PINCTRL_FUNCTION(0x1, "gpio"), /* GPIO38 */
-			BERLIN_PINCTRL_FUNCTION(0x4, "pwm1")),
+			BERLIN_PINCTRL_FUNCTION(0x4, "pwm")), /* PWM1 */
 	BERLIN_PINCTRL_GROUP("TDO", 0x10, 0x3, 0x15,
 			BERLIN_PINCTRL_FUNCTION(0x0, "jtag"), /* TDO */
 			BERLIN_PINCTRL_FUNCTION(0x1, "gpio"), /* GPIO39 */
-			BERLIN_PINCTRL_FUNCTION(0x4, "pwm0")),
+			BERLIN_PINCTRL_FUNCTION(0x4, "pwm")), /* PWM0 */
 	BERLIN_PINCTRL_GROUP("PWM6", 0x10, 0x3, 0x18,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO40 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm6")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM6 */
 	BERLIN_PINCTRL_GROUP("PWM7", 0x10, 0x3, 0x1b,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO41 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm7")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM7 */
 	BERLIN_PINCTRL_GROUP("PWM0", 0x14, 0x3, 0x00,
 			BERLIN_PINCTRL_FUNCTION(0x0, "por"), /* VDDCPUSOC RSTB */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm0"),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm"), /* PWM0 */
 			BERLIN_PINCTRL_FUNCTION(0x2, "gpio")), /* GPIO42 */
 	BERLIN_PINCTRL_GROUP("PWM1", 0x14, 0x3, 0x03,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO43 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm1")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM1 */
 	BERLIN_PINCTRL_GROUP("PWM2", 0x14, 0x3, 0x06,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO44 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm2")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM2 */
 	BERLIN_PINCTRL_GROUP("PWM3", 0x14, 0x3, 0x09,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO45 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm3")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM3 */
 	BERLIN_PINCTRL_GROUP("PWM4", 0x14, 0x3, 0x0c,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO46 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm4")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM4 */
 	BERLIN_PINCTRL_GROUP("PWM5", 0x14, 0x3, 0x0f,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO47 */
-			BERLIN_PINCTRL_FUNCTION(0x1, "pwm5")),
+			BERLIN_PINCTRL_FUNCTION(0x1, "pwm")), /* PWM5 */
 	BERLIN_PINCTRL_GROUP("URT1_RTSn", 0x14, 0x3, 0x12,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO48 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "uart1"), /* RTSn */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm6"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM6 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "tw1a"), /* SCL */
 			BERLIN_PINCTRL_FUNCTION(0x4, "aio"), /* DBG0 */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG18 */
 	BERLIN_PINCTRL_GROUP("URT1_CTSn", 0x14, 0x3, 0x15,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO49 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "uart1"), /* CTSn */
-			BERLIN_PINCTRL_FUNCTION(0x2, "pwm7"),
+			BERLIN_PINCTRL_FUNCTION(0x2, "pwm"), /* PWM7 */
 			BERLIN_PINCTRL_FUNCTION(0x3, "tw1a"), /* SDA */
 			BERLIN_PINCTRL_FUNCTION(0x4, "aio"), /* DBG1 */
 			BERLIN_PINCTRL_FUNCTION(0x5, "phy")), /* DBG19 */
@@ -308,11 +308,11 @@ static const struct berlin_desc_group as370_soc_pinct=
rl_groups[] =3D {
 	BERLIN_PINCTRL_GROUP("SD0_CDn", 0x1c, 0x3, 0x00,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO62 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "sd0"), /* CDn */
-			BERLIN_PINCTRL_FUNCTION(0x3, "pwm2")),
+			BERLIN_PINCTRL_FUNCTION(0x3, "pwm")), /* PWM2 */
 	BERLIN_PINCTRL_GROUP("SD0_WP", 0x1c, 0x3, 0x03,
 			BERLIN_PINCTRL_FUNCTION(0x0, "gpio"), /* GPIO63 */
 			BERLIN_PINCTRL_FUNCTION(0x1, "sd0"), /* WP */
-			BERLIN_PINCTRL_FUNCTION(0x3, "pwm3")),
+			BERLIN_PINCTRL_FUNCTION(0x3, "pwm")), /* PWM3 */
 };
=20
 static const struct berlin_pinctrl_desc as370_soc_pinctrl_data =3D {
--=20
2.20.1
