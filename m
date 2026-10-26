Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014587;
	b=LmWRNuI9h9y6aKYKmYZ5zus8/oHND31xeiUNS/1r0tHcS4FbQQEniotcOSGAqNvOOVbN
	 r4Z7mqNG1hgqI4VPOzorRmTIFrWL2qPeml4oVdKmW5RWeVX0ZFHrVk5EGIIQLwwLUwIz+
	 Tv3SfeiuVflHOYgkgMinzyHU9m1wT6+dsscLPiQh/fnVCoZ8JAMh9dEk79xz9+KqnQzMJ
	 VvDM051gqMLlF29eG/vGQT+03braLz5eGtnyjT+jZbXTC2oQNXvyClZikvnHuAD3ROhnD
	 5bX29f588QFzWFYqRdBlyOmaaQcCyRW3PzbwDlMuweAiTBjPIjwfQ9JjwqXUW9pdE0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014587;
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
	bh=h1pxCodCJkJ1zpUJbLHVTBbrHC4uA26plJ9ZtmqraWU=;
	b=W5J69SCPVinZPNouHG+TfpCXDF8REUJrfH8wkNKHa8F0XwCa76KJNXcvPTJxP4bXn2Gk
	 O2YtTf4y2oRGlZHQmsBBQ47QTP5qw3yWxvTcDIBsxHV3bhy7RFHB0M0hNeQDt1IS8XJHl
	 AWzvr/RZFClYjAA2/isjeBf59vKjcecTYH35KHZsB/68kV2Y3hMk53GJWd6hPOWOg0mRu
	 pL79vEjRCi+srn2aT/4vf08Sb0kCvytC+dTfVycZbqfzJbN951CCY/Lxx05SssG34f0E0
	 30ow+mQCxQVN2F6WOgL5+5iQ0nZKeQSm8lN76LbgzbW9V9MRJpWfWwpRHkcOX94h6Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=GRUSIYim;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.6
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D741606A31D;
	Mon, 26 Oct 2026 11:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D741606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=GRUSIYim
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjvqEFjpOg4fPC2Ugo1JiUm4rx3N6c/88Y+H5xWmrMV1+dThRpNVAqopW6I4+YXnIwIut/dkudOqFrB2YPwJG2Miw5g3kdyJewEkvKA9BA5+Xny3MkiZkH31vzjWHXaqTDLnzdm6O3+87jpFYU6uUsYxcHMCbubQ4JVkggiYzsC29TeZyP0vNmxsRFnauvIpLz/Q43p5VZlgpgNVIDqVRFNt2wOpVTNZu0gWlOQUt508FqSL3pxle8q4+6VvnKKf7VS1IPryiXqXf9Kv0u6s2GEh02sexahHSL5NaREiKaH4HyjBFI86jeRhu69zwWXs7hxDNDvBy6r6JIC6DZac7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1pxCodCJkJ1zpUJbLHVTBbrHC4uA26plJ9ZtmqraWU=;
 b=Gs0h4IRhoN17fE20PvtI0ceQtHXzLZbX8JBnL8tLl6JMNmL+yOP/41vt83dXySfXH5vFtkIc692hWzk0r56WelSCiXd/ILTFZ7GGrYSn6BKDZEWfO9uSzFY2eo91y8kRoUQZ8LbsviMPHD9JANyhk+/J6WVIPG25uhfcHDP3TnleZ/kJuQRAZzMhKoNjoqvpXe4jgTELjdVxkf4ZztHZzcotnwT2pow3YKnk4du8ixv+wRbAj++vO3P5q3Q1379q6tIfykyrVoc2aKTmmqq99jBdr+VIMcTnh1JYdTvBRV0uQQQM5c88BneQIsUU4FlVblBmxQvHRo8SVSOZOjCSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1pxCodCJkJ1zpUJbLHVTBbrHC4uA26plJ9ZtmqraWU=;
 b=GRUSIYimzFe6TFenxmzE9ZN5ed3p6y6usQqoNgf5aQjr/q6WIVEpfaQfVXJ5b2IasXf51BeUc0J0GQaI7Yn4HQjT0JYuZZJrYEIRmPAzdG93idk10SOc0aO+5+/alG843U/2TEt/BVgGzx+lTRccDSb/rRwYAUXd2yjvBK45O34=
