Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97D4456DF6;
	Thu,  3 Sep 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435223; cv=none; b=q0fDy0yPvJUL6ToHkQ3dUTvTz7r/ADAC0CgR54fEhkKYR/RC+7Z+FQa3WCWz3bY1RqQr7OgfUEznGT0c4sntn4hJ2W/mOYnL1rAOVszDzClxLva804tFA3fu0kB/JsqQlV4uFePlc8bhgoEcsXdji1lmrssjn25ich6izMGrY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435223; c=relaxed/simple;
	bh=fUwo8J8MtM2TL6y0rJ/TVzOV+7vGT3O9I4Db1wivI1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwLIm0YSex4EEkMEQDDE4zMmJe5B7q66nJ5uyPhasrA95+Hzk/0uXCXtTyZyGxTxnZgJD0zeIs9JSaftVbd7pvokhAsvYTLTIaF2BiKghr0FAvdiB1tm5ikxllCbaFHe4hLEXIfOYUaOyq10woPomlPZVLPlnWkfRBpeUonB7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2775B1F000E9;
	Thu,  3 Sep 2026 11:33:35 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v6 2/5] pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
Date: Thu,  3 Sep 2026 14:33:24 +0300
Message-ID: <20260903113327.1217457-3-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the QSPI and OTHER_POC register defines, which are SoC specific and
accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
initializations as sorted (by offsets) as possible.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- updated patch description
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 40bf8f9e8f2f..c17983aafcf5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -181,8 +181,6 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
-#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -3840,9 +3838,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.qspi = 0x3008,
 		.eth_poc = 0x300c,
 		.oen = 0x3018,
-		.qspi = QSPI,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3860,7 +3858,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch2 = 0x3024,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
-		.other_poc = OTHER_POC,
+		.other_poc = 0x3028,
 	},
 	.masks = {
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
-- 
2.43.0

