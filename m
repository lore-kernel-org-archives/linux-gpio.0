From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] gpio: mxc: use devm_platform_ioremap_resource() to simplify
 code
Date: Mon, 1 Apr 2019 05:09:50 +0000
Message-ID: <1554095107-15003-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Use the new helper devm_platform_ioremap_resource() which wraps the
platform_get_resource() and devm_ioremap_resource() together, to
simplify the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e86e61d..b281358 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -411,7 +411,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np =3D pdev->dev.of_node;
 	struct mxc_gpio_port *port;
-	struct resource *iores;
 	int irq_base;
 	int err;
=20
@@ -423,8 +422,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
=20
 	port->dev =3D &pdev->dev;
=20
-	iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	port->base =3D devm_ioremap_resource(&pdev->dev, iores);
+	port->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
=20
--=20
2.7.4
