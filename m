Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663290;
	b=yAMdLQtVbl6g5K64ZcHYTL8I5tsIlzyOl0S+t26eTNY/mWn2QLiSh8EaOmFMZxj3KL1I
	 tayKQvKn1d+ySFSGlU1jkBX1rZlYhEVLixHzH+/P7aeXGQ7r5rEjekvWE5Tcyna7Rcn+D
	 ykDubWGkndPjTkk2c1p64EeYLTZYiwJvgpn9x62cC6fyTbMdhmeuc1K7h5R2M6aniOEl5
	 gBXU3T3eqQfQRdp2n6Iz6vxtG/2EbSOTR4m9r9yejhGgbRYoKMzOj/GLAUwlxWpZXTWlu
	 hmDyaQJA0gCymW782JnOhuH7lIBqvFQd6I/vWTr9vMLU007MalUgayJEcZ2SSAc3bGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663290;
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
	bh=erqF7tSTrl6AgQF0khZmjSfYMkq7P+Poxq9xpKXhyAw=;
	b=xwuzu1nSrq1/4TFDpWScAWUjDM6ciSNGeaAsXnQfX4AjVeC15BF6kv53KgqZc/spXvl/
	 6e3PeyW+4BNzddltmKvmwXGrMqqrKkA55neDa3Ks9zk3hB5tnes04k/nRWMc/icHd5xCQ
	 JO9+yZKaGRQC6Mba4M1XMO3khDgmw1CEis/rVyBUaeY3/Nk9lLzCVtNH5+vtnehxt/Glb
	 Z50YdsMy5yScOleSc3TTWUOBkHSUvguloddLEdGl4lnxdzicplpx6HrKoPNiyEYwqHqI9
	 grOEOeBDGQPadY6CKgYHMv1yLQY369pkc6UdVPszzaKCe6Eq+po65euTwJLEh+cWTnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yGpuTaHf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.29
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66051606A337;
	Mon,  2 Nov 2026 23:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66051606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yGpuTaHf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoVz8pWwRwhfE36QC72iC+pXOOmHyxrY0WHqrfCTCC2RrCgv1JELUHDgQ61j0QWYjjegS4H4EkXgoUN3bqlwApVI7kB7eMDKuOcPJnLlwLYy9Cyn8BR0gwqr2xXzZbvRiwLO+LZLn6A/Hsh7MZnjnRaiK5+stuKHJPj0Io1Vj76k5cJqteQMOfDtlf5fxClhqMYMOtWYrT92SmEVHyJFKqu+vYu2iUDY840vAElOQLk0pWFeC8j+9ZwmebrZDYqVOaHoVW4VxE/w6aCUPFCotmVYsQwEtNCbGU00oAOIeMt8YW2KmPMP4PIf5pR4Ue+pvmTnEeslxstPjNyWjqb67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erqF7tSTrl6AgQF0khZmjSfYMkq7P+Poxq9xpKXhyAw=;
 b=clY5ObYhcj1byr7fTRSoY9xuAsaHQNH7XVLRk+d/yDMaaL9+/mmSxbWFN4gbMsLUXqaRmihtzD/3E+LhEFY3c8aH1m2NnAjfiJ1MDOJ27s5+51J4uGvGBSCnp0G1hBzgAxCtaMpo/K1+wEIvw7YokPN/r2Jd/4oT9pf+ijrAAvKTvscIL06lahLnTeSC94nr1s0rAtBAY5Ixe9yxQ90Yer5W2q8revdCnaHP6RaGqqdJbWa7giDJZnAjb9sRXwZsvyQNWNHUIUtlZa0LfoBCJvcbLoH2oRUkAk/7uZLmkGB5Hl0GdO0jDy9tixm79s5I8KiAMw3rEM7xNXlLB6o9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erqF7tSTrl6AgQF0khZmjSfYMkq7P+Poxq9xpKXhyAw=;
 b=yGpuTaHf+1hD44lYX8ZcC2OJSixp3T9j9AAQ8VPEDZomjANPe+BhmZJl5nPYb9rNVWa1UNweKka0b5MsmPilwdAoOvTfmS/r/01gh3nn34wxcGIC2lQ8eowqpaIrv6Swh4e87CuS16XAJZJPMrl99/Sz46KXiyc7xC0YCnt6OZSgisCMm6YNnlPInOUOudUakViOzHF+vhB0MwElJfIan5JeQwkNahFA4Kj4UaZ7GuPS0jjNvcu9g4JBeOi35KFXaroMsnkvMj0vvA1gBIH6If4gUKXYV5hHe97ZB2k7/6jcY86gGZzPJ+lxNlnAFzBBfz9MGq+yJ3jSpoNwpbTT/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB9068.eurprd04.prod.outlook.com (2603:10a6:10:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:10 +0800
Subject: [PATCH v2 06/11] MAINTAINERS: Update i.MX GPIO entry
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-6-7c71fb36e184@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: a48a26c8-50f9-4a72-66d8-08df393bbdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|7416014|1800799024|10067099003|22082099003|261102123227099003|18002099003|921020|56012099006|11063799006|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	bA/Uss1X52ruWmZZRdj5v9xmIdPzRq8mDPdkLO9x76httX9OSkiLqB3zPFOGShSrIWLctDONNsXvufrtjUn54Um0JaJmMCZ0DixO2WqJ37XCVRhHuapVCdIVbkP109XyXeSM4BLX7RKl+rOFqOCpBBxQ0B9yuUOf7dXd3PQQHUiEAysHKdGeJGpfupKEGEpSVq5rnGNHGBNFPgUZWScAxtBUHbis/OK2LxcPLepkpUDd5QYskyQJyPUW+RYDPxA2gYkxll1RihD9Fy1bxWLqnIPf3PVXHZIYjTO9O86VTlxvEGH9tKmUxVnI5sK+NWFQMKu8bj0bS7J69V6r5fwPNBQe9HwW741GElQPPbOZY1dzGZqqOQ8a/8h7BjbHVZiS9RaZjOALLij5aTp4/4PfXYOPMbYyklcaBYeRkfeYPklaMIuZEF/9BZ/0l1L10ZZ9FeFMWuvJIrNjPjVt3EZneff/cEaqM2vqU2vn7d0yr+MKAP5speqIZd75iyAEAMH906jyl59+4ZG4tnwzleiAtChUN4MBwq4i+0tLIaMs+V+fGPNsbaB17ndTuiLK9OYp3ESdr5uc2rZ4sQit2KnzbIhfADwq1pS1eM35KbnFWFy3li29romTQkMLSV3EIFofRmpD0L/P4TrWOjMaitSdf3dcB739U8lBXNffmndgWDgwVzTe8ErnGFZP37usaNe0WXfMwhNfeDlkibKSvvB1og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(7416014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajJlKzhzZDBBWUlpVTFZSFY5Umc1Q2hQeU5uNGhEeEVsdk10MjFUSnJEcHVX?=
 =?utf-8?B?MmFoaXF4cm9ZWndtL2ZVMGdMVTBEZDdTRm9FTUd2SnJOVTVkSkRWYUtQcU85?=
 =?utf-8?B?ejNqVHhiSWFSTzVLK1ErbTM0NE5vQ3czOUhDY0hoZ0hHeFI3V0YzTXZvR0lW?=
 =?utf-8?B?OFRWUStPbXRkamlrNzJJMWVGY3g1SCtVcmFrR2Q1cUNkNUFDQWwvNlFjdzha?=
 =?utf-8?B?bkpJLzVoTHZQYys3OVZ5TG5paGtPMG9jVWlpMFZlRnlKY0M3cEd0Nmc1TmhI?=
 =?utf-8?B?LzVmUlRmYlZ3ZTZNZyt1RUVTbGdKMDJjdm52U0pPSE5aWWNNZ3YraVNxMVJN?=
 =?utf-8?B?QXlZYnFXOE1TbkpCL1VMaGJFYU5IN3I5TGtQcndHZ05uckJWZElvMkVOeWFG?=
 =?utf-8?B?VkZVNVk0eUMvQVVWSlEwcWNnVElFVmtzTnpLM1NwQlliMjErTTBhNmNNem9H?=
 =?utf-8?B?a3NxWUd2M0hNdk5yNVN2MzFCNHFKYkRPdnlISy9BSHZqejZiVXVaczZjZS85?=
 =?utf-8?B?OHViRkNIaU0zRkhCZXhaNEJEdEQ0UE5ncGhYS2lpSzNtNTQxbmJNb2h1N01U?=
 =?utf-8?B?NEE5VUxqREl1RzRPbGZ6M0VyelZjQ1k0SEpqSEtIejd3NGJ4andsNVc1eUFz?=
 =?utf-8?B?Vjcva296U1h6cGd5MVF2ampZRjFmTEdPdnUvUlNGOXRWT3hNaXpwZG5VSGFZ?=
 =?utf-8?B?azVKSjc2OFkwUW12Z0JXZGV6N2psWDdtVFo2dGpBWmFVYVpXeittM0QvKzZJ?=
 =?utf-8?B?L05QeEFkVnVIRWJORjRoZVdiOUg3UWx2VTMydllFOTF5d1M1K1NiSXBPNDVx?=
 =?utf-8?B?bmZSZTRyWldTaERMUW0xL0Fxei9jRzFOUGU3QWZQZWNiOFVGSlh0anFiSUlX?=
 =?utf-8?B?UmZEV05yYnlXY0FqNWdCcXptNDRRNDFLMytOeU5JVVJ3S2RTa3o4eEtCa3N1?=
 =?utf-8?B?WWZFS2dHUDhXbGd2US9vMTdhdE9xQlJEbXhHdVBxeThMUGFKTGZ0MUQ4dm9t?=
 =?utf-8?B?Yi9Wb1dkNFlJSC9DYjE3dUoxOWlRWnliK0owQXZFTU92UmN1bWRYTXZJSFE4?=
 =?utf-8?B?eGhKcy9PbFZxZ2M1Zjh6MjhEUzVHUFk3K3BqY2l2QWUrRy90UmVrREVwbk5h?=
 =?utf-8?B?NFVjOWl2WkcyeEhEWHJkWVl1ZnFXTGpRelZyRzVBeGlvdmluVWI5NVVGamRw?=
 =?utf-8?B?dkF2RndvYjlqYkQyTURVOHJXZ1c5cnFJZXNLSlZQa2RqUU02TnVLRGZGemxG?=
 =?utf-8?B?N2RXSGRjQytDU3l6OWRWb3hvWW9QSWs2Ums4VmZUOFdzQmtaMHBPZjMwNk1z?=
 =?utf-8?B?NkRnNzN4RXlxS3pzOTU2dVZrakdJLzQ1dThRRkJLSFRWOXlxaU95SnZQWDY1?=
 =?utf-8?B?dnFBR2ZrYVVaUW1BKzBoRWF3ZlB5anRDUS8rZDN4a25kWHJ2eWtTdkxKTW56?=
 =?utf-8?B?bXIwWFVRWis0SmxFdW02aGwyTjdlbWUyWHZicFJxTm13cVdZMjZpOU04TCto?=
 =?utf-8?B?YlVjV3RzOC9rOEl5OWJXYlh5K3VwSStnaWtHMndLNG5SMTd1SjVRVFQ2UlA4?=
 =?utf-8?B?TW85Ti8vdWpGS21pUnZUTGQ5RVI4VGo1bkhwd2k0RFZ1ZnpxOFJMNHBGVWd1?=
 =?utf-8?B?eU84bFh4UGNSN1gvZmNlKzMzS29ZbUxmd3UxVVFYTVEzZXdQTGQ5Tk9sb3VT?=
 =?utf-8?B?V1E0bG55WDRwMlZJQkNmbFA4QkphV0xBT0hQekJFNkZVQlgyZkNIcU5JeXJP?=
 =?utf-8?B?MTZWeUNQQVJDSDExdXg1MWc3cXRrQ0ZGRlFBamR3NUJwQW40NzBpbXgza0wy?=
 =?utf-8?B?VDd2Y3pwWHJ6eUo1bm14M2h0UHpzRkVXZmVvbHd6eVM0NVN3dnZ1OXhkckxs?=
 =?utf-8?B?amN5YzBBQWJ3c21xS0dncnRNYW9DVzhOY0tJaFBmblRZS3hnMCtOKy9reWtL?=
 =?utf-8?B?bTZhMFhEQ1JzajFyb1JuOFVqd2tXazJmTjArT2VaYUhKRXJTbEIvY2JxQy9C?=
 =?utf-8?B?YTVxY0Yzay9HMk0xdGNXZ3V2OEN0dnRiR1ora1N1MlhvZy94TFBsN0ZDdmJj?=
 =?utf-8?B?ekN5L2VoYjJvQ2FnT0tPTktvT2NMM3F5c1RYeTNhNHVEUXJkZE53S3ZkbjZw?=
 =?utf-8?B?UzVNOXF5aGFFNS9USzRmRi9acE5ZSTlFcFMzcmdIVTd0ZUZFOU96WnQzNUNR?=
 =?utf-8?B?cTBHNGt2Rzhaa2h1bkIzdFJpYjRtSVEyWUtqcGVualdmaGpFbDF1QTkyVEo3?=
 =?utf-8?B?M0lWelZXSlZhYjhZUytzR0M5cW50cnNFMkxBdit2UGhXbmtLTTRiQW1Xa1Iz?=
 =?utf-8?B?c0ZrYU1jVmNWZndncE9rZHVhQS8vc0dpcHFTVW8xWU1RRy9KY2xwUURncVg1?=
 =?utf-8?Q?4vzSW4vhCmP4OyFPCN2EezxfsEXKdEH6zbCWd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48a26c8-50f9-4a72-66d8-08df393bbdef
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:06.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNN/kpo+iEE4zdfHMxWVufcE/dkfyvnqJrjexGdOz5e1NCWBt4lZHyo8KQ3pIjQ+EPKY+e4iyz0qFZsku0ywFeNJL/8xh/UWtVW4rp99GH2A/SAASNQE9gRcrAP89ZvU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9068

From: Peng Fan <peng.fan@nxp.com>

Update i.MX GPIO entry to include VF610 GPIO driver and dt-binding.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7177e77fe5e9..bf5ef00dbc2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10706,7 +10706,9 @@ L:	linux-gpio@vger.kernel.org
 L:	imx@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+F:	Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
 F:	drivers/gpio/gpio-mxc.c
+F:	drivers/gpio/gpio-vf610.c
 
 FREESCALE IMX I2C DRIVER
 M:	Oleksij Rempel <o.rempel@pengutronix.de>

-- 
2.51.0

