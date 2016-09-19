From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: don't default-flag IRQs as falling
Date: Mon, 19 Sep 2016 10:22:10 +0200
Message-ID: <1474273330-15789-1-git-send-email-linus.walleij@linaro.org>
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
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

There is no point in adding any default trigger for these
GPIO interrupts: the device tree should contain all trigger
information and the platforms using the driver boots
exclusively from device tree.

Also the boot log is nagging me to fix this:

[    0.771057] ------------[ cut here ]------------
[    0.775695] WARNING: CPU: 0 PID: 1 at
   ../drivers/gpio/gpiolib.c:1622 _gpiochip_irqchip_add+0x138/0x160
[    0.785034] /soc/gpio@8012e000: Ignoring 2 default trigger
(...)
[    0.942962] gpio 8012e000.gpio: at address e08f8000
(etc ad nauseam)

Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 205fb399268a..d318ca055489 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1177,7 +1177,7 @@ static int nmk_gpio_probe(struct platform_device *dev)
 				   irqchip,
 				   0,
 				   handle_edge_irq,
-				   IRQ_TYPE_EDGE_FALLING);
+				   IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(&dev->dev, "could not add irqchip\n");
 		gpiochip_remove(&nmk_chip->chip);
-- 
2.7.4
