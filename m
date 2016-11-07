From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 05/15] pinctrl-sx150x: Fix incorrect constant in sx150x_init_hw
Date: Mon,  7 Nov 2016 08:53:13 -0800
Message-ID: <1478537603-23653-6-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

According to the datasheet for SX1504/5/6, RegAdvanced's
"Autoclear NINT" bit that turns the feature when set and disables it
when cleared, so writing 0x04 to the register will have the opposite
from desirable effect.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 3ccd048..0e3e1da 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -942,7 +942,7 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 	else if (pctl->data->model == SX150X_456)
 		err = sx150x_i2c_write(pctl->client,
 				pctl->data->pri.x456.reg_advance,
-				0x04);
+				0x00);
 	else
 		err = sx150x_i2c_write(pctl->client,
 				pctl->data->pri.x123.reg_advance,
-- 
2.5.5
