From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/3] MAINTAINERS: Add an entry for the ATH79 GPIO driver
Date: Fri, 30 Oct 2015 11:36:29 +0100
Message-ID: <1446201391-22553-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alban Bedel <albeu@free.fr>
List-Id: linux-gpio@vger.kernel.org

Add an entry for the ATH79 GPIO driver with myself as maintainer.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9de185d..957b148 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1780,6 +1780,14 @@ S:	Supported
 F:	Documentation/aoe/
 F:	drivers/block/aoe/
 
+ATHEROS 71XX/9XXX GPIO DRIVER
+M:	"Alban Bedel <albeu@free.fr>"
+W:	https://github.com/AlbanBedel/linux
+T:	git git://github.com/AlbanBedel/linux
+S:	Maintained
+F:	drivers/gpio/gpio-ath79.c
+F:	Documentation/devicetree/bindings/gpio/gpio-ath79.txt
+
 ATHEROS ATH GENERIC UTILITIES
 M:	"Luis R. Rodriguez" <mcgrof@do-not-panic.com>
 L:	linux-wireless@vger.kernel.org
-- 
2.0.0
