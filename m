From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] pinctrl: rockchip: Add set_config callback support for gpiolib
Date: Thu,  3 May 2018 16:04:42 +0800
Message-ID: <1525334682-222918-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Could only support PIN_CONFIG_INPUT_DEBOUNCE now as the HW block
is too simple to support others. But even wrt. debounce capability,
it now could only support very limited period of time to satisfy the
real usecase. But still be useful to enable the crippled HW debounce
to prevent any spurious glitches from waking up the system if the
gpio is conguired as wakeup interrupt source.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Hi Linus,

This patch comes from our early discussion of debounce of cd-gpios for sd card
that I pointed out that rockchip's platform lacks HW debounce support, but I
think it's overkilled. It does have HW debounce but not really useful as the
debounce period is toooo short and almost fixed. But something is better than
nothing, so I'd like to enable it for filtering glitches, since cd-gpios for
sd card is allow to configured as wakeup source. ;)

 drivers/pinctrl/pinctrl-rockchip.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 3924779..14e80de 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2555,6 +2555,57 @@ static int rockchip_gpio_direction_output(struct gpio_chip *gc,
 	return pinctrl_gpio_direction_output(gc->base + offset);
 }
 
+static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
+				       unsigned int offset, bool enable)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg = bank->reg_base + GPIO_DEBOUNCE;
+	unsigned long flags;
+	u32 data;
+
+	clk_enable(bank->clk);
+	raw_spin_lock_irqsave(&bank->slock, flags);
+
+	data = readl(reg);
+	if (enable)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	writel(data, reg);
+
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+	clk_disable(bank->clk);
+}
+
+/*
+ * gpiolib set_config callback function. The setting of the pin
+ * mux function as 'gpio output' will be handled by the pinctrl subsystem
+ * interface.
+ */
+static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				  unsigned long config)
+{
+	enum pin_config_param param = pinconf_to_config_param(config);
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		rockchip_gpio_set_debounce(gc, offset, true);
+		/*
+		 * Rockchip's gpio could only support up to one period
+		 * of the debounce clock(pclk), which is far away from
+		 * satisftying the requirement, as pclk is usually near
+		 * 100MHz shared by all peripherals. So the fact is it
+		 * has crippled debounce capability could only be useful
+		 * to prevent any spurious glitches from waking up the system
+		 * if the gpio is conguired as wakeup interrupt source. Let's
+		 * still return -ENOTSUPP as before, to make sure the caller
+		 * of gpiod_set_debounce won't change its behaviour.
+		 */
+	default:
+		return -ENOTSUPP;
+	}
+}
+
 /*
  * gpiolib gpio_to_irq callback function. Creates a mapping between a GPIO pin
  * and a virtual IRQ, if not already present.
@@ -2580,6 +2631,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	.get_direction	= rockchip_gpio_get_direction,
 	.direction_input = rockchip_gpio_direction_input,
 	.direction_output = rockchip_gpio_direction_output,
+	.set_config = rockchip_gpio_set_config,
 	.to_irq = rockchip_gpio_to_irq,
 	.owner = THIS_MODULE,
 };
-- 
1.9.1
