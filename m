From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] MAINTAINERS: add myself as reviewer for gpio-mockup
Date: Mon, 27 Nov 2017 11:50:51 +0100
Message-ID: <20171127105051.10072-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

The user space libgpiod project is now tightly coupled with the
gpio-mockup module, so let me know when any changes to it are being
proposed.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa71ab52fd76..89e2acf95981 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5964,6 +5964,7 @@ F:	drivers/media/rc/gpio-ir-tx.c
 
 GPIO MOCKUP DRIVER
 M:	Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
+R:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-mockup.c
-- 
2.15.0
