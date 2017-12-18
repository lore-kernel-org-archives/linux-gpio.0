From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/4] gpio: sysfs: avoid using kstrtol() in 'value' attribute
 write
Date: Mon, 18 Dec 2017 11:08:35 +0100 (CET)
Message-ID: <d674a102bb9afb07298070f1efd730a94e0fa3bc.1513591276.git.christophe.leroy@c-s.fr>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

A 'perf record' on an app continuously writing in the 'value'
attribute show that most of the time is spent in kstrtol()

--17.99%--value_store
          |
          |--10.17%--kstrtoint
          |          |
          |          |--8.82%--kstrtoll
          |
          |--2.50%--gpiod_set_value_cansleep
          |
          |--1.82%--u16_gpio_set
          |
          |--1.46%--value_store

The normal case is to write 0 or 1 in the attribute, therefore
this patch avoids the call to kstrtol() in the most common cases

Then 'perf record' shows

--7.21%--value_store
          |
          |--2.69%--u16_gpio_set
          |
          |--1.47%--value_store
          |
          |--1.08%--gpiod_set_value_cansleep
          |
          |--0.60%--mutex_lock
          |
           --0.58%--mutex_unlock

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpio/gpiolib-sysfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index bb10e8ed456e..31e2352632a2 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
 #include <linux/slab.h>
+#include <linux/ctype.h>
 
 #include "gpiolib.h"
 
@@ -124,7 +125,7 @@ static ssize_t value_store(struct device *dev,
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
-	ssize_t			status;
+	ssize_t status = 0;
 
 	mutex_lock(&data->mutex);
 
@@ -133,7 +134,11 @@ static ssize_t value_store(struct device *dev,
 	} else {
 		long		value;
 
-		status = kstrtol(buf, 0, &value);
+		if (size <= 2 && isdigit(buf[0]) &&
+		    (size == 1 || buf[1] == '\n'))
+			value = buf[0] - '0';
+		else
+			status = kstrtol(buf, 0, &value);
 		if (status == 0) {
 			gpiod_set_value_cansleep(desc, value);
 			status = size;
-- 
2.13.3
