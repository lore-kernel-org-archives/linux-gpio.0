From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpio: davinci: drop pointless static qualifier
Date: Wed, 23 Jan 2019 16:49:12 +0800
Message-ID: <20190123084912.13376-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: j-keerthy@ti.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-gpio@vger.kernel.org

There is no need to have the 'gpio_unbanked' variable static since
new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-davinci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index bdb29e5..f250454 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -465,7 +465,7 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
 
 static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
 {
-	static struct irq_chip_type gpio_unbanked;
+	struct irq_chip_type gpio_unbanked;
 
 	gpio_unbanked = *irq_data_get_chip_type(irq_get_irq_data(irq));
 
@@ -474,7 +474,7 @@ static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
 
 static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
 {
-	static struct irq_chip gpio_unbanked;
+	struct irq_chip gpio_unbanked;
 
 	gpio_unbanked = *irq_get_chip(irq);
 	return &gpio_unbanked;
-- 
2.7.0
