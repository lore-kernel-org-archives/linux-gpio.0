From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 1/3] gpiolib: Add init_valid_mask exported function
Date: Tue,  2 Oct 2018 10:27:29 +0200
Message-ID: <20181002082731.20141-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Add a function that allows initializing the valid_mask from
gpiochip_add_data.

This prevents race conditions during gpiochip initialization.

If the function is not exported, then the old behaviour is respected,
this is, set all gpios as valid.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpiolib.c      | 3 +++
 include/linux/gpio/driver.h | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8f8a1999393..6925196136ce 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -377,6 +377,9 @@ static int gpiochip_init_valid_mask(struct gpio_chip *gpiochip)
 	if (!gpiochip->valid_mask)
 		return -ENOMEM;
 
+	if (gpiochip->init_valid_mask)
+		return gpiochip->init_valid_mask(gpiochip);
+
 	return 0;
 }
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0ea328e71ec9..df09749269ff 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -256,6 +256,9 @@ struct gpio_chip {
 
 	void			(*dbg_show)(struct seq_file *s,
 						struct gpio_chip *chip);
+
+	int			(*init_valid_mask)(struct gpio_chip *chip);
+
 	int			base;
 	u16			ngpio;
 	const char		*const *names;
@@ -294,7 +297,9 @@ struct gpio_chip {
 	/**
 	 * @need_valid_mask:
 	 *
-	 * If set core allocates @valid_mask with all bits set to one.
+	 * If set core allocates @valid_mask with all its values initialized
+	 * with init_valid_mask() or set to one if init_valid_mask() is not
+	 * defined
 	 */
 	bool need_valid_mask;
 
-- 
2.19.0
