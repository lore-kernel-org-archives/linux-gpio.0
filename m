Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD573B14A1;
	Mon, 17 Aug 2026 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993106; cv=fail; b=NYPAmhUFk+3reG3oVsy7MJeq4ZJlbv33Aqt6cZJ2oGdP8FXFwG5TNlZWUQeCvqLjHRm3n5oJIbfXS0h7WZk6kdUPYFLRstGmT2KSGo/N4b1Q2vkHX/u/UE3ahN4Zs7O86HVrrYK76B/6mPIzD2G/qUoG5aEgym8aK1g6xJhtIjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993106; c=relaxed/simple;
	bh=ED9klNBdd+qaPrXcO5GqJNuDsSSQt44l4XXuuk0ebI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qCKylYpAx5wguWA1P/RWvtiE5g/fkELx8d0RkmgQzGRCoJD2suDZ6ln9mbrWwAop9lcC+8vHwGDsxupCVo34yJsvGxtBSckA5Aoc3T0Dmkdgq1rKCP9zZ871XSZEaarwM36IpWdg2bMtJZMWPakqMljOEcvS/N1g/f5RJKau4XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jPJIPz8F; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jPJIPz8F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kk2hwBUrqgi8OoVlg4bTGSbK/Qfq/FG+QrzsbAIaLkhrZG7LxZ75mjmcVZOqCgpnyQnEvl1SXiFk3WcT3m09yB8II/pyq1N3xelTKZPhMoJEhSq9ScPU+9JJimNQrx95RCATFqGM07lUU33u63VeHjPLHuzbgK8D/IoIwCJX0HgRZACl7yjCfbLUyihuBKIpA7GvZFa7F/JVdt1+AcHpS2OxI1HwNfBN2lRHFGyucYbjsBT6nglQ8OwmTiPVPvAxQnAbNLNmiP2z3PSlJPpKXx8zemv8LSuflvrgKR62nEf+FxhMqYr8ZvZyRS0EAHcKx3dQ/7j4zhSbZyP8QGCc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxcVIIwsCSZvGUjeUWlrL4O+d8/m59o419JUkQsOa1g=;
 b=lsVg/b7tw7gRbU42ew2fZWCQWc1HjSQL0Rdyk2/6h9U00DC1mvCxSmou/PU4vJmK9WwmVak++dgkk0Yk3T/Ym6/7LRJSzxaAG4f6PkAzC5EE3GpgNSc5P0VTAXOkUuFlqycheqZ98w+hgTCsuzr/dKm7u79ZItnst4d6CuImcNmW9XpzUiDH8hWayzI5yyOs8m+Q6AGcrQHhgR8ga18HidiZ+eohPzz7O9afjIRJWEe8w+6dqkJjZCc16xoJ5w+mk50EV4Ef5SnNzRoubZnGC3PutLydonG3JmNdGoovqqsmO8VdfA5nHJIV3x8yne5WcF/PVum+UuuzTnoJ1yPP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxcVIIwsCSZvGUjeUWlrL4O+d8/m59o419JUkQsOa1g=;
 b=jPJIPz8F+wAxPlFdZ8mLhdwDGuhG4vXlaOaXe2u3aEgFBZ3gghBbD1KivZhEWf2yKbUmBtrVcX2earzSpiRNw3GOPkWjIiHEsL2akWJv7i3OM/x+cyTWuFu6yBaZJZ2ks4GPL1CPDcPDMSGf/WQ0Idq+r2rcML82CuG/GMr+Blo=
