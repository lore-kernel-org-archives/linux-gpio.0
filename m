From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: mockup: fix debugfs read
Date: Fri, 22 Mar 2019 18:30:52 +0100
Message-ID: <20190322173052.23763-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The debugfs read callback must advance ppos or users using read() on
the file descriptor will never get the EOL. This wasn't spotted before
as I was using busybox cat for testing which uses sendfile() internally
and only noticed it now when switched to cat from coreutils.

Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 154d959e8993..74ba8b1d71d8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -204,8 +204,9 @@ static ssize_t gpio_mockup_debugfs_read(struct file *file,
 	struct gpio_mockup_chip *chip;
 	struct seq_file *sfile;
 	struct gpio_chip *gc;
+	int val, rv, cnt;
 	char buf[3];
-	int val, rv;
+
 
 	if (*ppos != 0)
 		return 0;
@@ -216,13 +217,14 @@ static ssize_t gpio_mockup_debugfs_read(struct file *file,
 	gc = &chip->gc;
 
 	val = gpio_mockup_get(gc, priv->offset);
-	snprintf(buf, sizeof(buf), "%d\n", val);
+	cnt = snprintf(buf, sizeof(buf), "%d\n", val);
 
-	rv = copy_to_user(usr_buf, buf, sizeof(buf));
+	rv = copy_to_user(usr_buf, buf, cnt);
 	if (rv)
 		return rv;
 
-	return sizeof(buf) - 1;
+	*ppos += cnt;
+	return cnt;
 }
 
 static ssize_t gpio_mockup_debugfs_write(struct file *file,
-- 
2.20.1
