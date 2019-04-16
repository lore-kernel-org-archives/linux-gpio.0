From: Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpio: pxa: Make two symbols static
Date: Tue, 16 Apr 2019 22:56:12 +0800
Message-ID: <20190416145612.30364-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robert.jarzmik@free.fr, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-gpio@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

Fix sparse warnings:

drivers/gpio/gpio-pxa.c:580:29: warning:
 symbol 'pxa_irq_domain_ops' was not declared. Should it be static?
drivers/gpio/gpio-pxa.c:819:20: warning:
 symbol 'pxa_gpio_syscore_ops' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index dd47960..26f77fd 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -577,7 +577,7 @@ static int pxa_irq_domain_map(struct irq_domain *d, unsigned int irq,
 	return 0;
 }
 
-const struct irq_domain_ops pxa_irq_domain_ops = {
+static const struct irq_domain_ops pxa_irq_domain_ops = {
 	.map	= pxa_irq_domain_map,
 	.xlate	= irq_domain_xlate_twocell,
 };
@@ -812,7 +812,7 @@ static void pxa_gpio_resume(void)
 #define pxa_gpio_resume		NULL
 #endif
 
-struct syscore_ops pxa_gpio_syscore_ops = {
+static struct syscore_ops pxa_gpio_syscore_ops = {
 	.suspend	= pxa_gpio_suspend,
 	.resume		= pxa_gpio_resume,
 };
-- 
2.7.4
