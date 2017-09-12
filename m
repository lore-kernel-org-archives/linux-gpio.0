From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 resend 1/4] sh: sh7722: Remove nonexistent GPIO_PTQ7 to fix pinctrl registration
Date: Tue, 12 Sep 2017 10:40:54 +0200
Message-ID: <1505205657-18012-2-git-send-email-geert+renesas@glider.be>
References: <1505205657-18012-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:51532 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751332AbdILIlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 04:41:03 -0400
In-Reply-To: <1505205657-18012-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

On sh7722/Migo-R, pinctrl registration fails with:

    sh-pfc pfc-sh7722: pin 0 already registered
    sh-pfc pfc-sh7722: error during pin registration
    sh-pfc pfc-sh7722: could not register: -22
    sh-pfc: probe of pfc-sh7722 failed with error -22

pinmux_pins[] is initialized through PINMUX_GPIO(), using designated
array initializers, where the GPIO_* enums serve as indices.
As GPIO_PTQ7 is defined in the enum, but never used, pinmux_pins[]
contains a (zero-filled) hole. Hence this entry is treated as pin zero,
which was registered before, and pinctrl registration fails.

According to the datasheet, port PTQ7 does not exist. Hence remove
GPIO_PTQ7 from the enum to fix this.

Fixes: 8d7b5b0af7e070b9 ("sh: Add sh7722 pinmux code")
Reported-by: Magnus Damm <magnus.damm@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Tested on sh7722/Migo-R.

v2:
  - Add Reviewed-by, Tested-by.
---
 arch/sh/include/cpu-sh4/cpu/sh7722.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/include/cpu-sh4/cpu/sh7722.h b/arch/sh/include/cpu-sh4/cpu/sh7722.h
index 3bb74e534d0f8ca4..78961ab78a5a9c83 100644
--- a/arch/sh/include/cpu-sh4/cpu/sh7722.h
+++ b/arch/sh/include/cpu-sh4/cpu/sh7722.h
@@ -67,7 +67,7 @@ enum {
 	GPIO_PTN3, GPIO_PTN2, GPIO_PTN1, GPIO_PTN0,
 
 	/* PTQ */
-	GPIO_PTQ7, GPIO_PTQ6, GPIO_PTQ5, GPIO_PTQ4,
+	GPIO_PTQ6, GPIO_PTQ5, GPIO_PTQ4,
 	GPIO_PTQ3, GPIO_PTQ2, GPIO_PTQ1, GPIO_PTQ0,
 
 	/* PTR */
-- 
2.7.4

