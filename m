Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629006;
	b=nv3XIvpZjRFW/1UQbqHBC0H+Uq/sjZgmzh8TttJ54GEdmo4b4TOKCwXhSPRg9ZrLBk2o
	 U6R/xkEo+tnp1WIvO77tUXue69fcvewOM2IBvQ6ws1SuAUlkb46DSoczjdHTFPZ4e8Q7+
	 7F4VMVgWrFqjl/cfxsmxaat+USzJX2JbKoj2/MiYgH7tp0BUH7zElzuORUeaeENRGlmeX
	 w6h1fcdSB+JJbnmL77YUJTAwypjGEB4kqkQb/4XBySxNzVggEgaStXNmcjD3Fc+Fnoeh1
	 vJ7PCQ0isjHmZPNAWRnFnNVvuS4pd4UNxF/8WDXalJfJwfvUjEInKMha+KrQVDZeI9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629006;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
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
	bh=BLXlGvJlYzSJIzuJ+M7WoaUJckDZxdCSJaz1fTVmvG0=;
	b=VDs6FiX4My1s4NqpEV2R6AM0WtGncfv695mCuF36QmfrcHmzUgqvBxoCNEQnR+H7oCyr
	 Koo2wIbxVpFYslw1NctmqyTcHK6KL4slz7YMAiYqQ1OZQhNOo6iXoAKfKzFY45OMUC4OH
	 J23B+NYzYeUpViIlp3YgCxZbeK2B2evwE0gmjL9WFIDXV5HINNlmzVrg16Ykv8E2Tuj5A
	 i96tPIKZ7Uae8FyEh1X2K7EqQ2OGzBOPr+8uIM7ZipZoaEgPai0v9eDg8DGqM9NkSFcsg
	 QSf08K3SzEV3GZQb6A3uH7bZzDTCGvnGGoZ5yu5XdOrj/Di5RuUHLrUCvpNpYyYwhug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="ulE0/qeL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.53
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3D606A334;
	Mon,  2 Nov 2026 14:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB3D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ulE0/qeL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3ygfZavhqxhrPFepd8Z/kVPHzhDqj+1cGma8g6VrZaaSR4hV5vSEPaM/4YJr8+R2ugZJ8kRh7jFYE/igr01t05lF+B6/c+d3+hP5oD4rQ3H32v4AjLCWGKFc0A6OZpgZpXetD9SGm2xoWrXFcSspb0VzD3DQSBhQH5BUXL+yz5mjRf4zGYwaKGav82QZ4R3DgJFPa7OtLP/aUPOdtBRAzVk8Z2VJzuIHxZyCCty0yJ4oHBclmEac8ofX7ODNQpURR8zmxVZ38UO5XT4kcfS5Y4MtrEIFj8Pdn9ECZ95WWPI01AAelyofOOEn8U37d0iQvpCLa29qplRpxu4vAk9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLXlGvJlYzSJIzuJ+M7WoaUJckDZxdCSJaz1fTVmvG0=;
 b=SWybqG1pLj+xrm+01AZmxOrMsgL7eAuBAPQImubffzX1YIrOM6GIcPKp9TqE6C9l0hUf4hUdrtdwiSYIDeIo5o07cTMajGLUA08FxiLpMOQMb6zsUPuprwjSKQ03y+HAwsN9GjPZyQK/171Yz7rhldEASQjVTh6lvSexgw8yUJXGo0ONCVocvGZwq1Lap5xJOynAD2VqFiKvvcqLqohtEkGCkSMG2p+ix7p8wGGPNPvTTi6ztbtwFz8B6WtN8vBI+32VaOsVOc4AjgGjVtRGOJqfeFnXFZKUtBve9DSBkKKN8Qua6w2DUWAG5Q3LmeUCk4bGY1TSmL0ABGp9Kj+7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLXlGvJlYzSJIzuJ+M7WoaUJckDZxdCSJaz1fTVmvG0=;
 b=ulE0/qeLYzWhj1b1GXj+hXywQ28EOqCdr4IJ84rU74UxnB4atRGfRRQSWchLsgMtOVBhDcbtDKa5nmffUJm+0LbnO1oB5Vz+G1j+7NW49oL1DFDJgJHq323yCxkna6jHhVWY246izQ1gRGBz6ke1WLypYs3CF/XH2RNmeIAUQZnvNK1a0gWxBr7iNiB9tz6g7t6ZuAKPHWSFjhr0Wx7uXbIIJqREUYeyeGUgH1RMZcJDleUbPUfNtHWil9Meofj6CjgRrPJvSipncOA23aOPnZisBdY9B4Ss5/k6u9v+vzlL12HbMRla9BO0h8B/G0uCu6Cp/mGcvz+jgiuptXweTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:16:37 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:16:36 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable PINCTRL_S32G2
