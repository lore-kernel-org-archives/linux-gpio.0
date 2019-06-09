From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: remove unneeded initializer for list_for_each_entry() iterator
Date: Sun,  9 Jun 2019 23:55:37 +0900
Message-ID: <20190609145537.7953-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The iterator is initialized in list_for_each_entry().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index aeba6366fb13..15b680507867 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -98,7 +98,7 @@ EXPORT_SYMBOL_GPL(pinctrl_dev_get_drvdata);
  */
 struct pinctrl_dev *get_pinctrl_dev_from_devname(const char *devname)
 {
-	struct pinctrl_dev *pctldev = NULL;
+	struct pinctrl_dev *pctldev;
 
 	if (!devname)
 		return NULL;
@@ -288,7 +288,7 @@ static inline int gpio_to_pin(struct pinctrl_gpio_range *range,
 static struct pinctrl_gpio_range *
 pinctrl_match_gpio_range(struct pinctrl_dev *pctldev, unsigned gpio)
 {
-	struct pinctrl_gpio_range *range = NULL;
+	struct pinctrl_gpio_range *range;
 
 	mutex_lock(&pctldev->mutex);
 	/* Loop over the ranges */
@@ -368,7 +368,7 @@ static int pinctrl_get_device_gpio_range(unsigned gpio,
 					 struct pinctrl_dev **outdev,
 					 struct pinctrl_gpio_range **outrange)
 {
-	struct pinctrl_dev *pctldev = NULL;
+	struct pinctrl_dev *pctldev;
 
 	mutex_lock(&pinctrldev_list_mutex);
 
@@ -1642,7 +1642,7 @@ DEFINE_SHOW_ATTRIBUTE(pinctrl_groups);
 static int pinctrl_gpioranges_show(struct seq_file *s, void *what)
 {
 	struct pinctrl_dev *pctldev = s->private;
-	struct pinctrl_gpio_range *range = NULL;
+	struct pinctrl_gpio_range *range;
 
 	seq_puts(s, "GPIO ranges handled:\n");
 
-- 
2.17.1
