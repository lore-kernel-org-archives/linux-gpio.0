Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851048;
	b=lpky5OLm+rsqhbQYzOmcHIlGEZSTI4AmcxraUHccnIeyT6RnRmUU0yIFauBA8fAqJqCv
	 EjeeQ8bYNf4fX+52YFWvCu1sYUFleg0R88D6MB8uTDegSGWYM4T5F82LP1DoHu1HBPRkQ
	 kxjNOxTFRMFVFpVFPx0xKJOR+9dCCgC5drpOAsYK9x7eMpPXTMAvnXZJ+9jPIdkmcykhJ
	 Ye3Pad3Zv7fdW0Be6ye3OuCqiV0pkw6y28fOKWDniNGR+wWWJon41LzlsZFsI2OciZt8u
	 bMQ9ReIdJ6TTNM/ybkruKAHTFPnovIz61XCwBRVlYR6eWeH4d0dml2DoWnz8kd4Z/Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851048;
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
	bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
	b=jWbpzCy0eD6pkZg0EYxlU9gPHbkc5vpSpuALszhPBYwkWYI8/TPml9I0KdMHneeRJpL9
	 EEBN6ix3zs79yA2C9tmufmZN113MJho2tU871AjIcS4YyzX5rSUXFtkfUKkBEqNkDfEsg
	 uo5xog/CmHCVeDuoGISnnFfeKzB6rL2biayXzNbN1fJy27RrkVMH3p6MbS4iNv8IiaMcD
	 RAUOO5al6vd+MC0WcJg+NS9jDsFxF9svvWntUMkORH0yPiMpJxCE9viNaviP2foKiOrIx
	 Lhl6G0vBoGCHma9/FLKlLtyIZFuFNmLYi7xpuyfCiLYUxtpkZ/cQFv+oojSN/Vt8SGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RImOMSYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.65
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0B606A31B;
	Thu,  5 Nov 2026 03:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RImOMSYv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ48UxYaorUaocAZjlfnqXgJxsoxhu2lfp4Mz+KGZqNsTLJDTPBc2vnF/ng3SdGVuakPqmiTrPLu3KSEe0BP7A1s0PVg9hg5RGaU7pX2LUsOiFQsfu7OEibn/wa9cvV3DsvYoLf9A7Bg9QjoUY/IWC/UQykWqP6caKVnnXNMXkwF41bNr128E94DzaQh3HLh9591/hHdfEnHTm1enMQ7331sT7R3JjzqXS+ZQRIuNGWvQTDjw3APIUNRS5T/mhnROFgi/ePPIk4ZERznjo0lPtOwZgsQnlZ3deGTdTSDTST5b2WSJWQf/M+dlcz1WIISi7eHt42H3RyNQHa/FVewtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
 b=RH1aLr35OWna3WgLKKnQVQc7MYm23Vb5HjbH5Iv1XnAUs+nXwkxkifeIe8HWjoXOBo4LU09WFK+QnPA0NeQoTbY+fjcDYZOMUNMsY6+Yh9v6tjedu2bxA8ymIBSIcvfRT3gagiAieBz9LnkL/nIl4s3sgtjxCXwrP98ifyjuM69dGBUbLmYtihUOEMOwtG4UXCc1UIgXYBlveRQIEth80iURhIiJNddj5U9wljLwU/JGXW29UakEc9bMsVT1JA/M2Y6NerYlYMpu4g/p6NluUqfoWl+K2dhpzXugiNE8EYh6Hp+2DfjCDTCShx2N/P36GcETiwQk/zPKCcyzlbnvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
 b=RImOMSYvLSgbDc+O95W6EDXbq0nm6iU0FXukwFiwmUTu16rKpkHT8h+91CajzMRX7aF+UDdkHvm6ZNfkGMCjyxCnb2MsPcHuVRMJMQe8PjVFUAMMqFGSg6Pzu/Htof78pdd8ITqTK5+m9p/n5u9WH9CSmtkiLngy2VV1fpdQEgxfdfKCDyTJrLQoTRssTX/qsg9YsAB00E8dRXQ7fz5j9VE1K8Afsb3rOcNJGdYfKtiYs1B932pRqTXO0mu9T7fonpJsszRymKrc+gN4wlEGPwxcHaQyKn/9urCkUqY1DZEl3eXQehp6wkmLMDiW6C4c4tynSnsptvHDuYzMJCYvXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:57:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:57:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:08 +0800
