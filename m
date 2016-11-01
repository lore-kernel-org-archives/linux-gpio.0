From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 05/14] pinctrl-sx150x: Move some code out of sx150x_init_hw
Date: Tue,  1 Nov 2016 08:57:39 -0700
Message-ID: <1478015868-10309-6-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Move the code configuring explicit IRQ acking into a standalone function
to declutter sx150x_init_hw a bit and make that code somewhat less
repetitious.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index a38c8fc..4283504 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -914,6 +914,31 @@ static int sx150x_reset(struct sx150x_pinctrl *pctl)
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
@@ -925,18 +950,7 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
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
