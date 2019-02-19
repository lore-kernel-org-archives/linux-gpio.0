From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 4/7] gpio: mockup: don't create the debugfs link named after the label
Date: Tue, 19 Feb 2019 17:06:47 +0100
Message-ID: <20190219160650.9614-5-brgl@bgdev.pl>
References: <20190219160650.9614-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219160650.9614-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

User-space tests no longer use it and we're breaking the interface
anyway.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1c945c967f60..0317917a3678 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -234,7 +234,7 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 				      struct gpio_mockup_chip *chip)
 {
 	struct gpio_mockup_dbgfs_private *priv;
-	struct dentry *evfile, *link;
+	struct dentry *evfile;
 	struct gpio_chip *gc;
 	const char *devname;
 	char *name;
@@ -247,10 +247,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	if (IS_ERR_OR_NULL(chip->dbg_dir))
 		goto err;
 
-	link = debugfs_create_symlink(gc->label, gpio_mockup_dbg_dir, devname);
-	if (IS_ERR_OR_NULL(link))
-		goto err;
-
 	for (i = 0; i < gc->ngpio; i++) {
 		name = devm_kasprintf(dev, GFP_KERNEL, "%d", i);
 		if (!name)
-- 
2.20.1
