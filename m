From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 3/3] pinctrl: msm: Configure interrupts as input and gpio mode
Date: Thu, 16 Aug 2018 13:06:48 -0700
Message-ID: <20180816200648.90458-4-swboyd@chromium.org>
References: <20180816200648.90458-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816200648.90458-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

When requesting a gpio as an interrupt, we should make sure to mux the
pin as the GPIO function and configure it to be an input so that various
functions or output signals don't affect the interrupt state of the pin.
So far, we've relied on pinmux configurations in DT to handle this, but
let's explicitly configure this in the code so that DT implementers
don't have to get this part right.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 793504057ad0..defed34d32b0 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -837,6 +837,41 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
+static int msm_gpio_irq_reqres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	int ret;
+
+	if (!try_module_get(gc->owner))
+		return -ENODEV;
+
+	ret = msm_pinmux_request_gpio(pctrl->pctrl, NULL, d->hwirq);
+	if (ret)
+		goto out;
+	msm_gpio_direction_input(gc, d->hwirq);
+
+	if (gpiochip_lock_as_irq(gc, d->hwirq)) {
+		dev_err(gc->parent,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			d->hwirq);
+		ret = -EINVAL;
+		goto out;
+	}
+	return 0;
+out:
+	module_put(gc->owner);
+	return ret;
+}
+
+static void msm_gpio_irq_relres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_unlock_as_irq(gc, d->hwirq);
+	module_put(gc->owner);
+}
+
 static void msm_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
@@ -935,6 +970,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
 	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
+	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
+	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
-- 
Sent by a computer through tubes
