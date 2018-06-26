From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 6/9] gpio.h: fix location of gpio legacy documentation
Date: Tue, 26 Jun 2018 06:49:08 -0300
Message-ID: <60e0372bb4d96f7795404e28d776a4600e38efe2.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The location of this doc file was moved. Change its reference
accordingly.

Fixes: 7ee2c13080c9 ("Documentation: gpio: Move legacy documentation to driver-api")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 91ed23468530..39745b8bdd65 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -14,7 +14,7 @@
 
 #include <linux/errno.h>
 
-/* see Documentation/gpio/gpio-legacy.txt */
+/* see Documentation/driver-api/gpio/legacy.rst */
 
 /* make these flag values available regardless of GPIO kconfig options */
 #define GPIOF_DIR_OUT	(0 << 0)
-- 
2.17.1
