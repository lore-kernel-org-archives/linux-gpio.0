Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014609;
	b=N7mpQAA4jwFlIiAX/yUCMLlh6DebM+VZZ++u2xkid6to35vzL0i6+oKAQtXf7FZ6AFTg
	 qeVRPKE6azv8Yc0iTVABy+HWlvEzIl7j5BKI8sUKsS21MzhLlMlLXmDn43e5E8ldFfDHl
	 8DKc2/mUgEsr4qAYcPJ4eVi2pMnrhUf9kvr2RtyVYocJSwNjdnWpZ8zTtg+mGhuIdXh2J
	 aETTED6HNwgE96zbXZgmIhtIAflomWy9hrWt9IbjAuS/I2Wt94n1qo1qT7DbNWNVjBtKu
	 TWrb/jBg2F/vGo7VlI3NnHO7LMUdTb1dK0bcJgT9QdAYrNGbpyXJIfCPnOT4/5oEU0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014609;
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
	bh=bBq4ljD0JBjrOPYPos7Q6pP8UbqWlhgc2nYN2PIGiCM=;
	b=RemDPkVjGjiQaObJ24XZRYygGkCej3MdXRkpK/pcKV7yIxZ+pfxVyqRZTgARpRRX6QWQ
	 ps1ke5Xg2XW6jFGrdKw3PfQnkXdheHTRbgz5FQgoXyIrkki2HRiOcYC3djThSUJcV1GtR
	 mi4f5bYPJLqigo9Z8Xaneijm9BXdWH2fIx1Ak/bxUREqgp3TL2iGKDV73TaUMzBPhFmai
	 1Ve4SyOFLxY/XskkEUHPmz7ob7e1eBl1uVZV64AIgeVydhcoofAjPLsUM0FjO1PXfvvOq
	 w0feWX3ltoF861BzKktafCcbydnIhw2LAQ+vLr+dYQFMpgr1BM5tvv6ACiTkU6ruk1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UQ7Nhm46;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.52
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC2606A321;
	Mon, 26 Oct 2026 11:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AC2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UQ7Nhm46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COosIdVCSCDAIHRqx5amPyWaiw+FNSByv8jS7dTyd5OADClzjAbEaYtLU3mBc0JvmU5AZS5bHvlKDbe6bKQIZ15YHsXndCFWbm0cldTxvC4nwdxRfNWA6kmqsn8qDlKaei9fSmU+AthNtl7FjsH83aI/hxkrkVqaUDFEdGbR2+sbsp23WSzi2Wt1d+jR5aoL4rtCBpNUe8WSFVFJAypyuhWlEsi43Bl5T6PrIrVa8hUa5mZ0e0rCqSyRpHIcVN74Vy6RJ5q+PoS/nUi2mFhMdw8uUHX5Hh/eI78ZLdzeinS0qMwQJOl0IOHadRbffXNRUYI1/QeWEOEK5lbbW6WjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBq4ljD0JBjrOPYPos7Q6pP8UbqWlhgc2nYN2PIGiCM=;
 b=kXO5LL0C44pkoEvnnWtZaAa+Fe1DO3olxZfz9LbQCx82SmCqCxfnJyqGkcmaBnZxzOYp6QVOhv2RRZHb2fYcrNG0IJ/TPbpqbuQtw1hubyfxiwh2JlMwEYS0uiv7hqlvdTZalarX7A/UmHxFRdWGIK6jDXHVKzpm2xv0g+bSWGPunMasu5ZmcR+i2RB1XjuLaRra5XOCjKqe3dfFaLQ3IwHI56JjEiDivntmeEhy3pDSoX/wfdosiQIjEui34O0LhHwfmLXStnucNMIkCgXS/dBsuzIt7Rw0EKDeRyYlzfSNYIjS3TK0NFhN3nmQczpa8HZxxEPzQDBJssnONTvCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBq4ljD0JBjrOPYPos7Q6pP8UbqWlhgc2nYN2PIGiCM=;
 b=UQ7Nhm46qiijUbx79dHapDpleHwdMnI0MBus0TZaVbuZxCF4mdvSN5NALOpnRZgv/7tIEYReiNc26HLk2SCmSTk8w7GD2X2RXTeGsiqxCowZDtQjz9FsIH5bnNfGOWek8Z+8My6fZu7FWbe4KlW0dQ7p3kCoyo76fW7VUP96yTg=
