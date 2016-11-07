From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 04/15] pinctrl-sx150x: Replace magic number in sx150x_init_hw
Date: Mon,  7 Nov 2016 08:53:12 -0800
Message-ID: <1478537603-23653-5-git-send-email-andrew.smirnov@gmail.com>
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
 drivers/pinctrl/pinctrl-sx150x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 9466777..3ccd048 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -43,6 +43,9 @@ enum {
 	SX150X_456,
 	SX150X_789,
 };
+enum {
+	SX150X_789_REG_MISC_AUTOCLEAR_OFF = 1 << 0,
+};
 
 struct sx150x_123_pri {
 	u8 reg_pld_mode;
@@ -935,7 +938,7 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 	if (pctl->data->model == SX150X_789)
 		err = sx150x_i2c_write(pctl->client,
 				pctl->data->pri.x789.reg_misc,
-				0x01);
+				SX150X_789_REG_MISC_AUTOCLEAR_OFF);
 	else if (pctl->data->model == SX150X_456)
 		err = sx150x_i2c_write(pctl->client,
 				pctl->data->pri.x456.reg_advance,
-- 
2.5.5
