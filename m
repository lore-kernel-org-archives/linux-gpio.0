Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663273;
	b=vUhgPWlpw4ZVR8TDwYvynydALpZKxICJVwLb+/IHCVLWpqpgm4JGnE0YoHDsNH6MixFR
	 ObK+shyIywuU/t43sVHLDHM1NnQ8pnOiX7+RWIcl2Lo1KOfg3K/PcDtiD6sxNa9jBljEd
	 fuTNphOLjy+lC6j30VgGRC+hsW8NiTCLf6ZFkiTxqfLokAgl1hLfzbpH6zLfSQEhL4Yaj
	 jxhdDIwQarq/kaJzcpF2p2Ovpmj6Zcy//5CX0jGFTTAI5MypSw8Qe5ZpiwceN/QTffQkw
	 2icJ9WkFGpzkUyF4I3mdfNdCsq2iTitkX6LllmF5+QBnVeXj7LHz1Eg0am83MxiePOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663273;
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
	b=jUjMS4aJETOPhVjz3rxVxKUzAaQkP5ebIdNb1zwJK9eYc7WYf/BYkuDmG7zNjhpFI9AI
	 ZRgsTBsJ+N9Cd+f9g91GVNeGVJ2wcN7HafGS+/dGiBsj1ZBn+ROObZoFS4dqSsZC9yquF
	 l4mQaQmb1WJl6+UGkfhRro8IN9usJIwNPotT0D//lEliNde4h98IKEtCrU49lBqxGbsFd
	 yFExJMTBC9jIGd/8Gv66UI4TpvSI8sAflqgWosmafTZg8YUsBHn9p5MhHjp/mto0pIPm8
	 s0D6vAAPShvp4fD8pzxRySngCdI8hzgFdD1wrDHJC2PD57ClTeyTal1ifXjzfXYNfuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ab0Q83PA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.59
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E77606A337;
	Mon,  2 Nov 2026 23:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E77606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ab0Q83PA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkvlDvpa0t1zOd4a2WIoqFU32Sj/auuhdYt0zBxVOGeooHbn/N2K4KuBgXAHMU61S/4g/aNR92cVS0w1sCWuTt9MaGpyWLSJ87wMnudD+TueoCCXXOSUxQe8B1ivvveGThFdK+wMFqgL5q5UjBR5clx5BvdCG9BoCaSIAQesS/nx837LF0bizTUu+HGppj/+azZc2QBSVjQUN5OGqRLqHM/w0m4uBtI70BW8x587mh/ES4Jk4oQTjRBukzVyAe/KjKddQSTRK146AX9jpXIqrOjeKPlDSbkCnEaZrFCbgkd7eM2qE4M0w5nGZxxRlQhmeU3euAE/Gb7w8dyDkDy+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPOS/miJAuqLvdDzZuMenqy0qee+9axgzE6K4ViGdaM=;
 b=eZ4oQk1PEX3t/m3+AKkHH3vq6l5JAmPxt1rOi14AJWUHDMkX+i93FIC5daYxAZkJjdz9KXlxuvynbruntzDqVLcp1bvT3HP0kQsGMceh10r2iI2bix47WbAxck0UUgSXePogy7aBiA3Uf4I4wUBkWfYa0j1KelvyhlA75kyLCbwFrQV3pnVESVYhq1rYoXC4f33oZrOqjKiJZKYPDQ6VqbRgXLotSNXrvtTU6LZPy3qalXII2K9T6hJXF+GYuhPcBcVG8LsQkP/6et6jNbSy7SqKqYgTQJigcySkl/4XFQ5U5gL2tzakPu2ZSUWRS5WuNBdnOFy3uGWrFhSSN8kZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPOS/miJAuqLvdDzZuMenqy0qee+9axgzE6K4ViGdaM=;
 b=Ab0Q83PAaJnro0jTPkImdcaijqSbdOz2i278pmLfweE0wpR/Px5Lp1wKP30V7nATtlcH3kIGaY/bUR6VnCa9U+FrP1S56MCkZZ3F/4gltMKJdJAB8HCewg1rekdo8jJg1OAqjK6dP3P+IsHuf7bf8VJ71xShPgDhRImOTL34545Wu4SHDOGm+2n3OXbXj4dIMgM2hgW9zOoUNay1CgdncuOQr6FPTvf4evuiFCtOG59grIj7mnX8rMVtwV+hkf59tdhX6DVW7sLFP9uUpg11iW4uknKc7Pr2UtHfbjC6uVO+icACpPI4k9tsqZGnjD89O/99/9WGwm4oizFGGzmM2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB844454.eurprd04.prod.outlook.com (2603:10a6:800:364::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:47:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:47:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:07 +0800
Subject: [PATCH v2 03/11] gpio: vf610: use devm_clk_get_optional_enabled()
 for clock handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-3-7c71fb36e184@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB844454:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c85a4a2-71ee-48e0-6bc5-08df393bb3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|10067099003|22082099003|56012099006|261102123227099003|18002099003|261009223027099003|921020|261022105027099003|261021123027099003|261021121427099003|261022075727099003|11063799006|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	BXCSWgDw6I9b1HeWq6yqcqwTOJ9YrVxi1aQ70RwLDs9UFYNVcRsqaX5Ka8SE2oOcqDRtif6Mv7ZbrI8DUT7tkGoOfiYzRy0pVpEFgmXF63Y5OU4BW54bLSJOfb+Y2g1Hj8xX9eZT/Uopm+kHbyT63jLy3CIcjTgxuOcwqstOe0rks/MWo+iVrOz5WTEREdqpDk3XdQ+an5W7uY2FSAaiuMSNfecaVW764XTwnzmQCM+bYcsAP0y7QCKzKNbQsavDlLrGcyc/YENg9bxQh0Hka2EOwQgg0e+iyFZ3KpSxAdOsIOKclrWPeFNO9S5Ti8ZVh+RjtiUb6/mKHB+91L7Rg6W2eDw+R6bM8ysmNiYRar0YZ4BxgCkWLKCxi54O01po9PP8sNLMbGteqqyaNiHMp0eG0eOgsvR/zgn4RTdqMYb3hNRszZs/AO67rYRFDb4IADq+RikV75WdAhKx8J4QF+c7eJhjLMYav7SvpRfDnoyBIYCUZO4X5LY1H4yyk6ablCzVHqrsD5cdy5qbMp3kaBXCYGuqD9iWCLzEPiBtX1lNp7HQ+/sy03dlp1v+FJpcOzPQdgepPaT7apsq5fxbEvY2gZOu074Y57KtwRutxigDJnjinkyT46KdHpzk2IfndWWYcZJr5lzKKcC1oGSDj581KLP+NcXCtt0QBXvKftDCqXoLjL/DEcEMSmGAYJxDHZrOuJ9YoUiJH13ZlkBBEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(10067099003)(22082099003)(56012099006)(261102123227099003)(18002099003)(261009223027099003)(921020)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(11063799006)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWkydzFkK3pnTUdOa2ZQS2RhZkxRKzd2TE50MXdzL0pFdFlQQ0pBOWVsYkpE?=
 =?utf-8?B?ZmtLeWFVQU92cU9wcVdHRWtpZDVEbC9QVFFOTUp1SGpIdGVKbDgrNmg0andn?=
 =?utf-8?B?V3RBRTFkSmFEWXJkaW1XQk9sWDQ2ck1vNUVSRGYzUVNTbGV1eEc3QUtFRkxn?=
 =?utf-8?B?dEVab0JIUU9zT3UrQytWVmRwdUVZU2RNY05HbFArM3hSR2JxTnVNdEczemYz?=
 =?utf-8?B?MG1sUXNnelFtTnlLeHcyK0IwWklIam9xUkNiemswVG9qMjNzWEZzQS9xMUVO?=
 =?utf-8?B?dUxiSld6SUdWbVh2TVFHdVFWcTV4THJZbVJBVThFWTRNTGpUNzd5ajhKd0hD?=
 =?utf-8?B?VzlsVW1oQjZhenJGdy9ubzZrWVQzdDE0ZFVpZCsySlZ5Y2ZZUGVsbkRzMFhU?=
 =?utf-8?B?RE8yRDNPekZ2WkRKZlNTWlBxbTExeHRGRkNINS9SR0dyWHBoeEVjY1A0dHgz?=
 =?utf-8?B?blR3UFhyK1poanpSMmMwQWpSenhxcGd0OUduSWZtbk9lWEdGMXE4SjR5N1NM?=
 =?utf-8?B?VWs4TWdRQjdjaGk2NFNGTDB2OENZTkVpYXh1K0czeGlxWHpBcUFYWnJNT2M0?=
 =?utf-8?B?Wm1tQzYveDZaNDhOM0hCdkI4UWJZRHBFWUdMYVFIUVcwU0Fyd1NEb1hxWG9O?=
 =?utf-8?B?aWkrR2luQkJlWmxaQ1c3NjNSMktGa1lvN29HU3VFQkFRMzJTS09objhqSWIy?=
 =?utf-8?B?WVlDUWgvaU9LWEM3bldZWW1LRk5NYjRwYzlHMjB2R2xkNkpqS0pRblFZcDZ1?=
 =?utf-8?B?dGp3RGpqQ0FTQllBaStoVXlMalpGbVY1VlFjQWxxdHh0QU5yd2MrdWYzT1Er?=
 =?utf-8?B?MkE4YVhockVCQUsxKy9iV29xaUxVWStUUERZQlEwWi9zTTh4Sk5FSzhoeVNY?=
 =?utf-8?B?SmVwblhXcEQ1eHo0MWUxSHRoR3BsOWU1eDNLVS84Z1R6WGR1TnRJb3hwQWU0?=
 =?utf-8?B?N1JVUzIvTS9COWhtQzY4c1drUVJoMkw2ZGp2OXdjNkZlWW1ZbTdSa1JSUHFN?=
 =?utf-8?B?cDgrZUJlOVhzUHVJclNhZThvbm1yQ3YySU1zeERMKzlmVmd6QlMvbjRvZXFa?=
 =?utf-8?B?NVEwSGpETDFRQUdMcXgzM2trU3VJYVA3bGYyV2IvZnVlbFczWUU5SWhDbkFB?=
 =?utf-8?B?b2taNWZwcVQvWEdBVHF5eWtoN3lVQTlMOTJGOE5aeEpCTC9KcE5xbkIxN1Jm?=
 =?utf-8?B?dWp1Qkl2RmpobmhtYUdrbFNzQWNOQ05yVmEvYlJFTjhLRWRYTkdNb2VlL05x?=
 =?utf-8?B?YkFCclh3c2Z6MlZtUmtJcVBxQjVGZUhMQ2NNMm1LU0RZNUJ0NjUxalNHOStl?=
 =?utf-8?B?QndQck1sMnowVktmTkIyNDlyRDFXMGZiOU81ZUVLQmJkUm5LVGsvemlDYUc4?=
 =?utf-8?B?NC9raXB3K1pkQjNrdElkeEt5VHhZNGM1bS81ZlBNTDhUUjlOc0s5bnEvQzBZ?=
 =?utf-8?B?bkJQeUl3MWNLazJ1VHVyTCtKc0tLSFY3WWhjeUhEQkZsT05tK291bnZMRkxM?=
 =?utf-8?B?S3E4N3NqQmsrbzdwUTF5a3BpdmNIeFBMVzU5SEZtSVNlMFFHa2s5UElwZStY?=
 =?utf-8?B?Ymhhc0VLU2dkSWdLSmoxUVovbkNiNVFpelhiWVRackVrcWxpV3ZFWnJBeFMy?=
 =?utf-8?B?eDk4UDdodCtSblRtYnFDeWpad3B5QVNxRGlGTVpqckxVQ09wYThGQmM0MS9H?=
 =?utf-8?B?cGlFVFZiRDJ1RXBHMHBuOENEVFBlb3JrS2o0aWpBWVY4dS91dnE2Nkkzb000?=
 =?utf-8?B?UHpDTTBiSGRCUlFXbDhPczJodE1WSWtxOFpvVUZRTklFQzI0RVdTZlBPdDgz?=
 =?utf-8?B?ZjBmZkcyamZnTHpHTU82UnVyWFlMZmlWTkdQeWVibXY5OFV0cEhRbmwveXI3?=
 =?utf-8?B?Vm05SXVVT3NId3UrcENCRnZpc3hyYmttNVZDMDRXSGpEMVBGV3pYczlwbGRm?=
 =?utf-8?B?SS84akh0WnJ2QzZkUHprYm1yRmpyenZlRWhJZXpGTGhsZlgvaFpoRzU4WXpN?=
 =?utf-8?B?RUhhYXZPVWZQa2dqNURoMWdOcHg4R1V2dk8xUS9XZS9sNXJ3c0FBUjV3SlY0?=
 =?utf-8?B?bWtsVzJOeUoyN3FJeGNiYktDaC9nZWQ4U21SRmgzV3ZmUUNTYjNLNGg3QWFD?=
 =?utf-8?B?eFVXc05lNlJZZFNyN05oQm9XeVdZbmlMQ3NUYWlYK1V0UmY3aVYzSnJNcnRI?=
 =?utf-8?B?YmdCVTV1cTRSekh4TUxjME1qRDV2bmtSdWNRSWdZNkFIeXhLZFREMmFSWVlv?=
 =?utf-8?B?eVBvWmlDbzdZdjI3SXNJUUJLUUpXYndza2RyTlg0S2I2ZjdJRVg3QXd2c0lL?=
 =?utf-8?B?TytqdEZQalRicUs2Z1luSXY3QTVUOXd1dFkrSGo5Z25aWUJTS3NUVnZ4enNm?=
 =?utf-8?Q?jJsDuEV2dU1ZOCY1anzlKgt/qYClmldxibe8d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c85a4a2-71ee-48e0-6bc5-08df393bb3a8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:47:49.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVwK1os4GnvlMBUZGG+MdFkkxf5fCacX7G7elT2EkPc9W13NPDOJZEJRalmj3T9HiyPphFqErqv+w8ZNUOjZh9CkJuuELvBNiaspg8VaCiftd8QkFLDi4lA+WD84KE8P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB844454

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

