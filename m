From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 02/18] gpio: mockup: parse the module params in init, not probe
Date: Mon, 27 Nov 2017 11:48:38 +0100
Message-ID: <20171127104854.333-3-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

If the module parameters are invalid, we should bail out from the init
function instead of detecting it during the device probe. That way we
don't even allow the user to load the module if we don't accept the
arguments.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d21c6d651287..b70f3b0c30b1 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -275,9 +275,6 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	struct gpio_mockup_chip *chips;
 	char *chip_name;
 
-	if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))
-		return -EINVAL;
-
 	/* Each chip is described by two values. */
 	num_chips = gpio_mockup_params_nr / 2;
 
@@ -333,6 +330,9 @@ static int __init gpio_mockup_init(void)
 {
 	int err;
 
+	if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))
+		return -EINVAL;
+
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
 	if (!gpio_mockup_dbg_dir)
 		pr_err("%s: error creating debugfs directory\n",
-- 
2.15.0
