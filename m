From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: [PATCH 04/33] gpiolib-of: use match_string() helper
Date: Mon, 21 May 2018 19:57:41 +0800
Message-ID: <1526903890-35761-5-git-send-email-xieyisheng1@huawei.com>
References: <1526903890-35761-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526903890-35761-1-git-send-email-xieyisheng1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Yisheng Xie <xieyisheng1@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

match_string() returns the index of an array for a matching string,
which can be used intead of open coded variant.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
---
 drivers/gpio/gpiolib-of.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 586d151..9cbc898 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -202,7 +202,6 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *
 	};
 	struct device_node *np = dev->of_node;
 	struct gpio_desc *desc;
-	int i;
 
 	if (!IS_ENABLED(CONFIG_REGULATOR))
 		return ERR_PTR(-ENOENT);
@@ -210,11 +209,7 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *
 	if (!con_id)
 		return ERR_PTR(-ENOENT);
 
-	for (i = 0; i < ARRAY_SIZE(whitelist); i++)
-		if (!strcmp(con_id, whitelist[i]))
-			break;
-
-	if (i == ARRAY_SIZE(whitelist))
+	if (match_string(whitelist, ARRAY_SIZE(whitelist), con_id) < 0)
 		return ERR_PTR(-ENOENT);
 
 	desc = of_get_named_gpiod_flags(np, con_id, 0, of_flags);
-- 
1.7.12.4
