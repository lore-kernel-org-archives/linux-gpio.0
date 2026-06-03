Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772A3D1AB9;
	Wed,  3 Jun 2026 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499830; cv=none; b=neiv5IAiqF4i9ABnzFTKBAyANxI1eyQwqqC8edeY+OLO3pZLGitekgJfTVCb06aljfQOQcILlOkpUOAQ8PRuWeRpx7ItBcD5vuYDlW4dpeIrA07c73Ht47WRxuub6olu87zI4+YHbaaQsaKAvQKxLm49gxGYgP+4Q4LT5Z14C7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499830; c=relaxed/simple;
	bh=GVgjAVWVXbynufjGFxXsa0bKmm1lOm1h5fWN9ItYjeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYQF/QF3+Ou3crvR5C1sa5MD+44v441HT8gKkhpyayVFG9Pl/a1UmLpt9Adbz0k8NujN6Ol5p/PcvJELATVMdmwBG/g/7xgngPMWNTaNYlhrb+EQ68vn8QDBmD7STCWemgFxD+tZ9IjUgz97OJIa1olYWXTxsSRF0smHsn3wBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYhUWkwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYhUWkwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5971F00898;
	Wed,  3 Jun 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499828;
	bh=iWTd2gkTfeXLtpXeXgM8TZo+rmIc+Lsx71mY8c2PamE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nYhUWkwBXMWtm/7R5Ov61ZB7Q8pqJP7WD/dj7rd04yvrNZnZGGdR4BOebID85UbiS
	 TQd4YmNaDtrr2uMUJYAhfzbdPBkUyHyL/RFfJTbNf2GyPTaNroNXWLnT/b0KIWcZfk
	 PnJMQpPUzu5FoZtsK0oewK+5o75JhAocY4dRpacIOEM38mi/3t3OXCRs0wbpcylsn6
	 YKxHpke9S61engCJ31scEK+t4OUG2FNuu5U5scogMj2fiCRu8J9tLv6pgiMRZd+o2t
	 QtjjgqRoLooP05EUB5HcHssykgROh3s1vw4u5sSMbtPh4CyCG/iclsLyq+OSrYCamC
	 /3qGw991jDrOw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 3/6] pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
Date: Wed,  3 Jun 2026 18:16:39 +0300
Message-ID: <20260603151642.4075678-4-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- updated patch description
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 6f3760851460..b52a85066f63 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -180,8 +180,6 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
-#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -3816,9 +3814,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
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
@@ -3835,7 +3833,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
-		.other_poc = OTHER_POC,
+		.other_poc = 0x3028,
 	},
 	.masks = {
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
-- 
2.43.0

