Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43F3D8133;
	Thu,  8 Oct 2026 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443694; cv=fail; b=YIaQhcD5IpQZ4XkR+NH6BdhTdiDQdyxD+ZjSA1dlauCC5CQtWRl5N1nFUemA+srv+PNzkFo0wbNU7Y0KNc6amlTIMG8/XQcRT///uHEipzFWeofLNlleaiaAXmxwqQgNskPivrlsmDJG2cYTXeIp77BshRdEczwqverTLUDwhbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443694; c=relaxed/simple;
	bh=NFJVnl8XGkDZDFqq1PU8x3saDulB67drsYAxlhmFsuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hwY34S0EeGyU99/c8Lt0kLAPwpHePc6OVGDp1xPyJ53RGCyu/AeTp+t+LGyGvR84SYT8Iq0D5V5E58dHNORDNtdHa3Cj2y0MKfR9zj5sYBA3HEjFCHuXLI3oJcDEOg3fEDZ0Jhh4eKcyfcZNkIMPHn0TQDssPWLiaWx4zZV8x3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XTjF2RYX; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XTjF2RYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSDzxC3cnISUiGbyNZMhKjiY1NZo2ipNlSZc+sbvDpO4KnJsokgMGP7/8Jd/RTPGVRzNE+GR35l/MbWC2BgvvI6Qb3avi6EvXnWRQLJm+hXl/7+CxSZ5h+OnusnXaqj3aledHKauouUATyORWQqUvkXpNnBmhz8Ohgk0jBIXaXDRHpPudvIfVKEdRdOmI6QIKYOmMMP3EIjgOsIEwB5CU+YQFh28JgmClSRhCf/MLaysOawnUBaLJbCP/ckp+WYvWcnCfDuRRmJnRQ8t9MgNiVmzvV+O88S2SbJykehX1I45lxpfXT11oPYJ8Bymw7FbkB5+TUJmIHnid562b3wL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43h6arPUrRSIr1c66VVY/4QahGMiTV5kSA+8EQN+xLA=;
 b=suhgag2nD3nc1WCTMF5vyO00hhdDDMU7AAbap75bhpl6JlPZlx5SSkrx41zL7P3M5d2QUcj4WSELxUUfnLSi1YeujdRd99MwEV8gO052s4NdtASvMNkBvPP7LRlsn2XgCWHk5s+tNfn5npuYtgWqrvb749hmeRX64leowkrJte8fybB6oUt9CQ6oiqmqZuxNMMCfyXgE2mmDZ3vvOoKkVJJiUTyOrIIxS86NXkgLiLeFM0iU21Vw3NenPjwCFthMweK3NH+EhCxF1q1Wd/GNGKfg2MLPjovACUFUIdeXkx/azdVLDEiXfwpAuFwNrkWyHEKvu5wTDLZ1bATtyQ5m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43h6arPUrRSIr1c66VVY/4QahGMiTV5kSA+8EQN+xLA=;
 b=XTjF2RYXcQIshfDOYajm4YNysEs5OAucYS9ZWNWbKiWf6+sZ/EbHM2lUmfPSI0LeMnxPcJ33pnHKbA/KG8L9tcpGpVihNIVx19o/ubBUiXpHiYu0N5aC9S9XFB4wCciXBtg375YkfLQBhGTvK4vpLx7JB7QbwEuzRfH5qEWWW30BNFn4uTpCR5RySYQzPqMk/+zZrdZ8g32z3IysKpkbKVZZs9qVKxaSstlkJnLqn3K+4catdN3+PKNO9z7exJaYd7Z5ucMzHLh1FhWLCvP76xsLA+5rAaPBMeBNW1EnNQZlWxAiQcGzqmzlZxd4KYKtxkZoM1ukGoU4MlXa/TNHcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 07:14:40 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:14:39 +0000
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
Subject: [PATCH 1/3] dt-bindings: pinctrl: s32g2-siul2: describe EIRQ input mux registers
Date: Thu,  8 Oct 2026 09:14:34 +0200
Message-Id: <20261008071436.596651-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20261008071436.596651-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: dad2c345-2ad7-4e4d-7fe8-08df250bd15a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info:
 2dTtioinotU6E792DOWfNmUc16WOt4gm+zDRBI1JXenr3ZVei9VfORkQsp7OMOWrt9FkGPTTico6PLXNlo6X1ScD2m2vEQAijGsCcFjbzLep4RCIZT4IBwiMAMj8VldfSc6+gAJzAVEVZu3Y6nALZ2KFJyg41z3Ydy9IPw07L93cDk4jf7qqrAcPz2mRnr7s5hZW57KIoZFqo1EgAe6tgoTLNN0qYvHs7FmW32evMl3BfmH5NGe9ZRLK0QE92lvhpRwqNh1G9smRXCeeYvhrfuX3ixC7bB3kdq4072srwKbu9sUjfhZUQ0mTuzun5cjNz4wIYY//1C7EayGVYUduOEuDrL1DDDabaoVT6dPsUIxzbQi1MX3gvsllR8UwhMweGcRKDkvVTp40FMA8FwM9FJVHBp3Fh4WV0Tun7qGrfqD6gik0qWvUnn95VMRJ3LtuAv+Z0zGRWJ/SxZeunjdNw/3Nwh8iKIhvGmMYkDHBHykGxIvoCVy6cN8A3PAp7Tx2VQMXkdhNlhRY4jRNxTx2REk28DDXU1PTNkVQ1uaLDzV03B6jpe5TLEqrhTRpsZTF3jvw6u6Pi6lrKrhB8o2i6r0u4JW0eRi9w4+wESTVSytrZhsvmTcQR2oHGN/iTC4zYSJFsR/rMdGB+VVJMQilq2WC6NvkWsSZHUxGTnug2EIjRP5MUuloodn7DtPtzjaRI0rD/LkTsHzdbHF1TDCatg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L0hwT2tSWjJFQzRjVXBvSWhKWU5SMTJqM2pQV1FnSXl6YzdhTngrcVg3LzJs?=
 =?utf-8?B?aEUxaTlUVGowTGNPOFU3STh5TzRWNTB2VVJqR1M3OWZrclVKNzM2aXBkUENB?=
 =?utf-8?B?V28xai9DODdidFh0ekkyRGltc1BPVVdVQ1luTFBQZXkvd3VsSSt2a0JtQUtt?=
 =?utf-8?B?RlBHWU1ENkdBck5nRGRiWWhjV2NmUUc4WnN4R2FBZWN0OFA1blQrdzEzaC9C?=
 =?utf-8?B?RnRTM2hYVUw0dGRJS1hYb2t1NjNCL0ZqNmdodWRXV05QVFVjVzJLdlg4NXV5?=
 =?utf-8?B?VjVMV0xyVm14eFpMdHYyT3ZzK1I3azhuSUUvUmtiY2xPa3ozZlVwanJSS1VU?=
 =?utf-8?B?UzQ5bDhIcnpoajNBdzF1U25ObjcyZ1dxcFUwNXp1VmxiR29xQ2hzSGhHaXpy?=
 =?utf-8?B?bWRuTW1aZklQWUNjUlFTZldwZWI1TUhxVlpoVVRaVGg3UThmd0JNN3A5eUZP?=
 =?utf-8?B?OERTbytQc2ZhRmY0Q3FuNGd6anh6ejhLeEFLRFNsNGtRSzE3TzRZY2NmQVNB?=
 =?utf-8?B?YUJnd1h4TVJuZkJHa1JQNzJ4WjJxWnlhOU9iSHEwVHpEVVE2cFlCUDkwQk9a?=
 =?utf-8?B?djhiLzNhdE5aMWdzNGZTbmdzMC9xM2lHNkVZcTNNUURlLytkNzlrdnVYcHpu?=
 =?utf-8?B?amowRm93WG82ZWJKTTduOGJXdXpsYjFJWWZkcWZqRCs4dmhnSlVaQ2s0SlNv?=
 =?utf-8?B?VVd3WDVvSXAwamoxZjB0ZkdoRThDUG03ZncyNzJWcFdlRGNnZG1qYkhhYy9R?=
 =?utf-8?B?V0l1SFV5Um9KTGFQbitXc2Y3eS93R0RDQTB5cFRDVWwva09nbHEwYVAweEx0?=
 =?utf-8?B?aTkyRE90Vk0xMmRwN0pwNTVLWUo1Y1hmbVM3NTdtTnhDSWx1dGtDUU9KdUtH?=
 =?utf-8?B?MEhyRnhsNjZiZFdIbllTVmxJQkQ1NkFuM1RudTFxTVZjZVh4ZkxEaHBNRU5O?=
 =?utf-8?B?NjdEaTU0TXMvSHpHRzJEZVQwVXRQT3NyRXpNOWVHS1loUDVyTGFhTk5VcUVH?=
 =?utf-8?B?ZUkzSnBrMHNaNXI1aExaWWdHb3o3VElSM1dEL1FTR21MTmowLzJMcjc1L1BR?=
 =?utf-8?B?dVhma2puQzNPeDJ1ODNtbWVIWWNITWtKVEdaNXczQ3R5a3I3d0U1dWtSaWJQ?=
 =?utf-8?B?QktMSG1HbVFRTDNLOCtwSk10NkhBVnZ5bTVRZXRmSDMxM3JMUXBSRWJzeXJN?=
 =?utf-8?B?T284S0hOR29Ic0JWNERZbFBrUkRTWDJlaVZpSlR3MFo5ZGR3WWhyVDdrYXBs?=
 =?utf-8?B?cUVVcXRnRzh4V29JNXVDb29veVVGUkhxb2ZNQXFvajlGYnlPZmprYnhjeG5B?=
 =?utf-8?B?VUdnQ3hzNEVBWndrZkpuNGo4Q1RRbWYyY29zV1F0ajRQcWZEN1FndFhObllX?=
 =?utf-8?B?d0ZuRDQ3bXE2eHd4WWZubHZpVERFTmdOL29OSmI0clI0MEIybE1SRkxGNzlj?=
 =?utf-8?B?N1UyUEd6WHNXQmdGZVk2YmhaT0FmdkI3aDNucCt2cEdDZnVESzhKdEViNWJN?=
 =?utf-8?B?REYwRHFta2tTQ2VjMFgyRTg0R1VuaWpoaVBDVk0rakVHMkd3MTRuRnlpVVpy?=
 =?utf-8?B?YkRCWC9aMVFIekl2Q2xxaGlxRDV2aDlJNzBzZnozeGw5N1BjMEswaW5hZDVj?=
 =?utf-8?B?eEFGWndaWXR0SFM2L25KVzM1ai9Hdk1XOGxMaEVOcmtKeVlFVVE1cmEyc3M3?=
 =?utf-8?B?cmIxdWpCRmVoMVBibEdmRExDdHc2Z1d1NUhrQWN4SDRhVHA2U2dFdndrL0U3?=
 =?utf-8?B?TmRZODZySEJTY1FhZGFvNlZhOThEUmVSbXZidUs0MS9UUFB6azNCR0ZrOUU0?=
 =?utf-8?B?MG5Udmw5UEs0RUJaRkZ6L2p4VkdSTHVPeFgrK2dnVXREM2tnQWV1NTFFTHpv?=
 =?utf-8?B?eWdid1F0TThQNHlRWXdUVGhOcC95Q0pYbU1NSmxrUGMzWnlTeTlhOEtNUXhT?=
 =?utf-8?B?ZGpVZTVXUzJkYU50akJyY08ydWZaT0VXOGZNMXRhL3A4WjNnUlhCK1FqZkhE?=
 =?utf-8?B?REVIZUpoUGtJM1BLa3NqSjlZeE1RMjV4Vm9EYjNpdm5FbXF0N0xMaVA0SVVv?=
 =?utf-8?B?cE9iOXF1VzBKQ3RGdS93eDcxS1dlVEh2MkIyUC9VREtXSCtFWGJDdk5VR1Uy?=
 =?utf-8?B?VWVSZ1BRL2JSTkUwU2ZIQUJHcmM5V3ROK0x1MDkySFkydk96U0hiRTlRZUly?=
 =?utf-8?B?Y1ZuNE9zS0NOQXVzMTFJT0poMHFwQS9yZGlhNlFjSktZRVozN1RtTTEveUwr?=
 =?utf-8?B?V1pFQjdIb1lrY2hBQzhIcjMxUDVtYjBPVlBvUHZvQXNkZVYxNm1XUjVoYVor?=
 =?utf-8?B?K0FhK1RBeEVmL01PQndsR2N6Z0VYS2RObnJkSjF5b2M1T1hiMW9BWmhCWHIz?=
 =?utf-8?Q?fOT16uma7B9xEgRiY/wAEsDbwzcgLwvCBRSpj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad2c345-2ad7-4e4d-7fe8-08df250bd15a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:14:39.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7vilcpPNhuugYnpxizZwSHN5Nlw4z0zsShM8T7YhZ8q3yfQte9OZpg4MxaGwVo78OJN1AyUaCQaJTbWPd0/f6th/3zja3oY6vYxNkRtJEntGjboUPKKDCUEyyEBGfpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054

