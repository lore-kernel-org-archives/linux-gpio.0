From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V5 1/1] gpio: vf610: add optional clock support
Date: Mon, 5 Nov 2018 14:08:29 +0000
Message-ID: <1541426614-17299-1-git-send-email-aisheng.dong@nxp.com>
References: <CACRpkdaO-cUd7wVksboUU0-qu20aBo370Rio=GkNH11U0CB4Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaO-cUd7wVksboUU0-qu20aBo370Rio=GkNH11U0CB4Jw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "dongas86@gmail.com" <dongas86@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Some SoCs need the gpio clock to be enabled before accessing
HW registers. This patch add the optional clock handling.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v4->v5:
 * refine gpio clk get
 * add remove
v3->v4: no changes
v2->v3:
 * error checking updated according to Russell's suggestion:
   ptr == ERR_PTR(-EPROBE_DEFER)
 * clock independently checking
v1->v2:
 * new patch
---
 drivers/gpio/gpio-vf610.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index d4ad6d0..23fdb77 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
 #include <linux/init.h>
@@ -41,6 +42,8 @@ struct vf610_gpio_port {
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
 	u8 irqc[VF610_GPIO_PER_PORT];
+	struct clk *clk_port;
+	struct clk *clk_gpio;
 	int irq;
 };
 
@@ -280,6 +283,33 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
+	port->clk_port = devm_clk_get(&pdev->dev, "port");
+	if (!IS_ERR(port->clk_port)) {
+		ret = clk_prepare_enable(port->clk_port);
+		if (ret)
+			return ret;
+	} else if (port->clk_port == ERR_PTR(-EPROBE_DEFER)) {
+		/*
+		 * Percolate deferrals, for anything else,
+		 * just live without the clocking.
+		 */
+		return PTR_ERR(port->clk_port);
+	}
+
+	port->clk_gpio = devm_clk_get(&pdev->dev, "gpio");
+	if (!IS_ERR(port->clk_gpio)) {
+		ret = clk_prepare_enable(port->clk_gpio);
+		if (ret) {
+			clk_disable_unprepare(port->clk_port);
+			return ret;
+		}
+	} else if (port->clk_gpio == ERR_PTR(-EPROBE_DEFER)) {
+		clk_disable_unprepare(port->clk_port);
+		return PTR_ERR(port->clk_gpio);
+	}
+
+	platform_set_drvdata(pdev, port);
+
 	gc = &port->gc;
 	gc->of_node = np;
 	gc->parent = dev;
@@ -314,12 +344,26 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int vf610_gpio_remove(struct platform_device *pdev)
+{
+	struct vf610_gpio_port *port = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&port->gc);
+	if (!IS_ERR(port->clk_port))
+		clk_disable_unprepare(port->clk_port);
+	if (!IS_ERR(port->clk_gpio))
+		clk_disable_unprepare(port->clk_gpio);
+
+	return 0;
+}
+
 static struct platform_driver vf610_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-vf610",
 		.of_match_table = vf610_gpio_dt_ids,
 	},
 	.probe		= vf610_gpio_probe,
+	.remove		= vf610_gpio_remove,
 };
 
 builtin_platform_driver(vf610_gpio_driver);
-- 
2.7.4
