From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 2/4] gpio: 104-idi-48: Pass the correct license string to MODULE_LICENSE
Date: Mon,  1 Feb 2016 18:51:50 -0500
Message-ID: <b38c637feabe1a21c13e6d77995535be0c9f3bb4.1454342013.git.vilhelm.gray@gmail.com>
References: <cover.1454342013.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454342013.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454342013.git.vilhelm.gray@gmail.com>
References: <cover.1454342013.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The ACCES 104-IDI-48 GPIO driver copyright boilerplate lacks the "or
later" verbiage regarding GPL compliant distribution. The MODULE_LICENSE
string should reflect the actual copyright license terms used.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idi-48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 285a075..49b1188 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -341,4 +341,4 @@ module_exit(idi_48_exit);
 
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("ACCES 104-IDI-48 GPIO driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.4.10
