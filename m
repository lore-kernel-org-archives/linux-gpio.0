Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792438251;
	b=pbzIoBowKJoT5gfSHwqlmK0WCFcEebL5KBO5if/NHHmEwCK7wgIatJAo2Xb2oZscO+7z
	 2kLZckv7Pz/5CcpLZ2CCIlr+MDwZjxszAnLheVTqiSjuMV4Uk4AvIbxsEXtByzR/al3LB
	 6t13sSRgkAFJgoQvJE/Iz6m+AJGx+6B6DTU9oe6mFxeOdtcmcRtFTKDtGS/2ToZgXCguF
	 g8YJ3BfSuj3Cv1XuzkKXqnSgw4oCMWM41vqk/Ppcd6XPE+Dp9psVwHvpRabFEtqH197xu
	 /Wa30hSpxw1ZYKcjp399cU9HoWLLBlymoaFxLPusiPzZheRIPShdp4fXBhoC2N3FRig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438251;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=6PwGTgeJDaH5E4qaEAGq0Ils26uhBrgxsCM2CXVqncA=;
	b=XnpjvA47Uy+HgB1WTKwDLdFHa/kiD+rKil6FN29/K6rn0OwmpTKhq2J1N5npd/XGgq9v
	 R9NcD+jMKylI1WMCMuvMai1K2XUqPToOHLs0JMsMx9S2+MWlel84zNVz8JkkYG5nrE42d
	 792/jOHOH3fS6HYUGWzyio4b4L1v4sFrYyliAFJ9Il2zEj5sJsj90K+gOxxzCna0iRXaq
	 XrqgZ6K2TCH0LyubXOHBGXFzlvN3BU6VWdyLQv7SuPDR34HHCuL23QSfObwSlLVtKWGlH
	 N1g4YClOp5BZs6rL+fXWPM4sBLOUl9Bg3xJkWuqxzSJ9QotPTB/rH2JMoMooHX+GHLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ryZREfoJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C8606A322;
	Mon, 19 Oct 2026 19:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41C8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ryZREfoJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iq4kW21mmdJCjIH31MTmwG8jah8tDNU21bZH1qLbYFG2+D7mZZuRba5fFLj+V12byKy0mtG1naZ12RBLa7//i30i9Gt6YZlS5qtoNw6iKBNZnanV7NpzdemGSgtqCp+cwRQccaQrT7HhMxB0op3jUGp2qKyQevmLdHEO2FmKmuQdIZZGOOF3iu6l1P7E8ez+tMcY+ajRK9Q+slt/jyhyuAtn/Rk1RGtcPiO9Nl2FBAk8LWMHVkI7bUeM22O0B4chD3QRXiB3BXeecM236eS2bFL25RXEfA0ppdpFNmZzEfV2/M1CVuC2BYHM4uAC5FOPfvhXEPnlDwUISomTVAd8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PwGTgeJDaH5E4qaEAGq0Ils26uhBrgxsCM2CXVqncA=;
 b=d5VzZjECkpwBGsDQTO8jUg91svrqEjhOvhMPbhCr8GACVtjy1P0SJTVZTsnBdplR6L78f/XU6u3FohZAfM98AlQ36/kY/uKkjFFE79TGb8HktrrWC1TdXv66gJbGhyTCPtPbIwXOUH7IBnb0YGDljBaKuUq0ouaf+fVbzCoAIRmBcgVLUlG/VXULsVBeTbtdJWHOGTzpbvNBAeJr2okPCscK432mNfoHVdAhvIWUE8Zhy8y5prYG853lxl8fCwbMF5tYtTtBKNA2vh+94a+y5YUwdSvV6PCUS0FE3DtiTmtdInE0GFhcpRlu4In92yfyKnbe/aYLb+71Iuv4Q163Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PwGTgeJDaH5E4qaEAGq0Ils26uhBrgxsCM2CXVqncA=;
 b=ryZREfoJbWH5TZkA7LfSMob+WpTubO/NHdRo2Njp/thYYT9yNCeT0M+07ue9iiSE6YAjuutIsIQTsSblxxcNOOXd14s2sKR8eTse6RgFO5F1WKNj2VhTUUQ0k9HHtBiRf7ip2vQxhRBaCe9ie2Gtcd3cAxQBiJwrb5rJGnvqqFYusth0lp3jftEq1Y4FIQs0c7b69Pduy6dDaTeFg/kHmuR/9q8sozVSiEtAsOJUr14CBKsWf6XJFOrWj2JAmwQyxD0WW+mAq/1HiUwuelu/4HprWTnVkUxy+lZZ3n3O2wI5b/TPixfX2hCM9sNRumLYZtHqiatn5WQInKGyTWd0/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10934.eurprd04.prod.outlook.com (2603:10a6:10:581::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:30:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 19:30:42 +0000
Date: Mon, 19 Oct 2026 14:30:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC
 data
Message-ID: <atZv1_t_avZKYeS3@SMW015318>
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb1d783-2f6b-4ed2-0ab5-08df2e1776d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ACjIqXuWl0geg9IS53giKD7tOeyfs0+0mDHxHYVrpqSDvsq5NoKTgbv78iF63q9Y9l0ZiJOHfsUq0IjVK2t/cUf751HUfnvc7N1+VzGRVedugTdMyJckBVfwiRK7vUlOydjm7HAN2yhtzA/0cbCkM6MfpAXFEoRZEdJ/+E4C0LIqoBY079E/9Jxx+fJOeDma8M+1vKVM0dMYvttdSbxIThzw1tD/k9OVoCoJZJYga9iuE79xJnw51D80U4Rd12MH3+BlUS4KpcNIrkSpfytwEmrLHFzuXCxvKt/v8pgsEylJVxgcrXH7aonjKJ9xdWG4Skwvmuy08dQVD4z+xEYLQVMOHiTnUNvJqEcKuOPA1n6zKBeUvl+MPssl64zzvT25z82l+Gopr4xa9e54zZSlXD/hr9hmY+PFmJFlaH6nPkUARED3vky6O2kz67ZKsl7zPL9zHqadpoZZnqPIWGpJY9fj6ypxWJUSf1/JzVSU/lGusYwW9rp4n8UT1GNeHP6uAXn0vCrJyNqxvrZuFwLmqeJP9jA/eyum2UDQjP6UE7PLa5ZkSzSjEJVGIgl9B68flWSuE+L4pHdkY6Lp4dDB/GdxhrYE56wf8JtaqEFkH8DmDdNOMZmwzph9F+riUBAzUU9FyEKlCiFx4LYw4vpA8Vl5gXG5aog9jy36LWpZAzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XEanyw5YWAY3c3212lyAIP+ewIgDbXET0eD3vz88p1zROsR8PLj5TN6GxYI0?=
 =?us-ascii?Q?Q/dTxNIuI7v5Mkc+WZdPxbahtIpxS+b3Piw+PpW0h8Iwg6vAbR9n8Foad3ho?=
 =?us-ascii?Q?KyiInqd8tJ41zfSsz6CZH7rZKz3js9vZfVeCHjC4hWeZurHmEa7zzX9neGbE?=
 =?us-ascii?Q?qps8ybLhFtzGtMWgGmxLHljLMsOVxJ1ufF/tebjBirE9lajvljhoOzwowZqc?=
 =?us-ascii?Q?qNH86cyU55QKzyjBI2w7qgSRVrB8TwsLuPb10PyGdZFGLGz72Cqyd/QPl0C2?=
 =?us-ascii?Q?p7MFOzWq9+8cdn2MgIeKCDX3UMsZcSZYVNIB+H3O9zRgcyB0t85kgfPvfOlL?=
 =?us-ascii?Q?6V7+0dugbesHJhwNKsSy1n2m4fY6y0mObRA7jwh/jEbj9p9xWMUstpaja8Rf?=
 =?us-ascii?Q?r2qOlv6G0Qc59ckYR9mn/FbghQkL2f1HlgJ42RYdI0OCsVYXCGHLOi1dWE0Q?=
 =?us-ascii?Q?tJ4/WSvCXyvX0vT/RUOoMiuCkb1Mdm9t5lBYvX+Y+qJrnhM1Fk2nmeaPcJEY?=
 =?us-ascii?Q?N0Nc+US3e1Hdls3O06eqlqJPE4/abWZ7/31pUS0cSFabbYDYSYVBsIaQXuUq?=
 =?us-ascii?Q?FI8H427aJZui8Dj1UaB+6TqmxV9bvBlOWp3y0onr0J66J4mIrkFsKoyRC4Ok?=
 =?us-ascii?Q?Y7bLOBF28KGs7T0P0xMeTr4Y7RnVH4Nv98VR6IusA86OoV06oAkhNb0mYIiA?=
 =?us-ascii?Q?xLvOmXloZwtlM184dRAWbbeZgyNtl/2qvc0ZnC2kkgsQf8FoFujg7/xv/eGi?=
 =?us-ascii?Q?asnwfkuXky+/dHhAk6KH6AV316HgdHMGduge0dnxFxk9x+GBbbYw6qSMcQt0?=
 =?us-ascii?Q?jX5vpFFdiyGaGx0qUXRiJ2mEVlAnI8VfjIayBvGkhZLMGH1iN536a95JY1i4?=
 =?us-ascii?Q?hamLF4kxUAlz4tbq4M+GB7COPmOFr93j4ACpQKf0A+Ej4AVmRfcw5NpwR7dn?=
 =?us-ascii?Q?0HTZ6ASmQ/Z6foqfGKUvs/DCsfn7mBnXNO99H3zbR5WHM9WD9dHnw67Coi8n?=
 =?us-ascii?Q?nJy81+oaquwJtl/VsunkAMEuVJZIb4a4+eriQf5l0SfbTQ/JzcUaxQPwawx/?=
 =?us-ascii?Q?P0IoYdrtnPeyIFNC9qXkTXgC1XkJGMlj/I4sm25htXs45ALqw75E1Mon+6V5?=
 =?us-ascii?Q?gOJ/6uKKe9sjUnPSyELC/V0eGBereWISwfaLktFluq5r+LfqpARYsSRAzML9?=
 =?us-ascii?Q?KfESzfPqPUXYIihN1C+cIRZmTZIANcwOX8LusiZM8R8Ltfe/SXxY/YpNEq/j?=
 =?us-ascii?Q?JqDtdYDroD8lN87kf64vWkc1zVD0VR/rcgo8soR+wHdMYIa9xkbPHgUmx2k8?=
 =?us-ascii?Q?v9zSuTIfyRq4H0S0ntO311MF/f0ziHYdfEswctWk2TFxjnSIwIQbsrE+P6Ge?=
 =?us-ascii?Q?BFsRLNqdosJpkcsNm6gN8Tav5RAM2W+yhkoI30DEi0+3ZpZ79rQCEr9ioAyl?=
 =?us-ascii?Q?GIirwtzzkrOJT3a2dEut72HMabp1T2n9SuoTeMcz9P+xMv8J54Rb5+LT9ItH?=
 =?us-ascii?Q?MX8mED5avD+ke53F3YzMXKBSE+NOwVxcMdzveSkk2gxGmTAeM6tKLGcf4d69?=
 =?us-ascii?Q?wVcrnk9SQzgk98i4ze0xlA1RDl1WgLJA7gOrI36eQogzHu35Ihga/v5RiuXC?=
 =?us-ascii?Q?PX3bgwaXsb9rd0Lt6klc5p76pDt5skVakHThl0alwR6ENmb789nJRywn0/oF?=
 =?us-ascii?Q?PE7Z2talcicklC5VSbYzfcwsK4/Rh6F93sQLJ1pkqdZUviay2MrRJrtnvDns?=
 =?us-ascii?Q?U7N3TmwBIJWB41nmUhvCuv6VsSkbqjQodJDIUg87W45fCulF3yqn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb1d783-2f6b-4ed2-0ab5-08df2e1776d3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:30:42.3568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDLx+uWTxCdTf8+NQnKUwtVmXC7szK2uqVdqySkj/1bcuonb5KWto6BLdSmLxsOorWoqs0ksmP4zdu3zzvPdEvw+TSE5PXyK2Kc3wtpkRSk1nE5FOvBUDB6zhhUzwbdP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10934

On Mon, Oct 19, 2026 at 07:09:35PM +0800, joy.zou@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
