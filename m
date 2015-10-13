From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] pinctrl: intel: Fix compilation warning when !CONFIG_PM_SLEEP
Date: Tue, 13 Oct 2015 17:51:25 +0300
Message-ID: <1444747886-70568-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:23983 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932140AbbJMOv3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 13 Oct 2015 10:51:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

We get following warning when CONFIG_PM_SLEEP is not set

  warning: =E2=80=98intel_gpio_irq_init=E2=80=99 defined but not used [=
-Wunused-function]

Since the function is only called from intel_pinctrl_resume() move it
inside CONFIG_PM_SLEEP guard as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 40 +++++++++++++++++----------=
--------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/in=
tel/pinctrl-intel.c
index 54848b8decef..613ba1b1e0b7 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -861,26 +861,6 @@ static struct irq_chip intel_gpio_irqchip =3D {
 	.irq_set_wake =3D intel_gpio_irq_wake,
 };
=20
-static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
-{
-	size_t i;
-
-	for (i =3D 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *community;
-		void __iomem *base;
-		unsigned gpp;
-
-		community =3D &pctrl->communities[i];
-		base =3D community->regs;
-
-		for (gpp =3D 0; gpp < community->ngpps; gpp++) {
-			/* Mask and clear all interrupts */
-			writel(0, base + community->ie_offset + gpp * 4);
-			writel(0xffff, base + GPI_IS + gpp * 4);
-		}
-	}
-}
-
 static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
 	int ret;
@@ -1087,6 +1067,26 @@ int intel_pinctrl_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(intel_pinctrl_suspend);
=20
+static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
+{
+	size_t i;
+
+	for (i =3D 0; i < pctrl->ncommunities; i++) {
+		const struct intel_community *community;
+		void __iomem *base;
+		unsigned gpp;
+
+		community =3D &pctrl->communities[i];
+		base =3D community->regs;
+
+		for (gpp =3D 0; gpp < community->ngpps; gpp++) {
+			/* Mask and clear all interrupts */
+			writel(0, base + community->ie_offset + gpp * 4);
+			writel(0xffff, base + GPI_IS + gpp * 4);
+		}
+	}
+}
+
 int intel_pinctrl_resume(struct device *dev)
 {
 	struct platform_device *pdev =3D to_platform_device(dev);
--=20
2.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
