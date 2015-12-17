From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] gpio/sysfs: Add ID parameter for GPIO lines
Date: Thu, 17 Dec 2015 17:48:12 +0100
Message-ID: <1450370892-2517-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On named GPIOs there is currently no find out their numerical id.

Because of this, a GPIO pin named like:
/sys/class/gpio/PROG_B

cannot be unexported by an application different than the one that
exported it.

This patch adds a new parameter to the GPIO line called id, that
shows the numerical id of a given GPIO. E.g.:

$ cat /sys/class/gpio/PROG_B/id
496
$ echo 496 > unexport

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 Documentation/ABI/testing/sysfs-gpio |  1 +
 Documentation/gpio/sysfs.txt         |  3 +++
 drivers/gpio/gpiolib-sysfs.c         | 10 ++++++++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-gpio b/Documentation/ABI/testing/sysfs-gpio
index 55ffa2df1c10..53d78abef4f3 100644
--- a/Documentation/ABI/testing/sysfs-gpio
+++ b/Documentation/ABI/testing/sysfs-gpio
@@ -21,6 +21,7 @@ Description:
 	    /value ... always readable, writes fail for input GPIOs
 	    /direction ... r/w as: in, out (default low); write: high, low
 	    /edge ... r/w as: none, falling, rising, both
+	    /id ... r only, GPIO number
 	/gpiochipN ... for each gpiochip; #N is its first GPIO
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive, not necessarily unique
diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index aeab01aa4d00..68e1b16e747b 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -96,6 +96,9 @@ and have the following read/write attributes:
 		for "rising" and "falling" edges will follow this
 		setting.
 
+	"id" ... ID used for export/unxexport the GPIO. This value may
+		be used by named GPIOs, to find out their numerical id.
+
 GPIO controllers have paths like /sys/class/gpio/gpiochip42/ (for the
 controller implementing GPIOs starting at #42) and have the following
 read-only attributes:
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b57ed8e55ab5..3fc5c7231aae 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -350,6 +350,15 @@ static ssize_t active_low_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(active_low);
 
+static ssize_t id_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct gpiod_data *data = dev_get_drvdata(dev);
+
+	return  sprintf(buf, "%d\n", desc_to_gpio(data->desc));
+}
+static DEVICE_ATTR_RO(id);
+
 static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
 {
@@ -377,6 +386,7 @@ static struct attribute *gpio_attrs[] = {
 	&dev_attr_edge.attr,
 	&dev_attr_value.attr,
 	&dev_attr_active_low.attr,
+	&dev_attr_id.attr,
 	NULL,
 };
 
-- 
2.6.4
