From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/4] gpio: sysfs: change 'value' attribute to prealloc
Date: Mon, 18 Dec 2017 11:08:29 +0100 (CET)
Message-ID: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:60974 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757648AbdLRKIb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Dec 2017 05:08:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

The GPIO 'value' attribute is time critical. A small bench with
'perf record' on the app below shows that 80% of the time spent in
sysfs_kf_seq_show() is spent in memset() for zeroising the buffer.

|--67.48%--sysfs_kf_seq_show
|          |
|          |--54.40%--memset
|          |
|          |--11.49%--dev_attr_show
|          |          |
|          |          |--10.06%--value_show
|          |          |          |
|          |          |          |--4.75%--sprintf
|          |          |          |          |

This patch changes the attribute type to prealloc, eliminating the
need to zeroise the buffer at each read. 'perf record' gives the
following result.

|--42.41%--sysfs_kf_read
|          |
|          |--39.73%--dev_attr_show
|          |          |
|          |          |--38.23%--value_show
|          |          |          |
|          |          |          |--29.22%--sprintf
|          |          |          |          |

Test done with the following small app:

int main(int argc, char **argv)
{
	int fd = open(argv[1], O_RDONLY);

	for (;;) {
		int buf[512];

		read(fd, buf, 512);
		lseek(fd, 0, SEEK_SET);
	}
	exit(0);
}

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 include/linux/device.h       | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3f454eaf2101..7a3f4271393b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -138,7 +138,7 @@ static ssize_t value_store(struct device *dev,
 
 	return status;
 }
-static DEVICE_ATTR_RW(value);
+static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show, value_store);
 
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
diff --git a/include/linux/device.h b/include/linux/device.h
index 9d32000725da..46ac622e5c6f 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -575,6 +575,9 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 
 #define DEVICE_ATTR(_name, _mode, _show, _store) \
 	struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
+#define DEVICE_ATTR_PREALLOC(_name, _mode, _show, _store) \
+	struct device_attribute dev_attr_##_name = \
+		__ATTR_PREALLOC(_name, _mode, _show, _store)
 #define DEVICE_ATTR_RW(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
 #define DEVICE_ATTR_RO(_name) \
-- 
2.13.3

