Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE2147668A;
	Tue,  4 Aug 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859493; cv=fail; b=fH6vXchz5lzG+OhvVBPTkcNaz7sVQAmuGLX/9Aiafv5F5TLl1jQMVbvrMSawP+HjNeRUoBAIYes28vXZV5jNYW3OT5nwW5CYVyk7pqTzfdWyJVRdWcbcoBkojIyM9tyipm4iheYzWK1gkGIFej7aFt5DOXpYW1xB60G/dB3xDhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859493; c=relaxed/simple;
	bh=w+eYWOaPUc2ta8HlvfAB+7JCJdNEwzVXatZL5G1N0Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sb194/VTm1AYCsFdphVwXEy+M5kt5hwNdMK/FQ/jdFVulAbZ8tuAtQ43X5NHwLdban/ZHoaP6zKLyMLm0dt0ESnpxIH3P0qRRbvkEMZ3Av4NQwlW+Jh35Mll8nUrtO6Z2NpmdRB5FQxoWqD+LK1TB9ivttXCnbIilmp72nqoOw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=krjQkAbp; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="krjQkAbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQEj4ODcDQG2v/7oVqRscstCFUI02qP7VmkBlXsOmBfxGBe5GZx6rqXGBgPyiP9ZRKqp96VGTa9GaJ1xlStzqkSh1F8iDO0wfyIpCxTlBDX7oT/VUX3h0G4zUAJ6MMWCZVVlBhArKz3/3Us5T5reDrYKM7KmChTFNyLhCxdQS18SQPMODT+R3tBVAzL3oXQ9DLxN84MOxNAOE6q4GxMBkaXK+1UZUIXsXmjPOv+EwU2PSSsjUro0JYmHIbQHOq4tEpq2lwhJibyrhwX0sU2WoNRVNQKAZT/arxCS0hptsfQpl1gV9tKT1V5xZodF2rzcKEVwVqmqkR7q015fsNJQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=;
 b=MWb0niKqZB95oA1Vknt+8bpOXkaAO4Fs6sO4fotIwgTQhEdykHKg/Wz1OWK2WPfnptjJ2E5/x9EY+efoXL/t6475MQLc5GGBGw4JJu1Wq51UDrSND3PvcD3/UecYcLDWIFt599HYmCwa+p9JfH1KRX8+1DoNlBPi2c/Kqy9Ws1TZdCIsyp/tc2GWQ/2PlQkDfI4vVNT7GuqUPSyWjiYyK4Eil53q9rQa1l2gprky2H7H38Ti3gHk+NejjqsBcmJ6Us3bonRfhxc7i8dcwbKHCOMgsd16aPV9UXVtFg2tp1g2e+kO0hUdB3I1fez+XKIKMsKzsCOzrsVW/QHH9MvgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUUtL1D30/arAiUeNNdivJiAS5w98hDY3XRx9eiZsMo=;
 b=krjQkAbpCAiG4rMt488bS3vUXOcbosz/cE3I1HAdiMCMiAXYaJb1eUZk4FQoNTg/Cb8QRjJoziQP2A+rnNcKHbvynvBQkDFXcXcw/+JGLw7nNqfIX2YhbbWucPj9iP+niQM4rpyNfQUFnJBseAJtCBZgEbKhqM1YYjZS8tIFQ0OQQAjygUTM9S8BfbKzu9ZzJlEzJSp5q+mhWUShYn4yBe2kNqz1WGidKhfz5+X2sjVR8rRsmrSdDmDyM3B6byhTORDIZ39jrz0z+zhmmLtyLh5wMvBud9t97aovLQfrq9YMI3ZGNArDpdSJdIlWyI0z8fw6pEUgWTAg/VP7c7YIlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:47 +0000
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
Subject: [PATCH v9 10/36] pinctrl: airoha: fix I2C1 pin mux config for AN7581
Date: Tue,  4 Aug 2026 19:03:53 +0300
Message-ID: <20260804160419.3592327-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a77607-9af9-4221-8e37-08def2421b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18092099006|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	2z95DFjH2eFIUJnWKS66GSurNeKl0wVbDsaemgGnQI8Pjpi90RsAdTQaoAkBMBXEPUK4EGcYyAWBbY1A+KvSXUs66pw4EB1nc2IjRifNRjcrfb/5qE3jTDswfNXBzcN4pDze7/Af6FpaqpaWlm8ewN56r3p0N1lDLn6g1LYyvn20K2xarQELXaKRzw4ct4gygO1v+L5bYr5xtbPC3/WerfvarhSNKELBCw+xv44V77i1hpUajKD6rnkz6Ijc49TG9+WuXp+NDu3Uas3/SIH4Qcr8zO5qOL2OsKliPZyWHQqXDxS8mLWxtCnUEpiI8eB2phrtUMBZd/LSClCMvBduCXnULyDHhCkSq2ybKQbpFmcRHtH7G/cNUYewNl2qUeK+8R2u0FgUD4kcRH3qcypawiT8aTmNDm8AHv9YGNm+wQRQQtLzGcoOLIC3k9I45HvqmlO2Di/yDdBpIXYaUwP2Csfy3Oc3pOB1sUtj/0sHNbixh1LACTbwwRg3yFl/rcAahevfFY3W+jjSgcpdgugISZwIRUJA6KK/t2pQ5kik1zamc6Nih33Bf5lHDs7irkKaIuLgfQok/e+4ecI8oQNPD7/dGc/hixraMWJ7R50ciD9snKZlfz+C3IC2O9EsQ3hYZLaK19Rc7cKezU+1Bt8YiCom4EiKzuK3rm6hKsxnai6uNP+xGeNE9oIugOOeRPEKRIP1SkUy1kicmeZGekpB9zYGyxodcpF0FmSHXB4BxbrYYXxLwwaZgnurcLDGdway
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18092099006)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LJOAi4HEHayORmeN4NhFs/Ld4YrDbzbG7JTuDG+0os6bPKtItv3iPNUq3L54?=
 =?us-ascii?Q?m7i1ndmpwQp9eOqeW8OepDcaX7jSrWv2W1JpTygxhZuisnR8oy5ZT/eBKEdZ?=
 =?us-ascii?Q?rppdX9VcezGD0Mbt6uDaV2GsSA3RiFTsbT5nhtN4iND85DVjnHak4rjq4Sl8?=
 =?us-ascii?Q?uT0uZCSqFzmjhiPOmxjl/ETzggN/NacLuvKRq6qf1pgvVMNtQYBeTINmgwBt?=
 =?us-ascii?Q?0vZ56W+ffKnmVrAeMym8oFxwno7QFrav9smiZbVvmEApkHQXmCcGSH5hhWYn?=
 =?us-ascii?Q?8OFlLNnL7QuXMKb23QZ7pBW7Wo2K+XcuTRUIFLjw8mWPsG4OoDLEDz9Afy3m?=
 =?us-ascii?Q?Ki+D51KknbgIW2nmpmYpdnX8RFVS4SCsHHzd9c9Co4RQPVROIcVHEOVCgfe7?=
 =?us-ascii?Q?yFXYwV8pXflI+j21EuS+qhgsPAJg5sG9+KtnVLzlbQbjA0lHbgqZa0i4j96n?=
 =?us-ascii?Q?7UFXy7IuvCdqiAcg0Hek5tI9hy0hGISjN7sLpsF+c1HAaBNg6lRpFDy2W6aM?=
 =?us-ascii?Q?17rMzrKgyQ7lFcJSts3lwvbmDt7xIeJznCpDg929YGp14B6dZPMtk/jbDP3x?=
 =?us-ascii?Q?Z4WVth8XqdILT1WtjjmXi5bCg/sPzqjjHSLsYAByfMAx6evzFX4TRFUQ0Q4p?=
 =?us-ascii?Q?Q1BCNFPa5ZmDBaUBcDwHwvjMb1kJCtI8DKFXwA48DmnjjI7RClnJFOt0atE/?=
 =?us-ascii?Q?FpttdPB0lMhImfnG5cQKWGO3vSikb02prTViAlyKtMoMYVRSG6Z9y5m1oRED?=
 =?us-ascii?Q?ORMeeADfOn0uXq/p2ZFT3Mu5vKbg4wM48qveia4cEh+2130as+MZ85Gz7c7t?=
 =?us-ascii?Q?NDqcCXO98rnnYzncp8q44zohbUTh1GT7voHFMPpu4k1XKQPLqTXQ1CXZmvZq?=
 =?us-ascii?Q?mM+HrpnQyNA5tz+xrgOQE9gFrei+KiWZWwimiES+ssym0M1Ukm4llezZs+9o?=
 =?us-ascii?Q?k5DjS3bL7AixNZwYq96nnib6s9TYMiPJH2uvXehnTOdbj3abvhZOAFVR/JqT?=
 =?us-ascii?Q?DLvOdVYF8fbSX7r6laZyP4PppKv0esGPGKt3o6poynTyCJpIVeoXqpzs8vM/?=
 =?us-ascii?Q?7EgMTl/tW6nDyIgogizUOyHxz9ZQKJOjHjbYup+x7Pyjnao+t/bE6yxOsD/t?=
 =?us-ascii?Q?Dd+WDNoQttOEMYKKus/t1A+jxucM2JI53KEaT9G6JCVGvz260XWLCffnCbNI?=
 =?us-ascii?Q?6agAF38PSycyihpT3ymYMRZtIDKFRYiRQ985Wi4n5RtoplDgXSfJJ5A3Ez/L?=
 =?us-ascii?Q?ubqhiwl02iKoQlfa513wUB8UPpDQl89470LsgrH75az1TuKadJKa3lS1U5zY?=
 =?us-ascii?Q?YeNSg6F6d0Kp2CAVQ/QIbFkiF9Zpcd+C1YMCsAsnwHvpjsX+8tUl17W3AL/O?=
 =?us-ascii?Q?b650uBTVNBacArSZfRgXNBG6YvHh9/nRX7c8TLWinmIkh59pVLCBeIJ39Zof?=
 =?us-ascii?Q?X+tpD65AW1Nryd7L73LIV6wPTSRZrFQ5yEmjx0i42ETyDab/FyVYsdQzhO/S?=
 =?us-ascii?Q?l5IIgwamhuNjw8Zf+EXfjcXVM+7eLFzdNpTMlY2QfqrFIuX42WIDz0v7CP6o?=
 =?us-ascii?Q?TgY/2wtZJNPATUrbEAnTtf7oad/eV8NO0Zkfk3OPQM3tODb5sFLut7k8V+Q4?=
 =?us-ascii?Q?zcppDhNdN0cAKF8iUBNYWtgDMWaohiZEyo1BZ87Pp10dEB14H527jUzjfb3d?=
 =?us-ascii?Q?yB0hZ1YUNFAJCm+Donb7TIIeRBKU/h5enq3Y0tXRnvRlkgOEzUHHctxexn7e?=
 =?us-ascii?Q?XAIGsRUvdjDdVu7sfSZ2U8ZeKo+PtxE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a77607-9af9-4221-8e37-08def2421b3f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:47.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX3XdrcWOcBkpsXlyvDYWQFk4LHCVp9GkYQdwE2QQrgcVPufpMWTO9IXfYOU5w6cdQi1y35RsSNnfr9vrvkJKYclXkc5OitQTvueB5gG1wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

The pin mux on GPIOs 1 and 2 on AN7581 supports I2C in master and
slave mode. When selecting I2C the according bits (bit 13 for master,
bit 11 for slave) must be set in REG_GPIO_2ND_I2C_MODE.

Fix the i2c1 pin group to set bits 0 and 13 to set I2C1 master mode by
default.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 89979a2c0e357..db6644bcd3aba 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1158,8 +1158,8 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_2ND_I2C_MODE_MASK,
-			GPIO_2ND_I2C_MODE_MASK
+			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
+			GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
 		},
 		.regmap_size = 1,
 	},
-- 
2.53.0

