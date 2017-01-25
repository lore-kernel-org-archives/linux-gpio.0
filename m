From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/7] gpiolib: allow injecting line events
Date: Wed, 25 Jan 2017 16:34:18 +0100
Message-ID: <1485358461-24070-5-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Implement a routine visible inside the drivers/gpio directory, that
allows to inject line events for testing/debugging purposes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 16 ++++++++++++++++
 drivers/gpio/gpiolib.h |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 19b4b8b..8dde5f1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -643,6 +643,7 @@ static int lineevent_release(struct inode *inode, struct file *filep)
 	struct gpio_device *gdev = le->gdev;
 
 	free_irq(le->irq, le);
+	le->desc->le = NULL;
 	gpiod_free(le->desc);
 	kfree(le->label);
 	kfree(le);
@@ -733,6 +734,20 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+void gpiod_inject_event(struct gpio_desc *desc)
+{
+	struct lineevent_state *le = desc->le;
+	unsigned long flags;
+
+	if (le) {
+		/* Act as if we were in interrupt context. */
+		local_irq_save(flags);
+		lineevent_irq_thread(-1 /* unused */, le);
+		local_irq_restore(flags);
+	}
+}
+EXPORT_SYMBOL(gpiod_inject_event);
+
 static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpio_chip *chip = gdev->chip;
@@ -794,6 +809,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_desc;
 	le->desc = desc;
+	desc->le = le;
 	le->eflags = eflags;
 
 	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 067e5e5..3c87222 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -23,6 +23,7 @@ enum of_gpio_flags;
 enum gpiod_flags;
 enum gpio_lookup_flags;
 struct acpi_device;
+struct lineevent_state;
 
 /**
  * struct gpio_device - internal state container for GPIO devices
@@ -196,12 +197,15 @@ struct gpio_desc {
 	const char		*label;
 	/* Name of the GPIO */
 	const char		*name;
+	/* Private: line event context for the GPIO */
+	struct lineevent_state  *le;
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
+void gpiod_inject_event(struct gpio_desc *desc);
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
-- 
2.9.3
