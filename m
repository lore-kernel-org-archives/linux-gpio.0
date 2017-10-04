From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add git repository to Renesas pinctrl driver section
Date: Wed,  4 Oct 2017 13:35:12 +0200
Message-ID: <1507116912-17362-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e018e720152c98c..61d77c8037a1faf9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10675,6 +10675,7 @@ PIN CONTROLLER - RENESAS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
 S:	Maintained
 F:	drivers/pinctrl/sh-pfc/
 
-- 
2.7.4
