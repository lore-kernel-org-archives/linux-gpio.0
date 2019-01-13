From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 2/2] pinctrl: sunxi: Consider pin_base when calculating regulator array index
Date: Sun, 13 Jan 2019 17:57:23 +0800
Message-ID: <20190113095723.25295-2-wens@csie.org>
References: <20190113095723.25295-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113095723.25295-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On most newer Allwinner SoCs, there are two pinctrl devices, the PIO and
R_PIO. PIO covers pin-banks PA to PI (PJ and PK have not been seen),
while R_PIO covers PL to PN. The regulator array only has space for 12
entries, which was designed to cover PA to PL. On the A80, the pin banks
go up to PN, which would be the 14th entry in the regulator array.
However since the driver only needs to track regulators for its own pin
banks, the array only needs to have 9 entries, and also take in to
account the value of pin_base, such that the regulator for the first
pin-bank of the pinctrl device, be it "PA" or "PL" uses the first entry
of the array.

Base the regulator array index on pin_base, such that "PA" for PIO and
"PL" for R_PIO both take the first element within their respective
device's regulator array.

Also decrease the size of the regulator array to 9, just enough to cover
"PA" to "PI".

Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:

  - Take in to account pin_base when handling regulator array index
    instead of enlarging the array to encompass PA - PN.
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 ++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 9ad6e9c2adab..0e7fa69e93df 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -698,7 +698,9 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned short bank = offset / PINS_PER_BANK;
-	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank];
+	unsigned short bank_offset = bank - pctl->desc->pin_base /
+					    PINS_PER_BANK;
+	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 	struct regulator *reg = s_reg->regulator;
 	char supply[16];
 	int ret;
@@ -738,7 +740,9 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 {
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned short bank = offset / PINS_PER_BANK;
-	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank];
+	unsigned short bank_offset = bank - pctl->desc->pin_base /
+					    PINS_PER_BANK;
+	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index e340d2a24b44..034c0317c8d6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -136,7 +136,7 @@ struct sunxi_pinctrl {
 	struct gpio_chip		*chip;
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
-	struct sunxi_pinctrl_regulator	regulators[12];
+	struct sunxi_pinctrl_regulator	regulators[9];
 	struct irq_domain		*domain;
 	struct sunxi_pinctrl_function	*functions;
 	unsigned			nfunctions;
-- 
2.20.1
