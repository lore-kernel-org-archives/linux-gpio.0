Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A78433BA4;
	Mon, 27 Jul 2026 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174131; cv=fail; b=NMWS9T0e3cVUVgtwaku65hJ0qyUBQ4PecEvSOdeeMly1Ctv4/DOfRhNEGFxnRum+IPF3NkFnE4eEdbkIUqoC4ltmg5QYTo5ZJOEk0jhvBLm0o3oWAn4LKF6CFkhjiwpRzEu2Rhx81++5URkuUvL1IvDqCabzu2n9pS5tjBQ9huo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174131; c=relaxed/simple;
	bh=BgrTV5QK8MSLKScBdsKQPUQVky4JYXGsmc3DzHKYM90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TebQgD4PYYGdyA86loBTh+mAU7+5yW5ur6J4KYTJjmraBC7ueWZ2mTi8NKeFFINR0aW6EohEoL4Yd1bJTK3AxTy7LUEAt89g/fEr1U4NcWFgq9md0VY+6DIG7L6ipoVuNRugRpLecQNvVT1bYfD7+nrrDL/PbnZcki1dg3APvS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=kRWp8Iry; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="kRWp8Iry"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqnjLCn4uT9NdFQWDpYxrU+svJo0rC/39tYY6CYI1A/lQ/ylMPv5z34rvMLZRfD+QdzCD09Z4+pW2Dhe174pDVn0XcdTw/PBUSRbqf2hJ40sDj0zlUuEMbPlwI/cse3omOCEqm37mRkAvxbvb6Dw1uG+Yja87Kg+Q1TMi3/PEBpbxi0RjaSv4PiCnVzPGy+cAGVUUhKzcyM1z4B0KOMe3hbM2FABxgeVMwj3nPcQTm7IZCgvlAi8WiSdUxkVzindBzL6RUgk8cqq1EK9G9frV0MyTb4xVo7O+Qmj//qDIFUAbCj1ReRe8PiHwFbcGhqLWMVAQJsMHzdbIjKwCEdyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twHBjwxIrWHWurd2jBcOK2Cj31Z/XCgTinxT7gVKh+s=;
 b=pnIxS+Itum53mLtaIgIo5UnLpinrIRqy9972BRxxsfGLomV1phCRrRia4QKMrIXKIljviZCjNEtsNXefJp2+1IK46J4Bb4jMsqkqXcdIeojJEcMnAJ7awh1ucqIDkxhh21qeOgMIEEpilP2SyjZMQLmg+wnbxl+MvDqcMtp6/DmMawV2ZqbMb66A5Cf3G+4FvSFwNErkYBoP1GViw2g4IPuNqAx6Gso7WdOH4yBM5/PSha39vGOtelEBWWLk51Xj34C23DLxUGlasTr3o4nKPPUw24Hshu7KKenOaizrpPpi3VATaqrTQt5DCEyL0XnN8XHxBlY+haEwfkZUCy3mQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twHBjwxIrWHWurd2jBcOK2Cj31Z/XCgTinxT7gVKh+s=;
 b=kRWp8IryQQ6MVXh2n4H5P1Sc6CfqjBRVDUoe9GCxTm4oYKdR3liIboZTYs5TshfXrhjDcSDcK8UjXY2qUzawmyQE3az7sU1drlhD8ei4CssnwQH7a3WqXaup555ZI/+/isdv0ZEsjo/wahmzLHDwaso7OCGBFZ+11PWndyS4ipsbb5PeY56igXnip0xefl7B312salSTQidwdT6F0/xoerHqqgLCtz6YtsdsbFFuUSG9AlK6dlG+xq3aOtUqczFAaGZiYfFen7AbikaYz8svG4V6Avzd6npikRovi15MpKRcAIAeg9AOmDvpDvg0KFBHGSP0bP1FOmN2F8+X8/Fkhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:05 +0000
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
Subject: [PATCH v8 07/35] pinctrl: airoha: an7583: there are no muxes to enable i2c buses
Date: Mon, 27 Jul 2026 20:41:13 +0300
Message-ID: <20260727174141.664933-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: a06cba7a-7104-4e97-3f48-08deec065fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NrNy4/9TPBPfkdGB93hUgqFXBzjzIVSIlSxub2G4G9hCfAp8/j/IdkNWdx+nHX79bersblkw+gVis17fV9lI9AOfaIJgHLGUOUv6fgfrjcOMifhYvtV3fKF84X7VxiAjV9iwyw73ezR2TJgA2q1NGcvtZEVgHuSKRTxgfFI7kbsGJa0zcW69l/RNn20W/2lAVqzWLZe8giTyUcbeccZGUmOcfr3AaPxfa8wBjccQb4b2PIhtFkUC1mVF0dAfpKDTYR7+h4KZuFXbhYGeHfCucKcCnzai8FO6NVAPuzylXzJNP/kjoel9n/rSaf4qiM1W3ymn1W3t3BBhKXBUyoz8D45Yj7bLqDjjg5p1oJhatC9FxXU06Vm+kZPsp4ETA7bz8JHRFBj0XiibeBvWsIdnjRAFNtUa8eeGZVDc1+DSWLZeoHrjjxjmqulAH/cNYzIoo0oGA+foGipYyWIzmNSDTnqLZ1Nd4clY1JxAK9R5Fd7lM0p4KnvzeEVWekxPhljRVQNCwAz5YonwPLhyuz5uQpysmdMw0PPnTzn23td2eCEO3iWVuM6tosTnqA65snB8TYqjPiCf9sFfbG/w2ORwl7guVqhfURKFYRvw8Zls12faZYK31HK+qlhY6pf2ANZKz5QV3ZvNCiVyxOFFB9KTjh9ReuXFV0yO1AHBIUAuj8JA+5M/B4RD8E+pI2TptgZrgb/dGRoRQqLdi7qdNQ5z09HxksAyr52giTFFnpn6nl6ZISXI/OgFnCC0Q15Ju7zI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AvIOh93l30+9om7trrY0iMHLKJclQMkX4vH+xAsl4QL9MLwY6zO3JeP+Axkl?=
 =?us-ascii?Q?eeBO4KErGQtvfhIW92/sl99RTGG6oMvIdEgUa9P1qjMvuGC8vqdZB6vpHHX6?=
 =?us-ascii?Q?OfYNfJxKJKHyXgbAYojf2elyZsKS+j4TMFvsB55tRK2R5fMSxmBnCUTxmIOH?=
 =?us-ascii?Q?7ChKgNukkfX7DsozWfqzyCgXKBn9QLG5qmTpc+s87ww6q0Na4kDCMHWbSSdl?=
 =?us-ascii?Q?tceetfGxb1KJyxHenYcYY4XEYMtZCyqRy0OCPFtgvt3G6I/JqZt/IIrjrbMc?=
 =?us-ascii?Q?dPOhVM6jZKHRiu11E9pZxogNawH7a8sbM4MqfoMt/KX3kEKOzcvkubNhZAQL?=
 =?us-ascii?Q?s2bSiTX6/6pvPfzGz7znH3hGL3YBDKsrUF+9ccYLDvm7ebyXctdvFOvFS+Ns?=
 =?us-ascii?Q?AhuY2/c4x87fq07HDiQeZfQtGlf9QD4EG5k+zEPsKwe1AQmQ/Dq0ZhyA+iPx?=
 =?us-ascii?Q?xjxrI4zjTaT9X1vzcYu2lZloznV48D41nFVNjkPD88TGixd02JNQnS9QfjHv?=
 =?us-ascii?Q?6JsccRlwfSYFjaU6f4hFfXnnRZnT1CX9Lon4tQGF52/21xit3X55xd4VxYF9?=
 =?us-ascii?Q?CkAjYqONyT/O7ps2yEwhzAlTTu+u2n2K2dZaKDK7/rlk7moDckjOR5UZ1Lm2?=
 =?us-ascii?Q?wctwSo6hnBsYUdYtTd+dZyvRl5oO/+SFs39lTYN2rXuCHyG4OfVfKjPfBcnJ?=
 =?us-ascii?Q?ZCiPzOuJscGENJ4kFZycggekNynOziMHVKyeGAuqXWtRzPBeItZMBX00f/Va?=
 =?us-ascii?Q?CeVjmzH44ZyUIjKL6JDh2hcYxUe62RyJ19CANMoHSP4QVo55xT0viXcGyhmQ?=
 =?us-ascii?Q?kRCMDehd0+/tESpOalspC4oQFZ8NCQK+EWa7kJOEyJDauTr8qPWIBcngUFxr?=
 =?us-ascii?Q?7x3d0GKuABBYM+ZhN5Zz1Zbnxyg/Py/SncQAv2jyNniI64Kd6kR8ILkuH2mN?=
 =?us-ascii?Q?TsDarQNfBPg1O8Qy7vwkLbOA/zcky5zG0A8ZZOqphmSA3A7yK/8KvsIBN/m6?=
 =?us-ascii?Q?su+pZ0GKtPwe8aDkgCE4vJR+R0/u+cWbwxyQL9eGOFuAxoz/iPLTlADPKBl7?=
 =?us-ascii?Q?53eFwuHbSWBtxr/ZdDjgnQvSfZN3ltUrr6ktvpgSxyD5PFqhX3PMWKQa3UV+?=
 =?us-ascii?Q?pXWaHECH2QTQklOkYKeBRy4v3LnKxQOMiB3Af7kz1HIUNLnDsr2r8uMsHhEM?=
 =?us-ascii?Q?VqtqgI9HkDmrb97pYbl9LsUK+utHO0FNcuVBL2+E1OsFZdAtckq815rCSJ5d?=
 =?us-ascii?Q?3P6KajmqjrNEquPq8E/rq07YxcZS9SsMQV/BD+l2u99oOUvzhw5aEOqnkYIR?=
 =?us-ascii?Q?ZlJ/XHEeev8NmMv14A/lq7s1xRRO4imWiRO0GMD3VcCI8zjVlTpKcDPWlv61?=
 =?us-ascii?Q?1QkE22O7w8/ZyWErKh+XzpHvfEsnviUyMTZllHJ0DlUpjUWxDuOu94/5m8f2?=
 =?us-ascii?Q?jS8OqLI+TEtKsgN/VGMRrIc68G5ADUBOiINTBWgXXwPV3N0FvVB9iWolQYTc?=
 =?us-ascii?Q?39KcxfTSfHtNAHF1ICEhjH1/XdoHqNUvV/ii9fA+3ezizoOlIQlwmjupYVhY?=
 =?us-ascii?Q?vvt6rLQixgkP64lbstSVVJ99XPkurV+o0kFNJiaJtbW2Ua0HdtNqKaNkGsfF?=
 =?us-ascii?Q?ObCMLvNyjMZkAEY0zZEZCEDbBFu8+bdWTJltUZn8vXvHRAYH6U3njAek+TMM?=
 =?us-ascii?Q?TfQt1j2yOYRYD2d/PIBqIqi46zrtk3tytQ6h6y8liLSbZ9nA2OlnQ21t5mEJ?=
 =?us-ascii?Q?vWNQmILR81b4GdgqYRd5kf04cCc4zos=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a06cba7a-7104-4e97-3f48-08deec065fe2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:05.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ2H1WMKMDcTN2bAilMsemfTnVH/zKHKS9zprqsWHoGcKGuO/VV19BSQysbF6Kphi/9yFEUNDOP+rN/2BC+YRW3AoUeDHm7pRcYJ6Oth4Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

In the AN7583 case there are no mux bits to enable i2c buses, so i2c pin
function is not necessary.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d743d7fdcf0cd..75a5167b67186 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1822,7 +1822,6 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0

