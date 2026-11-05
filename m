Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793850997;
	b=mXlWbs9XfIi2bTnOvjw4kQmrrC4sPRFBqAFumaz6TqKTrALqqtMhBy9HLxspb8qgIx3J
	 CRUDPGCDiWCJKEuMieFzo5oSKCl0MZmeiMCoWZUK4i6Fk7TTZFq/acOxDQ7Oehq1Wp1yD
	 CJEQtmaC1d//jM4bRzTTaHRRkqX0gh9TWQr4pr7cxC6l32+SYu6w9FFnE6c8FUzksCKPD
	 IlzGnYBr/er23OiPmsrz1nQcUQHHyPGEZUotl+hom4qDe1/XoUhgGEv+gepUqBYNfsLnQ
	 Rj01Y2R1ySKdSJU08Xwg28wefQAmqBFnOrHMbKruzAqs7qMtpoKWcyhhokJB9nvYZyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850997;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0IPEZ5d0pVs4ES7Q+/gElq6g7c/4MJAGdT1+EdlvsX4=;
	b=U6A+YFxHfquxQjJS5l0t/vCqKlE5+uz5W7HvXQ9mxiYptmPjBja6OFPZ1gfcqZRmakZK
	 flLr98W5iTo2uE9ZNeZwrkMLq0rfmdnz26n74y/xDnIJGfLdwp1jelCLYlcgyNFC79dEy
	 P6HqWwZh8mZ3g6niIl7+0WceO/mi4BViATYcw+52zotLuY/lAyJBuizPO2ma0Ia3PoLcD
	 CpiOfMj/R8lcGPWcUO70suSWYNR/e/crWwVboH2qCCpma/Kay39BhG2FkM+0SfQRYcHGd
	 /yhGMIklpAIWGuXZKJvVR1PTH20ixDM+jlqdYuGirwZ6ODAj+DYkz8L+Blz4NlteG4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="WKh/bWTe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C4E606A32F;
	Thu,  5 Nov 2026 03:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C4E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WKh/bWTe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRFA3I/N+tu6TRLqnmuhr5iX4v1dZTWDMAj6yek2nWQBvBT9BCBs4VYvZB2wUfdddXk64GcaD0o8hK6ys0vFsuK86EDWz/x17oC2/cza0ZisxpQeBauNXllbIj+6eToHnrIoYZPCqTqOvvQqcdt8KByNMZ5M1KnU8eQmdguPDiW1CV8A2/Sj75xB3SFRHaKXXcFwaZFlzqrRllgqx/z9X9F4N5xXrIXnwdaSBV5Sz5t8OInh9X1YaLEE4htruq8600MDmqJDFL78agdfWx5q7DFw064wk9jPwqDzxytLzcytoXbaxYB9E4B6nUCJFPe2CxExH+CZHvGpaZCbuS/9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IPEZ5d0pVs4ES7Q+/gElq6g7c/4MJAGdT1+EdlvsX4=;
 b=cCdaE6kaJhyvLVzgFA3kudxrvRJSiyZokAjw/GUxFbXUC4wTeVORD+AlALF5+9rbgKhFqWIXdRWEozcpZgQoMvvvFf4BKSNmqVCwfa5P2tPFs9VZkWLNO8ALWCKPeXWCnV/8ztK9FKo0s2OWqk27rxCv9Mz047P5FaL8kD8n4YnjmO8wV0fQ3hi178UMhjPzKSOlRqA0EL6837sDCiWtDA5nNuJ8liJ4hiOQPn1RIZVqHD7YYjBm8ZKQXIKWZ3s2U8r3f1KtkoRmlHchjmneNbEqJnHwjCKvneRuLNscmSiXemzGv+0q4npASsudhtlYn7i3NC75YyRt1pmhy4IDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IPEZ5d0pVs4ES7Q+/gElq6g7c/4MJAGdT1+EdlvsX4=;
 b=WKh/bWTerrbdx82COvYkvvDuywvKSbUOE7lL624kL7SJufrsAqRVkybY1F3pe9nyf6v4Q/AlNEKmWn5dyvwmRpRm/N4qD/gPISRzdngkwI7TkTba7gMCl/0dRbR1t7m5D9O2iSFS1cwOGPgE1mXuABFA3P/D+1s3UKZBPna7xqyrktJFfmPTShjpe3czXWLv5vKtuQ09CHuvpdP3q0rTHa9J7fsRuKHtwdrzN0dcSsEd+ZnR9Gk9ryGjM1ZeShSHOgUXL95xKWjX6XJOhV6j5ycwaC03RXlm8mHjU+/XGJMAMBe7bDDif4jrxKm6fnqoCffKO2lSWUR5prlabg9tyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:56:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:56:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:00 +0800