The SIUL2 external interrupt lines (EIRQ0-EIRQ31) on S32G2/S32G3 are not
hard-wired to fixed pads. Each EIRQ line has its own input multiplexer,
implemented by the IMCR398-IMCR429 registers, whose Source Signal Select
(SSS) field selects which pad signal feeds the edge detector.

These registers were previously listed as reserved and were absent from
the reg list. Add a dedicated entry for the IMCR398-IMCR429 EIRQ input
multiplexer window between the two regular IMCR groups, update the
example and the minimum item count for the GPIO/EIRQ variant, and drop
IMCR398-IMCR429 from the reserved-index note.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index 36f2393fa406..ecf6d61a80e9 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -23,7 +23,9 @@ description: |
   are used for external interrupt configuration.
 
   Please note that some register indexes are reserved in S32G2, such as
-  MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
+  MSCR102-MSCR111, MSCR123-MSCR143 and IMCR84-IMCR118. IMCR398-IMCR429
+  are not regular pin IMCRs but the EIRQ input multiplexer registers,
+  which select the pad signal routed to each external interrupt line.
 
 properties:
   compatible:
@@ -53,6 +55,7 @@ properties:
       - description: MSCR registers group 2 in SIUL2_1
       - description: IMCR registers group 0 in SIUL2_0
       - description: IMCR registers group 1 in SIUL2_1
+      - description: IMCR398-IMCR429 EIRQ input multiplexer registers in SIUL2_1
       - description: IMCR registers group 2 in SIUL2_1
       - description: PGPDO registers in SIUL2_0
       - description: PGPDI registers in SIUL2_0
@@ -141,7 +144,7 @@ oneOf:
       - interrupts
     properties:
       reg:
-        minItems: 11
+        minItems: 12
 
 additionalProperties: false
 
@@ -162,6 +165,8 @@ examples:
               <0x4009ca40 0x150>,
               /* IMCR119-IMCR397 registers on siul2_1 */
               <0x44010c1c 0x45c>,
+              /* IMCR398-IMCR429 (EIRQ input mux) on siul2_1 */
+              <0x44011078 0x80>,
               /* IMCR430-IMCR495 registers on siul2_1 */
               <0x440110f8 0x108>,
               /* PGPDO registers on siul2_0 */
-- 
2.34.1

