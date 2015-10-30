From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 3/3] gpio: ath79: Make the driver removable
Date: Fri, 30 Oct 2015 11:36:31 +0100
Message-ID: <1446201391-22553-3-git-send-email-albeu@free.fr>
References: <1446201391-22553-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446201391-22553-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alban Bedel <albeu@free.fr>
List-Id: linux-gpio@vger.kernel.org

As we now allow the driver to be built as a module it should be
removable.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/gpio/gpio-ath79.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 3e71ced..6108dff 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -43,6 +43,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
 		return -ENOMEM;
+	platform_set_drvdata(pdev, ctrl);
 
 	if (np) {
 		err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
@@ -97,12 +98,20 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int ath79_gpio_remove(struct platform_device *pdev)
+{
+	struct ath79_gpio *ctrl = platform_get_drvdata(pdev);
+
+	return bgpio_remove(&ctrl->bgc);
+}
+
 static struct platform_driver ath79_gpio_driver = {
 	.driver = {
 		.name = "ath79-gpio",
 		.of_match_table	= ath79_gpio_of_match,
 	},
 	.probe = ath79_gpio_probe,
+	.remove = ath79_gpio_remove,
 };
 
 module_platform_driver(ath79_gpio_driver);
-- 
2.0.0