Subject: [PATCH v3 02/11] gpio: vf610: simplify with irq_set_irq_wake()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-2-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI3PR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:4:297::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba53850-9ef1-44c1-2cd2-08df3af0c882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JOhKTKQVSp+yiAFXbb6V/m3Pc5xC58gaDffyvu5XZErVhgldwd5/nlC20vEUKU7+Ej3a+gGNVvlp3azfJaxowuOsK2R/rBpUe3AAVTVhkz5HolaaahlXQEAgxCtmrCOp9LfGFZkFe7TYvdqDaGEIoJ4NF+sQrDGv0/IYIJP2UqXX9k1DEF2/la37SjKKvIkVRHQiXRq2KZHf6Qcvxq3cRQKsUeu3Upq0/UqqEkZuifDc+Jr6hLc+bVoibIHSBJIX6s+CJmdFqsLVfjwUqaM+q3C8g8+ZimXk6liaHYkKR12yU/BFXH6HfVZD2qHMdoicw3cb32StoNmVZaSwIL/5BaEImMV8X4GACUKhnnq+j7BSmko7s/P4uZw5jR33eJaksh7R7bdytfDR7MYoP201tAhACEPAUCWy2ZdNuTGs83YEoTi5FgtYca/BPfeY2e6o/AyhPs7KkCOdNVdVpcsbFZoO+XoEfSmuD5QCaVQC2cjzUACouIeqOPNcSRfNZVagNXw6ZjGgCwD3mwAAwBEIz3zqxtpW2G7XKMBzftwYYxilc9iyDBHAahUFwzDYMQXcLAWs9pk8I60PriAPNNpyRnYJ2r1+IHAVGK+ZVQ8jiaPBg5Re6FSZ9lyAvv4vklGDPasRQRcX3oLZfG3el6IhvPMKt283JmmRrdJw4j2p39deYCJBXnjgMyEm9WqAokcG35AsuSo/8JOY04ksKCMk1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUNVNGNWQVY0dDZPaVJnZmRha2pTTllTMThLQVNLZE9Tdk5JMUMxK2E1NFJ2?=
 =?utf-8?B?WjcxVnBwV2VlOStPMnR0eFRCcitob3NSWW43aEptMFBYZVFiK3BOck9sMWw1?=
 =?utf-8?B?YmFnT0Z5MjY4VmRHQ0YrbU5DVS81dGdUbnpHcWRObXR5R3N3L3NsYUtOZjlB?=
 =?utf-8?B?WUkvbFk4THZaRFBZVEQzTnNGNzhVVExGL3lmamszNzZBYnd3ZDRXa05EOS8z?=
 =?utf-8?B?eG1EYUx6aDJhTy9wQWhmUjRoWnlHYjJGQ3dicndDN2tFTFpMdjVUSlJncWJa?=
 =?utf-8?B?d1Nzb0FibVI4b3ArME1GZVg3aWhoMmdjZlVsM3Uvem0yajI2SWh5Q25JYTg0?=
 =?utf-8?B?Tjk3bXFTYWw2R2ZuS1Vic3YvakszTGY1VDQvRmpSM2d3OXhCdUMwTnlHYnly?=
 =?utf-8?B?TFFDbzJRREZ6QXdESU82MnVpTi9ORG90ckNDbXRwcldnMkUySmRCYTZwdjkx?=
 =?utf-8?B?a2VOU1VrdXNkNkN5SVFQQUhBOTZHaHFjTnhXQjdwdFkxTEFhY2JaaCtzcC84?=
 =?utf-8?B?b05GV1l6OWF4VlZEUytrazFrSDd5Q2pkSjJvUVE3VWtLTEUrY1hNL3VXcUxM?=
 =?utf-8?B?MEdNZDljWXlCUVpKUzB6NzRlcmFDVWVRdXhmemFZZGRRMU4yYlhRMjVEbHZk?=
 =?utf-8?B?bmtlNkdrUWZlMDVqNXpWcmNsQUxsZ001SXRoaGNPbUdvcWtnYXJuVjFjUysy?=
 =?utf-8?B?NTVRMEwrZ3h3NDBCcnJlamM4VUxmVTgrMUFDNzE2STBXN2ZGRTM5R0I0QWg5?=
 =?utf-8?B?Tm5NR01BOWREempUNTU2dmo1Q3NjM3FWRnVqa3h5YlpJTndYUFFRMWJTMzc0?=
 =?utf-8?B?OW1DL1gwbkc4VmwvZGwySEpFRi8rS3pmSjVDWjRMbFVnKy9ZRXg5dVNLSWhH?=
 =?utf-8?B?alJ3SGcwSEdKUmRZVXFjUjdzck1vdng0LzYwS2J1MGx0b09JVmpEVzBHZlpm?=
 =?utf-8?B?VGNQdlBoOU95RlpsMEk5Vk44cWlGMFNhb21LQ0x0NHBnZHBiNThsemdOTndu?=
 =?utf-8?B?K0V2d1Vkdno2ZE85UWJnVWV4ZndzSmZFaytBenlvT09ETW5RM0lZVy9aVkU3?=
 =?utf-8?B?UmpNUjNuTFY1eitLNkVaQ01VWVREUzlvYkZ4L25mdGsvNWFRN1pJU05IZHFw?=
 =?utf-8?B?Y3g3WDA3UGRkUWRlUGRwakx3aE1HeTFaTXBKc3pVVkh6TDhrWEg0VzBFdmFK?=
 =?utf-8?B?UUR0TE80UFgrbmM2RTg4UWhaQmptSW85ei9semt4UzBPRENNUnRwL2hxM3lk?=
 =?utf-8?B?L1Bkd2J4ZjZiKzJXcWw3OFgzUXRZNE1IVW11WkN3VFUwbmxYUnhoMUFKMldo?=
 =?utf-8?B?bEpqdDgzaFRLMUIxVWZkNEpZWnNGY1lySUJHMmhEN3RPc3g0dnA2MlEzYnp4?=
 =?utf-8?B?bmtVWXppdjlDM2ZvaTFvTzlFMENkZFRFem5sQ3Y4MUMyaVZxY0F6dXM4emZT?=
 =?utf-8?B?Rm11RDJ3T2lwb0djMS9iazFLdHhiN0N2TDVVUGVGYXc3bDhMMERaSWYvZjIw?=
 =?utf-8?B?OUVmSnJLMWxBS2tOeVh0TWFnL2wrejdBMEdxL2c5ZGIyZDc2RXVqTDR6R0xN?=
 =?utf-8?B?azRvam1rMnE5M3RhOHlLKyt3dnNEeWxqM0JIWlJVaXJDc045RlZ4Mi9oczEv?=
 =?utf-8?B?R2VUVFNlMDlYbjlCemk0S2EwVElXQXlJSG04c2F3a2IyRVRTZFJXVE5idjMx?=
 =?utf-8?B?UmNuMUVUNnNidzhUNWJJSW1aS1JxQ2VJMUtIZE1nTUdMbUpCQkZnTHJWVnpk?=
 =?utf-8?B?TUhnN1lRVWJlMUNJYnZkcWt5NmRTQnBZd09MTC9xMEF5b0Zhb0tNbE04YnVT?=
 =?utf-8?B?UVFreVJNUVJLOHE1T3FPYUhZdDkwU05MMHhwdTIrbW1kUlZ1blBnUHpZT3Fu?=
 =?utf-8?B?WWQvQmFDdXNsYUpzcGduVDVpWHBUSWwyMFE3V2prNVFnZDhLMGRtYXNVMEtS?=
 =?utf-8?B?YXE0dzdKR1FNLy9nNU9FcVcvdE5NOWFoK3hKdnNrU1VZdmxoMXdEcjdFQWNY?=
 =?utf-8?B?dWlkRVVmNVA4bUhsRHhtVFBNaDdjSmEwRXRsL2VBN2I1dTY4elVncXJxd2Ry?=
 =?utf-8?B?WVkzUU9kQk1LV3FGVnl1QkRqSGYzTEZRS01qTkZlOHFmYUFrZEd3eFI0RjhX?=
 =?utf-8?B?cWpEYVZHcGNYb0VXNTUwRCsrcjJScko1SXZqUGQ3WU9xT0NBZHFtSHY2eXpE?=
 =?utf-8?B?bURESlhodXJaZFB4c2lDR3h5UnVyUVhUcmJkOWR3NGtVbC90eVFVUHYrNlVm?=
 =?utf-8?B?blp3SkVIQXJYT2ttdTI4SDNwRjBtY3JaS2cyV0l6T0pmc2F4aHlQd1FVSXo0?=
 =?utf-8?B?V1YxRWlYcXFKLzh2NEIwR1lMRWxqdEtPYU5oYTR1bHc4cUI4RHI2V01qbHpn?=
 =?utf-8?Q?t5+NHK2nFp1S5uckEX0fgN722uomEIFRheo+y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba53850-9ef1-44c1-2cd2-08df3af0c882
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:56:34.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHz606Mdw8B5ME8/XbJhDhy6qgqrBQ/K+v2yg0iTJWUq8n6S1/Ijlt7pTZlpEcyQ1axSGafzmCBOqJmvNcrgzbC+4KES9COlBIDKtPUMeaAs9VYpKlW3VwkjctEJyWJt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Replace the manual enable/disable irq wake logic with a single call to
irq_set_irq_wake() to simplify code.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index adfa2c2d5873..c1c562071c0d 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -189,10 +189,7 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 	struct vf610_gpio_port *port =
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 
-	if (enable)
-		enable_irq_wake(port->irq);
-	else
-		disable_irq_wake(port->irq);
+	irq_set_irq_wake(port->irq, enable);
 
 	return 0;
 }

-- 
2.51.0

