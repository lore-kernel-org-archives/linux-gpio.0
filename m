From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH 5/7] gpio: brcmstb: enable masking of interrupts when changing type
Date: Fri, 29 Sep 2017 20:40:55 -0700
Message-ID: <20170930034057.15166-6-opendmb@gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170930034057.15166-1-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Mask the GPIO interrupt while its type is being changed, just in case
it can prevent a spurious interrupt.

Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 0418cb266586..e2fff559c1ca 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -363,7 +363,9 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	bank->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
 
 	/* Ensures that all non-wakeup IRQs are disabled at suspend */
-	bank->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND;
+	/* and that interrupts are masked when changing their type  */
+	bank->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND |
+			       IRQCHIP_SET_TYPE_MASKED;
 
 	if (IS_ENABLED(CONFIG_PM_SLEEP) && !priv->parent_wake_irq &&
 			of_property_read_bool(np, "wakeup-source")) {
-- 
2.14.1
