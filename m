Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F938736E;
	Fri, 24 Jul 2026 18:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918820; cv=fail; b=dqSUoVozWDdv5DDH9rc35YdNo2uxJuLgQJYVYeVLVexh5OqSy3/yRQ8R6S5HCxjHkZE60V8jDY158HUMYKMlkoCWJ3O0ovlI5bc1p4dXJA0Paak/0aaVFn+gpEflw0lrtd0x0X7lrjPaDDT71caA58GtA9rLVgHzyz3gWPBfGWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918820; c=relaxed/simple;
	bh=pvpdr0ElBe4Xtf1Ny8AmqvVzWC8iO2Ekr1p3iOUrbV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r7py/EZI0INc5ay0aE/XMFQDqDOS5Kw3IfaBB2c9z77IzQbdL4Y36yVTgaXQlnaRzfnZVQbxytcohtJKQXbgCeM2nChBCvqGh6Tg2hw7pmEyNdIb5Y5DFSwBzcmpOvQx9zWfWWsZ0c3VQ/8TgjNOW39B0APm33H8KBfsu82/88o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VwbNf5/Z; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VwbNf5/Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4TmLa+6whDGgPicBn6huPgTNYvnkmSNVjb02ggVEUkVmch2gyh5hVbVl+nh+vMpE92TTmMcBWtpS5nF8wn74tZ8EQrcdMNC6wVqJusfEiSG7HA92x36iORUmw91aZzSoJaEcVa/9qK3gbdAauRdJloTAJ5plSEP0npRAwKDko08tHQzS30og6J9t2McoK8EvVOGuhvH+p3Sz/xIfc5zfkZggbDOfVe6pdCjNtpciVo2Z88kCK7hOCiElxNWzlER12RF76iRMiUUzunPEiNtymjaPniSb2Vno6sDu/WR6QqMX16QK31kYzJ5jM1OesxVskOvSSB61IJ4EPq5mWFg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR0D2tlpCuIZGlT7XHS5ABzK8eiDZaDqbm3dl0eZmvc=;
 b=ijRVtqYv9an8qZ0edbwYaiRz+vY3Bdz/O0sZvEX6avta+trJ5i6tNMST1wgouBROmaAI1i8dvNhfrFVc58+HuYYgkN3/C+sc5QoeyJ2eANKKOiT72/jefAhXLg1t6xPD2QDHcbYMnDl7d13I1PQ1QD+ExGwlHAYwxELdCMO8pgfeAB2BOibdWpce1dV3+dJpJxRGIoj1k92mnJ7cuoTGTwo/GaSdcGH/N2OiaBdPUotGa5uz/NBS9hccgHrwDC8OxROxJD6KAm2lCNmNYpHzUBd9/ObYZii3O8A1lmbQkspVRGngEuDtlR9cwF4rSAtjtR7ejPlQrgPOiFRuIWSU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR0D2tlpCuIZGlT7XHS5ABzK8eiDZaDqbm3dl0eZmvc=;
 b=VwbNf5/ZrJQrh6EUA11UVFYcoQVJGVIaj+OehA8xhMYtIAXKFK+7F7X09rB9Ve7cuohllcDwftjf0IURrSpudZRZyIakPcoW0ahRSlcv3u0JEQLrQ2z+Rzs/ChGOizNTChCfhxycy/GD691MhgfFNrb50FfA1tU7tXQIqs93VCMsy6AMvXYidvPuumi5on3bso+YA1Xetdz7rXg8X6Mxu+IrQfcJ9OhGV+cInDsQibBtAaIhKHtp3dq35SDCYgnM0e66ZF5XKRd7PYpSQwVMe/WWC0TL0KeK5td2NV6mC5ni6+ZRdrb0PiheOaRxCBzVcTA4q5fhVeJwTZtdWeQjiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 18:46:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:46:54 +0000
Date: Fri, 24 Jul 2026 14:46:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: kr494167@gmail.com
Cc: linusw@kernel.org, Frank.Li@nxp.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: generic-mux: free maps on
 pinctrl_generic_to_map() failure
