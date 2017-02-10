From: Timur Tabi <timur@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: add get_direction function
Date: Fri, 10 Feb 2017 17:21:00 -0600
Message-ID: <1486768860-18237-1-git-send-email-timur@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59726 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751418AbdBJXVH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2017 18:21:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The get_direction callback function allows gpiolib to know the current
direction (input vs output) for a given GPIO.

This is particularly useful on ACPI systems, where the GPIOs are
configured only by firmware (typically UEFI), so the only way to
know the initial values to query the hardware directly.  Without
this function, gpiolib thinks that all GPIOs are configured for
input.

Signed-off-by: Timur Tabi <timur@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f8e9e1c..c978be5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -422,6 +422,20 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
 	return 0;
 }
 
+static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
+	const struct msm_pingroup *g;
+	u32 val;
+
+	g = &pctrl->soc->groups[offset];
+
+	val = readl(pctrl->regs + g->ctl_reg);
+
+	/* 0 = output, 1 = input */
+	return val & BIT(g->oe_bit) ? 0 : 1;
+}
+
 static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	const struct msm_pingroup *g;
@@ -510,6 +524,7 @@ static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 static struct gpio_chip msm_gpio_template = {
 	.direction_input  = msm_gpio_direction_input,
 	.direction_output = msm_gpio_direction_output,
+	.get_direction    = msm_gpio_get_direction,
 	.get              = msm_gpio_get,
 	.set              = msm_gpio_set,
 	.request          = gpiochip_generic_request,
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