Received: from OS7PR01CA0088.jpnprd01.prod.outlook.com (2603:1096:604:25b::6)
 by TY5PR01MB18574.jpnprd01.prod.outlook.com (2603:1096:405:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:20 +0000
Received: from OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25b:cafe::22) by OS7PR01CA0088.outlook.office365.com
 (2603:1096:604:25b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003D.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:20 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id EDBCD3000269;
	Tue, 18 Aug 2026 03:58:16 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
Date: Mon, 17 Aug 2026 21:56:57 +0300
Message-ID: <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003D:EE_|TY5PR01MB18574:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 66d317c5-4a97-439d-1c03-08defc918140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fNlHek1NLeGqs9QBpTSJVfDOZrk2tNa2NtdAkP7ZN5254MOikKCPACSiKPiXMD/XNP1tk3Y+ZJ6ZdNg9BL9kNT7fkS7MT5rUD+kWOBw9Qdvg+RXQ4eU1pQPB+y+6gmsSOZnCa9Ufu+Z/Sk7poljkdE5j0vagU7/7z+irmtCeQwoTTCPcSrgjJW7SRS75EQIpfzjM91yf3kY6ckGgw9Wy93XwJIXdTfc0VKPk7C2VNidgFJ7nDpf5JXO00pfPShRofdm4wg6R8eLB/q+txWDsSEVqUC0qkDZGOPxueJQZaAqd9UsApwRaHA1zGJP3Im3jaNHjCqq03YAg5JS6buMmYRtUJ1Tbrz/it057ALLL4igyM0uGofHeNVANEO/yxgLsrEcT0SbMS+XkuU/9ZUxPiLUkvHmMB3ldbil/gQB8u1myN/H85Q2B+GdmwHFkgNw/YA09CHBnyWsP6Fjx7m1Ij5pHsEiQu++xcB4lyCJI+kRaO3NS4LTMN4W/xQChHOLhhN/CnCPG/q/ty6TT1Jky9T+lN+qpM99wB3bjjNIJjNRZeJ74n7gvx75SPBQQ2/wwhCblLp2MyNZRlpl2lW4oeF/HVuNVuXY9sdrnJEUpk3jPuLUcsOOVB9QiUy3Dg2YAb3yYplYBnxZm1yfRG3D7m8vcGVaFT+ATm8FZbX4Tprm/TMfZGnxAf668LW+qUQCUyXtFK62HIYiZ1T0BJm/gNA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GZyPvydNB+6FFeeSGPDWfwpi2VnN3WEdBsIub7vhf2pYmx2mKlOQ2ACZXnpoQ7fIERL9hbW2N1DXCRd3MP0CqHuRVP5LBptpLXuKdv7gsaUb4FfAFxMjU8YToB8A2FD8MnrJUQf1xUKs02TBDaTC2s3k1H13ZZ0FV9gLdAuN+BefV8qDIf67qtMSb40WpHm9HP6GKOszwhyn0RQomZ91OuhWDldG1awqk+39LHG7kMTMURjvLt8EnzxEjLKF0/D29c309R/m60AwLulr3MRdi0mj4NyV/KDy1nSq+lK48405C7ZFf6lKo4PI5qYOKVjfsTKw74FnYil+JTWaB+vOa2Vc3anGfqg0RQxf7vBXBdrBwpPHg0nluFaw6hW96KzdrSiVBZHUkLh0/Hs/i1xghsOubYpROhnij2s90YKj6eOi47GYi/SPLiuHQ6HF3AfQ
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:20.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d317c5-4a97-439d-1c03-08defc918140
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18574

rzt2h_gpio_get() only reports a level for pins in input or output mode
and returns -EINVAL otherwise. When a pin is requested as an interrupt
it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
value can no longer be read.

gpiolib calls gpiod_get_value_cansleep() to determine the edge's
direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
Non-zero values are translated to a rising edge, zero to a falling edge.

Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
returns -EINVAL when the pin is in IRQ function, every edge is reported
as rising.

When using the IRQ function, the input buffers are enabled and the PINm
registers reflect the live state of the input.

Report the input level even when the pin is used as an IRQ.

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 287cacbcb37b..b8d5b6af5be4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -171,6 +171,23 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 	return (pincfg & BIT(pin)) ? 0 : -EINVAL;
 }
 
+static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
+{
+	return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
+}
+
+static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
+{
+	u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+
+	return field_get(PFC_PIN_MASK(pin), reg64);
+}
+
+static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
+{
+	return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
+}
+
 static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
 {
 	u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
@@ -847,6 +864,13 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
 	u16 reg;
 
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
+		if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)
+			return rzt2h_pin_read_input(pctrl, port, bit);
+
+		return -EINVAL;
+	}
+
 	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
 	reg = (reg >> (bit * 2)) & PM_MASK;
 	if (reg & PM_INPUT)
-- 
2.55.0

