From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] MAINTAINERS: remove a duplicate entry for gpio-mockup
Date: Mon, 26 Nov 2018 09:15:58 +0100
Message-ID: <20181126081558.32175-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I'll be getting all GPIO e-mail now, so remove my name from reviewers
of gpio-mockup.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 380e43f585d3..021c73808212 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6299,7 +6299,6 @@ F:	drivers/media/rc/gpio-ir-tx.c
 
 GPIO MOCKUP DRIVER
 M:	Bamvor Jian Zhang <bamv2005@gmail.com>
-R:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-mockup.c
-- 
2.19.1
