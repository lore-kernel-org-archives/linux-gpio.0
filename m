From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] gpio: mxc: add clock operation
Date: Mon, 21 May 2018 18:06:30 +0800
Message-ID: <1526897190-28714-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Linux-imx@nxp.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

i.MX6SLL has GPIO clock gates in CCM CCGR, need
to enable them before accessing registers, add
optional clock operation for GPIO driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 11ec722..8fc37c4 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -60,6 +60,7 @@ struct mxc_gpio_hwdata {
 struct mxc_gpio_port {
 	struct list_head node;
 	void __iomem *base;
+	struct clk *clk;
 	int irq;
 	int irq_high;
 	struct irq_domain *domain;
@@ -434,6 +435,17 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
+	/* the controller clock is optional */
+	port->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(port->clk))
+		port->clk = NULL;
+
+	err = clk_prepare_enable(port->clk);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return err;
+	}
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -502,6 +514,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
+	clk_disable_unprepare(port->clk);
 	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }
-- 
2.7.4
