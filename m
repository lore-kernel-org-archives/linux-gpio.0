Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210845A2B4
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324415; cv=fail; b=jZe40+hcM6yRf/YOGzERMwceiz6hMDHlO+lMx75Ei1Ow9DoY+S5076p+ZKsqT/sSn2ElLODmsbczSJOv4cZyf5cN/6iXvfah3rB+Gu5QczbC+k9sMxYo88OnyheevO8/eCR3v8ivhBbw/ERj58121rDX4BbG+y70jDncMR0sEmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324415; c=relaxed/simple;
	bh=rMgT7IN7x1zHQsxf71F4E0fSFNcpJR9kru+FT0b1uns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n/YdAzPUKruExMWw94aAOadDASXfgy8gpNsQ+s5snCwzauRZUTquBmTH+k4zQDM8AZAD+5gccXJeBuKUP1IhJxYRvM0MeHtXaOD7Wqh11mgr2JYjKaFm/EaSDsLAc8M6fzL12fqzBbNYQzm8mwIvE1P85lYRdHpiYo7Jnr+PwzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oxqQxYHd; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oxqQxYHd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdEcNrP5/18ZixNkDx63Nl4wPWNPi0tLilLMrdgdpdTloq0Eo17nJh7dxyKh+pT8EQi8otVL3BxyrGs6excacVzV7N58/lWZ1hETVQDJffls51xXHS0j6Gz/3ejq7zreFWI69u6dwIoaNi16QsIYTRnU7vSf/ePRVcNLVFK6yUWqWmcRoaZ4dqjoEdRU03Isdv/Wm4XLg0eJLh3+JKAWar+MTQHV9Ie1s+FbJWnxChDPGyIMQnLSsyx+db49r+REhAmwjDHzlWAv+MAm7q4IB1PMF/uR3K6wg9MQ4h4bSaSffTGGHFZAgDd3EyNC6uDTvLLefSAm5Q62i7FNrHBdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OprH4HtsVY/lU92oB6iSztSUPttSsElEEDcfoW2P6M8=;
 b=biEwXTzpseK7LK6icm3Ez8H6oSa+0kql4Lwrw2Cj/M4/8sOq+7WEf0FIViFfaG/brsZPRXM0jeY4wu8/bZuXHc3FZteLT+hyJJ9nlfCJ8dbeBlAuOibv/nvFmQ+gTX9jL7OB2spxg+4NXFZVem3Bsb1kpMlj2CP7q/FGfMDa6WtdEjn+0pC6JPo0g8/RbdXhFtluegtDA+vXM7+JNyDTwDdBvITxqpI13VhpE9qxSOrp+srVpmPuC3DBRUmf1LQ4bBI5VjMZHF/Cg5rn6IbkcAA8oij6k25kRijqcvPh3NVtMaK+KzzRamgsHaX5yN3UtiIiK7TQ5FH/pz1CGqoqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OprH4HtsVY/lU92oB6iSztSUPttSsElEEDcfoW2P6M8=;
 b=oxqQxYHdbeaxqMKipdXeVhJuUAh2koO6+yKcs9j21UxF4Zlz9GNQM+QQ9x9AZRFnRKgcBG7OFw9uMKcF/zMZHfCVlshaBymErDWl8nW5FBgbQghN9zkioZE/ex7sM/fhcppKy5OveaJabC/zcECubMovXnyB1wXwYBGBSYkb9HAV7ls5STETOMz3okbHxObPrjEU04rpncnXlkWSCShOrvvg8ioJKkHcxt0BkRt3MfqIoIoLs8Uy2aR3ghigbG44E050ePtzfB/2Rb96ETYIxxGVLRG0jJfqfauqCUcMRHhs4AJHIabyIPoCfG6RMTkx7gDygdWN2jq3QICAt33WfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMZPR04MB897483.eurprd04.prod.outlook.com (2603:10a6:20b:7ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:00:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:00:11 +0000
Date: Fri, 21 Aug 2026 10:00:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Md Rabbani <rabbanyhmm@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: freescale: imx1: Fix device node leaks in
 imx1_pinctrl_dt_is_flat_functions()
Message-ID: <aohn8ybsXRBcbw5t@SMW015318>
References: <20260821050813.739-1-rabbanyhmm@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821050813.739-1-rabbanyhmm@gmail.com>
X-ClientProxiedBy: SA9PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:20::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMZPR04MB897483:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea978d2-4fe2-49df-a206-08deff94e5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|22082099003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	LDF436dL84PKbZ9CFId8waNzOx61Kod4p44z8HI6vR/dGxlrVaZD4vSV/UbHZom1lHNWZ+rt8LoJqV76z4WTEzZUZgpTE4LF0tb/ziqNB6LQs2fOgnM86uDGrUquH1gZBWgexixFNBFUxVB0YbcFE6jNzv/V5m6Qg6ZWm1M2ghJKCL3GAhXzUqFG1K53LZNUt3wE6vW+RbzPv69/Eo4qZURAidA6VXl88Dp8lMjbqFlcksAcJS/Ajz9aLUuFul7eFDlZzaqF1bnNO8JRrsjdsDZUoy3zKPus9zRXUzmXfxGPS2Ao/qqBy+bvFB8uWK3K1m2lw34K1NrKNZcaw/EbACYKolunyLwbmEFh5obPeKL7i7uRGmzXyV51PzFo9HqNQs2BTJ8HAITXnOxYqNhN/7vwy0ZwTJRWDdFR5FZLGPf9/1Sp2ilC6eSH0T1dbu3yXWSzgirhwMBugzIKikIaB4aFYnDZvn75Mj3S+C2HpkYwnXTIvVOkK+KxbwPIMG5Q2wgTb+YYyYzMrV19jwEKhkWoBheRxkbnO0QMI7uXTLANoTF2f5WZ9jQRoxoWzlga+zrfQN+mN6tgacNsB1weTfW/a2/MIy+NO86zok8QQZEDnc8oUw+Jz+gRBBFhhkIQa96KMrOARRzQJ6xYnmhErQ5F2x1jij8elGA6ARcQmlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tgeSr48bwXxvzQ1tL9iN+YBHFvIt6BAiIGulg6XRqzGbn76o53mb+BzQq0Kd?=
 =?us-ascii?Q?ITMX2F+vZkmAWaYTPr+0YwzmG2mpQrKYsoJmG11ivB4zuA5A374NSwwY5fme?=
 =?us-ascii?Q?5B3OUyxMY7fEOvNWpuKeHGdf5vL8s4fmC/no88jeC9XtIU0bp4EHuG1Od8mI?=
 =?us-ascii?Q?1omr2ITPLjXfdZ6pQWDOwQZaQMX+T9P+NI+oXYIdJdXNYTIT3sz8zOdxzNKn?=
 =?us-ascii?Q?G1zohxBqIF+d0rV9Gk8IE9WaFoWmH0bQ0+bO6saL4CFpIpESp9X2kWc7RZbx?=
 =?us-ascii?Q?DpeCZe/MpQ+oDK5GNtYjZ/FFXaATpNNPlUVus46Vc7XP95bLj/nzJvZzFD6E?=
 =?us-ascii?Q?fU2j5SmR6VFwqGS0GepWgSVkM1r51YCh0ChFVlOEUMThSdtw/1gTY74oOlhX?=
 =?us-ascii?Q?UFDL7WqZMpXkJe/W1Q+Foh/A+5COFZWejcAF6sPOt+VWks3wnHLcaV3qbDhR?=
 =?us-ascii?Q?TOZne07AZhkyyMbWW1lIXW5T5VqjFEQDTOpBrGCYZ6Z21JremWlzyMgLHDbG?=
 =?us-ascii?Q?/efMcGa9NFuHAldTxQdnh2zVk8EiiESIyMAr3ka/a5Kd307eN83S8MY3ynHQ?=
 =?us-ascii?Q?dPMo/dQnXqsmNoi66jZxbyuCY0k5JJWbVPiNZr1NGztexaWO0X8S7QoBcymz?=
 =?us-ascii?Q?hMiWH52mIp3M1IwA6dKiH4o0YRdBpAigkiJHb29NON+64rOyAd42F0ubkDQa?=
 =?us-ascii?Q?mA+DvH+m5TjS2Uk/EwxqGWiXYM9fJyjFR/oS9Ob0odNlI2zIZmBDln0chEzd?=
 =?us-ascii?Q?ThV323/9dsOi8FF04FnJCLTkhjKBj9oZ4DI2ttAsCAPeDnCIAktGi31ytcQ6?=
 =?us-ascii?Q?wP1DHK/OqrdpYfRvMbqa0zt1mMWxXD7BYX6z6oxpBGoDvY9+DkBDx955NN64?=
 =?us-ascii?Q?zE82H6kkENHzWZFDFxhSxLfAViDVXPTdsfSBb7zXygTyRa6wZPHrWMeN+IVJ?=
 =?us-ascii?Q?yMd67B+pRrlMT+nug6nSF7KTK4tmxGSdppsWcBuiheVCzxmpKF6mb5ArlzQf?=
 =?us-ascii?Q?ppiPnCAD3SevuJNP5DSWXNjpc1W9tc1mIHntXtUCP7Db9Otkzqtz0J+e3XT3?=
 =?us-ascii?Q?7E4AxD4A96R4BRWTkMfjP+eCE6KXPogJKb/Bi4ORQrTNrFAvP5QZLym37wwE?=
 =?us-ascii?Q?oUXCF90NrJJiEdy3+w2VcoHFes7JdUv/jvNFzwrpuAGsFvrFK1Y9Xgyc9Ui5?=
 =?us-ascii?Q?8+lYvoavG1ZJIZuOTgUTfYtN01hkdUCaH730fEwzl612e7ga4z4R+LXC2xwE?=
 =?us-ascii?Q?2Bv/0wPoHKQZeaaMOXmWG8sWwJxZjEgK6bbih3OpktYPQ2I2SyVMSbOsoZ/j?=
 =?us-ascii?Q?15pzoHrDlQomHQiqMtljN1gFO/G9n9Enp2zBW0w78OhX49+GPEM9pY0Bw1kg?=
 =?us-ascii?Q?1qhkmLnXR1O1dBULqmITvp0lWFpRqEuleTq6IUrLo43nR8mnljPWVQxarkHQ?=
 =?us-ascii?Q?4GYUjkrX5So5+eHh+iHG2QGUxUTAc51srg2f9vDKRCa5CPPW/Yv3fPGJTPxR?=
 =?us-ascii?Q?OV+At7JQRPo8U1FK+rOGJtQuzJB4MWzI9V6g8qSYVOoAtKIqF43h0DIUwlDI?=
 =?us-ascii?Q?WOYs9xOgSPL8lQstgK3iNNxtabzMvE7T3Wua3Kvj1Gm+OLt3ZKd7yUV6lSm/?=
 =?us-ascii?Q?OQAq+4DNaxn/2e3J1pnoTZKyhEpnIOpCq+hdVNIeOe37Kco6NL8ZKDpJmfpC?=
 =?us-ascii?Q?Gf4o/7u3ZH8sOUAzWqeOytLzta5QISnsJBNP4ClfyvpvpEveaRceV62rdF2T?=
 =?us-ascii?Q?GhWc8NWwmB8lyee4NyGU5LmwU7C9HguBV4S/8H9iJx79/n5hTxou?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea978d2-4fe2-49df-a206-08deff94e5df
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:00:11.3997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RP3auwNZpLmWSE5Hh77sxrQrfLqxyI0hHUs/pg7nXEmXatNtoHmp05z/UaASOoOuX0B2f0DcmOiLCVJsUOahE7ciuADusNP0MTolpHpzHC9kVZ7sA4DpDrgOg6zRYCqd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB897483

On Fri, Aug 21, 2026 at 11:08:13AM +0600, Md Rabbani wrote:
> [You don't often get email from rabbanyhmm@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> imx1_pinctrl_dt_is_flat_functions() uses for_each_child_of_node() to
> iterate over child and grandchild nodes. When the function returns
> early upon finding an "fsl,pins" property, it does not release the
> acquired device_node references, leaking their reference counts.
>
> Switch to for_each_child_of_node_scoped() to automatically drop the
> node references on early return and loop exit, matching the pattern used
> in pinctrl-imx.c and elsewhere in this driver.
>
> Signed-off-by: Md Rabbani <rabbanyhmm@gmail.com>
> ---

Manush Prajwal already post the same patch

https://lore.kernel.org/imx/20260814190527.969-1-manushprajwal555@gmail.com/

Frank
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b7bd4ef9c0..4a6bdaefa4 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
>   */
>  static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
>  {
> -       struct device_node *function_np;
> -       struct device_node *pinctrl_np;
> -
> -       for_each_child_of_node(np, function_np) {
> +       for_each_child_of_node_scoped(np, function_np) {
>                 if (of_property_present(function_np, "fsl,pins"))
>                         return true;
>
> -               for_each_child_of_node(function_np, pinctrl_np) {
> +               for_each_child_of_node_scoped(function_np, pinctrl_np) {
>                         if (of_property_present(pinctrl_np, "fsl,pins"))
>                                 return false;
>                 }
> --
> 2.55.0.windows.3
>
>
