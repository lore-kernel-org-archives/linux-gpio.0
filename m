From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 15/15] pinctrl-sx150x: Remove magic numbers from sx150x_reset
Date: Mon,  7 Nov 2016 08:53:23 -0800
Message-ID: <1478537603-23653-16-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 56abe36..dc1341f 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -49,6 +49,8 @@ enum {
 	SX150X_MAX_REGISTER = 0xad,
 	SX150X_IRQ_TYPE_EDGE_RISING = 0x1,
 	SX150X_IRQ_TYPE_EDGE_FALLING = 0x2,
+	SX150X_789_RESET_KEY1 = 0x12,
+	SX150X_789_RESET_KEY2 = 0x34,
 };
 
 struct sx150x_123_pri {
@@ -771,13 +773,13 @@ static int sx150x_reset(struct sx150x_pinctrl *pctl)
 
 	err = i2c_smbus_write_byte_data(pctl->client,
 					pctl->data->pri.x789.reg_reset,
-					0x12);
+					SX150X_789_RESET_KEY1);
 	if (err < 0)
 		return err;
 
 	err = i2c_smbus_write_byte_data(pctl->client,
 					pctl->data->pri.x789.reg_reset,
-					0x34);
+					SX150X_789_RESET_KEY2);
 	return err;
 }
 
-- 
2.5.5
