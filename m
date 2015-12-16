From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add co-maintainer for Renesas Pin Controllers
Date: Wed, 16 Dec 2015 11:31:12 +0100
Message-ID: <1450261872-540-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:50039 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934069AbbLPKbL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 05:31:11 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Add myself as a co-maintainer for Renesas Pin Controllers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be included in next sh-pfc-for-v4.5 pull request.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9caa4b288284b92..f625860effec8c16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8351,6 +8351,7 @@ F:	drivers/pinctrl/intel/
 
 PIN CONTROLLER - RENESAS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-sh@vger.kernel.org
 S:	Maintained
 F:	drivers/pinctrl/sh-pfc/
-- 
1.9.1

