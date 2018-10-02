From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 2/3] pinctrl: msm: Use init_valid_mask exported function
Date: Tue,  2 Oct 2018 10:27:30 +0200
Message-ID: <20181002082731.20141-2-ricardo.ribalda@gmail.com>
References: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The current code produces XPU violation if get_direction is called just
after the initialization.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 79 ++++++++++++++----------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 5d72ffad32c2..ce1ade47ea37 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -566,6 +566,42 @@ static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define msm_gpio_dbg_show NULL
 #endif
 
+static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
+{
+	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
+	int ret;
+	unsigned int len, i;
+	unsigned int max_gpios = pctrl->soc->ngpios;
+	u16 *tmp;
+
+	/* The number of GPIOs in the ACPI tables */
+	len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
+						   0);
+	if (ret < 0)
+		return 0;
+
+	if (ret > max_gpios)
+		return -EINVAL;
+
+	tmp = kmalloc_array(len, sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	ret = device_property_read_u16_array(pctrl->dev, "gpios", tmp, len);
+	if (ret < 0) {
+		dev_err(pctrl->dev, "could not read list of GPIOs\n");
+		goto out;
+	}
+
+	bitmap_zero(chip->valid_mask, max_gpios);
+	for (i = 0; i < len; i++)
+		set_bit(tmp[i], chip->valid_mask);
+
+out:
+	kfree(tmp);
+	return ret;
+}
+
 static const struct gpio_chip msm_gpio_template = {
 	.direction_input  = msm_gpio_direction_input,
 	.direction_output = msm_gpio_direction_output,
@@ -575,6 +611,7 @@ static const struct gpio_chip msm_gpio_template = {
 	.request          = gpiochip_generic_request,
 	.free             = gpiochip_generic_free,
 	.dbg_show         = msm_gpio_dbg_show,
+	.init_valid_mask  = msm_gpio_init_valid_mask,
 };
 
 /* For dual-edge interrupts in software, since some hardware has no
@@ -855,41 +892,6 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int msm_gpio_init_valid_mask(struct gpio_chip *chip,
-				    struct msm_pinctrl *pctrl)
-{
-	int ret;
-	unsigned int len, i;
-	unsigned int max_gpios = pctrl->soc->ngpios;
-	u16 *tmp;
-
-	/* The number of GPIOs in the ACPI tables */
-	len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0);
-	if (ret < 0)
-		return 0;
-
-	if (ret > max_gpios)
-		return -EINVAL;
-
-	tmp = kmalloc_array(len, sizeof(*tmp), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	ret = device_property_read_u16_array(pctrl->dev, "gpios", tmp, len);
-	if (ret < 0) {
-		dev_err(pctrl->dev, "could not read list of GPIOs\n");
-		goto out;
-	}
-
-	bitmap_zero(chip->valid_mask, max_gpios);
-	for (i = 0; i < len; i++)
-		set_bit(tmp[i], chip->valid_mask);
-
-out:
-	kfree(tmp);
-	return ret;
-}
-
 static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 {
 	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
@@ -926,13 +928,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		return ret;
 	}
 
-	ret = msm_gpio_init_valid_mask(chip, pctrl);
-	if (ret) {
-		dev_err(pctrl->dev, "Failed to setup irq valid bits\n");
-		gpiochip_remove(&pctrl->chip);
-		return ret;
-	}
-
 	/*
 	 * For DeviceTree-supported systems, the gpio core checks the
 	 * pinctrl's device node for the "gpio-ranges" property.
-- 
2.19.0
