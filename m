From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/6] pinctrl: uniphier: fix pin_config_get() for input-enable
Date: Mon, 31 Jul 2017 15:21:07 +0900
Message-ID: <1501482071-9819-3-git-send-email-yamada.masahiro@socionext.com>
References: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

For LD11/LD20 SoCs (capable of per-pin input enable), iectrl bits are
located across multiple registers.  So, the register offset must be
taken into account.  Otherwise, wrong input-enable status is displayed.

While we here, rename the macro because it is a base address.

Fixes: aa543888ca8c ("pinctrl: uniphier: support per-pin input enable for new SoCs")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
index c649e835bd54..f2f0f9dcfec3 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
@@ -32,7 +32,7 @@
 #define UNIPHIER_PINCTRL_DRV2CTRL_BASE	0x1900
 #define UNIPHIER_PINCTRL_DRV3CTRL_BASE	0x1980
 #define UNIPHIER_PINCTRL_PUPDCTRL_BASE	0x1a00
-#define UNIPHIER_PINCTRL_IECTRL		0x1d00
+#define UNIPHIER_PINCTRL_IECTRL_BASE	0x1d00
 
 struct uniphier_pinctrl_priv {
 	struct pinctrl_desc pctldesc;
@@ -252,18 +252,21 @@ static int uniphier_conf_pin_input_enable_get(struct pinctrl_dev *pctldev,
 {
 	struct uniphier_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int iectrl = uniphier_pin_get_iectrl(desc->drv_data);
-	unsigned int val;
+	unsigned int reg, mask, val;
 	int ret;
 
 	if (iectrl == UNIPHIER_PIN_IECTRL_NONE)
 		/* This pin is always input-enabled. */
 		return 0;
 
-	ret = regmap_read(priv->regmap, UNIPHIER_PINCTRL_IECTRL, &val);
+	reg = UNIPHIER_PINCTRL_IECTRL_BASE + iectrl / 32 * 4;
+	mask = BIT(iectrl % 32);
+
+	ret = regmap_read(priv->regmap, reg, &val);
 	if (ret)
 		return ret;
 
-	return val & BIT(iectrl) ? 0 : -EINVAL;
+	return val & mask ? 0 : -EINVAL;
 }
 
 static int uniphier_conf_pin_config_get(struct pinctrl_dev *pctldev,
@@ -456,7 +459,7 @@ static int uniphier_conf_pin_input_enable(struct pinctrl_dev *pctldev,
 	if (iectrl == UNIPHIER_PIN_IECTRL_NONE)
 		return enable ? 0 : -EINVAL;
 
-	reg = UNIPHIER_PINCTRL_IECTRL + iectrl / 32 * 4;
+	reg = UNIPHIER_PINCTRL_IECTRL_BASE + iectrl / 32 * 4;
 	mask = BIT(iectrl % 32);
 
 	return regmap_update_bits(priv->regmap, reg, mask, enable ? mask : 0);
-- 
2.7.4
