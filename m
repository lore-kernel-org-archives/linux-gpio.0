From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 06/18] gpio: mockup: remove a stray tab
Date: Mon, 27 Nov 2017 11:48:42 +0100
Message-ID: <20171127104854.333-7-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Minor coding style fix.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0aa68242f33b..9b2823a33538 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -27,7 +27,7 @@
 #include "gpiolib.h"
 
 #define GPIO_MOCKUP_NAME	"gpio-mockup"
-#define	GPIO_MOCKUP_MAX_GC	10
+#define GPIO_MOCKUP_MAX_GC	10
 /*
  * We're storing two values per chip: the GPIO base and the number
  * of GPIO lines.
-- 
2.15.0
