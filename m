From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH] pinctrl: stm32: check irq controller availability at probe
Date: Wed, 24 Apr 2019 10:08:44 +0200
Message-ID: <1556093324-1008-1-git-send-email-fabien.dessenne@st.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>
List-Id: linux-gpio@vger.kernel.org

It is not guaranteed that the IRQ controller driver is probed before
the pin controller driver gets probed.
Considering this, check for the irq domain availability during probe
and return EPROBE_DEFER if needed.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 37 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 0aebc31..2317ccf 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1122,23 +1122,35 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	return 0;
 }
 
+static struct irq_domain *stm32_pctrl_get_irq_domain(struct device_node *np)
+{
+	struct device_node *parent;
+	struct irq_domain *domain;
+
+	if (!of_find_property(np, "interrupt-parent", NULL))
+		return NULL;
+
+	parent = of_irq_find_parent(np);
+	if (!parent)
+		return ERR_PTR(-ENXIO);
+
+	domain = irq_find_host(parent);
+	if (!domain)
+		/* domain not registered yet */
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return domain;
+}
+
 static int stm32_pctrl_dt_setup_irq(struct platform_device *pdev,
 			   struct stm32_pinctrl *pctl)
 {
-	struct device_node *np = pdev->dev.of_node, *parent;
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct regmap *rm;
 	int offset, ret, i;
 	int mask, mask_width;
 
-	parent = of_irq_find_parent(np);
-	if (!parent)
-		return -ENXIO;
-
-	pctl->domain = irq_find_host(parent);
-	if (!pctl->domain)
-		return -ENXIO;
-
 	pctl->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
 	if (IS_ERR(pctl->regmap))
 		return PTR_ERR(pctl->regmap);
@@ -1264,6 +1276,11 @@ int stm32_pctl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pctl);
 
+	/* check for IRQ controller (may require deferred probe) */
+	pctl->domain = stm32_pctrl_get_irq_domain(np);
+	if (IS_ERR(pctl->domain))
+		return PTR_ERR(pctl->domain);
+
 	/* hwspinlock is optional */
 	hwlock_id = of_hwspin_lock_get_id(pdev->dev.of_node, 0);
 	if (hwlock_id < 0) {
@@ -1294,7 +1311,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (of_find_property(np, "interrupt-parent", NULL)) {
+	if (pctl->domain) {
 		ret = stm32_pctrl_dt_setup_irq(pdev, pctl);
 		if (ret)
 			return ret;
-- 
2.7.4
