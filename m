From: Jonathan Bell <jonathan-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH] pinctrl: bcm2835: Clear the event latch register when
 disabling interrupts
Date: Tue, 30 Jun 2015 12:35:39 +0100
Message-ID: <55927F0B.80602@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


It's possible to hit a race condition if interrupts are generated on a GPIO
pin when the IRQ line in question is being disabled.

If the interrupt is freed, bcm2835_gpio_irq_disable() is called which
disables the event generation sources (edge, level). If an event occurred
between the last disabling of hard IRQs and the write to the event
source registers, a bit would be set in the GPIO event detect register
(GPEDSn) which goes unacknowledged by bcm2835_gpio_irq_handler()
so Linux complains loudly.

There is no per-GPIO mask register, so when disabling GPIO interrupts
write 1 to the relevant bit in GPEDSn to clear out any stale events.

Signed-off-by: Jonathan Bell <jonathan-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>

---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index efcf2a2..547b925 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -473,6 +473,8 @@ static void bcm2835_gpio_irq_disable(struct irq_data *data)
 
     spin_lock_irqsave(&pc->irq_lock[bank], flags);
     bcm2835_gpio_irq_config(pc, gpio, false);
+    /* Clear events that were latched prior to clearing event sources */
+    bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
     clear_bit(offset, &pc->enabled_irq_map[bank]);
     spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
 }
-- 
1.8.1.2
