Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851003;
	b=5CWu/XyzV7IMjfcvTR02p8sCJHJexiNir8OxC4LWPKL0YToGOc8HIxr4i2nO46tg71X2
	 xUpo2+qzDg++Qf/xlhrhsEEijuY5Y1Nl3AQchhN5LNiap4nyjnX+m6R3RXpRQ85jSmGP0
	 1lKeZG9FlrW3Q86LkoxJnF9h7pjfrgDjO+KPqMbfF2A2t/kBvdGn136s+CPqpEeZ+SPl4
	 4kNPQbtZTYo1NOUcGkkGAWi21lLVpp/QvP+9tHNBioS/Vq+MW1gcRZgp0iuZnji0vk6o+
	 4oKLhnxuvkXIJkVYePG6M7v9mPpPlXxpf625H9K6fpF5n4Iju2jGVuGiY/npJDz4Wuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851003;
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
	bh=MPOS/miJAuqLvdDzZuMenqy0qee+9axgzE6K4ViGdaM=;
	b=qK3Dw5FwQoXvXWXLifu/nXyh6vbPHEC796UDb+0qEF+Ws8D3kcYO14L1qtF2aVYOWcXS
	 5Vli7WW9dk/0fQwGorQKq2X+nzOSNMIiOiGfp5Wp7cN4LjzgDy0uHdm33ne/biylceyB6
	 QR2oKLeZnd2JevieL7QnJXiUOMGbNMljQhGrUcza66B00lPjuPtYrJwqkkNWyJmZfKjNc
	 AJuo48DLblGRJDcPvpYjDPoIdlJUpuM7q6UBPEUsLcc74JGKCMTBS78r5DxbQuCd4ynJQ
	 R2aVnoyZt4H4yzHIEyrG2DuJ3RbX1y2Mrl168+yHxeH/T4DR54U/QFZQrxPuwhmstHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uMeDOTLB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.29
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D6606A33A;
	Thu,  5 Nov 2026 03:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613D6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uMeDOTLB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCoi7O+M9Krw5cerGkpIFoN1AnSTgw0+YDFxrUg567ngE+/DCtx/gBf1dDHopFPZrSW5J1kZQ2S0pEhHL+V1X5AwAfap35pY57PGNv0CW2rbDIj1MKIl1OA3M3rtLBANjJWhN31UZjv54y4D7+0IuetHRbxAQA/x/npq3IjgxEmCSUWF2Xn9rZLdlc+UrGdAFBltIha3dkxdtEJuSmouZIxs8Hsl4cevQV21LxaBZ7nje4koVcnNCX+I9g7XXvpMKxe8AUYue4MoD776i8lGqUd7CkB26fhP6iewpRW3p0urTDxcaS4IOo0svVfxTdL4ut2Nn02bxR3INCMUKOrTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPOS/miJAuqLvdDzZuMenqy0qee+9axgzE6K4ViGdaM=;
 b=YKdJ4k1/gkX4+Es9nVvG/9Vq8foHeXPJppXTqn7GtA67UlvsJSuGWKJxtlkaK67PvcQatvcwZIm2fsOT2xGfrEULlDtgd8ZLS3HyOE6uNQAf5MkVYkp7jD1ndlNWdf8l2wZZWAPUM28WMGu14GZr4VLcI58otx4gpGVmoATaG52MZOiSGxleyU65JcBYaQTb0ryGaWAjP/MW2oLXy73c/BCM87pYpNWERbonAUaf89YWplKCuIOX4l5LJ6X0UywW/k/nt1EnvfNeicPp+pfkT1BkPSWFujEkgTWA+eypnr5Opz5dwCDPYfLwcwSnu9LFEwp0oLKXL4r8dkE1OJ3xtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPOS/miJAuqLvdDzZuMenqy0qee+9axgzE6K4ViGdaM=;
 b=uMeDOTLB8bffRBvDXNjEOwqSiYSU6mWCCCsmFXeryUCWShs0HEo9xoYnNKPOl01KR+DmfVl/0yeXMbK5sXm4BSr5KKVdZuWlApDh6NSqXgDh1nfbeBmg4tR/ZUaW6Z7FOq7QnPs5r1itg8KrL2B9SjT0y0xjomhTcoLGCLrIhba2JqPt6kfhZIi1qBa+digiAqb4jcnjx1kFvAqOrHE79U8Inkvhj43sMDRCFHLOAdCMAzeIP0JReWrMqcBMZ9Qr3EB7ZsukYNnUJE1wHZ3uJ9JMmbcxXYj82FDeS6yDaikkDfXNjuawEhIcsy0WhC2s7DgnZ/GNe8WLyxhO+6gyxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:56:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:56:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:01 +0800
