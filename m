Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213093EC2FF;
	Mon, 27 Jul 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138222; cv=fail; b=BA6UDSmIKvSWmPH1PMN+2ERr8Fh32JBD46Eej8C97bW2UUedoAEiBrOBrrVWHTBa3vJRSNQHLqGmybjC2murh+wegnmMxb1CNE5Dysbx/vsltCUfF5g/ATpnBO5rRngA7mp83K1+eQaylZUhS2OzwVt7UeCYSR9kIsKrT7fQfhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138222; c=relaxed/simple;
	bh=sJ4FiaA4bUjeLyTo38CH+UQHvN56tWmQfEb+I1Q6jls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HzBgTgCMmCSLwHuf4A7tnZb7gGwjM4tQ51a44pGJ26/3vLox/vP/hPeLL/3bDbDvrXbgalibxSavI6TXT7lDbzeYmHsE5yffS9B9E3qH41my/+nBZiZEHjg0K56w7K/M9YtmUW7DrzrxmeVXCI/JwlnR9cSfT8PMK0YqQsoowvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Vr8gudnk; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Vr8gudnk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJu2Qkdm9iq5JwOD6bSrPu6s6BnjQ0SZkT+djets2HV8JfM80seM2cZEy9AqdMSGYEiAV8ToHAAbBevvwM4QX6pFQXI41vXK6S+TMNrcfcBXsk4Q7031VJQ8hA6YsPkei99LsDwmnKRL4sq/w6qAteO6TjpzB9EJS7cT1XBKy4hSreDQ1YRUxSD46tJEWhJtbrfRK6u2crTCx7UF/x733hwIRS3AD0atfWCNqRyUAx9Yd6b6U2UbPz4itsMtfvGAx7xb1jwbFJcJcBeMyzge99pk27AbxdlT2SziCbyv5iJbyGQotpNgtq6K8HftyiqP+3VEhyyP/gdlbIYbYdD5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNczyRCyq+MCvm6MUR+0isFyFNBcuMqhQM9I97MKDgk=;
 b=G8ZaZwPOBd+5SDBkizCSNGdrhmbHuIKM766U6sQri9cr72+ViQ5nLU+Zpf8WAu/Jsm8yiA506Ru2MFcun/2orVfpNVFbhfm0gOfZoSNS+lxD9YDeHQuS+Bs2Owzcyaoz0KsWI7R4vId0+5VKWiZyuDPAXRzdWBEtg16r4En/EBRszM/Z+JMyRR/G58+P21w5TvlLTEuZanlfncsdrTSfhInvgCfRYU3SKpknsS10eJtmlqxTRYxTiqw61DawPWyGjNCJSGTmcmsGoG/JKdjJ/7RUt9IvqstCCcxUVb0nLdYJH9XAxI55nbE0TnEtvpk3PXAya8ybhH43LJWkPizR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNczyRCyq+MCvm6MUR+0isFyFNBcuMqhQM9I97MKDgk=;
 b=Vr8gudnkNgBAXkOZeV4ZZvLNQhijyeksCy+saq7YUUqsmrUdCUtiEC9i+FUVhjdyccbYSqD2pbeYgt78zHQZ9V+b28nCqOBWd1uBaUp3KZsixDugRKPAWle1u5mxgDhjIvhmcoMcwIGTYnFRX+FIZGfLDHDgeg4bP5ZpHWVhS4yAOj5cOq/VixJSDK6BFM9MPD+aDp3jObzwiNJ/+C/OSvIbej2jy4W1l91HBTfx1WUcKlVwhqZaOCqKgLyO64L2SnumUxzmcdHKBqYDYLZO03O0T0+lTi0x/wxAaHJimLCLzSXbSReyVA5SGt2hpE80SX4lhwWj3fWw9ag8wqVQQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:34 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:34 +0000
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
Subject: [PATCH v7 25/34] dt-bindings: pinctrl: airoha: an7583: add npu_uart pin group
Date: Mon, 27 Jul 2026 10:42:25 +0300
Message-ID: <20260727074234.3761170-26-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|FRZPR08MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 709f509e-f1ab-4c3d-9b86-08deebb2c310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	H5uKhRYxbcB1cXDngZAdel4m4iaB1lsyYgvwzWMrlz7n2ncYAAzOTlBeZPfsEkluZT0+8LeJKeojc2iA17sHqei7yYuFrNHFBKqOXs5cIoknVpJ943UeAE2wXh/V511PsRPfBGZnzqNO+MFG28y0QDgEbne9vo4LIgpLIO24hY+HCiRp0HcwfZRRDLBCz3tU7tTkVSb7/Yc9pxQeoy7D64nK2M5Fo46o/rPsFXVJnXuXR/ahX1iX584R7BIZMoGtoyA4oi/l5KUGyzPqOPQZjLx4fAlomL7cKkxd6zeN+D1+FKMyWDAT5y/t3P4GIYdm3A+OaUV2C6X9jO+Dz9xTGGxTSM4sr3Fbec6Ze1abviNgcnpNQoFOPqv3zGIY058s1dwxjwmGb8hnQ3FCov4gmxmQQy3YjmOHzQnVuHNhznXpJYlBA//55vQJcsGdLGje69bqQm+xRTcB3JEjtFaC3fd/ElKsDZLKE4w8PHqgq5o5nSWiy+km2kakCYDbwNiTp6zO/EytKMbLh5HHp9taFTL94WhGQRbjockE88gN7MzPXDslddzwyKxd8DEfP0lfheKlngG3Vsb79cKdj+MylFxKawlxExh7kgJt9shB6wQ8jxQMn79cOoRFfyCu4/vVkt8befIlhTKl7jDyONIV4/Ucm7iT0IM4KnTehVWBAZn1XJXcuQzDeYn2Mp8ao/kCw5gqmSn2U5uIvFaCYN5gooryHeb0maZS15EgQF2O36/qH1vVPIWDFBKpe7dtTUgW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OXn0Gb5eGW+7VXxpqSlSVlG8gHFPp8dmP5VMJGC3fIDYSv8mtGT7l0FcG3ZJ?=
 =?us-ascii?Q?Nrd/cnscYGRwndgEzv4iGH3d3y4t0knYgfRgwsVSu+a99Gn26kCYDPrR+jOO?=
 =?us-ascii?Q?rvpzSpiINnmoL6+HvPBzpBnHfm0WxdcWWM71ciBJMfBc3erRoM7N6rqDDv4E?=
 =?us-ascii?Q?p5oiN2hutavVKvBlvpQ1hwF9n4wn6zIkCk7h7l56Jt+rJp0V0ib41GOi1y+s?=
 =?us-ascii?Q?gf5pWeOZ7ahJx1g2DMohDHWZBF4ySIQa726MVlkQd71f3sbCybuSJa3L7SF2?=
 =?us-ascii?Q?tBdkHmUSj0Org8/Mg2yOkDlwoPSJ1Vy6fxQki7gQFxZSuCPdn7NmH8xhJKXB?=
 =?us-ascii?Q?Ro//Fr+0JUgBbpSFKGl3qlKJ74jtL6Jc46wrZagwH+KwbS1Nl+tvOcEfUH3r?=
 =?us-ascii?Q?Gl5NS8pyJezW/K6vfuNuY5F9KzlMLC1IxuOSjbSuUwKR+ROqIxr+Sc+xSukS?=
 =?us-ascii?Q?rqepNckW5Wkjb3kB0uSJcR5fo/rJQA6lMkSMMcQ4WIB8hgIjgGef5ydnb/Xc?=
 =?us-ascii?Q?pMtdH4fdk3WFDcjhtS5AYPQ15YdJc/Bw7D0Iovr7A+LVj1XDsXu9cuiECJ1p?=
 =?us-ascii?Q?Jvl6jNjBAhBePjGf/qiflG4yQTf3pl9yuh9wwLtvrSuLoq5NYC7yvP0YiDYX?=
 =?us-ascii?Q?pNcYIVH+n50CC4N6V7jCOutnr5K3BFEwSNaaQnotwJfp+wnOYxgOpm6d6W8j?=
 =?us-ascii?Q?FezqVM1k/ap5jQ/bfvOskvKZkCGQlrsw4ZMu2bHrHYqTmg83uCFbRnnO7OtU?=
 =?us-ascii?Q?thIytXecZhnTTu0d7KeSL6Qt2Su9ejzoNqNzQ3jpaobrL4NVPfM79m/zBezc?=
 =?us-ascii?Q?bX52jIKwZEi3+Wu3bnb6xP05sbXXrebhYJx0Y78uawSzXD6PF8K1m4g5UKAk?=
 =?us-ascii?Q?6T7nBiSdFJ6JBd9SMGmQuadjGr5MJNySNGNwyxHhqYv+DjjfdsRq5hS3K1tk?=
 =?us-ascii?Q?1Giaq9QNf/stUAtRO2nOnjLIwmnTT6jNuoNzJvWOMWFr4y8+2nFsZuFP703g?=
 =?us-ascii?Q?CpjBsNAtJT9T03oGI/Lqpyrp3qKmzbmrxAdGSzaDENbbIiJRCnNKSmYINMf9?=
 =?us-ascii?Q?u9wChO6IQrBn+ulV6C5z+I6kBP4ONBdewiAqkyyzIfBxTgLFyGySINxbxfFj?=
 =?us-ascii?Q?C/pudAPwxznK0pKFCf5krGfSuGNLJBfKHif4otottdFsxarDbleyrymfP1eJ?=
 =?us-ascii?Q?NNtoWkhIIjw0AR1gtHWuPyi1mB2pqgrzSRr9buVCtV6D+yKhk+LTMp7F6Dje?=
 =?us-ascii?Q?lVy+tsSqxEOR8/WIgFNuK0bLcjPHvznL2GygeYGRSXT1P2Au5ovDN/cW1S21?=
 =?us-ascii?Q?J5JEtrAOqWo7gjvsZfqwtFq+o9nFuA3QSj4XVb8HozMDS3043tKMwHDPdofy?=
 =?us-ascii?Q?9fN8/lN7bGl6AqVXIoGuX2er1OcZG8jZ4aEtEOnWqP7ZqtYdaYuAn6bhNYjU?=
 =?us-ascii?Q?ZxYiPkDrgQAkcTG5eWt7blnCkYtCPvm4qyJxZGQZ4Nzb1JIWQOsTi+2ZwdJj?=
 =?us-ascii?Q?G0oRELyy2QNx/scF4OfmIfVMVmy6xNBEHE1cVThsZA/D3ROqQwz/TTik7vwX?=
 =?us-ascii?Q?dl6lVq2lSQznshqkE6a8qZAlEETkDmAAewaZzGFePa46CvtMlETLIdQtvJ8t?=
 =?us-ascii?Q?fyatmsU86litoX0FWW04jBiAjJmeN6PVFi8ptCL0hoAPnuBFxrw989jJkgiP?=
 =?us-ascii?Q?rEG6uH04n+R4XFpGdIOeOXM619htosV4mlS3r3KXpIuhENjMKQYXgLpNAio4?=
 =?us-ascii?Q?2lU6kOzfSQ5iHQ3Q3RPMGWaxddTxMUg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 709f509e-f1ab-4c3d-9b86-08deebb2c310
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:34.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTqfrxfLZtUeKNHGgm5uMspjxVokHk5fB29/gLdMrXRF6IvAFpqufQgN5XR3DyVol5NHxnZ6LXt6NRI8zEuWKnw2GPY/Mh8iJ/m3WwY5WcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

Add npu_uart pin-group support for an7583 pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index bedcb6374f1a0..0a217429b2cb7 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -115,7 +115,7 @@ patternProperties:
                 groups:
                   items:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
-                           uart4, uart5]
+                           uart4, uart5, npu_uart]
                   maxItems: 2
           - if:
               properties:
-- 
2.53.0