Date: Mon,  2 Nov 2026 15:16:35 +0100
Message-Id: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::35) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc89989-3527-46d2-f2d0-08df38ebe78d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|19092799006|18002099003|56012099006|10067099003|261009223027099003|921020|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info:
 ek/to59FruU7xIjk24VrhJMIKlcd+s324yMHdX5Qz22N212QYM4PhRtwVuFLL1PHvG6wLHVSrk09grZZQRYBvdr4vtf3RG0eUBmza3FxD8jSQO9DU1U2/iMNNxIgA/VdsnB2uLhS2arJzCO7VvFVQZMUbusROkVt97RNrr3/ncoKi/axaP8lrfyA0YVs7FTLUvBWZSONPhui+YbNWv/GHfUN3/xmV5jaHj8I2ntIJ/YhH/xOze5UqVdcHwuZWVoDiBrfvrBoz7merl2iy84WFjLTjzQ9foAV6tKyEWN45wFmbRB6FKLl/NEy+jGcmCWVcUPHmtZOnGxz/RGirshLquRT15pemfYqtnmdFeK2wh/7faa+nq/FkaxIreShhh6YE2RsRnJVrkypZ6Os+N4qKyVK+HQI66SUmq8qug3shToh2aJfSfBUW4+DRTXyCVByEdq4k295+L9vUka40pNkyNFnJ4f7iNXQaIaLo/kO41TumqyMSnZbm70JsJiM4zt5Sd5w8KJ4MRQUwogjyjywE0v01dgnhugeF5RIBnr+711zdpg8AYnbo4UUpLZNHug5Ku4Wv7QFohZkQ+LV9/ObNG9paen4Eg2j9BQ1n7fX7TtCJpNjwZkB17raareSs7CMOpIIkRqHeEHJfeb65HRwxaNyjGiGhqqXeZ7WT7W02xMzih+M0hH00D8bAAVCmq+FK712yAphvVmzZF7hiWj9YQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(19092799006)(18002099003)(56012099006)(10067099003)(261009223027099003)(921020)(261021121427099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N1loZ0c5U0lmTXBubnl6NFJYRjNsRGRQNGZDOGZqN29xd294UDdpY09IUzZL?=
 =?utf-8?B?dzh3OUNFQnN4Sm5IK3J4OC9QYmNVTjNCMUNWQlVxL0F4dk1zZTUzajlaNklM?=
 =?utf-8?B?dXNKN2IyQnlWalJ2VU1mNFRJVTRwOVp0ejhiblNpUFlCbWUySEtrWUpTZ1Rs?=
 =?utf-8?B?RjhhVVkrNnhaQnNKYVUxcUFJNklwZzlZbWdEaHdNd1JsMklDeStRM29QMzNw?=
 =?utf-8?B?aEJLU2JkMmVxRkJDUSs0dUpvVDJzMVZ0YXFyMUk3a2pNa012MW16STduVnBI?=
 =?utf-8?B?clZkYnA4emhENzQyWWpGQThnKzIrVGlhZk5kNll3OCtEb0NmbXcyOVpVVWRn?=
 =?utf-8?B?ZXZyYThlMStmaElqWndkM3pnL1Z6YXBkY3VvYStIOWdVQTB5bGI3RGtXOEhF?=
 =?utf-8?B?VGpRNDc3LyswVUdiYzBkZzBhLzFvSUJtMzYwNEFJTG82dG1FVE5jK0tBSWk2?=
 =?utf-8?B?T0V6ZTRLbzc3NzhZdzBoUjRXd0JnSmhVV1RhQnpPMHM0U2w2dDF5Z05Qay9o?=
 =?utf-8?B?U3BUOVhzaUxnUFhXSTd1c1ErUmdkazVTbnhXRVBZbStDS29uTHpnMUR6ZHk5?=
 =?utf-8?B?czRBeTlWK3M1NjAvZVJ3RURtRmJpbDFoTGU2c3JhLzRkZ2lxYVFxejhvcGxX?=
 =?utf-8?B?VmhibVNOaXc1SjZuL0xzNDZMTHRoclVrN2gwM056TmZlNy9YcVE4aUE1dU81?=
 =?utf-8?B?VmxnOGUrNVNVTnZiaXBOYVRRdVppaTdzK1VOVFhRcnk5NE9qMHdsM2RMQjRM?=
 =?utf-8?B?dGZwQVBaZXVudlZKNloxaXhOclBqbzhIU24wMGloYUg0bm1RVzMzcjJERStv?=
 =?utf-8?B?cnlhRmxFTUJCbHI1K2xUUmhaVi9kSjRKSFVIT1lpdmRnbzMvOFhyNUlkb2I5?=
 =?utf-8?B?bjVKVC9uU01aMlRpeHJlRmRNRHNHZ3Nvd2NzeGhMb1NadHEyS1hMeFJSc1p5?=
 =?utf-8?B?dkpmTG9OZHFOZXVsdWpHdG9EOTBEdXFucmJ1THdhYXVUZkRhYXJJSDRpcXpu?=
 =?utf-8?B?bk9zU1o0c2tWMlpGTFMwWDVHRURtaUs0T3FONE5qclY2a3ZaZFliNG5qN3U2?=
 =?utf-8?B?R1ZPM2pjSEpBdFFvR0NZVlN6QjNoeFJHYVBiRWF5YitYSlVSL1ZTekEzY1gv?=
 =?utf-8?B?K1k3a0JGMXc4VDNnTkJudDljeG15ZXdQNXRoMDdja3ZCdFAxWTZhRWMxeEs3?=
 =?utf-8?B?ZDB6VTRuTFBXaDZCZ2hUUEVsMGdZUkhMYmdCYlBsN0pQRFBFMlJOM3VLMVVN?=
 =?utf-8?B?M0ZjdU1tV2E3SHBOSVF0a24wN3dER1FkSzlrVC83aXEwaFo5TkFzc1UvY2Yy?=
 =?utf-8?B?TzhwaW0rWStZdmZTajcyWURBd3RHREJQV2xuSTE5MlNqUnJKUDRvVFRubFJp?=
 =?utf-8?B?Tm9YMVN0amNQZmRMbkVoaDQzM1lPWDQ0ZEw3OWxSaitURlBEek5QOXc4SnF0?=
 =?utf-8?B?T3lQS25Kejd6VE1ML0tBUzVQNkl5cU52ZzlZbml2UzlzbUhmVWxzTjM2b3p3?=
 =?utf-8?B?K3VGV0w5VVNxUnZybUs2djh0bnU0Q2UxWFFzT0huaWlWNkVqeFJJanFRMzUr?=
 =?utf-8?B?SVFhZ0oyT0lrbEp4dkRNLytrWWpKN3ZVc3Jic2tIdVp4eTlsSDB4eFljd2sz?=
 =?utf-8?B?ZjUvVU00YmM4T3E4UGdTSTd6VTVKWXFaVWJ4UllSUXdRdVJYSEJudThWeXVG?=
 =?utf-8?B?Z2xEOXRxaHIyVmRFNFBtalRIcEVqdHpiY1A1Vzk2aXJsYjlJZkpzcDBjY0JK?=
 =?utf-8?B?SHFaazZuR0szVnpudFVCUzFGMFhHRnpwQi91Q3hUUHdIQmgzM1Y5TjA4RzJL?=
 =?utf-8?B?VnZLZ01SKzdza0FkclhKQlpZcTR6MVhhbWZzdnc4a2s2MVA1MkxFaVpFMFlq?=
 =?utf-8?B?NCtKQlBYUm92bXU1WFp6ZlB2OC80UVd4eU5JUWNRZnJqVFdFTHYybUdUNHFl?=
 =?utf-8?B?OG1Ud0RudWFhTDZTaDcxQ0lVUXFOZXhYeWpDRGRqd0ZwUC85OVFMZ25ieHkz?=
 =?utf-8?B?RVhZeGxqR2ZQVi9mRHdwK2lJelBDVkZ2MVFQejFTZU5HVURpcWZZbkcyVjhj?=
 =?utf-8?B?Y0w0dXVidDlTVjZiR2czM0tGMzgrY2pDMWJqNnYwVVJOclh4YXZqNktuWWEz?=
 =?utf-8?B?YzN5Q2VOVHpiTFVLMUl2WUpJV1dTVjdBSFJHRjVXTDBZWW1sZFBqSmpGVjFk?=
 =?utf-8?B?UXcrL1JSTlluUlRneUpQWnlxMHJtVWdrN2VwYkRZcXRDRE1yZk5zSzdrclFu?=
 =?utf-8?B?MEMyYnBhOThTVHlQWXRha3Jjc1VQR2VkSmRLdWUyNU9PV1BkUzhpU1FBalRB?=
 =?utf-8?B?NlpkdDdQWDBYcWpNQWNSUUkzQnNlei9hcjBvVFZtMDU2TGVza09xaVNQeGdZ?=
 =?utf-8?Q?GQs4BW8mFYNjnf3UXVF92VDgdRUdk0HJ5dCfT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc89989-3527-46d2-f2d0-08df38ebe78d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:16:36.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Qnx0pLmj9DQJtLJVwcbkYJg0LZPu0fDKLjFezWeOH6SoxI7N9SopW04MfRYwPcYqNB2uAK1/4Ei6TeT6N+X/CVCu3Beu02qegvCvO8ZOi6tg9MqO8O/nkldhHALimjN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

Enable the NXP S32G2 pin controller driver in the arm64 defconfig so it
no longer requires a manual "make menuconfig" step. The symbol selects
PINCTRL_S32CC, pulling in the common S32 pin controller support used
across the S32G family.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..545a2b7db8a5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -704,6 +704,7 @@ CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_SKY1=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_IMX91=y
+CONFIG_PINCTRL_S32G2=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
-- 
2.34.1

