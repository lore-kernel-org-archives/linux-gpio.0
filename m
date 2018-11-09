From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] gpio: mxc: move gpio noirq suspend/resume to syscore phase
Date: Fri, 9 Nov 2018 04:56:56 +0000
Message-ID: <1541739112-383-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

During noirq suspend/resume phase, GPIO irq could arrive
and its registers like IMR will be changed by irq handle
process, to make the GPIO registers exactly when it is
powered ON after resume, move the GPIO noirq suspend/resume
callback to syscore suspend/resume phase, local irq is
disabled at this phase so GPIO registers are atomic.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 5c69516..2d1dfa1 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -17,6 +17,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/syscore_ops.h>
 #include <linux/gpio/driver.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -550,31 +551,38 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_por=
t *port)
 	writel(port->gpio_saved_reg.dr, port->base + GPIO_DR);
 }
=20
-static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
+static int mxc_gpio_syscore_suspend(void)
 {
-	struct mxc_gpio_port *port =3D dev_get_drvdata(dev);
+	struct mxc_gpio_port *port;
=20
-	mxc_gpio_save_regs(port);
-	clk_disable_unprepare(port->clk);
+	/* walk through all ports */
+	list_for_each_entry(port, &mxc_gpio_ports, node) {
+		mxc_gpio_save_regs(port);
+		clk_disable_unprepare(port->clk);
+	}
=20
 	return 0;
 }
=20
-static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)
+static void mxc_gpio_syscore_resume(void)
 {
-	struct mxc_gpio_port *port =3D dev_get_drvdata(dev);
+	struct mxc_gpio_port *port;
 	int ret;
=20
-	ret =3D clk_prepare_enable(port->clk);
-	if (ret)
-		return ret;
-	mxc_gpio_restore_regs(port);
-
-	return 0;
+	/* walk through all ports */
+	list_for_each_entry(port, &mxc_gpio_ports, node) {
+		ret =3D clk_prepare_enable(port->clk);
+		if (ret) {
+			pr_err("mxc: failed to enable gpio clock %d\n", ret);
+			return;
+		}
+		mxc_gpio_restore_regs(port);
+	}
 }
=20
-static const struct dev_pm_ops mxc_gpio_dev_pm_ops =3D {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mxc_gpio_noirq_suspend, mxc_gpio_noirq_resu=
me)
+static struct syscore_ops mxc_gpio_syscore_ops =3D {
+	.suspend =3D mxc_gpio_syscore_suspend,
+	.resume =3D mxc_gpio_syscore_resume,
 };
=20
 static struct platform_driver mxc_gpio_driver =3D {
@@ -582,7 +590,6 @@ static struct platform_driver mxc_gpio_driver =3D {
 		.name	=3D "gpio-mxc",
 		.of_match_table =3D mxc_gpio_dt_ids,
 		.suppress_bind_attrs =3D true,
-		.pm =3D &mxc_gpio_dev_pm_ops,
 	},
 	.probe		=3D mxc_gpio_probe,
 	.id_table	=3D mxc_gpio_devtype,
@@ -590,6 +597,8 @@ static struct platform_driver mxc_gpio_driver =3D {
=20
 static int __init gpio_mxc_init(void)
 {
+	register_syscore_ops(&mxc_gpio_syscore_ops);
+
 	return platform_driver_register(&mxc_gpio_driver);
 }
 subsys_initcall(gpio_mxc_init);
--=20
2.7.4
