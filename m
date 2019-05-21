From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] gpio: max732x: use i2c_new_dummy_device()
Date: Tue, 21 May 2019 11:03:05 +0200
Message-ID: <20190521090306.28113-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now have a resource managed version of i2c_new_dummy_device() that
also returns an actual error code instead of a NULL-pointer. Use it
in the max732x GPIO driver and simplify code in the process.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-max732x.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index f03cb0ba7726..7fd1bdfe00e5 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -652,12 +652,12 @@ static int max732x_probe(struct i2c_client *client,
 	case 0x60:
 		chip->client_group_a = client;
 		if (nr_port > 8) {
-			c = i2c_new_dummy(client->adapter, addr_b);
-			if (!c) {
+			c = devm_i2c_new_dummy_device(&client->dev,
+						      client->adapter, addr_b);
+			if (IS_ERR(c)) {
 				dev_err(&client->dev,
 					"Failed to allocate I2C device\n");
-				ret = -ENODEV;
-				goto out_failed;
+				return PTR_ERR(c);
 			}
 			chip->client_group_b = chip->client_dummy = c;
 		}
@@ -665,12 +665,12 @@ static int max732x_probe(struct i2c_client *client,
 	case 0x50:
 		chip->client_group_b = client;
 		if (nr_port > 8) {
-			c = i2c_new_dummy(client->adapter, addr_a);
-			if (!c) {
+			c = devm_i2c_new_dummy_device(&client->dev,
+						      client->adapter, addr_a);
+			if (IS_ERR(c)) {
 				dev_err(&client->dev,
 					"Failed to allocate I2C device\n");
-				ret = -ENODEV;
-				goto out_failed;
+				return PTR_ERR(c);
 			}
 			chip->client_group_a = chip->client_dummy = c;
 		}
@@ -678,36 +678,34 @@ static int max732x_probe(struct i2c_client *client,
 	default:
 		dev_err(&client->dev, "invalid I2C address specified %02x\n",
 				client->addr);
-		ret = -EINVAL;
-		goto out_failed;
+		return -EINVAL;
 	}
 
 	if (nr_port > 8 && !chip->client_dummy) {
 		dev_err(&client->dev,
 			"Failed to allocate second group I2C device\n");
-		ret = -ENODEV;
-		goto out_failed;
+		return -ENODEV;
 	}
 
 	mutex_init(&chip->lock);
 
 	ret = max732x_readb(chip, is_group_a(chip, 0), &chip->reg_out[0]);
 	if (ret)
-		goto out_failed;
+		return ret;
 	if (nr_port > 8) {
 		ret = max732x_readb(chip, is_group_a(chip, 8), &chip->reg_out[1]);
 		if (ret)
-			goto out_failed;
+			return ret;
 	}
 
 	ret = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (ret)
-		goto out_failed;
+		return ret;
 
 	ret = max732x_irq_setup(chip, id);
 	if (ret) {
 		gpiochip_remove(&chip->gpio_chip);
-		goto out_failed;
+		return ret;
 	}
 
 	if (pdata && pdata->setup) {
@@ -719,10 +717,6 @@ static int max732x_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, chip);
 	return 0;
-
-out_failed:
-	i2c_unregister_device(chip->client_dummy);
-	return ret;
 }
 
 static int max732x_remove(struct i2c_client *client)
@@ -744,9 +738,6 @@ static int max732x_remove(struct i2c_client *client)
 
 	gpiochip_remove(&chip->gpio_chip);
 
-	/* unregister any dummy i2c_client */
-	i2c_unregister_device(chip->client_dummy);
-
 	return 0;
 }
 
-- 
2.21.0
