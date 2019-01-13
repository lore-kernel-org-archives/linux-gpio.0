From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 1/2] pinctrl: sunxi: Fix and simplify pin bank regulator
 handling
Date: Sun, 13 Jan 2019 17:57:22 +0800
Message-ID: <20190113095723.25295-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The new per-pin-bank regulator handling code in the sunxi pinctrl driver
has mismatched conditions for enabling and disabling the regulator: it
is enabled each time a pin is requested, but only disabled when the
pin-bank's reference count reaches zero.

Since we are doing reference counting already, there's no need to enable
the regulator each time a pin is requested. Instead we can just do it
for the first requested pin of each pin-bank. Thus we can reverse the
test and bail out early if it's not the first occurrence.

Fixes: 9a2a566adb00 ("pinctrl: sunxi: Deal with per-bank regulators")
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:

  - Moved before the other fix. Both fixes are needed, but having this
    one first made reworking the other one easier.

---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 36 ++++++++++++---------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 5d9184d18c16..9ad6e9c2adab 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -699,25 +699,21 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned short bank = offset / PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank];
-	struct regulator *reg;
+	struct regulator *reg = s_reg->regulator;
+	char supply[16];
 	int ret;
 
-	reg = s_reg->regulator;
-	if (!reg) {
-		char supply[16];
-
-		snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-		reg = regulator_get(pctl->dev, supply);
-		if (IS_ERR(reg)) {
-			dev_err(pctl->dev, "Couldn't get bank P%c regulator\n",
-				'A' + bank);
-			return PTR_ERR(reg);
-		}
-
-		s_reg->regulator = reg;
-		refcount_set(&s_reg->refcount, 1);
-	} else {
+	if (reg) {
 		refcount_inc(&s_reg->refcount);
+		return 0;
+	}
+
+	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
+	reg = regulator_get(pctl->dev, supply);
+	if (IS_ERR(reg)) {
+		dev_err(pctl->dev, "Couldn't get bank P%c regulator\n",
+			'A' + bank);
+		return PTR_ERR(reg);
 	}
 
 	ret = regulator_enable(reg);
@@ -727,13 +723,13 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 		goto out;
 	}
 
+	s_reg->regulator = reg;
+	refcount_set(&s_reg->refcount, 1);
+
 	return 0;
 
 out:
-	if (refcount_dec_and_test(&s_reg->refcount)) {
-		regulator_put(s_reg->regulator);
-		s_reg->regulator = NULL;
-	}
+	regulator_put(s_reg->regulator);
 
 	return ret;
 }
-- 
2.20.1
