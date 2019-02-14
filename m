From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 7/7] gpio: mockup: rework debugfs interface
Date: Thu, 14 Feb 2019 14:42:32 +0100
Message-ID: <20190214134232.3821-8-brgl@bgdev.pl>
References: <20190214134232.3821-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214134232.3821-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Modify the way the debugfs interface works in gpio-mockup. Introduce
the concept of dummy pull config which will keep the mockup lines in
known state. The pull values can be modified by writing to the debugfs
files corresponding to lines. Lines in input mode always report the
current pull value, lines in output mode change the line value but
it will revert back to the one specified by current pull when released.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 143 +++++++++++++++++++++++++++++++++----
 1 file changed, 129 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index f1807afd44ba..f710df8ca737 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -47,6 +47,8 @@ enum {
 struct gpio_mockup_line_status {
 	int dir;
 	int value;
+	int pull;
+	int irq_type;
 };
 
 struct gpio_mockup_chip {
@@ -55,6 +57,7 @@ struct gpio_mockup_chip {
 	struct irq_sim irqsim;
 	struct dentry *dbg_dir;
 	spinlock_t lock;
+	struct notifier_block nb;
 };
 
 struct gpio_mockup_dbgfs_private {
@@ -73,6 +76,11 @@ module_param_named(gpio_mockup_named_lines,
 
 static struct dentry *gpio_mockup_dbg_dir;
 
+static struct gpio_mockup_chip *to_gpio_mockup_chip(struct notifier_block *nb)
+{
+	return container_of(nb, struct gpio_mockup_chip, nb);
+}
+
 static int gpio_mockup_range_base(unsigned int index)
 {
 	return gpio_mockup_ranges[index * 2];
@@ -188,15 +196,72 @@ static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
 	return irq_sim_irqnum(&chip->irqsim, offset);
 }
 
-static ssize_t gpio_mockup_event_write(struct file *file,
-				       const char __user *usr_buf,
-				       size_t size, loff_t *ppos)
+static void gpio_mockup_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	__gpio_mockup_set(chip, offset, chip->lines[offset].pull);
+}
+
+static int gpio_mockup_irq_type_changed(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	struct gpio_mockup_chip *chip = to_gpio_mockup_chip(nb);
+	struct irq_sim_irq_type *irq_type = data;
+
+	if (event != IRQ_SIM_TYPE_CHANGED)
+		return NOTIFY_DONE;
+
+	/* FIXME: add locking once we switch to spinlocks */
+	chip->lines[irq_type->offset].irq_type = irq_type->type;
+
+	return NOTIFY_OK;
+}
+
+static ssize_t gpio_mockup_debugfs_read(struct file *file,
+					char __user *usr_buf,
+					size_t size, loff_t *ppos)
+{
+	struct gpio_mockup_dbgfs_private *priv;
+	struct gpio_mockup_chip *chip;
+	struct seq_file *sfile;
+	struct gpio_chip *gc;
+	char buf[3];
+	int val, rv;
+
+	if (*ppos != 0)
+		return 0;
+
+	sfile = file->private_data;
+	priv = sfile->private;
+	chip = priv->chip;
+	gc = &chip->gc;
+
+	val = gpio_mockup_get(gc, priv->offset);
+	snprintf(buf, sizeof(buf), "%d\n", val);
+
+	rv = copy_to_user(usr_buf, buf, sizeof(buf));
+	if (rv)
+		return rv;
+
+	return sizeof(buf) - 1;
+}
+
+static ssize_t gpio_mockup_debugfs_write(struct file *file,
+					 const char __user *usr_buf,
+					 size_t size, loff_t *ppos)
 {
 	struct gpio_mockup_dbgfs_private *priv;
 	struct gpio_mockup_chip *chip;
 	struct seq_file *sfile;
 	struct gpio_desc *desc;
-	int rv, val;
+	unsigned int irq_type;
+	struct gpio_chip *gc;
+	struct irq_sim *sim;
+	int rv, val, curr;
+
+	if (*ppos != 0)
+		return -EINVAL;
 
 	rv = kstrtoint_from_user(usr_buf, size, 0, &val);
 	if (rv)
@@ -206,24 +271,68 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 
 	sfile = file->private_data;
 	priv = sfile->private;
-	desc = priv->desc;
 	chip = priv->chip;
+	gc = &chip->gc;
+	desc = &gc->gpiodev->descs[priv->offset];
+	sim = &chip->irqsim;
+
+	spin_lock(&chip->lock);
 
-	gpiod_set_value_cansleep(desc, val);
-	irq_sim_fire(&chip->irqsim, priv->offset);
+	if (test_bit(FLAG_REQUESTED, &desc->flags) &&
+	    !test_bit(FLAG_IS_OUT, &desc->flags)) {
+		curr = __gpio_mockup_get(chip, priv->offset);
+		if (curr == val)
+			goto out;
+
+		irq_type = chip->lines[priv->offset].irq_type;
+		if ((val == 1 && (irq_type & IRQ_TYPE_EDGE_RISING)) ||
+		    (val == 0 && (irq_type & IRQ_TYPE_EDGE_FALLING)))
+			irq_sim_fire(&chip->irqsim, priv->offset);
+	}
+
+	/* Change the value unless we're actively driving the line. */
+	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
+	    !test_bit(FLAG_IS_OUT, &desc->flags))
+		__gpio_mockup_set(chip, priv->offset, val);
+
+out:
+	chip->lines[priv->offset].pull = val;
+	spin_unlock(&chip->lock);
 
 	return size;
 }
 
-static int gpio_mockup_event_open(struct inode *inode, struct file *file)
+static int gpio_mockup_debugfs_open(struct inode *inode, struct file *file)
 {
 	return single_open(file, NULL, inode->i_private);
 }
 
-static const struct file_operations gpio_mockup_event_ops = {
+/*
+ * Each mockup chip is represented by a directory named after the chip's device
+ * name under /sys/kernel/debug/gpio-mockup/. Each line is represented by
+ * a file using the line's offset as the name under the chip's directory.
+ *
+ * Reading from the line's file yields the current *value*, writing to the
+ * line's file changes the current *pull*. Default pull for mockup lines is
+ * down.
+ *
+ * Examples:
+ * - when a line pulled down is requested in output mode and driven high, its
+ *   value will return to 0 once it's released
+ * - when the line is requested in output mode and driven high, writing 0 to
+ *   the corresponding debugfs file will change the pull to down but the
+ *   reported value will still be 1 until the line is released
+ * - line requested in input mode always reports the same value as its pull
+ *   configuration
+ * - when the line is requested in input mode and monitored for events, writing
+ *   the same value to the debugfs file will be a noop, while writing the
+ *   opposite value will generate a dummy interrupt with an appropriate edge
+ */
+static const struct file_operations gpio_mockup_debugfs_ops = {
 	.owner = THIS_MODULE,
-	.open = gpio_mockup_event_open,
-	.write = gpio_mockup_event_write,
+	.open = gpio_mockup_debugfs_open,
+	.read = gpio_mockup_debugfs_read,
+	.write = gpio_mockup_debugfs_write,
 	.llseek = no_llseek,
 };
 
@@ -258,7 +367,7 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 		priv->desc = &gc->gpiodev->descs[i];
 
 		evfile = debugfs_create_file(name, 0200, chip->dbg_dir, priv,
-					     &gpio_mockup_event_ops);
+					     &gpio_mockup_debugfs_ops);
 		if (IS_ERR_OR_NULL(evfile))
 			goto err;
 	}
@@ -266,7 +375,7 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	return;
 
 err:
-	dev_err(dev, "error creating debugfs event files\n");
+	dev_err(dev, "error creating debugfs files\n");
 }
 
 static int gpio_mockup_name_lines(struct device *dev,
@@ -342,6 +451,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;
 	gc->to_irq = gpio_mockup_to_irq;
+	gc->free = gpio_mockup_free;
 
 	chip->lines = devm_kcalloc(dev, gc->ngpio,
 				   sizeof(*chip->lines), GFP_KERNEL);
@@ -358,6 +468,11 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (rv < 0)
 		return rv;
 
+	chip->nb.notifier_call = gpio_mockup_irq_type_changed;
+	rv = irq_sim_notifier_register(&chip->irqsim, &chip->nb);
+	if (rv)
+		return rv;
+
 	rv = devm_gpiochip_add_data(dev, &chip->gc, chip);
 	if (rv)
 		return rv;
@@ -415,7 +530,7 @@ static int __init gpio_mockup_init(void)
 			return -EINVAL;
 	}
 
-	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
+	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup", NULL);
 	if (IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
 		gpio_mockup_err("error creating debugfs directory\n");
 
-- 
2.20.1