Received: from TY4P286CA0058.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:371::16)
 by OSAPR01MB7279.jpnprd01.prod.outlook.com (2603:1096:604:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:36:17 +0000
Received: from TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371:cafe::5b) by TY4P286CA0058.outlook.office365.com
 (2603:1096:405:371::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:36:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005624.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:36:16 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 280003000253;
	Mon, 26 Oct 2026 20:36:08 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:45 +0000
Subject: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
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
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=970;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=Yfo90mbAJFlxo5BL6tK9lm4HFGc2m7/X8/TmcGUVQqU=;
 b=DyOGwIA7lWY8WFqxFZDGI3FP3rcoVLBnNh9j0g18Q6S5SSlYyYzIjcqJWXcbirb0rS1ktUYLO
 0AX1fh3cMsIBsnadmfu/JeSVkZLGARdPv11wSQOIk02UyFM5nMctkmV
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005624:EE_|OSAPR01MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 59dc2c38-9bac-4ac4-f8e2-08df335558eb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|7416014|376014|82310400026|261009221227099003|261009223027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|56012099006|22082099003|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	UHLW9Db4nNc2GBJUe68VtdCLJ1sZres0NMK7DEw8R/QITEHvPTr//AzXzm8JnaLdtQFJ4XeYtJK0OjqL7A8Cbv8rShTo52vnukd+qSMrXPokeISzlEYL4I6/gWPETYjbFFg1bkpjXCjU4qachjmw/QdKb7ui2Mxs4znbQlvZ29ZmIfp8pqAXMPYwq1xtYmA/MryWt7/WkueRWRU4ND8G7e5hwufe2JDrGIkemIqvEBrWUU60OgCjh3JtD6V0VKAm8PnZRn7JwiEjguwDwGnKBwcVf+SxB/pUmSISeQWlU5DOZUnqztZKV9p4X7Nc8DeYlPrjOASypQNb/bs+ywB7Wp1isOGuGlGn+qvgFUcdyEAd88a7pbxv7GKwhw1Ytm7HJUSGKca3/hjUsP8tSgy219QbMdZxNWmAFOBbhLb8IolblOhx2aAwFcFE/VEvmyhaNImSIQU/epzZ6nFECHF18b6dhh5+vo9lK9r9ev2fV4ZMHoDmuAJ7o7zUxnQfD3XVPZVn/lHkrsCcYQyrBpQ5prhvDa/Tw+RMMXQaQk1PxTiqhAQsa4uEVcrnTLN1JGPmxNp0dTCkVFEp3XNaVH5xIgMF5ae2JQdd3mVNO0q/lLOrONeb+a/b8N1J4FX5DMnmlGDc2A1800FDLg+dmb1VV2IvYNSnu/WZUGY+F3vVa17RQViWywpiKChBsQ8oWejA2XK2c3RplE016+V4GmxbKj5B8C+jVSXMxcJHR7c7wnhF6YCo9GiyqK53/TxM/p/4
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(7416014)(376014)(82310400026)(261009221227099003)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jhCc5KDKpljF/qmNuPbr6LPJKR7GyPmIqyNTSUgh56N7E0wmwjQRbW3jYIoL1/obBbOm/sKh9I/ywXAixzxHlfNrd1Izw5eh6x4aYQH3HZEPqIDwgnsdNsEEFd8vJgk8p79qV8uaRuwqnK9rA0ZHH0GviREvq3csGdyXB18zJTei53uIt409Ur7XjcZv7JhBRjeDbGu0uetTkCqFM+ZJ+TdBFvipZ0jyFtYIe83V1S1W38wtkUweQuNnzwDsa6rhUpZTIdml7yPO8lm0QRro4fVpAEeHxncrkwIs5yNdQ7VRpzJy8nY4ZmoS8IsWC7mZIUfC2IoYbAuQ+XKg5mzGG/eeErWsL9DIFwphInfjg+J8k832KQMYuwy++R1DX5hWFQuSOHrlelBfb49OoHWvtUIlSr85Zk/OEPo/Qom4pQyrVIUKFjRM1qOBpGVo2Ols
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:36:16.6496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59dc2c38-9bac-4ac4-f8e2-08df335558eb
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7279

Drop the unnecessary terminator comma on the compatible table.
No functional changes intended.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
 - Picked up R-b from Wolfram Sang and Frank Li
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 78d0a2c4a19e..fe4e557e5b9c 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1623,7 +1623,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
 

-- 
2.56.0

