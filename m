From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V3] gpio: mxc: add power management support
Date: Wed, 18 Jul 2018 09:25:32 +0800
Message-ID: <1531877132-14280-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Cc: Linux-imx@nxp.com, fabio.estevam@nxp.com
List-Id: linux-gpio@vger.kernel.org

GPIO registers could lose context on i.MX7D, when
enter LPSR mode, the whole SoC will be powered off
except LPSR domain, GPIO banks will lose context
in this case, need to restore the context after
resume from LPSR mode.

This patch adds new compatible string for i.MX7D
which supports GPIO power off feature in suspend,
and adds the GPIO save/restore operations in noirq
suspend/resume phase, since GPIO is fundamental
module which could be used by other peripherals'
resume phase.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V2:
	Add compatible string for i.MX7D GPIO using i.MX35 type GPIO data, but
supporting power off feature in suspend.
 drivers/gpio/gpio-mxc.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 2f28299..995cf0b 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -45,6 +45,15 @@ struct mxc_gpio_hwdata {
 	unsigned fall_edge;
 };
 
+struct mxc_gpio_reg_saved {
+	u32 icr1;
+	u32 icr2;
+	u32 imr;
+	u32 gdir;
+	u32 edge_sel;
+	u32 dr;
+};
+
 struct mxc_gpio_port {
 	struct list_head node;
 	void __iomem *base;
@@ -55,6 +64,8 @@ struct mxc_gpio_port {
 	struct gpio_chip gc;
 	struct device *dev;
 	u32 both_edges;
+	struct mxc_gpio_reg_saved gpio_saved_reg;
+	bool power_off;
 };
 
 static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
@@ -143,6 +154,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx21-gpio", .data = &mxc_gpio_devtype[IMX21_GPIO], },
 	{ .compatible = "fsl,imx31-gpio", .data = &mxc_gpio_devtype[IMX31_GPIO], },
 	{ .compatible = "fsl,imx35-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
+	{ .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
 	{ /* sentinel */ }
 };
 
@@ -434,6 +446,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
+		port->power_off = true;
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -497,6 +512,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
+	platform_set_drvdata(pdev, port);
+
 	return 0;
 
 out_irqdomain_remove:
@@ -507,11 +524,67 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	return err;
 }
 
+static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
+{
+	if (!port->power_off)
+		return;
+
+	port->gpio_saved_reg.icr1 = readl(port->base + GPIO_ICR1);
+	port->gpio_saved_reg.icr2 = readl(port->base + GPIO_ICR2);
+	port->gpio_saved_reg.imr = readl(port->base + GPIO_IMR);
+	port->gpio_saved_reg.gdir = readl(port->base + GPIO_GDIR);
+	port->gpio_saved_reg.edge_sel = readl(port->base + GPIO_EDGE_SEL);
+	port->gpio_saved_reg.dr = readl(port->base + GPIO_DR);
+}
+
+static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
+{
+	if (!port->power_off)
+		return;
+
+	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);
+	writel(port->gpio_saved_reg.icr2, port->base + GPIO_ICR2);
+	writel(port->gpio_saved_reg.imr, port->base + GPIO_IMR);
+	writel(port->gpio_saved_reg.gdir, port->base + GPIO_GDIR);
+	writel(port->gpio_saved_reg.edge_sel, port->base + GPIO_EDGE_SEL);
+	writel(port->gpio_saved_reg.dr, port->base + GPIO_DR);
+}
+
+static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+
+	mxc_gpio_save_regs(port);
+	clk_disable_unprepare(port->clk);
+
+	return 0;
+}
+
+static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(port->clk);
+	if (ret)
+		return ret;
+	mxc_gpio_restore_regs(port);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mxc_gpio_noirq_suspend, mxc_gpio_noirq_resume)
+};
+
 static struct platform_driver mxc_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-mxc",
 		.of_match_table = mxc_gpio_dt_ids,
 		.suppress_bind_attrs = true,
+		.pm = &mxc_gpio_dev_pm_ops,
 	},
 	.probe		= mxc_gpio_probe,
 	.id_table	= mxc_gpio_devtype,
-- 
2.7.4
