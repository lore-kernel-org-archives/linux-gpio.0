From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: intel: set default handler to be handle_bad_irq()
Date: Fri, 25 Nov 2016 13:31:16 +0200
Message-ID: <20161125113116.28193-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:20533 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753347AbcKYLe3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Nov 2016 06:34:29 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

We switch the default handler to be handle_bad_irq() instead of
handle_simple_irq() (which was not correct anyway).

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 +-
 drivers/pinctrl/intel/pinctrl-intel.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 71bbeb93..3730063 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1703,7 +1703,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	if (irq_rc && irq_rc->start) {
 		byt_gpio_irq_init_hw(vg);
 		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
-					   handle_simple_irq, IRQ_TYPE_NONE);
+					   handle_bad_irq, IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
 			goto fail;
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 0144376..1e13967 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -911,7 +911,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	}
 
 	ret = gpiochip_irqchip_add(&pctrl->chip, &intel_gpio_irqchip, 0,
-				   handle_simple_irq, IRQ_TYPE_NONE);
+				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add irqchip\n");
 		goto fail;
-- 
2.10.2

