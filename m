From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] MAINTAINERS: add my-self as maintainer of gpio pxa driver
Date: Fri, 18 Dec 2015 22:41:34 +0100
Message-ID: <1450474894-12425-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f7d7136adfd..a27682bdee8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8643,6 +8643,12 @@ F:	include/sound/pxa2xx-lib.h
 F:	sound/arm/pxa*
 F:	sound/soc/pxa/
 
+PXA GPIO DRIVER
+M:	Robert Jarzmik <robert.jarzmik@free.fr>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-pxa.c
+
 PXA3xx NAND FLASH DRIVER
 M:	Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.1.4
