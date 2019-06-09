From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: remove unused pin_is_valid()
Date: Mon, 10 Jun 2019 00:09:53 +0900
Message-ID: <20190609150953.6432-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This function was used by pin_request() to pointlessly double-check
the pin validity, and it was the only user ever.

Since commit d2f6a1c6fb0e ("pinctrl: remove double pin validity
check."), no one has ever used it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c          | 23 -----------------------
 include/linux/pinctrl/pinctrl.h | 10 ----------
 2 files changed, 33 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a64849a9d1b0..aeba6366fb13 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -177,29 +177,6 @@ const char *pin_get_name(struct pinctrl_dev *pctldev, const unsigned pin)
 	return desc->name;
 }
 
-/**
- * pin_is_valid() - check if pin exists on controller
- * @pctldev: the pin control device to check the pin on
- * @pin: pin to check, use the local pin controller index number
- *
- * This tells us whether a certain pin exist on a certain pin controller or
- * not. Pin lists may be sparse, so some pins may not exist.
- */
-bool pin_is_valid(struct pinctrl_dev *pctldev, int pin)
-{
-	struct pin_desc *pindesc;
-
-	if (pin < 0)
-		return false;
-
-	mutex_lock(&pctldev->mutex);
-	pindesc = pin_desc_get(pctldev, pin);
-	mutex_unlock(&pctldev->mutex);
-
-	return pindesc != NULL;
-}
-EXPORT_SYMBOL_GPL(pin_is_valid);
-
 /* Deletes a range of pin descriptors */
 static void pinctrl_free_pindescs(struct pinctrl_dev *pctldev,
 				  const struct pinctrl_pin_desc *pins,
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index e429e5d92dd6..34b10d112be6 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -166,7 +166,6 @@ extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 extern void devm_pinctrl_unregister(struct device *dev,
 				struct pinctrl_dev *pctldev);
 
-extern bool pin_is_valid(struct pinctrl_dev *pctldev, int pin);
 extern void pinctrl_add_gpio_range(struct pinctrl_dev *pctldev,
 				struct pinctrl_gpio_range *range);
 extern void pinctrl_add_gpio_ranges(struct pinctrl_dev *pctldev,
@@ -197,15 +196,6 @@ struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
 extern const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev);
 extern const char *pinctrl_dev_get_devname(struct pinctrl_dev *pctldev);
 extern void *pinctrl_dev_get_drvdata(struct pinctrl_dev *pctldev);
-#else
-
-struct pinctrl_dev;
-
-/* Sufficiently stupid default functions when pinctrl is not in use */
-static inline bool pin_is_valid(struct pinctrl_dev *pctldev, int pin)
-{
-	return pin >= 0;
-}
 
 #endif /* !CONFIG_PINCTRL */
 
-- 
2.17.1
