From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] gpio: Use proper indentation
Date: Tue,  3 Sep 2013 12:39:28 +0200
Message-ID: <1378204768-18013-2-git-send-email-treding@nvidia.com>
References: <1378204768-18013-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378204768-18013-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Indentation should be done using tabs, not a combination of tabs and
spaces.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Linus,

Feel free to squash this into the commit that introduced these:

	fc9bbfb: gpio: improve error path in gpiolib

Thierry

 drivers/gpio/gpiolib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9f8a134..b762718 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1636,8 +1636,8 @@ static int gpiod_direction_input(struct gpio_desc *desc)
 
 	chip = desc->chip;
 	if (!chip->get || !chip->direction_input) {
-	  pr_warn("%s: missing get() or direction_input() operations\n",
-		  __func__);
+		pr_warn("%s: missing get() or direction_input() operations\n",
+			__func__);
 		return -EIO;
 	}
 
@@ -1709,8 +1709,8 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
 
 	chip = desc->chip;
 	if (!chip->set || !chip->direction_output) {
-	  pr_warn("%s: missing set() or direction_output() operations\n",
-		  __func__);
+		pr_warn("%s: missing set() or direction_output() operations\n",
+			__func__);
 		return -EIO;
 	}
 
@@ -1779,8 +1779,8 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 
 	chip = desc->chip;
 	if (!chip->set || !chip->set_debounce) {
-	  pr_warn("%s: missing set() or set_debounce() operations\n",
-		  __func__);
+		pr_warn("%s: missing set() or set_debounce() operations\n",
+			__func__);
 		return -EIO;
 	}
 
-- 
1.8.4
