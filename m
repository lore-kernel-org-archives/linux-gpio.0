From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] gpio: reduce descriptor validation code size
Date: Thu, 21 Dec 2017 01:27:04 +0100
Message-ID: <20171221002704.20824-1-linux@rasmusvillemoes.dk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35580 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932178AbdLUA1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 19:27:10 -0500
Received: by mail-wr0-f196.google.com with SMTP id l19so11416232wrc.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 16:27:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

While we do need macros to be able to return from the "calling"
function, we can still factor the checks done by the VALIDATE_DESC*
macros into a real helper function. This reduces the backslashtitis,
avoids duplicating the logic in the two macros and saves about 1K of
generated code:

$ scripts/bloat-o-meter drivers/gpio/gpiolib.o.{0,1}
add/remove: 1/0 grow/shrink: 0/15 up/down: 104/-1281 (-1177)
Function                                     old     new   delta
validate_desc                                  -     104    +104
gpiod_set_value                              192     135     -57
gpiod_set_raw_value                          125      67     -58
gpiod_direction_output                       412     351     -61
gpiod_set_value_cansleep                     150      70     -80
gpiod_set_raw_value_cansleep                 132      52     -80
gpiod_get_raw_value                          139      54     -85
gpiod_set_debounce                           226     140     -86
gpiod_direction_output_raw                   124      38     -86
gpiod_get_value                              161      74     -87
gpiod_cansleep                               126      39     -87
gpiod_get_raw_value_cansleep                 130      39     -91
gpiod_get_value_cansleep                     152      59     -93
gpiod_is_active_low                          128      33     -95
gpiod_request                                299     184    -115
gpiod_direction_input                        386     266    -120
Total: Before=25460, After=24283, chg -4.62%

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/gpio/gpiolib.c | 57 ++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aad84a6306c4..adbaa19bffe4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2165,40 +2165,37 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
  * macro to avoid endless duplication. If the desc is NULL it is an
  * optional GPIO and calls should just bail out.
  */
+static int validate_desc(const struct gpio_desc *desc, const char *func)
+{
+	if (!desc)
+		return 0;
+	if (IS_ERR(desc)) {
+		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
+		return PTR_ERR(desc);
+	}
+	if (!desc->gdev) {
+		pr_warn("%s: invalid GPIO (no device)\n", func);
+		return -EINVAL;
+	}
+	if (!desc->gdev->chip) {
+		dev_warn(&desc->gdev->dev,
+			 "%s: backing chip is gone\n", func);
+		return 0;
+	}
+	return 1;
+}
+
 #define VALIDATE_DESC(desc) do { \
-	if (!desc) \
-		return 0; \
-	if (IS_ERR(desc)) {						\
-		pr_warn("%s: invalid GPIO (errorpointer)\n", __func__); \
-		return PTR_ERR(desc); \
-	} \
-	if (!desc->gdev) { \
-		pr_warn("%s: invalid GPIO (no device)\n", __func__); \
-		return -EINVAL; \
-	} \
-	if ( !desc->gdev->chip ) { \
-		dev_warn(&desc->gdev->dev, \
-			 "%s: backing chip is gone\n", __func__); \
-		return 0; \
-	} } while (0)
+	int __valid = validate_desc(desc, __func__); \
+	if (__valid <= 0) \
+		return __valid; \
+	} while (0)
 
 #define VALIDATE_DESC_VOID(desc) do { \
-	if (!desc) \
-		return; \
-	if (IS_ERR(desc)) {						\
-		pr_warn("%s: invalid GPIO (errorpointer)\n", __func__); \
+	int __valid = validate_desc(desc, __func__); \
+	if (__valid <= 0) \
 		return; \
-	} \
-	if (!desc->gdev) { \
-		pr_warn("%s: invalid GPIO (no device)\n", __func__); \
-		return; \
-	} \
-	if (!desc->gdev->chip) { \
-		dev_warn(&desc->gdev->dev, \
-			 "%s: backing chip is gone\n", __func__); \
-		return; \
-	} } while (0)
-
+	} while (0)
 
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
-- 
2.11.0

