From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] arm64: renesas: salvator-x: Update SCIF2 pin group
Date: Wed, 26 Aug 2015 20:02:24 +0200
Message-ID: <1440612144-16877-6-git-send-email-geert+renesas@glider.be>
References: <1440612144-16877-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:53925 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751819AbbHZSCa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 14:02:30 -0400
In-Reply-To: <1440612144-16877-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Cfr. "pinctrl: sh-pfc: r8a7795: Extend SCIF2 pin data", which renamed
"scif2_data" to "scif2_data_a".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 7bb80a937d760195..c485440564451cbc 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -38,7 +38,7 @@
 
 &pfc {
 	scif2_pins: scif2 {
-		renesas,groups = "scif2_data";
+		renesas,groups = "scif2_data_a";
 		renesas,function = "scif2";
        };
 };
-- 
1.9.1

