From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 06/14] pinctrl-sx150x: Improve sx150x_init_misc for SX1504/5/6
Date: Tue,  1 Nov 2016 08:57:40 -0700
Message-ID: <1478015868-10309-7-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

For Sx1504/5/6 only SX1506 has RegAdvanced, so put some code in place to
account for that.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 4283504..9063424 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -926,6 +926,13 @@ static int sx150x_init_misc(struct sx150x_pinctrl *pctl)
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
