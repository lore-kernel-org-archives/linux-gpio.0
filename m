From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 3/3] pinctrl: sx150x: add a static gpio/pinctrl pin range mapping
Date: Wed, 17 Jan 2018 14:34:23 +0100
Message-ID: <20180117133423.4482-4-peda@axentia.se>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
 <20180117133423.4482-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117133423.4482-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Without such a range, gpiolib fails with -EPROBE_DEFER, pending the
addition of the range. So, without a range, gpiolib will keep
deferring indefinitely.

Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond sleep")
Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 049dd15e04ef..cbf58a10113d 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1193,6 +1193,11 @@ static int sx150x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
+				     0, 0, pctl->data->npins);
+	if (ret)
+		return ret;
+
 	/* Add Interrupt support if an irq is specified */
 	if (client->irq > 0) {
 		pctl->irq_chip.name = devm_kstrdup(dev, client->name,
-- 
2.11.0