Subject: [PATCH v3 10/11] arm64: dts: imx952: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-10-504e19de5ad5@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 27618a3d-ba2d-47d5-f6d0-08df3af0e72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jI98Ggz6kL1euxbRrWfNeycW6E5BDzx91FGqeMzgy1STSWM0+/ixZb5YrDNtM6+fByMWbe0VDoc4khRrj808AYh13LMqgUycOYusiwNWKhkzIyYMg3aZFWnaAeltFDfZcBUOQFew9mBnzSVKoxGOzpavD+Lm1nOmoX3G7trSyCE+/9//oAd12/F3XG7zRCpSOQvSIzjj4gxF+DsNVX1YXOeq9gF7JCwvi0WQqIMJPjuQIg+zqp8IUYBF/CNOSPxn5GwUjekxgwBcfj+n+Abeo18kRGRW7ivSPBf+MPvn2Oe6ArpwJKQFTlHQX0ltygj+rFuFUEG2paHPsZqyNJO6hmFNr8rckwHkpqK+YF3x8y6fDl+LNMlqOOMO8J/yD5yQ+xI9AIMFPj7vHR7M9slcj0YqBKHCXUOHFOWBpvlLkKYOb19i4lDqZLM1yAx3uN0MU52j5FCCxZB+bVI5LbP9OOWlZ+Bj95szMZ43rgNt7IdgbJbgglnP0Ia/UJjOQQutEFR9+l2ebhVP5/Z5tDlZcCJMGhFijM09KeG3luliuyEWEd5xDFCjBREm2W1o/c/HgciB/aH3PUcE2EUt8Y5A7VjixXjWoR61OBQkGfXbpXDcwaNKaPaZbmzOoM7iFbguvcS7FgJjETHms8KDOeoHAYK7vxTO1ErnxjsZnqIKuB75rKRhAy/UuhCiwgfLSvmNtqitxopo9zaKcNo9kbFKbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVF1cHFsRms0QW5DMStBTTdvcTdFTTd5cG9tOXVoVTVidHZZY21XZCtpNDFo?=
 =?utf-8?B?b1hKUjFZaFgrQWJqcE5tRlNxMlBuMDRlMmZwK0ROaldrM1g1Q3RldmFndjly?=
 =?utf-8?B?UVZ2NkRoTVZEckZiYzhyVVNJUDdaM1hDdEFLSVdjU1p4ZEVYQVlpSFpaUGIy?=
 =?utf-8?B?U1VJT2ZrdTdxTmRNbzZtNFo1QTF0bXlLSkZ1U09pNDNxejdnMC8vS0FIQkxy?=
 =?utf-8?B?bm16NUNvSmNRZzNqT3BnaHl4NGZ4OFBLUVNjc0V5QndMb2hsOUh3ZzRNWU8v?=
 =?utf-8?B?azJSWkZCNTErZ01qUjVuYXZDa1hONHJDS1o1SjdHMlpyWnNrMStQRFNGVGdN?=
 =?utf-8?B?bzlLNnM4elNOaHpNdVE1T2luOFpNK2ZqOFJWUVl6d1ZpckdKa251SlJoVzZs?=
 =?utf-8?B?Kzh1bWNWaFRMeVVXeWViNHhKaE9iSkY2emg2NnZhV1FTbnNMODQyU3RGZ1E3?=
 =?utf-8?B?STNlS1UyWnhqRUhXaFFoM09KcEQ0aHM1dEQrcU8rQ3VWMndDQU1uM3hFeW9Y?=
 =?utf-8?B?cWxkZzU0S2dZdEc4S04rVjVWZFVobUtnY2ZYdjYrWDdMbm52RzlLZnV2SE0r?=
 =?utf-8?B?SURMaUFxZy9PNVRGc3FDM1QvNXFtcVNsRXVBTlhVZllidUxObHFkRWVWY3p5?=
 =?utf-8?B?T3JXZ3phdFRBeDdpU2R4TS9WQ2xFU3VPdndHazRBWlh4OFM1VmFxZ0ZHUzhn?=
 =?utf-8?B?U0xKejVlcWxrMldjTmVLZitVcDBXVlB3UXVMekVFenZocTVGYVRQUWR3aVZB?=
 =?utf-8?B?TmxySEdkMldHb2JDbWVLL0Z4aE16WjlQaGFxOFcvamVqL2RsUTZ2a1NhdTV2?=
 =?utf-8?B?dXRVaWs3V0pCbHlSTnFwZENXVHUwcTVKbmFPa2dvQTZ0ZW9YQzgya1Mrbjd6?=
 =?utf-8?B?QzA5VmlIOFlJYVFMR05HblhYdmZIZ2ZpWVNVWHJVSFpHb3l2eXQrejlEZDlU?=
 =?utf-8?B?N2lhMzNaZHI3VzBmZFJ4TTRvbENnNU53anVwVUVDcTlSTnJNeU92OVNQbk1J?=
 =?utf-8?B?MEZ4Q3dvSlZrc0JTWnl2cnBnc2wwN1NEc2MzRG1WRVd4TUVGVjZ4Vzdvc2Nz?=
 =?utf-8?B?MjBhMUdEWUROQzNkbkwvUWpZbjBwVmZ3TFI4U3dJYU9WRCsxVVVpMUVKcHNC?=
 =?utf-8?B?VGliSGw3SzZ1Njd5K2w3UDFZc3I3bTB0NUZaSGg4ZmFyVkYyNkxWV3IzMzZl?=
 =?utf-8?B?eHI3ZFVxQURDSkoxY2szUDRuQjVteHIrVlNTZEpwYUlMQlg3aWpqTXpOanht?=
 =?utf-8?B?bHp5eVZNcGpJQ0kxb1JKL21JOVpETWhYSzllNWszVnBadWd1Qy82NXF6VzVJ?=
 =?utf-8?B?OURFYUtpSnNSWERXSnYzQmI5ODQzWWhYYi9Sa3ZNVzUzZC9LS2lEdkpOV0M5?=
 =?utf-8?B?clJia1VrRWNzMUNMb2EvbVFrTmFZMWNkZlhaL2lIM2hNWEI4YU5aKzRMNzlK?=
 =?utf-8?B?aWdsSEN5U1hQRm03RVhLUWZlb2VsT2ZMRDRITys0SVBKOEdNMXY0bmpXNkRa?=
 =?utf-8?B?WXNGN1RKcjhFS1BOSHhrbVFQRjFTOU04K3VqQ1I5ZUlMUThiak02M29JMDJw?=
 =?utf-8?B?MmRWS3cyaTY4Y1ROSGJVWHFmK0xVTmxTNDNwcWNGMkhZV0IwMWVoTloyYVFt?=
 =?utf-8?B?MTFvRGcyb0tMY1p3UVdyYTI1NkhlQlBZdHhuUzQzZVdtaWVLV3hEWmxXaXlx?=
 =?utf-8?B?eDUwdUUvUDdmV3JnMjk5T2lwN01qaktKa0pHMVltM0FxR29vbUlQVThERTZN?=
 =?utf-8?B?aXNCUjJsUlBXelRVQzNaZlc1M1BTbWdjUXBZTVpVV3BDVFVsajREVmpHWVhX?=
 =?utf-8?B?Y2lWdnNXV01MaEVyZ3V2SVgrSTNwcFFIbjZZTTBOZEh3OEZyb04vZW45cGph?=
 =?utf-8?B?aE9MdEtNTUI0TmNwbk43dk94ZUwycUducHlsQkRNV2h2N0dNV05Nc1JlMmc0?=
 =?utf-8?B?SG5SeU40SWxFNnkyNXRSbFBQZitCSFBQb2tLKzkvQmlFb01tT1lLZm5aTzUv?=
 =?utf-8?B?YzhQUkswYmNaWjI2cTAyb3d2WUZJaUloNmZRZFJUM2FxWDZCdmZmY1ZYT3U3?=
 =?utf-8?B?MXBmNWRKNlJsQ2ZQMjk2bXBQL2NUYXJoUlBlUXpiU2RZb000RDg3Rk82UlJD?=
 =?utf-8?B?TjZvTGI0cWJZdzU4S2xaWEUvUWFWRG9aVUY2ejF1bDNmSllOVVlHOHZCYzhT?=
 =?utf-8?B?eUdYbWRWSjEzOUpYZGVIWldEaTFvSnlsZjI1S0w0L1EzOEkwUTRmYzZwZ1BJ?=
 =?utf-8?B?MnFvMEJyOVhFc2doRUFvZmFUN1JTa1Q0Zlptb3RYRWNaSHZ6dEw3YnhNU0dB?=
 =?utf-8?B?ZnNWQmN5SVBWYUx5d3QxZk9yMmpJTEd1ekhsemNqK1VFNzVLZktTd3ExYXFZ?=
 =?utf-8?Q?qf238tu2Uc6jfNyX7aB9XIj8lkLz82Xu+Wqp5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27618a3d-ba2d-47d5-f6d0-08df3af0e72e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:57:25.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUybB4UqWzRQU4V7OKTVrfSCHap1EywBRU2MUdvb7Ji4q4NDqTFmYhJvJnzjk6nT48vkipvQjp80Qz6A9u52iFSaRGXY7rv5tF+Z8QU+YW0K2i9yRHX5/FJLKXDqPcwJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

Fixes: b516a4dd6a1f ("arm64: dts: freescale: Add initial device tree for i.MX952")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 1154b66dadb2..22f02f48298f 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1024,9 +1024,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
 			ngpios = <32>;
 		};
@@ -1040,9 +1039,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 115 8>, <&scmi_iomuxc 8 85 18>,
 				      <&scmi_iomuxc 26 53 2>, <&scmi_iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1057,9 +1055,8 @@ gpio4: gpio@43840000 {
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 57 28>, <&scmi_iomuxc 28 55 2>;
 			ngpios = <30>;
 		};
@@ -1073,9 +1070,8 @@ gpio5: gpio@43850000 {
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 6>;
 			ngpios = <18>;
 		};
@@ -1411,9 +1407,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_M33>,
-				 <&scmi_clk IMX952_CLK_M33>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_M33>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 123 16>;
 			ngpios = <16>;
 			status = "disabled";

-- 
2.51.0

