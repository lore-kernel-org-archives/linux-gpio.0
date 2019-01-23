From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH v3 1/2] gpio: altera-a10sr: Set proper output level for direction_output
Date: Wed, 23 Jan 2019 08:00:57 +0800
Message-ID: <20190123000058.28317-1-axel.lin@ingics.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thor Thayer <thor.thayer@linux.intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The altr_a10sr_gpio_direction_output should set proper output level
based on the value argument.

Fixes: 26a48c4cc2f1 ("gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.")
Cc: <stable@vger.kernel.org>
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Tested by: Thor Thayer <thor.thayer@linux.intel.com>
Reviewed by: Thor Thayer <thor.thayer@linux.intel.com>
---
v3: Add Fixes tag and cc stable
v2: Based on Bartosz's comment to split the patch.
    1/2 is bug fix
    2/2 is coding style fix and fix checkpatch warning
 drivers/gpio/gpio-altera-a10sr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index 6b11f1314248..7f9e0304b510 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -66,8 +66,10 @@ static int altr_a10sr_gpio_direction_input(struct gpio_chip *gc,
 static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
 					    unsigned int nr, int value)
 {
-	if (nr <= (ALTR_A10SR_OUT_VALID_RANGE_HI - ALTR_A10SR_LED_VALID_SHIFT))
+	if (nr <= (ALTR_A10SR_OUT_VALID_RANGE_HI - ALTR_A10SR_LED_VALID_SHIFT)) {
+		altr_a10sr_gpio_set(gc, nr, value);
 		return 0;
+	}
 	return -EINVAL;
 }
 
-- 
2.17.1
