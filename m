From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: make library immune to error pointers
Date: Thu, 16 Jun 2016 13:22:37 +0200
Message-ID: <1466076157-9805-1-git-send-email-linus.walleij@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Most functions that take a GPIO descriptor in need to check the
descriptor for IS_ERR(). We do this mostly in the VALIDATE_DESC()
macro except for the gpiod_to_irq() function which needs special
handling.

Cc: stable@vger.kernel.org
Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Complain when descriptors contain error values so the offending
  code can be fixed.
---
 drivers/gpio/gpiolib.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f39bf05993e7..570771ed19e6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1373,8 +1373,12 @@ done:
 #define VALIDATE_DESC(desc) do { \
 	if (!desc) \
 		return 0; \
+	if (IS_ERR(desc)) {						\
+		pr_warn("%s: invalid GPIO (errorpointer)\n", __func__); \
+		return PTR_ERR(desc); \
+	} \
 	if (!desc->gdev) { \
-		pr_warn("%s: invalid GPIO\n", __func__); \
+		pr_warn("%s: invalid GPIO (no device)\n", __func__); \
 		return -EINVAL; \
 	} \
 	if ( !desc->gdev->chip ) { \
@@ -1386,8 +1390,12 @@ done:
 #define VALIDATE_DESC_VOID(desc) do { \
 	if (!desc) \
 		return; \
+	if (IS_ERR(desc)) {						\
+		pr_warn("%s: invalid GPIO (errorpointer)\n", __func__); \
+		return; \
+	} \
 	if (!desc->gdev) { \
-		pr_warn("%s: invalid GPIO\n", __func__); \
+		pr_warn("%s: invalid GPIO (no device)\n", __func__); \
 		return; \
 	} \
 	if (!desc->gdev->chip) { \
@@ -2061,7 +2069,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	 * requires this function to not return zero on an invalid descriptor
 	 * but rather a negative error number.
 	 */
-	if (!desc || !desc->gdev || !desc->gdev->chip)
+	if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
 		return -EINVAL;
 
 	chip = desc->gdev->chip;
-- 
2.4.11
