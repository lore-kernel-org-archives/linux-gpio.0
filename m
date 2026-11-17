Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794949831;
	b=ulUSWNJOUhJAlKbvln9bVAS3TJRkL6VdhL+eZ//exGUL9ZPo8vYBJWSmrvDQnluXy+lk
	 T/OAR6K7kjfC6LyFKLaFDmcPpDQcpnGANFKaDTuvYIVMcyJHK7Dd9Xu6AO0FNHQeW9NMj
	 5HI+0iyI8ZFNUU6jhN62uWcC3xbT3PXQ5l/VtEOu6aDTlqdH7tvqCbOCgcWypSCBALQ4c
	 4BdIoXOcX8drrWjMr+MV7eMLXd3LcpALIjXb5m8mEbIv7f/6+6g4qLee672DxdojFUKoj
	 u6MwzvQ0SviiZmcTGMmv+JD5qXAHV890G01tS6wII/IIzsJZYWDaEq7d4C8GN5rTU+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949831;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qp3so+Tiq/Xz3sUOW+k2g2hy3TNdSKABKWtqKUk2pwI=;
	b=TldoA0ldrwkfmKOgPqY/Hou3g3JQHKK8AxvkZYGud0BtPatMeJKDdRPFfhn8PamWPbHS
	 2cANiRTDiuCix/7LU1PUli7+h77KFwLT6h7VxuleidKOpnjHuiAgnSa5Q2Q2XWMYdQRb3
	 fEPV09j81bdk73DZFlsgBzLzY2uzkHGY+A/MlrptYbTMMChQcpXiEQ1J3y2+JlIkwFDn5
	 bYPRKCEgZhmc3yuBr32nd0aBvtzRUKsqfVUG+bL+VY4jhmU36eUaAPg+mWHW3gxJP5bdm
	 ouI8ZJf75pinwQa7nL3+1QQWWjNdHaGY6lyPzQj0o2LQPbYWHFofuTdg+Tps6GSvTSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=INzMlI+0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.17
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9100606A32A;
	Tue, 17 Nov 2026 21:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9100606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=INzMlI+0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcaO7mXimKD+grilEnfo7eG+WEZybSD26qfMCuFHPYY1HYwZzmxBnD5O6GMAlpN9Yv5G6duNqzQ3eiExlaSj18dKdFX5o41W8IfydYKlxTvyA/8BHhlUa2Wt4/qdnknY86DoH23t0ctc3eBdye9Mjz8gziQ9sbxnGT3x23oGK1rsAwtxsTQFojB0LglYBWbO6XnSVzrVAaffOyfRi5kdb+2FDjkwDRxvh8GyycI/rB5cvUrqRuvJIxMrT3h7ThsQayd6nV0QdlFCuj6eYcQmDhjOPbXMtCk1y8pwJFmQExp+NJMhyTrJW8Ovkx6cKnrut3wYnidkjpQAsX+M5lDEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp3so+Tiq/Xz3sUOW+k2g2hy3TNdSKABKWtqKUk2pwI=;
 b=hfWpm5trEer6b0vZCYVmzvT5iRnlCnK2nJ4uPwUx82/5JCxUmx4kNvTyDimFaNSJxZjuq4hS+YKzxlq/VbFhXjI2dx3H7BN5sw5Bb3BFohHX+jG7hLF/UeIxjlKekpBWAl6KMs+RFPNELTUyPYzpg0l3gDH7i8cxU7CZtiKwxwWuyt/O5Mvg9E1heBlIvC86DClip/x6ZzXtnTc1JV8W0dljVadRUGXJW572UqchiIupceKp3QXIPn31BcanZDPiIwcZb4ZycZQyfg6gP+n5YNvtA3DBqGxFSfBWeJk6IY2NtT9lB8a9MEJNdNk83eX5Zf7xLlxs7j1yQbDBbV2L5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp3so+Tiq/Xz3sUOW+k2g2hy3TNdSKABKWtqKUk2pwI=;
 b=INzMlI+0uDRC5RniBSYn3Y3nTD3Lt7Kt+ZXvQAM9EZoJN9xhr0xfR5PSLPvlyXd8VPQ0+NzS0SG0Z3Js1um2n5uGQemUAPPjvMqOWBR97oMH1/WtwfMv/XTfZ0BgS3YHnXdeCPZj2WxmvjNt4gdkDLdJqTq2Q8m8LjtXo3fOhe0jeEN76/XZYN7Pgucp/my9vIi6AFue7ju8iLTxTMFTTtJ83HuItaPunfApNXfNMiDWA/BZ5RDLnDUQmw6iexrV3AMFWkQqptKQfpm9BJq/xmU51XR4MLbd8ZytkUfON2Xk/zhelmVrG8USUBASL5lLqPUup21BwXgAbPbjConu9g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AS8PR04MB8915.eurprd04.prod.outlook.com (2603:10a6:20b:42e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 17 Nov
 2026 21:10:26 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:10:26 +0000
Date: Tue, 17 Nov 2026 23:10:23 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v7 3/6] soc: fsl: guts: add the RCW override of the pad
 muxes
