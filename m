From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 02/27] drm/bridge: ps8622: #include <linux/gpio/consumer.h>, depend on GPIOLIB
Date: Tue,  5 May 2015 18:32:18 +0200
Message-ID: <1430843563-18615-2-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
List-Id: linux-gpio@vger.kernel.org

If GPIOLIB=3Dn and asm-generic/gpio.h is not used:

    drivers/gpu/drm/bridge/ps8622.c: In function =E2=80=98ps8622_pre_en=
able=E2=80=99:
    drivers/gpu/drm/bridge/ps8622.c:368: error: implicit declaration of=
 function =E2=80=98gpiod_set_value=E2=80=99
    drivers/gpu/drm/bridge/ps8622.c: In function =E2=80=98ps8622_probe=E2=
=80=99:
    drivers/gpu/drm/bridge/ps8622.c:584: error: implicit declaration of=
 function =E2=80=98devm_gpiod_get=E2=80=99
    drivers/gpu/drm/bridge/ps8622.c:584: warning: assignment makes poin=
ter from integer without a cast
    drivers/gpu/drm/bridge/ps8622.c:590: error: implicit declaration of=
 function =E2=80=98gpiod_direction_output=E2=80=99
    drivers/gpu/drm/bridge/ps8622.c:596: warning: assignment makes poin=
ter from integer without a cast

Add the missing #include <linux/gpio/consumer.h> to fix this.

As the resulting driver won't work with GPIOLIB=3Dn anyway, make
DRM_PS8622 depend on GPIOLIB || COMPILE_TEST.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/Kconfig  | 4 ++--
 drivers/gpu/drm/bridge/ps8622.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
index 6cdcd2ec4848edec..3e562d3f37973efc 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -14,8 +14,8 @@ config DRM_PTN3460
=20
 config DRM_PS8622
 	tristate "Parade eDP/LVDS bridge"
-	depends on DRM
-	depends on OF
+	depends on DRM && OF
+	depends on GPIOLIB || COMPILE_TEST
 	select DRM_PANEL
 	select DRM_KMS_HELPER
 	select BACKLIGHT_LCD_SUPPORT
diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge/p=
s8622.c
index e895aa7ea353164a..a9c38f8edf172bb9 100644
--- a/drivers/gpu/drm/bridge/ps8622.c
+++ b/drivers/gpu/drm/bridge/ps8622.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/fb.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
--=20
1.9.1
