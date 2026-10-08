Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD403E5EC4;
	Thu,  8 Oct 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443701; cv=fail; b=RZ1L41wm9D+hm+JF0mhP9G0bUVvHWX+6gh/+KHZ1VopOv9kb5zypscsdISw0QKPNV+d90r1k/e+Zuxtk6at554JwkI9fTLHgd2OnC2KyVEHRZSuSA50IW6bbWc9bYz2UFqe/6Ak1Q7FZMf26yWKehxszyXcijJysLdvV4nBA3jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443701; c=relaxed/simple;
	bh=E0BogyLCh3FiHrG5oZQvbVfLQBy8emkGR6Q5FGe5lG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iy4YYXHmE7sGglh+YASe8e3Q/fzD+95Y9zjkdXblwX8NOJs06MhF0g/Z2zc8AdLe6j0t6JkgGxBRT8NJ6EHK0Ogxt1JC2sD5DdsXouP4/6njo49Mu/pSrpLUbkne50c92WLkW2wR5EEerqutwjDiNh4kdxBAoS5PvjF8KNlD5aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JA9o+QLr; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JA9o+QLr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTd6Jz8S9pCNqJFN7dy8qhiKZRdBXARKHEQHaBgmirihsYp6/mls0d+JiHkyXyQwRdf4+iTWlIER+SUnz1Hg9hMB6mpSw39M00TUuswcR/TVkDlOfT+1b3UZaCGm9JPsKEvxp7ZZ2ltD4XSrxvLLuz4N8klexz6APldgVVupypZYsJyIG/fJEO70E7KD5VkLg+Oyqol62bbAzojGikKR0EbHAuJnRIe4VidP8fCC0N+9t94/0HsUBj9etx0ywSy+B+pZt1vbJ3uwtfANJ8lf3tYc+JhVqserUDcE4FxBuDGaWiYAXRQ0QDo6WJyDgLBgvj3JmzAHd8wc0pZcoKtzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ae3cOtnz6wBJkPdiqJ3cU1XJvU2ohuv/uw5ndGjtWE=;
 b=YVaPU1HPuhrf/ybuIIr7hFNHu/PsuA2dbk/bU2SJqqAeVZ95kzR6weVkJ2QhGoPoLvDiRPsJfS9GrPmIKfxS1kozmlX++YqZkVTuIEcwbIhe60MB2qLibJz6FTdY5pcdbqlTPR+Ip8QhEylWiwZs4MsAIqL/E0LwG3cjnfLmdaeiQydqlDh2t2Eh8yNDqAmCsjwvj3bT7wYAlEGOzyLZNGvwZM0QBKIJhmiIS9Qj5R6louUBhOWOPksPLmJGNazDnWXcBMywL9og3+orfqs2tBD8/0eWWPScuPyEGBzk/bMgMo0Ja5FyJIXzPZzf+wbaesV5gQlNwLIbHpHpuScBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ae3cOtnz6wBJkPdiqJ3cU1XJvU2ohuv/uw5ndGjtWE=;
 b=JA9o+QLrLSuT9CNVzmKIFCbTw3rVSXBXdi0PQLJsgFMLkxkIaA1+5DQlKTzrmmQdYoK1dQfa7LQyvXRd2W4NrS1DDD2Bm+dSVCrUjjeriyZFRINkTjP9nHXGh4ixETagYP3eSO/go43/55cP/Nbyhr6JWXZPbnPW0j3QjKWaREC0tXSCl7mEYCjWog0LTEAhwVZgohVhlooHKEHcHyCud0f+z+1ud1rp+UpyIPCl+vZTMGRxhjan+ZFBVX9DN7kseQY0qX2Apd1dH6AwF7lWyVeC2exXNlkTpA3gmOMVo/t35dt+8hzFnJLra7sKD7fF35NZoZ+IVWv6Fd4fjZSS1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 07:14:42 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:14:42 +0000
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
Subject: [PATCH 3/3] arm64: dts: s32g: map SIUL2 EIRQ register window in pinctrl node
Date: Thu,  8 Oct 2026 09:14:36 +0200
Message-Id: <20261008071436.596651-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAWPR04MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: be254694-4f3c-466b-7927-08df250bd313
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
 89YwKxPWnAUQuQUFBhOCHhqH4SLuUjR68OB2wS0tetgn+gmNetWiaLqgFgmu7ws+K9Cx7rL/UJtkT6of/kbGgmZZ5Yv8qVWYHc7zzSOnTIgmukYj1zBVbp3HAeqOWxCGDlzjG+BZYqAG4DqFpfnFQcUb0ylHVvsQtDf84zt0gHw+g61koMyqM7suOy+psow7uXop4uFPP7pnwynC964WrfdB6POy+ltJWvYRRAD7b2hOjJXY/eKh7B3P2fzJNDPXEaX1Wg/6CApesp812XIqZuAk5HVpRxPBoqw/yewkojvb3gcUWw7hj1O9BEDOjmutYcRwoDEElRZWo2GIQO2qSucCUOfZshotd5B+wdfihiCjfngfKbnXD2WPaxWYv9GAGMAO7EvvuqGfhLCKS6Q1EXvKmRfG1maaI6ZkEhCFO1J9y5hSfAxl9jHjhv5Y1GCjiObkAdWgpY6yBi1k/oeHvcDwyX7vFDHS5jwh3yWbgwIoXJcb437IZoAGAN7uQnpzjrpAsIJ/ht8jvZvjvqZy30g3zSyVwpNAMDuh9bvVmlUnwmvyMnC1FekxAmfCn2x2P9UCktEVpJbf6gZTHfyMtOxWAV+ZaO1OBdGbj0oz3heWpgXgeFvgizwb4yKSp1U41er/bxSe5VnlMXTgrOhHZBW52MwH9o3W/OCM4wvjog0ZIP4ztTromwUg7/OFDWUs+zss5gF3QzsICrbu8JLGkQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RFFtUTZFTnV2SmFaMTQvN05XbDFPV091QUp5b0prYjVUalM4V0IzNjFTZDJY?=
 =?utf-8?B?TE5RVTB0UlgwOVBpOTFyeEhhQ2p5NDY2NmFjV3hVMVN6ek5GT21CSFh2R1JH?=
 =?utf-8?B?YXJVYzVac1d3OTRZQTdpTzJiZ0NtVnhyM3IyaFVWU096Ni9WdGVweUNHeGFu?=
 =?utf-8?B?WVNjMmNvNHJYQmx4ZElLYUt2R3dZeFhlL1Azc3IxYllzZUw5QjBrd2ZhekM5?=
 =?utf-8?B?SUZzZFM2ZEJTZVl1dVV5dy9zcy9FeWFEM2lDOGVXRjN4SGg4NU54b1ZvQlNN?=
 =?utf-8?B?MERGaGR3cjFiWHRLS1BMSHc0QVg0UTN5bFV2d1RWbEdKcS92MEkwM1grbmlB?=
 =?utf-8?B?OVNEYlh6NjdrellPZUtFQmxsRkp3V1VoY2cwRFM5UTA0TGhyNXcrdlJhVzVU?=
 =?utf-8?B?QTliTzVHUE9mMjI2MmNsZlU1T3UxRTB3OFZnZG9SMHV2WmplTnE2V3RXaGR6?=
 =?utf-8?B?RG9jTkdlWkxNcXNZeCt0UVE2b3Bpcmo4NGtlc0FjVGdjOUN1RXlzR2NvNXNS?=
 =?utf-8?B?ZE1KNVI5OTNLMWFKN2ZGZEZoUG85SjFmeExwUHZlOHZDZm92elVRb3I0QnEz?=
 =?utf-8?B?N1JYbUVrdk5KTTVxa2ZHUDQrMkd1ZXpJK0NmUmFORGNycDdwUUdmT2ZxMWJV?=
 =?utf-8?B?eURkL1ora2lFVzJlNzk5TlJDdU9wWXZ6cE1FNGxFczcrV1lDdUEvRkVpSFBK?=
 =?utf-8?B?U3FRQ1c4TXBMMWEyd29xd094UFlJWnNRbnZPRCtqL3FnK01ETm4yQ0pMelRq?=
 =?utf-8?B?azZXSG1HcndnaVdUbmN2MkFxTC9CTmRJZjNzZ1pqUktqdFBHSHVFbXZUQlJY?=
 =?utf-8?B?VVFzRjRXTzNMMitSRnVBSlF1TEhMN3RuLzdsQituWFFNZU9PRVNhN0JCbFll?=
 =?utf-8?B?eER2VllxS1ZIeERuOFd6OUxFT1R1czJPREk5ZkcrRHF5R1hUMko3dHNuWlJi?=
 =?utf-8?B?cVVsZDVOK0xDNWZwZnlQNkdPNXkvUmpXT09WWGsrNEhrTDZrZFRuVERWcVNy?=
 =?utf-8?B?UUkyY3M3cU9CUTlaU01oRDZBeEhheHdVVVltb1NieXlFd2NCbWI3Q3pFamhx?=
 =?utf-8?B?b3hwYkZpL0Y2WTRxT1VOaDhmNDF4OVkxejRaREN1UC9GYjVBcnN1VWFsNjhG?=
 =?utf-8?B?SEZQRGdrMGJTRHZ2dTMvalJlT1VMQ0JPUXA4bHFJeXRuMlVmOFZMTHJmVGFN?=
 =?utf-8?B?RmVZd1N0NzBOQnd0aFZLUzl6SVVqOU9YeVRxS24wc25LNmhxTXNmcnN3UVdU?=
 =?utf-8?B?V0FubFZGRUtTcjV3OEF1STVQMU9rajdWV0Jwb2lTYi9sbEprcXU5dUVjU255?=
 =?utf-8?B?M1ZNYXAvcnRsMWZYMGc1bHJrK0c2UmpXbmxzZ0N6VWIzeDdoWWdLT0ZYL0E5?=
 =?utf-8?B?Vm43Y0FmbFliYjdvM1paeEZRTHZLblN1aVF3cnNxUFlManZob1lHVVFKZyt3?=
 =?utf-8?B?a0s3UUtBUWxXVUh1QXN3ODR2L0xZSEwvY1VUVG9FK0diVVBMK0h0UmRhZ1Z2?=
 =?utf-8?B?U3lmM29qUTdPeTBQR1RGMmFRM1JPVmwySWNJMDBEaDlDbDNZaUx2SVN1Y1NZ?=
 =?utf-8?B?WG9icVVzUFFaZkFSSkY3Z0drRUJXRldSL2NLOGl2YTVLeXlYUTc5V3hmc0Vq?=
 =?utf-8?B?WHd0WG94Z0tJczdKRmhORHUyZVEwM3FXeHVHOS9jb25jWW5hUDZtMVZncDRt?=
 =?utf-8?B?ZHJudFF1VWRJc2R6c3pMbXJYdU9ZQmg2N2NyRWo2MUt4US9oRGFRSHNQYW00?=
 =?utf-8?B?NVNNSmtIUHZlSVpRa0NNbWlXdmN0NDRkTTNocHM5c3VCNHlJbklPSWwyank1?=
 =?utf-8?B?bVJ6OHpRRFdRY0hidWZxck0vWGJPN0pDUVRSVC9EK2xEcWtzQVVBeWxrRXJu?=
 =?utf-8?B?YXhjRTFaYUY0MUJzL3R2NXlzc3hGWDIrMEpUbG5uejRKa1JtYUpzVUxZRzh6?=
 =?utf-8?B?MUozUmk3UjYyZWtOZmxSRzljd0l3TklOQXUyc3lvcGJQUHFtbjdVbThVcGVv?=
 =?utf-8?B?S24wOFJUSkJ5OG9UUmd0dE9BS2tQWFNjRnVTU0dMYlAya0NGWWRZRmN0OFlD?=
 =?utf-8?B?MytEbkhNVVhZS3l4dUZ4Vm9RbC9McHpRdGt0RXJCUTQzNHZRWFJEeE5veFk2?=
 =?utf-8?B?a3VzQ1lQcE5xWG4xbEh6d01lMXlOczZkYkl3d1ZEZENkNXBNTVFHQm9qbjE3?=
 =?utf-8?B?UFhGK05rUWg3T2N6NTJZZVdWZk9tQ3prQUhpKzdCQ2QwdHpaeEhUc0V0Q0xC?=
 =?utf-8?B?VHdxQ2RKekZ4QW5WeUtsUDROUksvT1lVN3A1YVR2Z1g1eUZqWVc3ekNkKzVt?=
 =?utf-8?B?QkhnRDE4d2dYS1FYek10azlTNzV2dmFsZGxpQkcyRXl3WDVtVTJvMTBIZ2hS?=
 =?utf-8?Q?Z/UxHxVGiZ3FeHUF4+9SBjFO9gXddQN5/TvaA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be254694-4f3c-466b-7927-08df250bd313
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:14:42.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b1w9mOlFLOlVoE9zLSZEEOnkzk8+U13wvmVUnMIFXli3s4BWKe1u1rIRoAyExi+bbIdefbID0cNsgBfkee6ZA3pp+MxXjP+NczyueWnuIPcFE1yBtIoSLwktM9rtoJT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054

Extend the SIUL2_1 pinctrl reg list to cover the EIRQ input-mux IMCR
window so the EIRQ source-select (SSS) registers used to route a pad
to an external interrupt line are reachable by the driver.

This adds the IMCR398..IMCR429 region (<0x44011078 0x80>), which holds
the EIRQ0..EIRQ31 input multiplexers. Without it the pad-to-EIRQ
routing write falls in an unmapped gap and the interrupt never fires.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 996494e34593..53213057120e 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -139,6 +139,8 @@ pinctrl: pinctrl@4009c240 {
 			      <0x4009ca40 0x150>,
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
+				/* IMCR398-IMCR429 (EIRQ input mux) on siul2_1 */
+			      <0x44011078 0x80>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
 			      <0x440110f8 0x108>,
 				/* PGPDO registers on siul2_0 */
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 31f7aad00b76..fda827fd3eee 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -197,6 +197,8 @@ pinctrl: pinctrl@4009c240 {
 			      <0x4009ca40 0x150>,
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
+				/* IMCR398-IMCR429 (EIRQ input mux) on siul2_1 */
+			      <0x44011078 0x80>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
 			      <0x440110f8 0x108>,
 				/* PGPDO registers on siul2_0 */
-- 
2.34.1

