Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023130.outbound.protection.outlook.com [52.101.83.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD93EEAF9;
	Mon, 27 Jul 2026 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138230; cv=fail; b=gOHxOuj/plntTMXemCh884Bd9dmraY9n5PEtdbhySLFwa/3OO8rbs91bvpUyZU5aRuEWb/5uHfWGSxvqU4SvPG7RyzIzz8etMWJGGoeKVjLvJUWFX6x9rVpERi0ZQwj5FGlC1NbvOCo0zhLKdsHbSVYuGBygY+wqr429XAGabYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138230; c=relaxed/simple;
	bh=X+Cxyi+IreajQqKJVIWYQJcxujcfApHZTHC9/4IIMIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KsSROMqPu02LNPx4ErpK5YvR1Y5MQROJ7akoJhonaZ/Hs6LoZQLCGMSk2E6FWsh5tnBIJhORWOWGUPs1E0CoWyu1kkiwdDTOObr/NbQ9WKkOxdJBLxhJq7x0DUR8n6gLx4p+w/VqEmkvDaZR/vmIyV6p/VG+UPQ1+hJWJaSRhWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=C6OmHN5l; arc=fail smtp.client-ip=52.101.83.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="C6OmHN5l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vj9auTUXRuP2yV0+V14zMbiTrWavQ4BBx1/GL89SUMsf+5J80kf+kaH5DXojx0eqyg2IfJ3ghFwLE5KLBTjjQdITV+Z7Fa0GW6Ph2UEmQ/axbFUtOTDt9CZLyf8f91sccwRItgDROJDxuzwa0z+0s1/ipZeLhaEa4Agu+D+Mx/I9a2xEKkmmygbrJS8QWxFSTiTqShNjy84sT96dQJuYiwvnAuyrvQrTna6zHNuUDJ1rujS7uwZ5BCEHW2byjbTYpd9OFLUfLZi6JSQIuC3OWPlGQHD7M1lmKlLDy3bU38vK/nvEEmT1Hso9kH7OhB8bigP09+Zi+2XLJN97h+HLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgJGTH2Manqdb6l7SF0s2oZsQViWSq0iBsx9NKel4Tg=;
 b=xzbdCdEZ+H0eRUNrHA6RMifjyf+EP/Eqql2Ie+tOI6Pqyw9mFOaQ7S55ziMfmtYTgi38pE+xnpSeimr8FdLxGpAZdMI8i9+KM3nTbJwpNflxSTlYxh1Yl3+yuXmzBHRBw7CNzoMkTURBbUvHbNVHpDsM+G+8QKfckiCVMrhp9pBimaULMg1gSoiiRSWjGlHvths9ChHd28vrIl3DiXHfzPyUMzo6/RZTQHu3MqZCYDNWg6BiO6bVy5vJ2qEAwYROHPJImxCj5+TMiQ/xkprkqOm+2eR9MPdLeXQ5E1FEQgJY7txsyKtOgFGbX0nygcuCo0AES8frX0c2LJ/dkEOx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgJGTH2Manqdb6l7SF0s2oZsQViWSq0iBsx9NKel4Tg=;
 b=C6OmHN5l1kfQySwcw69C776pgMrtyY9AGl8s8V2oYLYn653+YtuOrCuntbOiwlY2K0JKzZMFTogFwKxjNk6xMjTxKhKvy2TI2Og3Jydsrl+99crcyV3kDq+0xGF3FbHEH8ESe2l0iQCmHMisF2oPIVEyC228mL2K8urcKlI3ZGIbsc0vYYkL13aROAluSpG+GdGWxS9l7UDOUlss4b73hA7BsdgiXeWQpl6OVK1tqF5uauguXvGi35pA8W/juSyfk2pGbt3lkBDoIqUz81xw6uC4dLbOJ8DF3RUoK4JW4J1mYTSCd7cLM5bVe/68yCYjkRj8N5SGg/i7vdhBq45I/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:38 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:38 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 27/34] dt-bindings: pinctrl: airoha: an7583: add pon_alt pin group
