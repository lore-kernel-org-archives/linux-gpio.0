From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] gpio: arizona: Correct check whether the pin is an input
Date: Wed, 19 Apr 2017 10:30:44 +0100
Message-ID: <1492594244-27361-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:47107 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1761481AbdDSJ3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Apr 2017 05:29:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com

The logic to check if the pin is an input or output whilst testing if we
need to read the register value from the hardware or not is currently
inverted. Remove the erroneous not from the if statement.

Fixes: 11598d174050 ("gpio: arizona: Correct handling for reading input GPIOs")
Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpio/gpio-arizona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 60b3102..cd23fd7 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -51,7 +51,7 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return ret;
 
 	/* Resume to read actual registers for input pins */
-	if (!(val & ARIZONA_GPN_DIR)) {
+	if (val & ARIZONA_GPN_DIR) {
 		ret = pm_runtime_get_sync(chip->parent);
 		if (ret < 0) {
 			dev_err(chip->parent, "Failed to resume: %d\n", ret);
-- 
2.1.4

