From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] gpio: fix kernel-doc after devres.c file rename
Date: Sun, 7 Oct 2018 15:57:00 -0700
Message-ID: <ec1afc50-993c-c0d5-00e0-ab111579fca4@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix gpio kernel-doc generation after rename of the devres.c file.
Fixes these errors & warning:

Error: Cannot open file ../drivers/gpio/devres.c
Error: Cannot open file ../drivers/gpio/devres.c
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -export ../drivers/gpio/devres.c' failed with return code 2

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 Documentation/driver-api/gpio/index.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20181005.orig/Documentation/driver-api/gpio/index.rst
+++ linux-next-20181005/Documentation/driver-api/gpio/index.rst
@@ -38,7 +38,7 @@ Device tree support
 Device-managed API
 ==================
 
-.. kernel-doc:: drivers/gpio/devres.c
+.. kernel-doc:: drivers/gpio/gpiolib-devres.c
    :export:
 
 sysfs helpers
