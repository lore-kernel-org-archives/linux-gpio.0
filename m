Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487767;
	b=1KXJ2b63x8n0aUYIfF2R439BmZmFFvgP8PCKYoXb97kdk3S79JPRpry6vDUc5N8H5O2F
	 ITmEfhpDdts8dlQWHb3yxz4M55nUitmnQDsUHOeVk62C/NWNYtjm4vsZwgLXnp3HFIxzL
	 dW6sZUobpsDsLLO1GzYGpeRaasWQFcNPlCfGLBex6FDAPhYemmuYbpoMuRmiU5RcWVn4l
	 RD2TmfOnR8FNK1jJT6ZMbn21nhZ/HH4ktJi8CIUO3kSnso3M0x7mJdUmmg9IDPUERP6tx
	 chsvNKO3ma//IOz0Kkg3zyzCgeRf5qYlAW4o5K+o5bHB4CyzP9tSfvizC+M3WJQVm/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487767;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7iGyiysZaKCBmOuXzYgRBERUHlAa2VJBh2oUOIDJClw=;
	b=mYmWfnWLaebsktyc13eGkuH+bf/XfUasB5fR/KB6L+ctTbZ9eL5fMgIwkzZiCbdYQAL2
	 Nwd/xN3YhDQUADUbi5Ujk6DvNOinCHz4HLN/45QbTngHm5qbKzARkFkRyZU0D/9VYBXhF
	 QaqUJ/ZDd6L9nwNvfYYoNfyLbsX0M3oz4mLcXngVPutOd/XPUFThXr2hDpb8iKOTN5rou
	 DPf2PI4uG8Nw4UXeANUTbXP0Y2lLrxU9phTGtFloH0H4gSyl2NPQjE9MHDupxM6zNJZUQ
	 /ecqKDDlvgvHGG+3AJRgOm4v9TaZ5v6s6qngFEyZN8elao6KGC9ZpGLZTots6EuRIig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=h3qhTb1+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.37
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFF606A32F;
	Tue, 20 Oct 2026 09:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CFF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=h3qhTb1+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJP4vcMoo4/HXXNA2OW0A9lgTwyBIbgKug0qeF/SGBCG5j4hSsW69FpkHzSZFBrZAokkEBxL79JG9vsvwzdRx3GBuhPsDqWA1l2KPzFhLEI3UEdNm2xrmvhZwOwM4P6kXeB6Q6u8RDMMOs5KAaXqg5k3c38gGsyNehN4q9q2esDa802jlAbBcwLkyw1d3efftMxzdZYrRCiqW5tLyTjFC8vMFOMhRA+Q1N2KAA1cGOv3Y1pV0PZ9mhmC0asd86SQtBSZScQchq3R4AsdIWOj6dCJMnnRDTX81/Li4QRh2eAhTnDiSUJrCGlm8mGgKsOkzcAQqKPPB8PZdWf+kBtg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iGyiysZaKCBmOuXzYgRBERUHlAa2VJBh2oUOIDJClw=;
 b=xwad14PZPxG7zTCQxP9DYy3RzTXJFlovDgf8MubFZkidQIRsdHm+wsHCbvi4WbuLHqYuMZTiZRlnKsLCftaX9+Rli6rphmhni1vEVrLs/wrRZVs6wPiozX6zuVRT0xcBXr+3WEGh6P+cZ/ktSdjJJSQlOIIzyC8v2p7lnpNZvgkQE13Pc5NmsobBBjdCeAcyk4pkmzCC8O4VZNjuNcWCC9dsqI3Yxj2CmtnU9oHbEmlfamFBpanMS1RsCfGwoD+jkJF9Pfatg+x+cABWgzagdpX604ivMSnDgwY7r1Og3YRdqyhCo5vRL/QesCkgQIMlhPlXJAcUfgWQ7RmKTqwJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iGyiysZaKCBmOuXzYgRBERUHlAa2VJBh2oUOIDJClw=;
 b=h3qhTb1+wNUMAgr6fs9s+VZm3ecs+owmmGKhqsatAyCAK+nr/samlblNVAcwJITQU46rrFDfMsYRLnkON0MgVT0/HhI/dLp8uMcXb9r4ca/7ZqaNzn70ciVDMa/J9G+fgRg1r8VIDIZxXeucCi8dJCDBEXXC9lA01MiOTpySRUA=
