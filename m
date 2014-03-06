From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] gpio: max732x: Fix I2C dummy device resource leak on probe
 failure
Date: Thu, 06 Mar 2014 10:31:15 +0100
Message-ID: <1394098276-11113-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:32858 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125AbaCFJbb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 04:31:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

In max732x_probe() driver allocates dummy I2C device (if number of ports
is greater than 8) however it is not unregistered if probe fails later.
Fix the leak by unregistering dummy I2C device if it was allocated.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/gpio/gpio-max732x.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 36cb290764b6..74432daaf656 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -647,6 +647,8 @@ static int max732x_probe(struct i2c_client *client,
 	return 0;
 
 out_failed:
+	if (chip->client_dummy)
+		i2c_unregister_device(chip->client_dummy);
 	max732x_irq_teardown(chip);
 	return ret;
 }
-- 
1.7.9.5

