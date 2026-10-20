Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487729;
	b=NCkpYPWl1+tlIlM1/aQ21Nrv4Mo3dQj0KK1udk5gu/yom1Ws/kWX0qkGGCw7K4E//MRx
	 LvRGTQDgyxdNrK/Q8E0tYFtpOjU0sManU8wp0HtcCqj6m6pYa5S1JkgWXG63Ki1MdjwuP
	 LIGRQSsF4/tOmBGJmC4YwRXJfj0pV2B8zDuljvVO7UbfeGdKiGrqpaaP+j1YJWfq0U4Wt
	 XX9uNZHYH68oFJS2c8G20vnnTiG1hfGnYrSecSK45XrQSHJhWom3/wg0aSLoDpvKS5a8t
	 MhPoqFZvYtTiFZ3OHXRVibY0IW9etCZYQRDxITEnTNIgeSQbd8eodNWK3qFTrTqQkVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487729;
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
	bh=NH+QGx0wGthKAS/WdE79a2UfZb5IxKaHJ0yio++Y+LY=;
	b=KSXu/z5s4vVBHdHjJEU/ip5zBsuQOmdrKlqFYRx4p8pViGzi9rnhMyn2AqahYyp/nxgr
	 3jgASxo95RN0XTadA3nJSMERgKk124JimmmBNU1iskx9z5QG7YyZqUz8tdl2ePyKU0YoY
	 muPLv5RWNzYh1zBIDVCFqdJxnh5KUl742Qj4wuEmfcsyqd/ccAytb74OPboO9HAryes/s
	 U+URfdtWUYXGVNvKE1IzWO6Eccwh2WMSLS1yOdyDPgs2yh9aIllhLG4ZQg0rYHh5gQYt7
	 HqN0PXHOFgUFUjoW8qtUS9djcZY8xxUkjRcooumClvqU4sEswBXdFg55loGMaMsi8gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="YGL//roJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.70
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380FE606A334;
	Tue, 20 Oct 2026 09:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 380FE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=YGL//roJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swMZTDQvWyiMAX5HhxoE7ipokuS2as5qx1iWk8XmXQGkp7L1IlcaoYwlTB94rQebOo2Ug83wQ0TL/3Ia5Z9bza4ltMFvDyB9JKbf26msp9e49gRfVRnsjtqt8klbfiSe6B1TG4G9LA+ICD3WEZUI+rp+iUOIBKWECGiu9Ro+JIQjjzoU8WYscetpzXsDsErqXuXUHnYaxK4sXe0n2ADD4GXh8usXGiS0yeVAuoijF1TSqBeEAEyAaYZr6fXZD9Hdi0siXn+Pvu7nP16zUpKRk8N3u2g0PZ6qb/EhVOvbv9JauCxblI5Kh6A2L9u1YZMoI6poi5MW2hp3RNlTAG+B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NH+QGx0wGthKAS/WdE79a2UfZb5IxKaHJ0yio++Y+LY=;
 b=yKj2eF2CN7tryTc6NpcmK3lZvGfXpR2DhWGS66Ej5rqQqrJvEzSV02ETgXCQMfOOAhYteSNWsXBCsxc05KLG5h47CMewpeFNHNNDWreFWf0I2T/JbjsBuRvIl2QNDr6ZfLdxKTzaDA74lpph4PdLarQgMYzj9giRZm8E8cKb1SYph/0ljzvDM45tA7N7XnG+V0Kb/KoKhqfDGE2CptRU99bN70JntJryowneaQJnH7tf+s7jbk2yLhh9Vk5m95OHGxcj432J3jBtEQ73+8JMneSRHsrDO3FxSMAX/IDBMYSXl4e5ycWcNeX6UsPk0ZsurxM2te5Ve0XhpuGj2xRmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH+QGx0wGthKAS/WdE79a2UfZb5IxKaHJ0yio++Y+LY=;
 b=YGL//roJfxpzjB8EGskCXVE4kEnM6WMo83+dMgr0x8IzuTzMfKvJpo4cQfUBpuVi2ex5kMtwDH5TULZkUVcC05Cau+Qbs83oygj31kJGBW8i8Ef4JLcLeRqccW16hyosIVaqWoVAPAQUBpcfhOzM0CQ677KTsGktHcD6hf1OpnY=
