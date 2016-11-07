From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 07/15] pinctrl-sx150x: Improve sx150x_init_misc for SX1504/5/6
Date: Mon,  7 Nov 2016 08:53:15 -0800
Message-ID: <1478537603-23653-8-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

For Sx1504/5/6 only SX1506 has RegAdvanced, so put some code in place to
account for that.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 27194e7..d51ec73 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -936,6 +936,13 @@ static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
 	case SX150X_456:
 		reg   = pctl->data->pri.x456.reg_advance;
 		value = 0x00;
+
+		/*
+		 * Only SX1506 has RegAdvanced, SX1504/5 are expected
+		 * to initialize this offset to zero
+		 */
+		if (!reg)
+			return 0;
 		break;
 	case SX150X_123:
 		reg   = pctl->data->pri.x123.reg_advance;
-- 
2.5.5
