From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] gpio: davinci: Handle return value of clk_prepare_enable
Date: Tue, 23 May 2017 14:48:57 +0530
Message-ID: <1fe4ff39a277a29c8a1c72cfd333f49419fb1a3b.1495530935.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

clk_prepare_enable() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpio/gpio-davinci.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index ac17357..65cb359 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -437,6 +437,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 {
 	unsigned	gpio, bank;
 	int		irq;
+	int		ret;
 	struct clk	*clk;
 	u32		binten = 0;
 	unsigned	ngpio, bank_irq;
@@ -480,12 +481,15 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		       PTR_ERR(clk));
 		return PTR_ERR(clk);
 	}
-	clk_prepare_enable(clk);
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
 
 	if (!pdata->gpio_unbanked) {
 		irq = devm_irq_alloc_descs(dev, -1, 0, ngpio, 0);
 		if (irq < 0) {
 			dev_err(dev, "Couldn't allocate IRQ numbers\n");
+			clk_disable_unprepare(clk);
 			return irq;
 		}
 
@@ -494,6 +498,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 							chips);
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
+			clk_disable_unprepare(clk);
 			return -ENODEV;
 		}
 	}
@@ -562,8 +567,10 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 				       sizeof(struct
 					      davinci_gpio_irq_data),
 					      GFP_KERNEL);
-		if (!irqdata)
+		if (!irqdata) {
+			clk_disable_unprepare(clk);
 			return -ENOMEM;
+		}
 
 		irqdata->regs = g;
 		irqdata->bank_num = bank;
-- 
1.9.1
