From: zhuchangchun <zhuchangchun@cvte.com>
Subject: [PATCH] pinctrl: intel: Implements gpio free function
Date: Thu, 21 Mar 2019 10:35:24 +0800
Message-ID: <1553135724-38331-1-git-send-email-zhuchangchun@cvte.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, hendychu@aliyun.com, zhuchangchun <zhuchangchun@cvte.com>
List-Id: linux-gpio@vger.kernel.org

When we use the gpio to control some peripheral devices,and try to
export the gpio first,then unexport the gpio, we test the signal with
oscilloscope,and find the signal can't meet the requirements,because
after we unexported the gpio,the gpio's register(tx and rx)value can't
be recovered,and this will infruence the device work flow.

We check the gpio's unexport code work flow, then find the gpio's free
hook function has not been implemented, After we add pinmux_ops' free
function to set exported gpio to recover its original value,the problem
is fixed.

Signed-off-by: zhuchangchun <zhuchangchun@cvte.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3b18181..002b9d3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -480,6 +480,33 @@ static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int intel_gpio_free(struct pinctrl_dev *pctldev, unsigned int pin)
+{
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *padcfg0;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+
+	if (!intel_pad_usable(pctrl, pin)) {
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+		return -EBUSY;
+	}
+	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+
+	/* Put the pad into GPIO mode */
+	value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
+	/* enable TX buffer and disable RX (this will be input) */
+	value |= PADCFG0_GPIORXDIS;
+	value &= ~PADCFG0_GPIOTXDIS;
+	writel(value, padcfg0);
+
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
 static const struct pinmux_ops intel_pinmux_ops = {
 	.get_functions_count = intel_get_functions_count,
 	.get_function_name = intel_get_function_name,
@@ -487,6 +514,7 @@ static const struct pinmux_ops intel_pinmux_ops = {
 	.set_mux = intel_pinmux_set_mux,
 	.gpio_request_enable = intel_gpio_request_enable,
 	.gpio_set_direction = intel_gpio_set_direction,
+	.free = intel_gpio_free,
 };
 
 static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
-- 
2.7.4