Subject: [PATCH v3 03/11] gpio: vf610: use devm_clk_get_optional_enabled()
 for clock handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 8b3d2ff3-b5d0-4a1f-9770-08df3af0cc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|261028144727099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261022075727099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	03O3AtJ0j+tfgLzYzE3BUh89DQB5Wx1imOoqq+5x4sJDkzjnc/vaOunllV/JArM/VWaNkdHotOe83dIqBvbodPslM9MTuNXWmwjI4XZYAkkegVdJXrkBHduPf9oZRKGqYiHQyS497xcKAemeqdMe6Bt9HJ1+fWepaW24EBJkJWS98S5XYtiQws4PkekW9ELDcxK1JU/klSStMoKp9UZyUNpMPqX28SS8/q8llLYObUk+iDw5dgfdDVPZovUDLmyPvp+qGoWez2nMbGPUreIl7eyyPKU/EJ+cTU14uHdOVsiosbk49QbzcSgZXvi0jB1vZJSWGQKKdrdy2PesOBNvwHpMbS9+eKBaKezwrvLmKLkkX2SRUh5lcC/Ga0WGy+SGwCl7yBesJsSmxt4Wcr6n6B+cuBNRsCqo5vi6ix+u+K3IQ6Wg5yDLxe0B501Fiml8+MecDB+brkrOjISUGdl5o8HHd/0dc+GJhEbd3pIk9Ii0gDPSfvsdLLmQlOQtY11C5bDa0hYj8y8FhscDAcOEFoHTMeHEzgfX1oUvIhIOVZAY6oFspel++1T76Myr939sefIA4KOe7jgxf8pN9w+9eu5TyRQr79ErFJEqETUiCCw+iJE5RilxxEWKrhZ280FLmjaxdBBqjxkivAAFZnwqElIIoFIlaSFMXLjh+P0mTO0dqg892/i5YhY2vndr4dEc/ZRTNx2NE3AoG3/CLfc1ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTRnN3NIb0JPckxid2pFelpMbkl5SXl4WlNNTlBIZ1IvMzd1SG02a2RnYmNU?=
 =?utf-8?B?OENyS2UxQVVvbnowbG5ac3hmdmZYalJvNmdWTm5CdWlaODVoajVEd2VXeldC?=
 =?utf-8?B?MW5kVWRoZkpUN05CZjI5cGY2d0tyME1DVE9NYzdnNTBNUGtVci92Ri9FSjNX?=
 =?utf-8?B?dUtUeGV0NmhKVkhTeHltalJPTkE0OHdjSEdGMHdJSm9oZEdkMExmNjRFQTZq?=
 =?utf-8?B?dVhNK0RLSTFHZ1ZEYkVnL0EwZmxlUmZWQ1Jub0VNMHdJRXdmdlhsdVc2akMx?=
 =?utf-8?B?MGJRb2xEcmpDSm41ellXTTJRYmIydTFHdlJFczhvRlN3dy9XQ0VTTGV6T0li?=
 =?utf-8?B?RXlLcjFBeXdxM3dtN1gvZHVETDExRWNFUXo0TUJMdzhVWEprQVFyMWJlcCtv?=
 =?utf-8?B?MThDSUpiRUM5K1BwRkZLMVRwUDIvWGQzbXFjblpIdCtmR3lLdWtYMVlJckNs?=
 =?utf-8?B?Vkw1QlJWZEg0L2kzdDgxSDlxbktuUWcwWkpkNnpSQTRZMWlTV1NvdmFnZ0Uy?=
 =?utf-8?B?U2dWM0xIczZ0U09DNFNHdXU3dEM1alBOR3JEQlc3cU1paDdiNWVvNUFnK29L?=
 =?utf-8?B?azJrMXFtVkl1dkNPLzlJNC9sWVB6Mk54V1VlRDZRcGFTemsyTXI5VzQrM0pP?=
 =?utf-8?B?czdTWnZ1czRRR0ZvQjdUdERqb1dacGFDV2NUamd5Yll5OWN4WmlwcThMUElO?=
 =?utf-8?B?bU9IODNNdFpDUzUxNmNKUXB1Q1ZrNHVpamRZVW1aWklvdW5xKzdaQVk0cFVm?=
 =?utf-8?B?dWlMYzlhMHFkNlZkampPeVJPdFMxbUVvSVMxamV4dTUrakcyZ3A2MURnaE81?=
 =?utf-8?B?aGlJMUFUMVVIRS9CanJYc3lvcVorL0RxTG0xRTY3a3hIaTJLVkQrR1NFVnph?=
 =?utf-8?B?M290d3dhUGxkMjUySUIxSlUzbEtpWm0wYk1SZnErMzl0QVY4V3FGeTBaVmkv?=
 =?utf-8?B?dVFuNG9Yam05dHZUUHZiVG5QUWZrQkNWNVR0OUZFVE9pZUZ1RU9Sa1V1cTlQ?=
 =?utf-8?B?THBKUGtOcTVSU2xGV0JwVlltQ2liQlp3YTh1dkk0NVgyMWVMWE5lbEV4cUdo?=
 =?utf-8?B?TXRDM25qVU5TdFM2WHpJbHBXa1Vaa3YyOUc1Q1Fzd0ttSnppVkJHQzRWR3By?=
 =?utf-8?B?UUpuSFFCdExPN0ZoaytUNEEzNU1Vakt5T09yV2J6WC8wKzlVNFNZQlBFbXZp?=
 =?utf-8?B?a3FjaWxDUkNwMnoyQTJIelkxbDB4V0dJa1krc2Z1UWFhKzNQNFpIWkcvN2VP?=
 =?utf-8?B?WWZrNkhZU2JaT0RCdXhMNWFTZG9IREkvTkw3dFZxckJMclhQMWNkT2E5bUlG?=
 =?utf-8?B?aVhhUGFyMW80K0hKNk1XZmxBV1dZTHVYMGJ4M2c4aFNPY2RLRStOLzkrQnlC?=
 =?utf-8?B?ekgxSXhtdWFiMW9KM0VpQzNDcW5IZzBlQUdqN25xQTk0ZUI4YmkrQzhPVTJY?=
 =?utf-8?B?QXRESUplU0dvWGFKYzNhL3J2cDVTT3VwQ1hJK2tFUlV0SXFqUUdyRDNEc2Nn?=
 =?utf-8?B?VWJlU0J2OVo5bDluSm5SRGxkbndxb3VxTitubjNMb3ovQ1k0R21lNlRIQ0to?=
 =?utf-8?B?aUdnU1JwOW1GdWpoNEEyT0JkU3kxSjdNU1hTaCtVMzdaQ2FRNHVtd3dWcmVa?=
 =?utf-8?B?b0ZXdEJuUTQxakwzUnEwd0hzUStzTXdWalFMTmRsaytjTGViRDB2RXh3S0JB?=
 =?utf-8?B?enpRSkJPd0FWOXNRNDhpUGZvNy9ySUppTWdGNVRVNEc5cUdSc3JkZWM0NWVH?=
 =?utf-8?B?QkROMXVhNDVFSmhKNDFmVTM3ZzhNdm5JUENIcmNMSG01dWhjSk1NbEdOWVpX?=
 =?utf-8?B?b1BJaDNSZlRTTG1pVjl6a1ZteTI4R1VuVnJjMEtZTE9ncml2cDV5UGxRRnYx?=
 =?utf-8?B?bUJNaHpJZnIrVE84MUYyRVBBOThqUzZCQVlGemlDaThTd3pGN2FGT3BhRjV6?=
 =?utf-8?B?bysyUVM3aG93alI5S2xJL0ZNbEVMTTJ3TXFiVHREdUV4dGVsR2N3VkZlMkMw?=
 =?utf-8?B?QU93VXhFL1pIckVsWkZhQ29NaVAvRGliUG5yV0IwcUs2UTZXWm9qOStQTzVJ?=
 =?utf-8?B?bjBFdzk0dFdTcDArMS9DbkhCTUMxUXJ4M3NCUW1RNm8wY0VBNGE4c1puM0V2?=
 =?utf-8?B?RUwrd0YrcUpxR2Q4OVJnOFhaMm1ZU2FaMXAwM3FYQjlybndGWUJ2Z05NRy95?=
 =?utf-8?B?UFdYaVVZZk52aVZXTkN4a1lWaVV1b3FYMmt2aWlYSWRoSXoveUhBaTRFcm9p?=
 =?utf-8?B?Y1ArMjFNWHlHV3pjOGRvWHNHY0o0SXpSbVVXdlFDVEJMZVhvNU5Sdm0vN05P?=
 =?utf-8?B?a3pYY1B1QVBkQitlVmtyVHpLYjNCZmdVU0N1bzNJdFJVcGliSHFDZzFIcVE0?=
 =?utf-8?Q?/3Ls/+t4rZm7YOWcTgK6EDv3LagN4O3ydVVNU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3d2ff3-b5d0-4a1f-9770-08df3af0cc5b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:56:40.6600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPxFifSZg3WthyxAbf5tRWsvaCo1mGY7ZzZUZlRNq+zu0Sv8ktMmuXlCBVkhzdsEE+vKKk+ygbeWne39V85kLXJ/Aafbm4KBF2GBe+5kUtZd0nVf2l8mGRR+kKJT9mKC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Replace the manual clock acquisition, enable and cleanup sequences with