Message-ID: <amOzF3h0ujw8x5ST@lizhi-Precision-Tower-5810>
References: <20260723063011.27145-1-kr494167@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723063011.27145-1-kr494167@gmail.com>
X-ClientProxiedBy: PH8P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f282d0-5b7e-4f28-705d-08dee9b3eeb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LGe+LdFrnMEvbUg84vNOhg9UfLmDCMnwlX7IqWDWxr0OZenlvriO/KZBHrHLK4t3Qhs61+t9vj4HSpF+C01ryc4S/vRswp4EPubXlLR7EvTsjvFTCT1RY9gDeRB65yZT3UFHcp34dRwAE2zrxt7CAC9VpMZ3kMmItBiZME1XY+M3sIWGBIO8cGzdlHrnoPggumXvs/pyoV8RQy/MKlRAp9tZoCa0Ol8X470QkY2AGhjM4kB34UhRYoJCroutuTCXpnIzmO5x0iTnM6WASLSBTEuhVAWzAX4GjwqgiG3GbhCPROx5EZyWU8goLSuJCD13q+RI1lOxTibX289SQqo0wvsmkJxkMNS9yPxAoFtimVyoOVmSDxhgAMgcOvKzn3gV6SEESlGFEWMPOiRMq7h4ocpIQjUvT+3xl1A4HbWRgk05s0UI2M5uiuJjIB2wc46SQJ+hSTB6cJKzmR+LERHThRbhNGxizNfmo4t/lncIfXeteWAx+0b1C/sW5GM9uOqUR/u8IQiobl623004qH080EK1A+iE+Ehbb+OpzdB/y5SIaY8ZqczPQlvjMXZdtRHA1U/RRyyZCtKWutUK1fTp+IbBeH1PRLenIPMzsV9ir4JrXUqOErMEtehV7LwE4o0iOOgrsV05yWswKO4HqZ/4S0KuEy9YIObHvmMaXYFj3do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z3WkycXr/RaZtcnKNtWYJ4y7uQzgHZSBKYtledvkw5FqZiDVYpASghXpD0Pg?=
 =?us-ascii?Q?1ED+/9vliO1P4EG6BIALndZv5nWAcdymGRlWrVXB4Kg5rUEWxdaCUkwIIfe4?=
 =?us-ascii?Q?P3ZZB2ivv6yT6KI8cOzCTPOUavSXyqP+XX6Ue7AygWFW9DdRO8Np32y7IGqQ?=
 =?us-ascii?Q?KetVOdOIhnYFtIhuuAvffsuNtVpu4KDszL0JrDEVp/66D1t1zLrmPHuJBVMc?=
 =?us-ascii?Q?sUIgqTpJZs180KzXOKmKUH85KElPTPUy+F0CbFK1JiTUXN/ILri5gxB6KyJC?=
 =?us-ascii?Q?Qmc2wp9X1P9wl+sEYyH6gZ0egQbDfqqbXwXSXc7Hr5pG3iSGNDytPXvo+xDF?=
 =?us-ascii?Q?BHp8XqIXC/VTz6xSix7n2l53a3ympmf/+grGE1OP8PspnWF2OKu7VwWlhdMe?=
 =?us-ascii?Q?BPdWlsMhNIO59w2OUG38mnMUP2zP6Ke/D6OgnrqhBSlcjkUy5eRXMuDhwQ2H?=
 =?us-ascii?Q?7m5GKJAqpl0lbffKtDNDEW/VsdajtWmjD/JVbRg+lYKKDewpcj+8kr7pJiqu?=
 =?us-ascii?Q?3Kkiw5zAbnGW31MjZdNVaG4aDuxiomspKowbkMl14FKYopAjQfPExAGCiS6x?=
 =?us-ascii?Q?qdJcUJCFYmyOanTrD0qr5IFA+HJubdp6dJ7bZLRf5mNkFyZ7JOE+HHQN8kJi?=
 =?us-ascii?Q?S7toTbUOz/b1SP0cd8Q1tXM6E4qVVc7Ql831wymThyr//FHAABd3FUBP1IAr?=
 =?us-ascii?Q?FKJE0TIVhk3xfrQkW8vw5oIycpDn7/Y6SV+kTA+ov/LEBUga584terwdIysR?=
 =?us-ascii?Q?XM23INPNa1OM6bFA5Xy+sRoHkQCAbQf4Xg/K2CP9a/p6y2ZWmOjg0qOUqX41?=
 =?us-ascii?Q?JfeZjRYPUeBwT2dIMmaPzWmS3pjO1GRNrBwSj2aa9ANCenbxjLi8XOCX83X4?=
 =?us-ascii?Q?4yCnCgqbBFmTJGcpUc4wzPZy5woHWSwl7MAnsHdvgz17OJon4XjdYeX+XZBS?=
 =?us-ascii?Q?NPweddEQaX/RyYE0b+AbBUYfNRqilI2FDToj6mkHb3h7BDXXMSKTZdbFkigm?=
 =?us-ascii?Q?S+JTJE2hqYfYgmPYGD99lAFufEm2tQO+SZgY8uQRpGGiAcoib35mlJ4VN718?=
 =?us-ascii?Q?ZEuITtff8amVQmf28yMUjLik5IDg1pwyHnxvk1jNc6M2ppo1N86Zm8KZ0068?=
 =?us-ascii?Q?ESQx/P9j3urNlzN4rlPbkAksBg72njB7PpgWWwEheYRFhVod6Iws16wLimDh?=
 =?us-ascii?Q?o2wtJIDygPhrav7DbTuJZ7bzXIdz9yEsJHU19dNePwQB1+v9h/T3ad+KTS9/?=
 =?us-ascii?Q?efMAO/TH1SH7uBPvMIkBRKRuTp0rJQpOMY7AHGTdQLmCkbFj7OgrxadbQmaV?=
 =?us-ascii?Q?XLLm42Ih00mKKUPkFvAyFJNtVAKqN70yoCUYJGZE06Hn6lZBGCpCBM0ZPpmc?=
 =?us-ascii?Q?9t9Wa8lxxMVmWeptoYxc36F/G0EcTME7rrvDx8KYn+PLqyrcHEMa390d5Qi2?=
 =?us-ascii?Q?9Ys/QdsPBSCiV0bLg8lk3SZlnU4N6lHxSeOv11D9yKizs386Jng/Y7jX4ApN?=
 =?us-ascii?Q?QU4oTslTJn3SuSZT3+PL2A3OxSJxQTrFYze9altsDObHwMfV3BsmQxEMS/AI?=
 =?us-ascii?Q?MvO8OLM+28klNxzWrR1lONR9SVUoPuNnfahPHiEAORVjpjUNa3hTamK78YCU?=
 =?us-ascii?Q?uALRxX2olAAuXMChZq7XCBif7G9wIghkPvPaaFeKtF8kf8BkIMZ/2iCP/9yx?=
 =?us-ascii?Q?7vD00aD3iOTC2IH6632tmW1YVSaW10SvPCiuoO9WQkdXt35JXCrdI/SsibcN?=
 =?us-ascii?Q?UTKeAb0j3Qdupj7su/E2R1CbdvC+zqPOV2KaBaNOvl/QBbWlyrko?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f282d0-5b7e-4f28-705d-08dee9b3eeb0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:46:54.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dN4UHd9FPR5ci4I9AjxmL2ge6S9OSSeUC6OGYLF2EiAyZzbC6EBxoYMY8OUnYRzozR6ZHR/iCIfRhP+jYt/frOU80a+bFnW+chscs5GagtsZRefdyQaE0DrINta55Ey
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897

On Thu, Jul 23, 2026 at 12:00:11PM +0530, kr494167@gmail.com wrote:
> From: Surendra Singh Chouhan <kr494167@gmail.com>
>
> mux_pinmux_dt_node_to_map() calls pinctrl_generic_to_map() to parse DT
> configuration and allocate pinctrl maps.
>
> If pinctrl_generic_to_map() returns an error, *maps may contain partial
> map entries allocated by pinctrl_utils_reserve_map(). Returning the error
> directly without calling pinctrl_utils_free_map() leaks the allocated
> mapping memory.

Fix pinctrl_generic_to_map(), which should cleanup memory before return
failure.

Frank

>
> Fix this by calling pinctrl_utils_free_map() when pinctrl_generic_to_map()
> fails.
>
> Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver using mux framework")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-generic-mux.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> index da5a5ec01583..927c7aa616f5 100644
> --- a/drivers/pinctrl/pinctrl-generic-mux.c
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -58,8 +58,10 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				     num_maps, &num_reserved_maps, group_names,
>  				     0, &np_config->name, NULL, 0);
>
> -	if (ret)
> +	if (ret) {
> +		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
>  		return ret;
> +	}
>
>  	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
>  					  1, function);
> --
> 2.55.0
>
