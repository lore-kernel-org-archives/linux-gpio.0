From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/2] gpio: davinci: use devm_platform_ioremap_resource()
Date: Wed, 20 Feb 2019 12:12:40 +0100
Message-ID: <20190220111240.10041-3-brgl@bgdev.pl>
References: <20190220111240.10041-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220111240.10041-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new helper that wraps the calls to platform_get_resource() and
devm_ioremap_resource() together.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index bdb29e51b417..188b8e5c8e67 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -198,7 +198,6 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	struct davinci_gpio_controller *chips;
 	struct davinci_gpio_platform_data *pdata;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 
 	pdata = davinci_gpio_get_pdata(pdev);
 	if (!pdata) {
@@ -236,8 +235,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	if (!chips)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gpio_base = devm_ioremap_resource(dev, res);
+	gpio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio_base))
 		return PTR_ERR(gpio_base);
 
-- 
2.20.1
