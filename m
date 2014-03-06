From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] gpio: max732x: Fix possible NULL pointer dereference on
 i2c_new_dummy error
Date: Thu, 06 Mar 2014 10:31:16 +0100
Message-ID: <1394098276-11113-2-git-send-email-k.kozlowski@samsung.com>
References: <1394098276-11113-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34325 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752302AbaCFJbc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 04:31:32 -0500
In-reply-to: <1394098276-11113-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

In max732x_probe() driver allocates dummy I2C device (if number of ports
is greater than 8) with i2c_new_dummy() but it does not check the return
value of this call.

In case of error (i2c_new_device(): memory allocation failure or I2C
address cannot be used) this function returns NULL which is later
dereferenced by i2c_smbus_read_byte() (called from max732x_readb()).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/gpio/gpio-max732x.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 74432daaf656..7c36f2b0983d 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -622,6 +622,13 @@ static int max732x_probe(struct i2c_client *client,
 		goto out_failed;
 	}
 
+	if (nr_port > 8 && !chip->client_dummy) {
+		dev_err(&client->dev,
+			"Failed to allocate second group I2C device\n");
+		ret = -ENODEV;
+		goto out_failed;
+	}
+
 	mutex_init(&chip->lock);
 
 	max732x_readb(chip, is_group_a(chip, 0), &chip->reg_out[0]);
-- 
1.7.9.5

