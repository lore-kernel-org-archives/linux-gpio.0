Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663319;
	b=fAbb/t39EPCDElhDRp6JSVnMliSPX6U/z88eQdhT152V23fnYFQdrLrkRnaPSjX1mSrh
	 y6qyJyCzlO+Mkz5AxkXtVI2gXu0J5LtZRrfX445Kl6iS33KPXItAhGmPfl2oHQXnxtre4
	 AD9HtYwywWRV7i1FtFhZfwFchsA28JypDTJzsog7iC/q6Kx7ui+k+9H2tG/XVsdlT47th
	 EZm+sc7Gw5azw0lx5YNLeU2pHGSAlZH1DdbeTlkjhSCWrrMey7Kw1zEnTRDqFyOmOSGDE
	 LsgsdW400YvaJKnLK++Fl0Z0Nq5aIPfck+7PkzsonDYZIL6gWDIu4h3KGrcbKL3ZnRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663319;
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
	bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
	b=nv7KkWPXyp4OM9nMrSSyb9/FpOBXPRbBm4cyFe74rhiE3pLAa2+lStHRBgv8zqQB+x/S
	 xLdMQ/+TBG3o7ewjrhi2/iOyDSiy+zLbrRPw/YY5hKludpRBWvTwCapLhxt/gjgEIbcXQ
	 9fxiaAUZ2FNAVxeJYUxAJ0yo1p7URED5Ulg5xW4zmjhbljQxkDz/WC8FfXNnIlb8QqpGk
	 Pqqn2ypaIW4KQmdvwK8Tlt9ULKsvNCJojSC3IHXKyCgdio7oRZ8fVwu3tlfhMwD/fuXqv
	 uv5ZaSDN66YKN3eyoZp18H1VAGgOaaQdg/uvj8EOj1OgAOutaai0ABKgrYwxBFXhQ4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=h4dwy1cS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.36
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF616606A33E;
	Mon,  2 Nov 2026 23:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF616606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=h4dwy1cS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJq3P9ce7doAGUOKjs/hwpkcoEAeu/S//rVXGWlIKklLZeYtRgCd0pxHD8iQb1SXmriM/T6CUJyZhsaPF+aMuHe2ZjZIrB6HEA6BCGe4djd5B53jVm1LbtZ1JbkfKqKT5S1UN590xsFdCcxuP8DAj81omts1bmL7bHWTT/a4whjQ25KWIkDaic9cDP7+AlboJ4onaojbih+vkIVaj26CDHY7GDVXz6++iGAX7uEbhG5+VTrmsnLfP++io3wIHDvxa7oUK0/+TZtFk+VLRchbHevzd2cYWqScCkucLEYtpIo9AXStH0d8fL8invDE1JVgDOhMIFlBPnZ7dpPKP50TpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
 b=kFkiWIeiZGptLeOqQbj9OzGprN1nf4gL/o07J5ZIq9sG0lssFm3gU8zwBhEQAWbEpSSskDZWyViboiodYPudpqF/Y8ToH4L92eOWNDWKIAX5FPxMwUloLqtHbDB7wuaPedOT+OB52zMyvcOy3d8iTbsSz90IPjBl1NIPXN/gf5QlTvlMwdD4NFz8CJi9bZ9q/XGvaZ8lDI+F3gMI2VSQ49eNrK/n/C4BO0nv69UWxrtsvNEzbPeKL31h9WexbPf5Ak7yNTxwC9Y0vtn3501A4XYHERWwUFKD4IfhjFPYLkYAcIAMDdAnR2VpOVs1LukIOrjwIRVpxMJPqqLbrcNltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
 b=h4dwy1cS5csHRHpKZHjwVHuf5r9ufb96DmBrvFSWZP7wmAzTPVLzgC30bv572dZsQmQmc13DmUoTxd7pk2BGuDQIyg/EPKgipcye1OyikvchCiXJMMmshsyXyvcMB3lvtUJ38lgFFm3Tvk66V/4rJPKnlE3KVpKdHg1okIw2+gQCoBoyuOh39JpQopmA7edtfsGekhyoEtSqtOx2uoq1FsVwCX064WDhsonGHODD/E6IYJIWbnNvhWz2y1Mi6AOR2k6U94k08sWuuypYOb3qgzDMTY9qv18db5Q0a8i5jearSWUEVXw4OCTKXsh+RRXfWXoRYzEAuhfHiGWpslbMgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MIWPR04MB750268.eurprd04.prod.outlook.com (2603:10a6:290:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:36 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:15 +0800
Subject: [PATCH v2 11/11] arm64: dts: imx94: add clocks for gpio controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-11-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:4:297::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MIWPR04MB750268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7994f38d-4191-405e-3982-08df393bcfde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|366016|1800799024|23010399003|10067099003|22082099003|261102123227099003|18002099003|921020|56012099006|11063799006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Bvhw7UXfc9DRZM9vNCG4y7XcwT7yWCgSUCnRd1YvP4WZmQrcQ3ia94wO34F2/e5YAF5m80Eb1gYhMCklo0mOGCBD50KiXTE9MV38kNmyN6QzNXc+Fr93HYHEsu9Mjh5SjbEUsu7zMBMCexIF8ilMHbPQtv9rShrZ2gZKH/velf3Y4uran21vLLzXwLqztQdTSvaSIE0BVGBCNPbtKaVdqFeV9VzQXQKvaywXyGCEhfiRPNG3QREjNsxP+utXHKUbd8/yuY8XbA5qh60fanhwk9+OBZ2nVh6lDnNJnMW8Gi/gC0L7r3Hk5iVwUgERfS85tPs9wpOd3rgVTSUqs7Z82RdsNNNeWWoyUU/MUT3/+9WQrD2lIe7shwWFM/T7H6b0hVnPCqRSUq3+aUwR+G/+XaTbHl7ZHJ1izo94LUzvZVy/63YG9BRyEaA9bmsVv2eudxSnReW97HESzxaBKencrp/imeUSoqogGtct6TPetE6rSKjzNgQcsxCOruOVhsfyY6TWZpqbarOlbdU3Kup048ze/jnrLrfRhFsh33V2ec6iCeJMYvpM3U5NArJqXiOf2V/NEOpzW83cSvau+uTTqfUsO+8itWpEpqfnVsYwK1fQhkGkV/4JxQBxOz+Z/jZxmPzVS8dbFk4UBlRvpblPHYF5Qxsx2EtCgZLuju1rqvctKLFbGTjNR/c47L/DUjT9qhsrg9oCJ/1q6k5WntMndg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU4vY3Z6QUU3L0d2TFVwY1dzQitxdERscWpKaC85R2pOL3dQUXRBTzlEeW9l?=
 =?utf-8?B?Z08wc2lUN2FmbzdSTzg4eXVQNzZma3NuTzYrVnl5T0dqa05EUWFxOWpzeHNT?=
 =?utf-8?B?NkkwazVlNEZuOTA5QzNsQXJtZnVoRUk4VXpIb1ZIUUtsWkFsWStKZVdzZHZ5?=
 =?utf-8?B?U3c1aTlMUzcyODQyYTR3a3g3c1BYdVd3OGgxR2NqWFFEWFVreVlJdjk1Yy9C?=
 =?utf-8?B?dzdiS1dJcGd2OExTMStqTEJrV2VlSERmd1R6bTZvbTkvQW52OTNZOFNZUWE2?=
 =?utf-8?B?NDV3amVNZUhDemJJWEpILzVlSXlwMVJjbHJsOVh2UHVNVGFZc1NHVUxPU21z?=
 =?utf-8?B?NnF1Zi9nWEJGZkI3N1BJT0M4YWZGR0tITmNWZnQxQ0dzeGR4cTUzdEQwQnAx?=
 =?utf-8?B?Sk42aE1mK2wwbS92blVQUnZVN0tDdmdxTDJDUVhpaTcvRmtvVlhBWThXbGFW?=
 =?utf-8?B?c1lZQlBpcW5EVEVuNEZFMWNvcHFOc1NmN0lCUXIxYTdyT0REVG4yVmQ5bzF4?=
 =?utf-8?B?ME9XMWFHaTJnQlV2R09rSU1jWWZVYndmNHBCMVlmaDBBRnYvdDl6SloxSlh1?=
 =?utf-8?B?dGI2dkhSd3hLYmtIY2lwODd0MFNPb0tjZnMvRlpraXdoc01UdmJNY1ZNZmIr?=
 =?utf-8?B?Tlpzblk0NGltVkZwUGUxVERtT2tsbVQ0QTNBOW9rQ05lTXluUHc5NEhaZ2My?=
 =?utf-8?B?QjFaUjA1WFJDdFJpSThmeDlwQjNCUVYxQTNydGU2VGx4Szd5Y2hIZDQ4WEN6?=
 =?utf-8?B?czBOV29YWERoN1dIb04zU0hjMGQySXk4RGFxL3V2OVJ4K1M2SVVkQlA2OGU1?=
 =?utf-8?B?dWhtN1FoMzF4ZjVSdmdyM2xWZHBmbjNTREw4amdkVmliME9LQnhTZUFiMUE4?=
 =?utf-8?B?Sm8yMnB3bHloYnRtV1psUDRyZXNXcVBweklMcnFhdXMzSlREYnBCL2U0OTg5?=
 =?utf-8?B?NFRpMXhLSDFpcVdWS3JBMDVRS1JDM1hiVWQrT1JDbnlEUklNQTFPTVFIZ3Nq?=
 =?utf-8?B?NERDMFRVQ0YrQUM2WFZOc0lSQ2Y4S1I4ZVRGWkRVQkZzUkJQNmJVTlFTM1Fq?=
 =?utf-8?B?MVd0dnNkNmwvR21xakhidzRLRjZGUXhVTUZhVFVEd3VHMDhGekpzeFBtNzJt?=
 =?utf-8?B?QThCSmh3V0ZKa3lnYnFabXFIbk1ON012RlBPakRBek1Cb2J3TnpHZWRiQ1pL?=
 =?utf-8?B?UDZRemgrcExLNzdscXFyL0dLL0hseHVDSEJrYnZraW8rZmtYWDFiUlEwOEVJ?=
 =?utf-8?B?WElxT0w4Z1F0c1lJRFNTSkpHYnloSmhpcXhBMmtTR2l4TjMxTTJsOVVQcnZ0?=
 =?utf-8?B?S3psZncrc3VpQ1ZTbkNLc3NnUkxXcXp0Q2FINEJOZktmSHpSdVB0SC9XYncz?=
 =?utf-8?B?eTRJMXBma3dJbmloNjl4TTJPK2JBUWw5NiszbUJmdFFoQXBqa3pzZDZ2Tk11?=
 =?utf-8?B?QjZCV2tldCttZitZd09iR0tZNTNHTnh2QWIyRmtjUUo4MWdIQmh4YnpGaXox?=
 =?utf-8?B?Zi9sY2FPUUZUcjJaYUp3cElYMWRuZ04wSzl4d1R2c0tDdnVzb09zK2Y2OGJM?=
 =?utf-8?B?dGNEODh4WWxkMDVPQmRlQ1BLZ0VzRzJXTGJoNkpjU085ZXVoQlVmM1pOc0xl?=
 =?utf-8?B?MWtSMlFXWFVSQnIrZWp3REJRaXlzZEVLNmlmL21ON0lOeFNOVGlwRDd1Z1Rp?=
 =?utf-8?B?Uk9UcXl3aGhaeUQvTENTOHhyblRsNHJFanR4VlU4cFl0ME51VEg3THhhS1NC?=
 =?utf-8?B?dmtzZFBDMnlGbjhpYnhzZGV3SXNuUVY1Rit5Q2tSa0lycTkzNEJUeUpkcGxN?=
 =?utf-8?B?RnBDT3U5SHc1cE5YcnF0NXRXVXF5SGFGU1ZFSENyUTRsOGcyejdldkRGT2NJ?=
 =?utf-8?B?QTBWYzVWbVNRZGhXd2Z5enA1eUJTeHZNRnNjZDBESy9kNzVtM3M5ZE9zcXVS?=
 =?utf-8?B?Y2xQYjZialhCN1pmc1hzRmR2UllWRDZIaGc4MVNrUGFzS2xVTzlIaGhtS05r?=
 =?utf-8?B?ZUJFVm1Qay9YM3JoZ1NJbG43Qkw4WnQxa3c1cXBTVkpEZGlwWlFpZmN1NXM4?=
 =?utf-8?B?T0ZUWitNY0tINXg2akhtTGJGTVpTa2huYUFGSndyQU1IQzVFclBoMWRUL1NK?=
 =?utf-8?B?SUFoaWhOZlAvRkdJM0VsbkowemloMFJUdHVVQnR5K3BhY3M5ckIvaHF4RFVq?=
 =?utf-8?B?NjE2YlYyZzJiNWpEaEJtVUNNWXE1YldseGt5SFRCblZ6eCtRSjkrWWRCOE10?=
 =?utf-8?B?dGVOZWRCS3FHT0RYOGo3QUp5QjN2dlBOeUxZRG01aXZWeFkyZ1o1d2tpQzJu?=
 =?utf-8?B?VCtza2w0V21Rb2IzR1k5OUF4YlF6MTBWQ2xrS2tTUjYwMHIvYlVycXRoOWla?=
 =?utf-8?Q?k99OfFDWG+m5H3yjCh5sI3NsdwB4YkpVknQTE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7994f38d-4191-405e-3982-08df393bcfde
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:36.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/uP3O7yd3pE/wzQL2F22ROFyw20vuHm6jytDf42OhZjrKC/KHg7Q+HLJ6j9Qhs88dlzSP74msycwh38y6GH0tCE3K4Zh3/cGmsHvrwbfQjjFwP4gDJlgyvsZbumvuwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB750268

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So add the gpio clock entry.

Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 020aa1da3315..90925d48daad 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -861,6 +861,8 @@ gpio2: gpio@43810000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
@@ -874,6 +876,8 @@ gpio3: gpio@43820000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 36 26>;
@@ -887,6 +891,8 @@ gpio4: gpio@43840000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
@@ -901,6 +907,8 @@ gpio5: gpio@43850000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 108 32>;
@@ -914,6 +922,8 @@ gpio6: gpio@43860000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 66 32>;
@@ -927,6 +937,8 @@ gpio7: gpio@43870000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;

-- 
2.51.0

