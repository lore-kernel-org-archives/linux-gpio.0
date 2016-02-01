From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 4/4] gpio: ws16c48: Pass the correct license string to MODULE_LICENSE
Date: Mon,  1 Feb 2016 18:53:29 -0500
Message-ID: <419b70385461558e4b3d5bdc768d44ff6533f465.1454342013.git.vilhelm.gray@gmail.com>
References: <35ba3999e8962521bff229f91cbbc1b9554e8c18.1454342013.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <35ba3999e8962521bff229f91cbbc1b9554e8c18.1454342013.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454342013.git.vilhelm.gray@gmail.com>
References: <cover.1454342013.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The WinSystems WS16C48 GPIO driver copyright boilerplate lacks the "or
later" verbiage regarding GPL compliant distribution. The MODULE_LICENSE
string should reflect the actual copyright license terms used.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-ws16c48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 9dd9479..d5279a0 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -433,4 +433,4 @@ module_exit(ws16c48_exit);
 
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("WinSystems WS16C48 GPIO driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.4.10
