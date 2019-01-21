From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] gpio: sprd: Remove unused irq trigger setting
Date: Mon, 21 Jan 2019 13:05:39 +0800
Message-ID: <972fd6c1a222b35159671ca82fb63db1632c3ba3.1548046988.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, neo.hou@unisoc.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Spreadtrum PMIC interrupt controller has no registers to set irq
trigger type, since it is always high level trigger. That means the
PMIC EIC controller as a child device of PMIC INTC does not need to
set the trigger type, so remove it.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index 29e044f..ac573da 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -322,7 +322,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(&pdev->dev, pmic_eic->irq, NULL,
 					sprd_pmic_eic_irq_handler,
-					IRQF_TRIGGER_LOW |
 					IRQF_ONESHOT | IRQF_NO_SUSPEND,
 					dev_name(&pdev->dev), pmic_eic);
 	if (ret) {
-- 
1.7.9.5