devm_clk_get_optional_enabled() for both the port and gpio clocks. The
helper treats a missing clock as NULL and automatically disables and
unprepares the clocks on driver unbind, so the vf610_gpio_disable_clk()
helper is no longer needed.

Unlike the previous code, propagate all errors from the helper,
including clk_prepare_enable() failures. The old code only tolerated
lookup errors and failed probe when enabling the clock failed; continuing
with a disabled clock could fault when accessing the PORT/GPIO registers.
The optional helper already covers the "clock not described" case, so
there is no need to silently ignore other errors.

The clock pointers are only needed during probe now that devm manages
their lifetime, so drop them from struct vf610_gpio_port and use a local
variable instead.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 46 +++++++++-------------------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index c1c562071c0d..9ebb4469fd15 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -34,8 +34,6 @@ struct vf610_gpio_port {
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
 	u8 irqc[VF610_GPIO_PER_PORT];
-	struct clk *clk_port;
-	struct clk *clk_gpio;
 	int irq;
 };
 
@@ -206,11 +204,6 @@ static const struct irq_chip vf610_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static void vf610_gpio_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config;
@@ -218,6 +211,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
+	struct clk *clk;
 	unsigned long flags;
 	int i;
 	int ret;
@@ -261,37 +255,15 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
-	port->clk_port = devm_clk_get(dev, "port");
-	ret = PTR_ERR_OR_ZERO(port->clk_port);
-	if (!ret) {
-		ret = clk_prepare_enable(port->clk_port);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
-					       port->clk_port);
-		if (ret)
-			return ret;
-	} else if (ret == -EPROBE_DEFER) {
-		/*
-		 * Percolate deferrals, for anything else,
-		 * just live without the clocking.
-		 */
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, "port");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get/enable port clock\n");
 
-	port->clk_gpio = devm_clk_get(dev, "gpio");
-	ret = PTR_ERR_OR_ZERO(port->clk_gpio);
-	if (!ret) {
-		ret = clk_prepare_enable(port->clk_gpio);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
-					       port->clk_gpio);
-		if (ret)
-			return ret;
-	} else if (ret == -EPROBE_DEFER) {
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, "gpio");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get/enable gpio clock\n");
 
 	gc = &port->chip.gc;
 	flags = GPIO_GENERIC_PINCTRL_BACKEND;

-- 
2.51.0

