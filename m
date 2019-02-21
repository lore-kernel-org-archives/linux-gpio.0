From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] drivers: depend on HAS_IOMEM for devm_platform_ioremap_resource()
Date: Thu, 21 Feb 2019 17:26:27 +0100
Message-ID: <20190221162627.3476-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We only build devm_ioremap_resource() if HAS_IOMEM is selected, so this
dependency must cascade down to devm_platform_ioremap_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f82691e1c26c..5f837f2e4f41 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -87,6 +87,7 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource managemend
  * @index: resource index
  */
+#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 					     unsigned int index)
 {
@@ -96,6 +97,7 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, res);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
+#endif /* CONFIG_HAS_IOMEM */
 
 /**
  * platform_get_irq - get an IRQ for a device
-- 
2.20.1