Message-ID: <avzCrmvlOQh0RVjT@lxl00025.wbi.nxp.com>
References: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
X-ClientProxiedBy: AM9P193CA0008.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::13) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AS8PR04MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 389cef8b-21eb-447f-ed78-08df44ef33c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|23010399003|10070799003|22082099003|6133799003|18002099003|3023799007|10067099003|11063799006|261026121527099003|261102130727099003|261022105027099003|56012099006|261021121427099003|261026140227099003|261102123227099003|261009223027099003|4143699003|261028144727099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	EmU6+ZFYGajB5fm5AF00Boq0RhFzQREvpIkqWuO9y21Auo/z4dE9t41xbnVig/DroLzdSApWa4yzSUvrz+2KvexBPge90N2THGVWCpda6ItkjKjUp8KJ4yRq5H6hsyh+iT8fDYSDyCm8HXtJ29aMgIT8L1Y/WtFTcneEmLUe8IebNQKpLfQtunQMS8hdIgZZU2l9mb53EbqddyHTem++RZx60+imX06Xx0StK/VZFi/cVt4Q7uncVDvDHBprdSRl6C8Ue7ED48Cy1FVxp7vOHLlZA2kc66fYvA5WNn6T7SytaWr9mJLuZjNdB+XFpSpRoTZ4GP/IDrAwa5iuna2CMH7hEgdaXJh2fxmBYTQciC0s2TZCyw1bWOJmXidDPfE9QYUjnqG7OeW/N4RAalQYMuVRzsOkKLHUhqv0kWOiy5j1DvBwDHQH9B+mFtfJ70pWL8oxz67Ft5QHdFLUFSdvq1PRfjJoV8GrKnSHM4m/3akZcmWlaNXDuZeiU8Nh2yApkBI1RRJKy+QcXH5mnKpBDymb+QHZv6pu8XRQMSQFggIK5CA1dMvdfstTsKXyX89RzsXdppWLyH5z3emiPvfBRhgcUqymkF3bl6SDEt0u8EDNveeMs00kYB+APG9R10866IDFYuX1kumaaBTTFYozvGY70N0Wtv+NDUnpbaSL9WIkPTOfnPMBQrWEbJMzmNoVGkdTJn0D3+IM6Kb5IVqex7dE4KSyhAHn1UcZ5Au0jLqE4gmNlp2xo4GCHs3hUluC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(23010399003)(10070799003)(22082099003)(6133799003)(18002099003)(3023799007)(10067099003)(11063799006)(261026121527099003)(261102130727099003)(261022105027099003)(56012099006)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(4143699003)(261028144727099003)(41080700001)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?khcUvbAcEReyLJlAllWRhZlkY3AKMhKTWFD9hK6hmM5TlPi/5j9vIznhNwE7?=
 =?us-ascii?Q?hJQWIJwXc3USSCi8gFUu4+5aq3OyPkvm8XBrV3ohDW2rBlSxgzLxNQuFKgE0?=
 =?us-ascii?Q?lmWtAudcijDU6fDi9WwKigQ8twOI592fbWEyWSJXL7kdD/SRMjlLL5KOcC+v?=
 =?us-ascii?Q?hGSwSdmBHCA+ZVrz5GYAl1XslxV/gVNzdGyIXSv9knBzpX+GS0X/t2NWZtT2?=
 =?us-ascii?Q?vH3pOnQLSSMLYxAXThzb8ouHVJX+El86AraD+qAiCvGgdzFsoH2xXHeg809F?=
 =?us-ascii?Q?jkZkPj4jan3rgwtc7poiQfWYHEuxN97IBwEfZyCohr6ie2ULyq9i3AIe/6xR?=
 =?us-ascii?Q?bRdNAX6y7pmE1VGe5OeR4gc1mTwk+0XTfw02sFzCHxJ2n84RXf/sVmrfIXjQ?=
 =?us-ascii?Q?gqW8rub8i+L+SZOKw4xHJ3Rq+m3ecIUeN46J+MQQBJ4TvH9qbfI3udyAaQrm?=
 =?us-ascii?Q?pzZuS1jNal45CkzjtkVmMP5alYX8W2sU88fZhCI0cIPq0c1/NtGTDvnZS1p3?=
 =?us-ascii?Q?+uqOx9b99RoLT4L4lxKCRVB7GmftI+3hfR68rH9OZYC/nRuk6iuCHwHLJrtM?=
 =?us-ascii?Q?IjxEQ7EyzcVos72X/68y/K0d8FfJ6ZOCluZNwnFqWPCnyZmRph02D9ZkgxSK?=
 =?us-ascii?Q?d0nwKqGbSno+vK9IfjatUWEyCBphaHvznNfnx77oBPLiDw5UTajX6eQLXGRJ?=
 =?us-ascii?Q?/qOTbbFJcXHtkbulHAkkLbnrmWmt9wS3ZLryFotaXWvmyWviS59Qmqs9jua1?=
 =?us-ascii?Q?0McErdRM0zfTNmDciv2giHCwB47furCtEcqC1SBfjq9HCdhIVHMZ7LttuOgh?=
 =?us-ascii?Q?lyRyxuMeOMlKo1/bE/s8qFswKZnPb1jAq9MWecFnBulexkBLTfP9GS0TEHyz?=
 =?us-ascii?Q?LuqyBL30/IKtIa1//g2Q7pufIzrhJZffASAY11MlSmDfCewy90v29UGIse8P?=
 =?us-ascii?Q?LjbAfue4xgHuAedC7oZPoAb7+k0Uj3V9FJxVCjRd5RY616ltngwBnvlkgfXg?=
 =?us-ascii?Q?PBeebY6K1hYHjql27LfjM2kOisrE4W/nZ/BoCxgRKuCU/xwnjkhbHU94kM6q?=
 =?us-ascii?Q?7OEEEYI+sWZXPIaBPHijJykzx5++QbO2OCLOCOEPLAdt4ywH9Msp4VIwLbt3?=
 =?us-ascii?Q?KnGYcFACG/iy7NxjBLtqbu2BTeANdK9T8529Ovl31UV6/1w3hpxNENRwMxuC?=
 =?us-ascii?Q?3KHADun1oJWk6E2sRqzAUs3/gvnMnBrnCfCpcflOhH2Lr6QE2BAIW+vhspCm?=
 =?us-ascii?Q?sDazqavOF3UGexPEzNFF/k8fi7q6zmuBgoRyUVadeAOwgHWIaL8bW2SgYad8?=
 =?us-ascii?Q?1PhvU3toE/rfuH1IHncwGgll8WLdVaLilmfv2smyzVMz6CWDIFSB9OcIsD6K?=
 =?us-ascii?Q?CII22xcc0jHc5jbOZxTUK3/LvSPZ1oOfqo+DoSDTZ5vDjRrSQRPp7lG2dBAt?=
 =?us-ascii?Q?Zmuh6Op4qtI/WJoRIHIGphlEf/db+wyYv6yaKi+J2IKMkGZCAmTMbP3iI5sj?=
 =?us-ascii?Q?cXZgNffC/TVdayE1mff6sr6BqPP4tw1c6Cv247ZFdxEnnGZZk/3gLBEf9BRD?=
 =?us-ascii?Q?espDXUl5PH3uuWRA4wVAEnU4fuw20MMXaxuf9M8NkpX3xjSyEjJQH9qw0T3r?=
 =?us-ascii?Q?t4DxgkSQ3ZrVYCk/AjwoAIh0/k6JxKjB/eUzQQeN2bKdDIg+7GHKXJAnoteh?=
 =?us-ascii?Q?eTN+oQDwbBQ3Wucy2QNHWwd+BWPqun770AxKgHS4jK5VEkwaqvdt+PrXXjXC?=
 =?us-ascii?Q?b7z9O2vcpC555TMXxI4XS/nogi2L30bd0L0/FVlnEOFVWjpZewoMl0v0LcYE?=
