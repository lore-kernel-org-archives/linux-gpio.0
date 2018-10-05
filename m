From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 1/3] gpiolib: Add init_valid_mask exported function
Date: Fri,  5 Oct 2018 08:52:58 +0200
Message-ID: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Add a function that allows initializing the valid_mask from
gpiochip_add_data.

This prevents race conditions during gpiochip initialization.

If the function is not exported, then the old behaviour is respected,
this is, set all gpios as valid.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpiolib.c      | 16 ++++++++++++++--
 include/linux/gpio/driver.h |  7 ++++++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8f8a1999393..907019b67a58 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -359,7 +359,7 @@ static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
 	return p;
 }
 
-static int gpiochip_init_valid_mask(struct gpio_chip *gpiochip)
+static int gpiochip_alloc_valid_mask(struct gpio_chip *gpiochip)
 {
 #ifdef CONFIG_OF_GPIO
 	int size;
@@ -380,6 +380,14 @@ static int gpiochip_init_valid_mask(struct gpio_chip *gpiochip)
 	return 0;
 }
 
+static int gpiochip_init_valid_mask(struct gpio_chip *gpiochip)
+{
+	if (gpiochip->init_valid_mask)
+		return gpiochip->init_valid_mask(gpiochip);
+
+	return 0;
+}
+
 static void gpiochip_free_valid_mask(struct gpio_chip *gpiochip)
 {
 	kfree(gpiochip->valid_mask);
@@ -1367,7 +1375,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (status)
 		goto err_remove_from_list;
 
-	status = gpiochip_init_valid_mask(chip);
+	status = gpiochip_alloc_valid_mask(chip);
 	if (status)
 		goto err_remove_irqchip_mask;
 
@@ -1379,6 +1387,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	if (status)
 		goto err_remove_chip;
 
+	status = gpiochip_init_valid_mask(chip);
+	if (status)
+		goto err_remove_chip;
+
 	acpi_gpiochip_add(chip);
 
 	machine_gpiochip_add(chip);
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
