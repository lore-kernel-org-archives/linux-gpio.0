From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 2/9] arm: do not place huge encoder tables on stack when it is too small
Date: Tue, 23 Jun 2015 23:19:40 +0200
Message-ID: <1435094387-20146-3-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fish.king.net.pl ([79.190.246.46]:36991 "EHLO king.net.pl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S934002AbbFWVtx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Jun 2015 17:49:53 -0400
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>

Since stack on Cortex-M3 is too small, we need configuration option
to avoid using it for huge encoder tables of zlib.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 arch/arm/Kconfig-nommu     | 4 ++++
 lib/zlib_inflate/inflate.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/Kconfig-nommu b/arch/arm/Kconfig-nommu
index aed66d5..965ca97 100644
--- a/arch/arm/Kconfig-nommu
+++ b/arch/arm/Kconfig-nommu
@@ -62,3 +62,7 @@ config ARM_MPU
 
          If your CPU has an MPU then you should choose 'y' here unless you
          know that you do not want to use the MPU.
+
+config ZLIB_INFLATE_STACK_SAVING
+	bool 'Do not place huge encoder tables on stack' if ZLIB_INFLATE
+	depends on ZLIB_INFLATE
diff --git a/lib/zlib_inflate/inflate.c b/lib/zlib_inflate/inflate.c
index 58a733b..917b7cf 100644
--- a/lib/zlib_inflate/inflate.c
+++ b/lib/zlib_inflate/inflate.c
@@ -75,9 +75,14 @@ int zlib_inflateInit2(z_streamp strm, int windowBits)
    Return state with length and distance decoding tables and index sizes set to
    fixed code decoding.  This returns fixed tables from inffixed.h.
  */
+#ifdef CONFIG_ZLIB_INFLATE_STACK_SAVING
+#   include "inffixed.h"
+#endif
 static void zlib_fixedtables(struct inflate_state *state)
 {
+#ifndef CONFIG_ZLIB_INFLATE_STACK_SAVING
 #   include "inffixed.h"
+#endif
     state->lencode = lenfix;
     state->lenbits = 9;
     state->distcode = distfix;
-- 
2.3.6