Received: from TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:385::20)
 by TYCPR01MB7218.jpnprd01.prod.outlook.com (2603:1096:400:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:36:43 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385:cafe::2b) by TYCP286CA0207.outlook.office365.com
 (2603:1096:400:385::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:36:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:36:42 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A1EE23000278;
	Mon, 26 Oct 2026 20:36:34 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:48 +0000
Subject: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
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
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=1929;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=eEsbuMwbCmlwZj1kXhIWUry4TAcI2XXVkhanKObD2wY=;
 b=nOc37G8KQ1UO6gLTDtCaSHixo0hS3dmCMzpkqzBK4Ep8nT3CTizvsv5BVgALD1gVpj19gX+Jp
 mOMqTwou1WsDT+Ew/hmyCg7xDYPzvbuW2KAcU+bI47e9Q9+RukPrsoz
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|TYCPR01MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ba5a09-3cee-4ce1-50db-08df3355688c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|7416014|376014|82310400026|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006|3023799007|22082099003|18002099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	FCdxetM74CY48Ghv9Wb815RD8YHUg02L5YM1C2aSfpc89CYalGXDllbiRXZ1IiUFzo1wxkrZvD0d15Iiekhjv74w5he5q+QktHBv01m0BPKAekDUwVKujFxkuLHknUlz6cHwxm+U82VXGwLZrXHxcBCN6qhqIAth2tjnLoZjm7TYxDkYiHRzagbyn+gLTDimByS8zbZPT4qku8W7n6fytBqTxUal6KUp4ooQv/zbPJfDXxFSDL+6zm21B5IEC+CCRdPcwwdQfsXlgXU45m0+DNtsMnhsmw05nzuJZrtOn8bJL57M1086rrqnMeAJhUUkRw4QpZiE/Qsh4vwk3Zg9X7jg0CRX3f5+eOo3fyxm3CilhxTeLrQ6dmExvFhUcmCCR5smuGr9Kean0aUQINo7bWzsaly5catTjjq8rG3Tp1n6wU9Nc+nzw3ZHsb9K6IwSoxkpzNBYqJapiJgEERZYT+yTxhyBWHKJ51e+Ia8FPvVaDYq/+QTPGTR+4tSbQ7MNY7Xq6aRM4nIJCNL53rG06DuQMfKCZPNs2gk0TNtL0IsIRy+qygiskqLnxfkzK9HJLMbR/8tGbge8/5bCa+VOSpTGC2YMp979S3J1yk3B31aTXy6AKtVPl6ZJgeiiGMmOrbTt+OHc92gHBvG0hSBW2aIcH5HoEPj6bD/mrdSjirJ+jfqE+sn6ike8JdwzjwDjRYtK25ImbFPr9sB6Lf73HyS8XFZwk1dpT1qYYnqjml2J90jIVizEWvfUZhZlfVmV
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(7416014)(376014)(82310400026)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DXUvZMJ7ExI6tc8YA0vBa7Sq35pDDSCTZs8bv95m75aSOryYw1c/iNLKaX8pqyjZTiUL0tRoSivGTTCqcb4i7DST/DnaUH1KZPySLkm2NYkDEqWNs8JAZ1yQIwvldAnR3SmB/fXwqmWVudBNwxnCg8FV286odcsQJSaY6iNug8Di0nJncfWc5wPI3KJdWBwC+KsBncXU51cfzfyiYJtgDdwlBlgx/h96770ue0AwXLyeeWSLTHcuz5eVNO3Py03u8CZoRre8vL+8ciw1uXvDimYL3KBIgg7pVV3c1P1zTmcGimPr3q94GmvN+9rUlTn91VP4WmrBH4t+YefYeb7sNZ7+0iUT30vu+juNDIbOpQF/SfZbbPW3dZYNNDAABo6KH0Qsi+PGkiTYaK12TWr28vl7u32Rrn94jHn7/mMvxT6YVMClxvnYmkcWvVe5YDWz
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:36:42.8660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ba5a09-3cee-4ce1-50db-08df3355688c
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7218

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

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
 - No changes
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

