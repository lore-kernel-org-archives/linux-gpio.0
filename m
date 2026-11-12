Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472567;
	b=yLWzSI7jeGfDSWsbk2V3TojF73jzA6ZkpHMEI9Acxmv8wFI2WOGRqN0g1CfEo2j+mMmb
	 nsiBaj9jcS9OAZpEH61JjWf+gPW4Jvxsd3ylP3g36WPZQtHYqeR9T/Tvre/V82mmggn/V
	 YcIp5VrOvAC7qZ55UpXR+E78kx1Xpn8Iiz96VFi3ZglyddisBSw0PBp94vqTHQufUnp5H
	 kWyfLnkvHFj9uZtjrvHj5aysJe8HZCr1ro1cuteZDNcOg28I/PHZDdPMltdgepRignkTS
	 ckwYfAmzAvqmDtAU+YM+tyHzGG8nMZIhWLLOnFEYTLUSOamAz8wX8+OzkWrG3TnYqjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472567;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hne+ZhQ6gairMaVHIgKF4Q5ChZ49q63S9LCZcE4yShE=;
	b=R6ixcgL3gWfAlp7OTjK53QdM3iuaYV2zzufqoVBrAVPxdbKkho/IAaYV96hzbTKGGS4w
	 sdDRdaqlY8hla7lZK7EuSQpIrXY8gIxJPrdQ/GW6nUwLemPCzmC5OZGNWMtBjHCFCYaRA
	 YdWd3riv51hoY5Mni56qGofqra8+jCM9DlWPTk2Y4YWmSQgNxiY0O1kCWZ4s8PKioDch8
	 6sBc5i9L8dy2wtYMEcOH103aF74WUi7xnyoJAkQRkq25TEUYPmkLCqyKtH8q+NDwL2Mnx
	 a4bxy/psxZWOedJ9NHmV2KeQtrXq8zlN255ZNjUf9mKVpbNUwza53yZtBJmg6mZ2uZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tvESyPXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.53
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B4606B383;
	Thu, 12 Nov 2026 08:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 951B4606B383
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tvESyPXR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbv2LoyjA6UhPAdw6X8gDLYS6GDopbQZSfdoUmIUWgoYMfubf6Z88+2Bp5UtC65Okxm6s5EWLZHec9Sx0+B+nGwXXR6yvZNESjFI/dMB2SGItzZPVPZfKdffn+kPvSVYguP+DnG+uuBY8eil0Y8m52Q60Ky4fvQdwTOaoHOtfh25dXV7HSISPv8n2lBl6ORBcq+lygRetevI6LVlPjx4Pl/TRNS3WqbgkaOaj7COhIZZ1txx4xrzSADwXAjmKeDalAv1bLS/A0/CgHRZPpN7xcHYImTeCJEcxqwF252OoJJnnjFrZ2DDq3YNdqRSxIwbIrftxNi9bl6o4Cv777TdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hne+ZhQ6gairMaVHIgKF4Q5ChZ49q63S9LCZcE4yShE=;
 b=WPGws41cG3x1fJdvp6DPvUoO01ifmCnQxiQzLV0dQWWTuU3sY+C8NyMUHYalhj6HsYjW98Bye2P6qX/84I8V/ryNeZQcolVayVFU2SyNKloktSh+hFQwMcKhWKjAQyehdfR0i0jY5uYcRzbKnEGDb6qc8Ta07mjagz40CArG0jqYuTLCcWYOIUnS1/dStlYfqOjP4tLQuClqnqm0aXXnsEqVGIrCvnl5ZlrNx9ZbarXlfAKhcFjlG1q+z5YbaOm6FFZhOXWJ1NCnDjmyBRWqCN+OClH5mLXYjyVUnqr80Y76V1rnFzfC/0r5Y/Brf+Rco7L+PfVgV8oiPRCYBIvZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hne+ZhQ6gairMaVHIgKF4Q5ChZ49q63S9LCZcE4yShE=;
 b=tvESyPXRMWIytfQmqJyxNDAtpXXdM5IJ7M+yAQUojquidUNp8HpBErDnmMfqsg751Wz/OrRgRgy7UEW9t7ZS9/OyrX4e2QaJXHUPwrYBeEAgC7DJthiJeVg4yeIInHr/2x+awJEg9rAGs72oU8mvFjPNWNPcc8HQt1XDB/1fgsfPYozqHj2g81Y1IrdZkB2u6uJ+dyu/AXhs0xnrYr6iFtLXUX0gRymv3+T7ngw4urH4Y3W4b2bd+jfPX0c5EODF6nXXmUMebLdJXmIybx3PRILrVQ9QnTAVq82yEiXW0WTjjXtfYxCoiXhw2WB4YDoC2oIsiYh7iT8dWwJDVIDvJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA4PR04MB7631.eurprd04.prod.outlook.com (2603:10a6:102:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 08:36:01 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 08:36:01 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
Date: Thu, 12 Nov 2026 09:36:00 +0100
Message-Id: <20261112083600.1550204-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA4PR04MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa75e71-2214-43f1-ede8-08df4097fb67
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wnkiv5CWobVLathy/zKpE2WbjpP+7btCWsL6QAEvrSL1CZLa3CsR3y7lszuQDsHhi2WtvDt/fEI4Cdt463LcF324QftDGocfqsQDmDRNtvfR5KpmPUURHLunoRjfPSp0A0ZcnEX1yOI7LPVfoFxldAitrw1w2Z6EwNdnBc9HFOkb5uF2i0Pr2G0yX1FZDlhyhRrm8bfEj/qER9ZHxSQglI0rdRBix3vgjmMnGWGrZt++fYPtEHGRFlJNQ1flUd05WFakbzV9t+4mTnDC2m6SEYWbuWjZaHJnjQkjXu/4ruajwi/MYSDjufMmUkCUtSwU/7v08m7h+rW8BHF1pZE9uUjseOP6QKxr4gm8wH+Wj9KE8gesPa4s9l/ogplan5CnJaBiRg1Q20CEWXjllPVqE81Jp1PHWUmyLt8yTruPWi08oPrgG0+GE+8FTOvNvN58t9G8p/1eGb+60hhIX08f7G5CpGXILo/QhGo4pBZINLI5M990FNRO8CLLVqsl6SdLYIXUntQPk/I6HS1GO+GhGyImkyrYGand4ayEpHOYrHoFub9UjmZQql1ZzbCo9Nf7eNYEtIAstD8WNaGobAc7snkG2cyra5VZnSeGGt6bN1FQ0Ojvo4EHUFv1N/fE6mp7sLrgrtj28uxw1mLzoDVPGJwAoLe1UX/702Sy3JzaRIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVc5YzBVbDIyc3NvSHZ3elNMK3NqUE5XYTFrT0llV1QvV1V6NnRucU1JWWps?=
 =?utf-8?B?UUFpUUZpakRnNlVSMmhDWitCMHVHNGNmckUxbkVST2YrU0ZkNFJVdXBvTVhv?=
 =?utf-8?B?VjhHVjZjNUM1M2FSMkVjSFlvMm5ScTRjMVl1QlNsWnVCQ2o3QUxvR2tZL25y?=
 =?utf-8?B?dXVqYnRqY1VZYkNGOUt5eDQrMkZwQnFoeFM5bHlIK1hBL1VDMGEzT0h3aGxz?=
 =?utf-8?B?bkJlSEw2Z3ZQRHMwNjJGWmNNbzFLYkZHSU9VVExXV0hEeXUyVzFEZWYvUkRB?=
 =?utf-8?B?amYvdk51TU83TVZJUXZNL2R4VkRUdzdWOUFrL01ESDZHQVZ5U2QyQjFJVlVD?=
 =?utf-8?B?Nk54SHlyT3RQeXNVOWpYMGFYZGZUeTlNV0ZwemFIckk3K0hPdlUzYlNBMWcx?=
 =?utf-8?B?NjVuRWJES09mNlZ6OUdSZTNTQm1zU0V2VVBBVVlQNzhzKzd0Q2JVVzlEV3RP?=
 =?utf-8?B?VUh0S3paSDFqRlowSmZnYTNsT2lGaVdhV3ZSSk9PVHhVUXRsSVBITE5WaWtQ?=
 =?utf-8?B?c1JRQ2NSNFkwd1Zodm9nbldRTmcyOG1qMTlSUmd0RWc2Tk01UU1WZkt6c1Ex?=
 =?utf-8?B?ZEZrQkh1bXRjbzRuTWhUN01vK1M0TFhScVZEVTJ2RzVNakswMDJGUkUyckRp?=
 =?utf-8?B?YWl6VmVKYzlTN3lnYmZrbHZNU3hmekJTUXkybW1pOXZBZ3VwRXNSRXhMSmxL?=
 =?utf-8?B?VmduWDRJQyt4R1BXZXk0Y1ZHL3dVN3E5VEp6b1V2YXd5RTBQdllyZmlmUURi?=
 =?utf-8?B?ODJQelNqdDJRNXRVazN4bk1sSGFqUFRBWEQ4QXl2NEVtenY2bG5ablU3VC8x?=
 =?utf-8?B?TjVqMmNDUm5rZ3dFL3V2SlFRaGJmN3pCcjk0elZFYkFSL0IvMnJPb3JIUnN5?=
 =?utf-8?B?bEFrL2dEemFEYTV5TnMxd3RVdTBtNE1PNzBIYzhoTENJMC9yMnJXSXYreDh2?=
 =?utf-8?B?bEJXVUIxL2Zia2V0R3d6d2UvN0daZmVFWmFpTW5GUUtHLzhzRnlFM2RCb0gw?=
 =?utf-8?B?YUIrc29BNjAzeDd5bGM5ckhpZ3VHYU82bldDeGd6cFhHMWpMbnJoc0NDYW12?=
 =?utf-8?B?Qy9HS0xJOGIxVTEvL1FVWDlPUnFoc295K1huNWp0U3JTd1Vac2xzMG85Vy9t?=
 =?utf-8?B?dThtQ3k4WlVmb1JtNGNaaDEweHJCVktrQnQ1RG9IRkxqRldxUDgvWFpZRGlO?=
 =?utf-8?B?V3VSdE94RTJCQXNVeHVTamdsMGM4cnRwOUlWbTU3MmlOZlNXeDhuSTU4WEtX?=
 =?utf-8?B?b3ZTaEFMY0EvTmpuVkRmcjNvRDZRT2hPVjVBUDJaTFZuamtONUZieDF2SEpO?=
 =?utf-8?B?aUFEZXdFQnpWRkltVkt6VkIyTEJQZ2UwbWlGb3ZkL29XUk9JSFFMTEhVcktB?=
 =?utf-8?B?ZisxbmlETkRFekZ3NEZ1L0NLMlRra3FBRk80WGcvMUY3QUlKZ3BWaFVUKzBC?=
 =?utf-8?B?WWRyMU5RRkdWSFZmYVlvMHhFZ0s1dkdTNkhCVW1ZMUEyaXh5V0lIQnNaMmRl?=
 =?utf-8?B?Q1R3ZFpTWVFLRWw5bE1IV1orakdpSS9lMGI2MURVTHVIWmdhaStYSmRVQlVJ?=
 =?utf-8?B?NGRVTUhaYVFKTGRtRm8wRXlaL2NXR0lFYTh6MUowUWF3RE9GcHd5SlhhZGFo?=
 =?utf-8?B?Mlp1MDlrNHlaMmZSY2JKNzhtZlF0ZEN3d2RwWVpEbElEUU4xOVRrd3JzdHk0?=
 =?utf-8?B?V0h6WlVjNlBLbVNlQWNUbDN6c1BFc0JUTlo1Mkk0dnMyejAwTCtmbGlPeWd3?=
 =?utf-8?B?WTQ4ajZucW9WS0ptdHZaM1BCeGVPNXZEMHhuQjZmZFd1cVZWWUl6UUNtb1o4?=
 =?utf-8?B?K0Z3UkZpdXBTRHRCVlJHTWNVOXUzM2hOOXAzemhtbTFWVXJiMmdENHVmMmJJ?=
 =?utf-8?B?eXBleDlVUzhxTWZJRml4SSt5S1ZKMWpMdmpmZ3dKT2xpalZuaytlMTJuYlhR?=
 =?utf-8?B?dTdtRWxiNnNKV0NzY21xMnJ0Y3E1ZTVPNEhiTlQ3MWl0Y2ZKMG1BZEFBVDhw?=
 =?utf-8?B?bjUrdmtPVjBUVzRBZ0txS0ZLT1JsT0t4d0p0RXZBZDc2U2lRSlhBS1VuMmg3?=
 =?utf-8?B?Uk5zV3ZPSTZwV1pwMW5UUGVMcDJNaEpCZFk3Yk1IVXNmV1Bhc1FKR0NBQjgx?=
 =?utf-8?B?R0NtVVg1Y1AyRExFK2UybXFNRWxZUXl0QjI3Q0pnd0RsNm5sSzNOWlVyZ09N?=
 =?utf-8?B?S3VPNEFlT2ZMUHROMVJyQTRNZmQ1NFcvN3Y5bkRCWU1HLzg2SlNtaTJLcjdE?=
 =?utf-8?B?dUVpbDNpbllEcms1RVNCbUJ0aVRZMU1VbEl3N1lLeExjZ1JiZXQ5VDF5OE9T?=
 =?utf-8?B?bmsveEJwL3pweW1rTVF3QituREtMU3pjTTRFUkhyY3RuU1QvenZmQjFrRUVT?=
 =?utf-8?Q?0ZoNMR8Yb/Bwq6U/qLdjL2vbMiwmniJm24KJN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa75e71-2214-43f1-ede8-08df4097fb67
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:36:01.4845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYRx1Z2fRyWrd1uhYO1sgRAYCCeGJh2NvHyvqDgNuXN73mdEW9OQ/Vc5KuvbTbHImfIigjDHiskaxW4NUpc6fHSNfshvlKH85lX3fvvGg5ljbXaHFEgo6VjoZ1AujXec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7631

The SIUL2 pin controller provides the pin muxing used by peripherals on
the supported S32G boards: the S32G2-based S32G274A-EVB and
S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
some peripherals never finish probing and a defconfig kernel cannot
boot to rootfs on these boards.

As the driver is required by every supported S32G board, make
PINCTRL_S32G2 default to ARCH_S32 so it is enabled out of the box,
while keeping the prompt so it can still be disabled on ARCH_S32
platforms that do not need it.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
v4 -> v3:
- addressed Sashiko's review comments:
- keep the prompt visible so it can be disabled on ARCH_S32
- depend on (ARCH_S32 || COMPILE_TEST) && OF so COMPILE_TEST works

v3 -> v2:
- add the Signed-off-by tag

v2 -> v1:
- list the S32G boards that need the pinctrl driver
in the commit message
- drop the v1 arm64 defconfig change
- default to ARCH_S32 in Kconfig instead

 drivers/pinctrl/nxp/Kconfig | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index abca7ef97003..24f94900a8dd 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -1,15 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_S32CC
 	bool
-	depends on ARCH_S32 && OF
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select REGMAP_MMIO
 
 config PINCTRL_S32G2
-	depends on ARCH_S32 && OF
 	bool "NXP S32G2 pinctrl driver"
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on OF
+	default ARCH_S32
 	select PINCTRL_S32CC
 	help
-	  Say Y here to enable the pinctrl driver for NXP S32G2 family SoCs
+	  Enable the SIUL2 pin controller driver for NXP S32G2 family SoCs.
+
+	  This controller provides the pin muxing and configuration needed by
+	  peripherals on the S32G274A-EVB, S32G274A-RDB2 and S32G399A-RDB3
+	  boards, which cannot reach rootfs without it. It is therefore
+	  enabled by default on ARCH_S32.
-- 
2.34.1

