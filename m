Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487770;
	b=BAz9fkFuN0MXzrWcYmb+wWwisT+tPlunTC1lgqPVQanUHiqZrSPwE/OeSDsTLf+mkYXf
	 y8t2GFZap+EWVYJBWN9HxiK5fbyfa9DK2oDXyEX54pgv43vgMzTd8VSDv+XMag8Jyq9FL
	 cYdd4S8pbdK1rNMbWojgN5I2uCfYt00FQdjGxFo4zAeXHX5/IiYx4UyPemHqI7BIZSXK9
	 WSSAyNXCJg352U5rBVx0N9MyXymqlBvT1iTlgFrNgkuRcRCofI8qTBD0WG4fN315PWT/g
	 /3/jnU3+gpzgmYAjs/HEks/xXpfiWojesoHEUXorTxYWR7iOEu/Q2QkxeBNylz63OBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487770;
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
	bh=bZzOn36/p4Sb8ty4X49VOmTzaKipBcBNakVoqmFsSjc=;
	b=kpjYjBgf1UstiZkCOzTrUobOpHb10InWTWCpJEfVPPGtNGf/3xW1yFPLlhAbvl4OPBZy
	 z4adLYpfTvLx5Sy8kqPuIn9SjzpDS5LDAOC0LkvPGxEursGsBBx6KIwFPoHwGAZlhqRJ/
	 v1VPZpxa0ZYAl6j75WO1fa06DX8GVb4KmV+FcBmSpz00n3K+/xSc+tw9Jq5+xrQ9PyUsd
	 JSIPXDeLPTQ+lFURDbu+/yZa/R3Ph1hROfjo1GJv+y54PYjsBKn85CsFHhLTBNvOoK5tB
	 4yIYkvqzgAhm38dhMmAiYPBuU+yCGYN1IMgFLAF3QSo4rNyQJxe8V3whR49nT2+1WRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a3HqN3oX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.52
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D31606A329;
	Tue, 20 Oct 2026 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D31606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a3HqN3oX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sf7BgBqBfMk8SV48mdyTI1huHDkOV5hK1qTxQhm6t1BkIy+EnnQf0Ocd9aUtl8hx3QUxkLZQwFNS37BSNeLETgli6rnGODMT99vA+0b4SjSbgHA+VoCqVZ6u5eGUb2Nc7IT6PAqpNYbWu7ATfRXoJETCcVgkiHSn+SiEYdPgPPDzOm9z8dzuxsVnUD+9Lo56dui5MWaEnGSA3xfNQFCiAZQtfh2Lq07cSo4L8k/eM3Ofk8BBgZY12kz+Ldq9ulaTRgSNt/AFrMbkOKXlQmFM00UlRxRAVEGlMVORe7OTspHEDeHFOvwk7B3HWIMJ8zoNl9IyLmHxIdqsXwbjsHvgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZzOn36/p4Sb8ty4X49VOmTzaKipBcBNakVoqmFsSjc=;
 b=q0+RLH329PV8XkcT4WM8r7b15hETnHeHIaafpex3qtRRe7QIZcIrdVn/EG6CWWnjomXqO5bOHSe4IxgGONoIMW8JgQ9m5VEUX/CMGPFRICZG7G0NFpi9XBoYWNZvEN0qRZ/DVroeDU4uo+Vfb1Qvxb7NTVJSIBAg5E4rYi5cRpApS/KKOUaV6S9CcXXM/VlAcz5xx5fZgZkKq6GJtSzWrJftpVT6C/sQosY2BmDur5jnS7WRha1YWEY2hLyrzkYpA2Hp5sUiwsrA4njETHPQHXI/hD9JCcDRTCBtCyHowJjtXKhcZBBLqaZdUf0HKzVrfrndVQfj97yvzma/sGEWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZzOn36/p4Sb8ty4X49VOmTzaKipBcBNakVoqmFsSjc=;
 b=a3HqN3oXLWS9YyHtO4yWeNDl7TYsPoZ8XbcQYmAskUbnkhz24CSVqhzUTQCCgvIG1/DqYvl9RvWBzjdPe73cxUGh/Zub4t3uSLHH2ToA5FnJDZMseZkOSe2cHClqaH52ZScUsQk6xHpRB0K5C955NKFQ7XmjRtDqp5mtqmXd9Uo=
