From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 06/15] pinctrl-sx150x: Move some code out of sx150x_init_hw
Date: Mon,  7 Nov 2016 08:53:14 -0800
Message-ID: <1478537603-23653-7-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Move the code configuring explicit IRQ acking into a standalone function
to declutter sx150x_init_hw a bit and make that code somewhat less
repetitious.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 0e3e1da..27194e7 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -924,6 +924,31 @@ static int sx150x_reset(struct sx150x_pinctrl *pctl)
 	return err;
 }
 
+static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
+{
+	u8 reg, value;
+
+	switch (pctl->data->model) {
+	case SX150X_789:
+		reg   = pctl->data->pri.x789.reg_misc;
+		value = SX150X_789_REG_MISC_AUTOCLEAR_OFF;
+		break;
+	case SX150X_456:
+		reg   = pctl->data->pri.x456.reg_advance;
+		value = 0x00;
+		break;
+	case SX150X_123:
+		reg   = pctl->data->pri.x123.reg_advance;
+		value = 0x00;
+		break;
+	default:
+		WARN(1, "Unknown chip model %d\n", pctl->data->model);
+		return -EINVAL;
+	}
+
+	return sx150x_i2c_write(pctl->client, reg, value);
+}
+
 static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 {
 	int err;
@@ -935,18 +960,7 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 			return err;
 	}
 
-	if (pctl->data->model == SX150X_789)
-		err = sx150x_i2c_write(pctl->client,
-				pctl->data->pri.x789.reg_misc,
-				SX150X_789_REG_MISC_AUTOCLEAR_OFF);
-	else if (pctl->data->model == SX150X_456)
-		err = sx150x_i2c_write(pctl->client,
-				pctl->data->pri.x456.reg_advance,
-				0x00);
-	else
-		err = sx150x_i2c_write(pctl->client,
-				pctl->data->pri.x123.reg_advance,
-				0x00);
+	err = sx150x_init_misc(pctl);
 	if (err < 0)
 		return err;
 
-- 
2.5.5
