From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] MAINTAINERS: gpio: add DT bindings directory
Date: Tue, 12 Apr 2016 17:57:53 +0200
Message-ID: <1460476673-3133-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Helps get_maintainer.pl to find the right people.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b0b5bb8d5c09b..4e0d6e5809dd85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4884,6 +4884,7 @@ M:	Alexandre Courbot <gnurou@gmail.com>
 L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/
 F:	Documentation/gpio/
 F:	Documentation/ABI/testing/gpio-cdev
 F:	Documentation/ABI/obsolete/sysfs-gpio
-- 
2.7.0
