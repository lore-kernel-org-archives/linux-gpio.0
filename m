From: Zhouyang Jia <jiazhouyang09@gmail.com>
Subject: [PATCH] gpio: max732x: add error handling for i2c_new_dummy
Date: Tue, 12 Jun 2018 11:28:52 +0800
Message-ID: <1528774132-38287-1-git-send-email-jiazhouyang09@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When i2c_new_dummy fails, the lack of error-handling code may
cause unexpected results.

This patch adds error-handling code after calling i2c_new_dummy.

Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
---
 drivers/gpio/gpio-max732x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 9d8bcc6..f03cb0b 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -653,6 +653,12 @@ static int max732x_probe(struct i2c_client *client,
 		chip->client_group_a = client;
 		if (nr_port > 8) {
 			c = i2c_new_dummy(client->adapter, addr_b);
+			if (!c) {
+				dev_err(&client->dev,
+					"Failed to allocate I2C device\n");
+				ret = -ENODEV;
+				goto out_failed;
+			}
 			chip->client_group_b = chip->client_dummy = c;
 		}
 		break;
@@ -660,6 +666,12 @@ static int max732x_probe(struct i2c_client *client,
 		chip->client_group_b = client;
 		if (nr_port > 8) {
 			c = i2c_new_dummy(client->adapter, addr_a);
+			if (!c) {
+				dev_err(&client->dev,
+					"Failed to allocate I2C device\n");
+				ret = -ENODEV;
+				goto out_failed;
+			}
 			chip->client_group_a = chip->client_dummy = c;
 		}
 		break;
-- 
2.7.4
