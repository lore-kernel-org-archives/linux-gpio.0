From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Fri, 15 Feb 2019 16:25:06 +0100
Message-ID: <20190215152507.31066-2-brgl@bgdev.pl>
References: <20190215152507.31066-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215152507.31066-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are currently 1200+ instances of using platform_get_resource()
and devm_ioremap_resource() together in the kernel tree.

This patch wraps these two calls in a single helper. Thanks to that
we don't have to declare a local variable for struct resource * and can
omit the redundant argument for resource type. We also have one
function call less.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/platform.c         | 18 ++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 1c958eb33ef4..14400a63cc81 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -79,6 +79,24 @@ struct resource *platform_get_resource(struct platform_device *dev,
 }
 EXPORT_SYMBOL_GPL(platform_get_resource);
 
+/**
+ * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
+ *				    device
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource managemend
+ * @index: resource index
+ */
+void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
+					     unsigned int index)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+EXPORT_SYMBOL(devm_platform_ioremap_resource);
+
 /**
  * platform_get_irq - get an IRQ for a device
  * @dev: platform device
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index c7c081dc6034..b126b73ed8ef 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -52,6 +52,9 @@ extern struct device platform_bus;
 extern void arch_setup_pdev_archdata(struct platform_device *);
 extern struct resource *platform_get_resource(struct platform_device *,
 					      unsigned int, unsigned int);
+extern void __iomem *
+devm_platform_ioremap_resource(struct platform_device *pdev,
+			       unsigned int index);
 extern int platform_get_irq(struct platform_device *, unsigned int);
 extern int platform_irq_count(struct platform_device *);
 extern struct resource *platform_get_resource_byname(struct platform_device *,
-- 
2.20.1
