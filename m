Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4832A42BE82;
	Thu,  6 Aug 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054022; cv=fail; b=iO1zVbzh/r5OgmKeHj68HfBNqpwBpyQmrG9WDIqA8K2WT8wmzQ39rQ0HofUxTif2RRuoXpOn0W8qstfZjeDZnrjxtljX++gWqhd+K7cDq+G7euwfNn6tXloGUOm6TknTEKMViyJmADjtvX194MAvC7DTdyKlE/dtNK/dMS9yPwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054022; c=relaxed/simple;
	bh=ff1wgyO31Rt/ws0GnXdUiDSHlpH/uw0CB4tw97/2PA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O7E90QmigKkpdhr16JCtO1eu6fY3aylHaSrSos864L9MdMoNL+IdUUIRZ+AXOHSzdyJH4TWCcGauYeacWOwDu64bqy845CFAx3Yeb8brjuguHv5wxy3piKB9F+G1nn5Jz4NB4N9xgr3Ni/UtCV92rNZMzWXGm/89mr4ej/X4pS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=PfixH3BA; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="PfixH3BA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCi3aFrI8pqYpMhmAM/1mpptFGXHKtzP8/Rtm6ydJN9PZ08yrzrp8a3oISw2+9yA/035vJ4BR+YZ4x1vVnAnzl2iebcCg1sUi5k9dKzoFPII1YsRoYkaW+5ZAX3OyvVxm2+LO/aWd5W3DS5zbAT7NsZd2Jt568cCZBhdcVUxaCLeFg49lIkKgx7vGQ9vcn1e3RZ+VCsv7A4Qpt36rufbrNN4elcKD6Q71WTR4y4i93K4KJaujjGA5JYg9oVRCfqNvx1Us4Ivdn9zZA/ZPObWkq7LZDpYmmDS1pAG7mJ1lt2teeIjwoFGRXT1uazszGbXD4me18U1IyBsqyhq7NaEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58OFInlsuXMddJEzbQ/pESSN3qMBCPwTNYV/5X3RixM=;
 b=Wav6Ly+CPl9+VJKd9sg2XxFvUB0FctC5NahNqfsHwIRr9NpRv6gSNvzn3GicLEqSTtRNQoMp/zcNgNdST0PnVAAizP/EcSTfFno4VghsNLIAW+3jTsSPgcl8kHFGoifziigOd0BNyoca/NMcUFxYkF5MwCEb8cTFXSl+oDKhHTjHVLEShQRC9cpFSrQQV/uxG/zj1fWO81mSmMsfd2gY6dT0GFnTcL3/qdfTBIwxcPG5jn0Hw3ocJdE5tDLT2PmpB/Bo8ESfRdUE7y3VmPM1BGXmW1pGA4r54Vx6jjTTgYzhApKfFek5tb8dk5Q1T6s40ye0pL9UToDs33DSIaR8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58OFInlsuXMddJEzbQ/pESSN3qMBCPwTNYV/5X3RixM=;
 b=PfixH3BAf3y3QYNjN7BWgfBUHIPpfJVNQXepKIpc3vnzJVUpMcXWXSMZ1v4a2bu02Vi5DtuMus74tKd9/s/3mw97iDizB2LF9+Owso6vsCwHysIGuhDJQU+oXEU58YYuM9RKt4AGytMH/wBh+etMzfKpjQgKTRtepGr8NcipgFyxvjA5THcVggblyJIbJ7LASAlEh/yLO12e6XUJZS7fj4ANU8IDWsX3t3StOl/7BwZ1ZL/HpFuGF0PnpD/JRn/BLPmmZgSHEng0kJSn+OxZg8hiotD+dLiM7hU7uRWsdjOVL36t/aWkj13aEnmvot9DDWlwKHT5fHSGY8g+Ufy1Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:50 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:50 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v11 14/37] pinctrl: airoha: an7583: fix spi group pins