X-MS-Exchange-AntiSpam-MessageData-1: e+z7Wez0jqJMzQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389cef8b-21eb-447f-ed78-08df44ef33c8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 21:10:26.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osIaFLXxJuQxXrvMUtprSBUlM6m/8Ez1EjyOqPhBEQk1PLmWdlYPp0dg+feFzicZukHINqXhqCWkPq7pkkaSlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8915

On Tue, Nov 17, 2026 at 03:53:13PM +0100, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
> the pad-mux fields of the RCW, and for them only:
>  - fsl_guts_pmux_read() reads the pad-mux fields of a status register
>  - fsl_guts_pmux_override() changes pad-mux fields of one under
>    rcwcr_lock and waits for the status register to follow
>  - fsl_guts_pmux_override_supported() tells whether the SoC has pad-mux
>    fields and whether the DCSR view of DCFG, which holds the override
>    registers, is mapped
> 
> Each SoC lists in its fsl_soc_data the fields that can be overridden,
> per RCWSR: a register or a field outside of this list is refused, so
> the SerDes protocols stay with fsl_guts_lane_set_mode(). The LX2160A
> lists the pad muxes of RCWSR12 to RCWSR14 and of RCWSR27.
> 
> Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Frank Li <Frank.li@nxp.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---

Looks good, thanks.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