Date: Mon, 27 Jul 2026 10:42:27 +0300
Message-ID: <20260727074234.3761170-28-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 877f6737-e9ad-4ecb-c93a-08deebb2c58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	C8WMa164gfiwc3emaHQvpZ/wQPz7USSNHeXw9vrsZLLPhaChR1NSuc8Ok1WWI8i/EOXfl+cdVqzeFP+UFG8GdTcepYPYgsOP81Kvcj4gBF+hCWv/Def1W6ZX6382/KigVZpFzS1r0Zig4vtHwR6c0gTF3Zjeaqu4gC+gnBcGnAbtnRBqCZG1vzE5fmHzHXQPkLfqwm94JhfTLzRQgQIeGWJ5mzTzxGdyRS+8nIQiQUb0WfroUrna1tp9WgwKRB1lc1gYKBNR1gxlUWCXRDaiLQkosMIDEWkB1BM9AiOUXNK0zX2we4Pa5C0gZhKi5r5XsZfxwBCJIfcRmwo0XLHzG1oLC+F0kozF8igVELWyhDtqPxAdj2w9gYO7inP0P9WKQ2Scl8wR0rzvWRtaI12mNjw7rjmwLDCctR+s57ocBWUf68H44RsjVEIDBFUhGIse0ftxjJef7qx1OBkZv+88t1OJEYDyu4pHb3cIYcWiNsE6qF3Q6ij4DtVZzwcjGdd/dKQ7idX/VepI+CYDb59NfEwu0g9bwqIVJZ4ZTu2wXIOGNl0R76xXcU7GuWWh99CmIsexgMpL7aqOj7U8W11pCigYLCEULQPQ2wiCAZPWD5daq035SpJtilS3DN+4TeqMIA7Qz9Qzm2VwyJdJcf06qL0ndn0qIEX3hKbSid53s1AmQ/BrkI8qZKMUD3FwuigXoVqkV+K7qdxaUuS7vs4L63rfKlSSWov2gOscxYuFXfrDVN/6Npb88sW59eRL7WL6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYyQzlQPf832fM4wPFiAbY6KnlgRUAoRUeydrPmFqaEHbJ5aMeFde1JDWHH6?=
 =?us-ascii?Q?QSxXv4aJfgGkl6ejTl+QwWfPFt/9RA6IQqv0R9BaK109Vi14F+S5cm7+FMVq?=
 =?us-ascii?Q?AcyJj/Ymm+PkaQaMf45eZocm6g63RTvsemia8APqAex8kLd4A1OqPYpyL4KH?=
 =?us-ascii?Q?/zSipUUNBq0khrobaKq0cHPGYP3YBVwgLr7yRtdnH07lxDgfzgo5TLtSPxX+?=
 =?us-ascii?Q?BNwxCfVdzYes/4wR7Lt8t3UIDDcLnKzFmFtikAwYSckiAGO876EQwUy+MG6t?=
 =?us-ascii?Q?Wy9oLeJ9Q4IlsxyAvfWQQ73FSSN4T9mxfmBZLcs893GdxwCIX2q8eUrViqct?=
 =?us-ascii?Q?msTS1xm9wzVi2rgVUxC2pGBuT388EjAzDaDfrcXXIN6r4dsW9eigZfZI+x8c?=
 =?us-ascii?Q?Sk3bjcBlSZFdFUEiNbm4dAUBA/4L7cyCBIMqnwtMDRANn00yYJUl80iRPHkF?=
 =?us-ascii?Q?6s6/Q8l9dlMy6pIzQL74LstunOXNpEriYi24E3K+VISOF1XVuOfnhcR0som2?=
 =?us-ascii?Q?4F2JEFnULr3s4Jh//kdxhHzjMLnpKApeWVARy4clz80M2CazHDtdVFpN0bF7?=
 =?us-ascii?Q?39mTd9NM3gr4lI+xyDnzvBaL56ur3eFyKXpLDHq88RV1Nh2rAtSU6jjWAlxk?=
 =?us-ascii?Q?UC6IvsEbmesoZ88VclPMDdPO6BTNgg5h3vgS6rsKOJxcF6NiC+CFvmoWfKgI?=
 =?us-ascii?Q?7ttrsw5ZFuoX+kzA+CfqMne5N9q/bjFqA/a/Z6mtP1l4IYd1uFXEMrOBMsMS?=
 =?us-ascii?Q?Gkete+UMFG0kqvHqHpjjbWhUkF/MIsRBf3oaN52PUV0m7pSUhjGl+wKsJAR7?=
 =?us-ascii?Q?VDr1pTFqLaeC5w87gufpbwsEmZg/cqqovZiI8asjHvNEIAK81+ac40EfY7Qt?=
 =?us-ascii?Q?7GxrunQ7nGZ7Xp8RCbb7GLWb6J1V/5kSTQbAQfcYe0+6jl1H/Yesll1nMX1C?=
 =?us-ascii?Q?tj8lE6c8nLLQvlHACfJYCwe58FwFpbzC7Ut++9NDHPCHEMQHoakx7Z/OLnKz?=
 =?us-ascii?Q?7elqySCZbXdo5j3HWN7OEn5lmMKhuJMcX6nG2h1MMfcGCQtsC5eTvoNuXszb?=
 =?us-ascii?Q?nJxsg2VDJyQUABfotgdXF19TIB3d3HmcFzvkjJ+TNgGNKLsjvSgjlaVk2E45?=
 =?us-ascii?Q?MyXXUOuZbir/hN6Y+06JgM3xKU/xelN0LTmsd9Pd0Qja3RMbyyr6MB1m5MYQ?=
 =?us-ascii?Q?QiSXGIQd/EFe7TwpV4BNmnJ3uQOvyZWekkNwcI+F0RqL3jAbqVEHJNYm61va?=
 =?us-ascii?Q?gregHsaZj8GrKEiTgzQwDel8CYr2WmhuJ1YdR2NgElXyI3/cd1utUxdEHyeO?=
 =?us-ascii?Q?/tJc5TyA3qTSyAGdeCFZieozCnlXwrhr+bnqvET+B3ahIKpDgwtM6phbTzLu?=
 =?us-ascii?Q?fV9aDCUaef3BPSyXdD2pAMH4f5oyr9wREgeeJn+Y9ucvu/juucQwvtTwgQld?=
 =?us-ascii?Q?mf/8JxghHTF9LLb0cX5UlACFOt1NTx6r7FdIbSV6bdqdT1o4ifK2XHvBN4BB?=
 =?us-ascii?Q?XgHhQWr5KijLwjVO33uxaGl3CjEUgolI3wm6SU5gLSXVCDDLP5D/7HbNarxK?=
 =?us-ascii?Q?7DSQZt7sCOBaz0sci+i+HWoLLGGNs9syXsZ5rVIscdny/hXjOIlcPUgfJ9Ef?=
 =?us-ascii?Q?+Ng6VglrvDvE0Pp1RZQglJn5wA1MQTR8Faq7gI6uLPk34AfRhCrG36JZaYON?=
 =?us-ascii?Q?KJSCFzH3nD1/XRg268hy1C5YHQStIvLfQywwQOLGBKsb4FyZ8hHJ4nS3PS4U?=
 =?us-ascii?Q?XGSjhFXRMyS3QS9Yx9Prh+U8jFHnoy8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 877f6737-e9ad-4ecb-c93a-08deebb2c58a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:38.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSGHcENVD9ugqatfj6MZDFQnp4fRjWVsLEziMsASTl9G7wUZwKF5fHDj9eIma4PghUEF0b1BcxehVzXHWwjZmEvyhqXuAYK/EjVlWI5JD4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

Add pon_alt pin-group support for an7583 pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 0a217429b2cb7..7deb48db52c3a 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -81,7 +81,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pon]
+                  enum: [pon, pon_alt]
           - if:
               properties:
                 function:
-- 
2.53.0