Date: Fri,  7 Aug 2026 01:05:52 +0300
Message-ID: <20260806220615.4078303-15-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 886f9550-3c02-48cd-ce95-08def4070411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	2meWOrHvBiyIVLH6dRHlo4EQd47X9+1w8HNTqdI0RJbw/m5q3CwT+OPEO7m1d8B7mGRQsAXYA83Z430Hw9eBjVXpegLLcDQXqvwPH1kJn/wO9LhmMYPtzwIQaygjdkDdqIcAeUpSZvYWhhuWZJ3yHCl1E15+ctVgqIsvTYScpROEspbQE6wFfiTrd94/5hn3ZS4VZFt2NeLC/wuRiYFZmoS+z0x7Qhm2+AR2FtjMIwf+8BMxqM6yT2yi/6IMDQlAqiueZeAdOY7Gbq+xEh3GWtJpZT0kd9m2NeoSRBzlJBCnbBEOPB1mKEI1XJDxt/jmJYoX2spnrhFrOnGDfTPKk3izSYw2sQV8qee4EVDdxHOVyvqVRAfeoVjeKkwzLkj7RubWk0IKBhBf8QFzsiTbP27VM3heJ2fNfxgK4FUVJ0CliZRFMz+1P4yEJuePxOJsuxcxwwhZPZct1YtWmZzOlABLmG3MvrDeMdCxsxjt62qKsZEmz2hqbNLtfWbT+muv64QJTwD0/FrYWLUAonJtQ8EHHbnWfsqHxWWQPrDAkB9l34f3VrZ3QQooKzOIbkVbIamrvbf0v4rQkOFRhfm78mAwnqwr/EqqXlPL/eXQ2kQOxeZQbHEbbch6i93ZQ5M+hwAPYE7XgGNUn12pHwhopAXgvRQ2UZXXBDST/ireAjO/1udNiwP09c57GR9dXbwXpOH2FrOiLoUIMKGjvSDWDJsdNWpTa70mLRsXAlUdYwweX+eS8G5h5+BCzKp2cb06
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOFT+oDmFHknc4wvipxm49yBwFjDMLOVzQd/6YE1JNfoWf6a6Dhr5P+Ad8DK?=
 =?us-ascii?Q?XQ3QuDsdgZqyjo3CM4GOkylu3jikg4zuDp6r0wjx2j04kuoRIvH6pW750gem?=
 =?us-ascii?Q?uuVzqNEeQqDQmARRCxsEc/RZ6XvTx2E4bv76en6wtT2kYyXKDIlKPndwzih1?=
 =?us-ascii?Q?ORlvwLP9sdN0t5GWFh7WPizzmIRIO/Bk2SfeA58chDyjKcKMkFFNt53frJCo?=
 =?us-ascii?Q?/U6L0kAFWnMW4WlXmN4DBf/d5NO6AMDI568gQMmuO2jqTMp8Qvpe7bBL8w+t?=
 =?us-ascii?Q?GWUqrh/hUz1oOOKaoMfOKXdmBKmCXNe7YkSCB5l93uPBKbDz4fUW8uWzjnLB?=
 =?us-ascii?Q?iMHqN10sI008YhfXK/9SokMxOi9bNXwWogkKlhcU1xui+tjiHXL+44m9Fb59?=
 =?us-ascii?Q?VCC0xwVEXAf52pcjb62FLkD29piQ/6Mtb2pjGByoe0bR9puW2qNtlcn7jp2N?=
 =?us-ascii?Q?jt0bOfPwmMFajxtzRzHp5Vpu0TyfC6bn5CSVOjNewAnib/UWHfcfVOuxSYYG?=
 =?us-ascii?Q?+z9AJeSBbhksAWxmC4DZsllB779VAMzeoSNZN1qXzr6i9JkvfUB+OV7kkXAT?=
 =?us-ascii?Q?RNqLUHohkOtfW1HdgJKXTX/QFjiTYbW0Oc4PyK0dLRpOnkzMmBPV0sGl6We9?=
 =?us-ascii?Q?OLpa1kHpVb2Lr7tDPwVoH8DyBHKguSbHz9jbgcz/RLo4YENh9E8bJKFJfNsX?=
 =?us-ascii?Q?NuCbW+hgIrVCEds+CVCuSq8iV4jSr8kKqcasneeTAnIWdMOX9gJc9ESJ88CZ?=
 =?us-ascii?Q?R8F6K2orPzYKC67zNCjb6X6Fek3M1/KjZNVCwUbl9ZsYxuzbd8IE37nsezUh?=
 =?us-ascii?Q?GK4na2+o/p7YZoLM1Vbm1ihQ9ObwoFFpT08j/kKOaODFLoDzFE92xUsI6oVb?=
 =?us-ascii?Q?pZh+neApnomLYbrvMIAH9KSyCI/aoTbqZTH2ZVUsd6SvHyD7S7ulfpBhZeZA?=
 =?us-ascii?Q?EMTMYoTs9mHpgulLn6xJDXPB8DPtfVRlt599BaCvjHEEKzDSOOE+SV46m3wT?=
 =?us-ascii?Q?TgC60cy3YjbegZHlW6h/B8JFyE/ayWBpLdtuTdtoRIelP7bVmof5Hdw9/ytf?=
 =?us-ascii?Q?Ym/rSBCiZ5x3SbShF6cg4W2Tzv3nZ6EzwtGaTcV/RRdXJIwIIuasb8KD7q16?=
 =?us-ascii?Q?xLjzyURE2ZYahduHLoLVnRnse5gXVUX7gjcUbRtZAIn6ojdr8uSy/jCjiGke?=
 =?us-ascii?Q?TrBeq6TO636FdB9Bc9u5vb1iZx/c1/JfMfmIGK8hqy/onKMtvqzZ0taGb2sr?=
 =?us-ascii?Q?g5WnLjtNEl7tBiSadSUg+GUOYFQ0T32ZYuUQr8tTG1KJ2PqHvohuJqz8fB31?=
 =?us-ascii?Q?yR30FdWSCDtaMALvbF4pmEhBDswc9Nf7oy4IB7/uufnCkV0fZbQ1l3hwlvfZ?=
 =?us-ascii?Q?JHoADY3zNfX+l+NmQ/vLcCOlPGg9+zf2iW+j8aWESoiPeeLpBYcJ8iRwT7b8?=
 =?us-ascii?Q?mM1dQrJ5hOQf5OidgXK6oYIC9+6HLV2CV/l0yicVQigPFTlaOQDZxHHV2S/j?=
 =?us-ascii?Q?lbiPsGVaXvT7DzwCZCcUS1QXUOSI3aUNtHEAYUyGANefFk4Ud2r2SaVPGape?=
 =?us-ascii?Q?vHuRwp5QDY/qelge33TH6aiYUSR1CMEmJwwEddz45Fg6gM7RGxhGwOVl71GB?=
 =?us-ascii?Q?0n29ZaF0zbaH/m71ovMCRp7NrphSomwSxmIdN5QlUpuZIW0a2izMW3/72tBf?=
 =?us-ascii?Q?XuE5R+Nr5yIBxan4avQXh6J628CaoWs7yr3BPzQ64n+I5e88HRh6J2hhAV3A?=
 =?us-ascii?Q?Pw5aDb/6RuYoqyAXbaGb0caTwVqiVIU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 886f9550-3c02-48cd-ce95-08def4070411
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:50.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPYei7i5Lgu09XWb6ReXZgkjErT68lcbqKWHAbUziG5Xqdy79FtzwuDp6VBG8IP7flyAXBd8HiyyIJ8SQ6KQYQgRKXVPc091oTv/71JWUDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

pcm pins were used insted of spi pins. This patch fixes an issue.

Thanks to Daniel Schwierzeck for noticing it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e5ae703c0e0bf..ad6d24e39c868 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -739,7 +739,7 @@ static const int an7583_jtag_udi_pins[] = { 23, 24, 22, 25, 26 };
 static const int an7583_jtag_dfd_pins[] = { 23, 24, 22, 25, 26 };
 static const int an7583_pcm1_pins[] = { 10, 11, 12, 13, 14 };
 static const int an7583_pcm2_pins[] = { 28, 29, 30, 31, 24 };
-static const int an7583_spi_pins[] = { 28, 29, 30, 31 };
+static const int an7583_spi_pins[] = { 45, 46, 47, 48 };
 static const int an7583_spi_quad_pins[] = { 25, 26 };
 static const int an7583_spi_cs1_pins[] = { 27 };
 static const int an7583_pcm_spi_pins[] = { 28, 29, 30, 31, 10, 11, 12, 13 };
-- 
2.53.0

