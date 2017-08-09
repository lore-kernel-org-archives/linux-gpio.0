From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: brcmstb: check return value of gpiochip_irqchip_add()
Date: Thu, 10 Aug 2017 07:51:27 +0900
Message-ID: <1502319087-23396-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Because gpiochip_irqchip_add() may fail, its return value should
be checked.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-brcmstb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e6489143721a..51485997f680 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -339,6 +339,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	int err;
 
 	bank->irq_chip.name = dev_name(dev);
 	bank->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
@@ -355,8 +356,6 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 			dev_warn(dev,
 				"Couldn't get wake IRQ - GPIOs will not be able to wake from sleep");
 		} else {
-			int err;
-
 			/*
 			 * Set wakeup capability before requesting wakeup
 			 * interrupt, so we can process boot-time "wakeups"
@@ -383,8 +382,10 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	if (priv->can_wake)
 		bank->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
 
-	gpiochip_irqchip_add(&bank->gc, &bank->irq_chip, 0,
-			handle_simple_irq, IRQ_TYPE_NONE);
+	err = gpiochip_irqchip_add(&bank->gc, &bank->irq_chip, 0,
+				   handle_simple_irq, IRQ_TYPE_NONE);
+	if (err)
+		return err;
 	gpiochip_set_chained_irqchip(&bank->gc, &bank->irq_chip,
 			priv->parent_irq, brcmstb_gpio_irq_handler);
 
-- 
2.7.4