Received: from PN4PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:266::16)
 by OS3PR01MB9833.jpnprd01.prod.outlook.com (2603:1096:604:1eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:55 +0000
Received: from OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:c01:266:cafe::5c) by PN4PR01CA0111.outlook.office365.com
 (2603:1096:c01:266::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 09:15:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D213.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 20 Oct 2026 09:15:54 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id CE4B03000274;
	Tue, 20 Oct 2026 18:15:47 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:15:00 +0100
Subject: [PATCH 6/8] pinctrl: renesas: rzg2l: Split SoC-specific masks in
 struct rzg2l_register_masks
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
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-6-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=1838;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=CDeb1CJCC0Vsr6riXKFKBKBPCOPr9AB+2PPgnhx2P3I=;
 b=nM7L4jFsp/4e/JBk07KBChVNsJVmTFh0m16RvAs3/P9hEbHX8jeimyB9vT1N7VUy8TRSoLRqo
 IYsVit0SwS0CHww1PFahXwXgfIN9mYaN0XsilLONMaghjD6KGQxlM2P
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D213:EE_|OS3PR01MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b7bbfc-da9a-48f0-3aa7-08df2e8abe79
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|921020|22082099003|18002099003|10067099003|3023799007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	srkuPyhtGob58C403OX2kt8SIMohEGHTVXEY5fv4tilIh4+biRxV1MekYbFzXByulrjpQAXdmnnJOaI+k+YFQbW5ozbStBNMxOKzhDJc1vK8BqXdB5IoYgCtJfBZlWDg/FAAiC8l9W0Az6rDrLZ5uAKge25/saQpp+gDzwQSS6kFLXsbrf/B8e9GLbSahcBFYJxjdaxZBD72eqb9980o4RAifHmZw8+nBINQIK2EX8zk4rQ0bEkSIDJMkUTb9mj5bN3mGUYYLnl9K+BINx6usKb7GTK9W7ffaTAEOUoLzRfx46WGuFfuq7OQRib65FhZJiOPJJfntMd/Q0pu9YmA/Ixo63XZNd1pn/l6ItXKY2cMzR/MqivtSbxAAcfN7CSutmu5IE/RFGFEQN4+iiHSDixpiyyocc61W7i4jHtHXuOcNNz6sS0By8wzf9mCNv6qQ+pQHtIFC37xVVitpVwS+9G57V9WAUtHGG2e82k5TvoZYBplNRC6hhbXswB8e4IyVMmebCflhS/kVNXfZK99kth6P0K0cdwgovKYaAS/gyZ16xa8ZzndHLlaIhUQOeeHAXT4tyU73gf213IHzs5Os4ZI5pH4D/HPe4PmnEZ/adtI9w4BqPudDl6K1yGopKdCTJ2M5J0s2h+wlQBcsmt4xbQmadoirE9ismY/2CAizidps5JuDh/tZEkqRMO8Gj/JKn5cMgPNYzgH+VDWU1TYuzX8a1A0po2b9qkybPA+nCYnX/ddKTFwO+LBCKuKnAHz
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(10067099003)(3023799007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+64yicCkc3jBk+152QOS/O1epJg8Fdd3qErkcpt17z/yrbFhNxnIJjZJzVH9azhj82eKw62xZJedogt8G4iEC8zMQV0L8SlChgMmQGldimH2h7Hp53nyFTNXTMoNHnVXjug7cSkfq2/9RuaTQPv8s27fgv7CijKTSd6Ht4uDJbUZW6P/deQ2OB+ttunl2EKbkPSyq+m3Te4i/KR2LdIx/UopQ3bWudsGms6WS9m3DTb97uQL+THWIDn04PAgmgmygQcog1DFz537bF+Mx/AKv5G0J1hVWyPhHYunBiSwRoB81XXqZ0tDi0a3iiXy4BDQaRUdXu/Y1ikHs+YUJHtlJ/3kzuRnr4pxKH5GIM/gbuPU8YIlx4WrI5QD8rYNGyMIovjGbKeylg0LAJvd0lsNtnij8X0i53fyH6wWrQIoU1a5bgH85Vc0jHfs0EqOTFNe
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:54.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b7bbfc-da9a-48f0-3aa7-08df2e8abe79
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9833

struct rzg2l_register_masks declares the masks of the OTHER_POC register
of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
anonymous union. As both branches share the same storage, initializing both
other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
designated initializers override each other, ending up with the I3C_SET_POC
value in the PVDD1833_OTH_AWO_POC mask.

Split the union into a common area, for masks shared by multiple SoCs, and
per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. This
way every mask gets its own member, and new SoCs can be described by
adding their own struct (possibly inside a union).

The existing RZ/G3S data only initializes i3c_set_poc, so it is not
affected by this change.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9bf3743dc1ce..f73d273df362 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
  * @i3c_set_poc: I3C_SET_POC mask
  */
 struct rzg2l_register_masks {
-	union {
-		/* RZ/G3L masks */
-		struct {
-			u8 other_poc_pvdd1833_oth_awo_poc;
-			u8 other_poc_pvdd1833_oth_iso_poc;
-			u8 other_poc_wdtovf_n_poc;
-		};
-
-		/* RZ/G3S masks */
-		struct {
-			u8 i3c_set_poc;
-		};
+	/* Masks common to multiple SoCs */
+	u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */
+
+	/* RZ/G3L masks */
+	struct {
+		u8 other_poc_pvdd1833_oth_awo_poc;
+		u8 other_poc_pvdd1833_oth_iso_poc;
+		u8 other_poc_wdtovf_n_poc;
 	};
 };
 

-- 
2.56.0

