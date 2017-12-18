From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/4] gpio: sysfs: correct error handling on 'value' attribute
 read.
Date: Mon, 18 Dec 2017 11:08:31 +0100 (CET)
Message-ID: <b9e7fbdb52adee6602b86e0771c6e26f35e21ac4.1513591276.git.christophe.leroy@c-s.fr>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

'value' attribute is supposed to only return 0 or 1 according to
the documentation.
With today's implementation, if gpiod_get_value_cansleep() fails
the printed 'value' is a negative value.

This patch ensures that an error is returned on read instead.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpio/gpiolib-sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 7a3f4271393b..1b0f415df03b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -106,8 +106,12 @@ static ssize_t value_show(struct device *dev,
 
 	mutex_lock(&data->mutex);
 
-	status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
+	status = gpiod_get_value_cansleep(desc);
+	if (status < 0)
+		goto err;
 
+	status = sprintf(buf, "%d\n", status);
+err:
 	mutex_unlock(&data->mutex);
 
 	return status;
-- 
2.13.3