Received: from TY4PR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405:26e::8)
 by TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:15:25 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26e:cafe::72) by TY4PR01CA0005.outlook.office365.com
 (2603:1096:405:26e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:15:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:15:25 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 700133000276;
	Tue, 20 Oct 2026 18:15:18 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:14:56 +0100
Subject: [PATCH 2/8] i3c: renesas: Drop comma after OF match table sentinel
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
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=796;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=sDBd76AGNOnOLbeDN4wvOjDiA35G1W9kveo/8FoUMFM=;
 b=lCwlzH6idYlG0XUGdnC/epHH+lGZJywOa11h3xf8mJaxSmiv6foZ2UUU+gCPfXZEhnL7EojFa
 IramzAUi+LvAIHUDce1kO5m9MRt8fHRxg8iP/UZM1tJ9hutsA/U6MA1
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|TYWPR01MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7ee5dc-6dc9-49f3-3466-08df2e8aacf8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|921020|56012099006|261009221227099003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vkKkbJGYs8qHGhJLKkFg9HwzfDZyMoJGJyEc87twhX/ymC6blXoDhNnlFbba/2Jq92gfuVIRJbeaMU0/fz0HVkxbL33cooGAAwU8nWr9++iss8m0MuCxXfPBQVZh6IE6pZKNtXFkYQ1xFT4BwtPK+aPN9Gw+LoizKdwFLk/sTQy93+N8GsKpEtujvQeGMDoYoidgtS30OnPCyQ2wsgvgtbCM3+Zk66mp8jc9HVFTNkvRj53nq2g+Uad95s+sceoAGP2cgmhCNAQAKsUY/0DmQJaFj9SMQlXdQBUsGjkJYqBbLSefAhtOFGZacrcYGECRZf7o+eAkSl+KpYpmhJWolc5UmSelHMR/9pabSqEAN3E0h9CDuFrfytP8R5ZjOh2NOoagRXQWhVZ2O/2uUzdaIFh9ectTHQKtEyAPMeocn9E9YgB4XoE7ytJNbgGWMeE3bPLjhIPe2N7Q9dV02Mjfj3zhEo7iw7UfZ0+RkjfUScwGsqgg9nirkjO6FFfRDaAl4OuNGkckAb32LiNvYcuWzf1zL337gJwxZQ8DVTKoEr0ml6JzGMwQX7W67J5YA0iKUTfh2boBdh33fOh796ryS+1G+g74yKeUsn/YgYFi/DNrnWt6tFBr7kSdodNPviCHXgIaN++WGTMfkzPKBUHZTaJag69noLktupPSk+Nvc69YUF16SzygkGIijKSW6H4MOMSQChL4nexcc+795B16YV7a4zYwPbLbHu8fETO+fEMkWna/fbTP89pK3QaDdIam
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(921020)(56012099006)(261009221227099003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hdWy04KuGK5iWi5I8No/I+249xTMmZHQSpAOYS50y6lbHAIxQpqcwlmFxl8VcBzICMgp/t9XYyswcwBK5cUaOKuEIml1LdwEXcfF4Omu5YfSy5HhBOBzNx0MXInxe8MDB1c01idzkgm745VUi7FflKVl2DL+F4MBW0yNMvEmHbkXQmB6O50N52cCBgiLk4BOLBjrQOR+GHNODcuyjDUL6YZxyabL14CucX4mHjWYmW26Pe4+VIO454a3MZiS503jQJhlGywpSZPp6tmd9/3qkGLJ1ry7kws0vkqpwuuyuauPw5TpfuRNqAyvMdN0oZ2pKnjEpXaBuQOcx43WfgsBmqwKrcYULU651xDthAslzI4rlANPp8EuzK05ohMRpXjMyWNPjqyYBCSoJMH5y18vVLLIpOxXSVC/KuAzkLOcuW8YPgm3eygHwvyuef6j1VFZ
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:15:25.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7ee5dc-6dc9-49f3-3466-08df2e8aacf8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8775

Drop the unnecessary terminator comma on the compatible table.
No functional changes intended.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1fa115bdab6b..4fddc1b4fdbb 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1626,7 +1626,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
 

-- 
2.56.0

