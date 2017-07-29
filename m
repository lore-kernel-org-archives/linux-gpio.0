From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH] [BUGFIX] gpio: reject invalid gpio before getting gpio_desc
Date: Sat, 29 Jul 2017 17:00:44 +0900
Message-ID: <150131523385.6834.16274817727659878191.stgit@devbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Check user-given gpio number and reject it before
calling gpio_to_desc() because gpio_to_desc() is
for kernel driver and it expects given gpio number
is valid (means 0 to 511).
If given number is invalid, gpio_to_desc() calls
WARN() and dump registers and stack for debug.
This means user can easily kick WARN() just by
writing invalid gpio number (e.g. 512) to
/sys/class/gpio/export.
This bug has been introduced by commit 0e9a5edf5d01
("gpio: fix deferred probe detection for legacy API")

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Fixes: commit 0e9a5edf5d01 ("gpio: fix deferred probe detection for legacy API")
---
 drivers/gpio/gpiolib-sysfs.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4b44dd97c07f..4efb11fd1c22 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -2,6 +2,7 @@
 #include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/sysfs.h>
+#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -443,14 +444,16 @@ static ssize_t export_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_desc	*desc = NULL;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	if (gpio_is_valid(gpio))
+		desc = gpio_to_desc(gpio);
+
 	/* reject invalid GPIOs */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
@@ -485,14 +488,16 @@ static ssize_t unexport_store(struct class *class,
 				const char *buf, size_t len)
 {
 	long			gpio;
-	struct gpio_desc	*desc;
+	struct gpio_desc	*desc = NULL;
 	int			status;
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
 		goto done;
 
-	desc = gpio_to_desc(gpio);
+	if (gpio_is_valid(gpio))
+		desc = gpio_to_desc(gpio);
+
 	/* reject bogus commands (gpio_unexport ignores them) */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