Received: from SY6PR01CA0135.ausprd01.prod.outlook.com (2603:10c6:10:1b9::17)
 by TYWPR01MB11963.jpnprd01.prod.outlook.com (2603:1096:400:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:16:03 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:10c6:10:1b9:cafe::24) by SY6PR01CA0135.outlook.office365.com
 (2603:10c6:10:1b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 09:16:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:16:01 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 1BEEF3000276;
	Tue, 20 Oct 2026 18:15:54 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:15:01 +0100
Subject: [PATCH 7/8] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-7-30a47f25e515@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=1580;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=tbhxNFUNCKR8ngWpy93hxpyKrC7Wl4u89qQjBTGcwcc=;
 b=Q2kOsYkhBEu6sk6i9sA6/LjrSIyMoZKA6XHuXVfooWr8uQHoIUSHPKVCZzV3GD2wSPTerwiSi
 7iUULGqu/KHDEQr1kxMRoeJk7UvBWV5JuHhM2PO6qHJWOX/WbOnuu+n
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|TYWPR01MB11963:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4b518b-b32f-4393-d2a8-08df2e8ac2c3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|921020|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	O5q83eGf4adIL6E1YW1OCpVWQm2EhSwCMaRXlYuQsFdUj55yX3v5MrxAlsyCpRDdQOzT1BLCfNEIr0C4KYHrbeNfiKikdGqOtvTN593wIx3rHJMRpPt8lZRNJ8IDBUKdSmTGRIgNlrP5pGn+C0bdgKYFgS/UdwY3f8ZmWcrTNx7InpFAYsUM0Wwh5gisCjq68aQHsiA5wmdYz7LW4LmaNGX5gQZ8le76pPzoNnuTRtoWjGr1NOT+IELHOUUn08Pz26XNp6KHpTdP6EQxhh9CVRgNsWa02tiIOR0vydik8/acurO52Nv6adn9QEErP/zixxbKqkudI/AmC3RrUjsYmBZruEgXSWfqsAu1N5o5p6gWivb2ZRToY61lYwRBEsRVusn41fE79tFEbjWqFiMhUupRTO5krubPgVO+2/aUg0hEa/rlZaKh+rOz8eI4AFR0nrChKeGf/DZONeMPHGA7D4syTqWdX2Tbqknsqrqja4p24pAEOsPOke3pCNB7Pkt7XbIj0cZAow3049aNzvUy+mbCpZc9SZ2Y0NGpyqBFLhdiz/xxAO+jO8HyVfoVNBbcqzDmCk+xa5tZPpX1ig6fHr//9dN9RL0Q5X9XO0EluohsODp9f/VZpOvtEhFVmZ/bCv0zkuaz+DgBv+86Wh/Ea3R5IM8gaWJaXigFJ2YDBfXrprr/dyjTbYhp8D7+/ksPDCNsLkI8S570q7wWemBuGX1keEHaDGT4Zka7ky5Ywedf5Um9tKZt3EJ3itV94h8U
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(921020)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7A5BVJgIwlh69DwIu2lhVyhskFBRN9krweCueaZSfzLQDS2EEE9C8XOezkJUB4LshGMnzdHWqQh8cE9/RXDsolwI9aivKgbwnt8rG09HMbMoG/DUYDLPISMOieaJ6gXQ/Jr0Pl1FR/c4ql7OqQUShYXMVo8Bp91fZK8qwT/9grS/GHtEsXK56uUVqCc/oyb6o650Tq7cd/ZKV/n5QY/kEihLtvnGovxCMaFEM7akhUDE6up4Zd6TP3fyah9URJnh9gY9uSgkOONG4imsMBpeB8Cr5/ok6TW3nUiNPE8nohnStgjWd0Y0HlDyBUs3pg+WTN/lcUXXV5yahZIBzy1kej+5gv497NziW29gfi3WqZIdOM0aTo/lQFzzpunYS9vE6nvoQp0gYv74HgLnzmv7xUrfG1GzcIXlYEZQW4x1EBCyQh586kOHqEo3qZWCpbY+
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:16:01.7380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4b518b-b32f-4393-d2a8-08df2e8ac2c3
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11963

The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
pin controller provides a register to select between these two options.
On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
the Renesas RZ/G2L pin controller driver to allow selecting the I3C
power source on RZ/G3L SoC.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f73d273df362..192da9f9a55d 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2431,7 +2431,8 @@ static const char * const rzg3l_gpio_names[] = {
 static const u64 r9a08g046_gpio_configs[] = {
 	0x0,
 	0x0,
-	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN),	/* P2 */
+	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN |
+				      PIN_CFG_IO_VMC_I3C),		/* P2 */
 	RZG2L_GPIO_PORT_PACK(7, 0x23, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P3 */
 	0x0,
 	RZG2L_GPIO_PORT_PACK(7, 0x25, RZG3L_MPXED_PIN_FUNCS_POC(A, ISO)), /* P5 */
@@ -3933,10 +3934,12 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.sd_ch2 = 0x3024,
 		.eth_poc = 0x3010,
+		.i3c_set = 0x301c,
 		.oen = 0x3018,
 		.other_poc = 0x3028,
 	},
 	.masks = {
+		.i3c_set_poc = BIT(2),
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
 		.other_poc_pvdd1833_oth_iso_poc = BIT(1),
 		.other_poc_wdtovf_n_poc = BIT(2),

-- 
2.56.0

