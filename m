From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] gpio-adnp: Use common error handling code in
 adnp_gpio_dbg_show()
Date: Sun, 22 Oct 2017 20:27:00 +0200
Message-ID: <1e2fb84c-9a5b-dc56-c93b-7eef03fc9b7a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 20:21:55 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-adnp.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 89863ea25de1..7f475eef3faa 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -192,28 +192,20 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		mutex_lock(&adnp->i2c_lock);
 
 		err = adnp_read(adnp, GPIO_DDR(adnp) + i, &ddr);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			return;
-		}
+		if (err < 0)
+			goto unlock;
 
 		err = adnp_read(adnp, GPIO_PLR(adnp) + i, &plr);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			return;
-		}
+		if (err < 0)
+			goto unlock;
 
 		err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			return;
-		}
+		if (err < 0)
+			goto unlock;
 
 		err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
-		if (err < 0) {
-			mutex_unlock(&adnp->i2c_lock);
-			return;
-		}
+		if (err < 0)
+			goto unlock;
 
 		mutex_unlock(&adnp->i2c_lock);
 
@@ -240,6 +232,11 @@ static void adnp_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 				   direction, level, interrupt, pending);
 		}
 	}
+
+	return;
+
+unlock:
+	mutex_unlock(&adnp->i2c_lock);
 }
 
 static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
-- 
2.14.2
