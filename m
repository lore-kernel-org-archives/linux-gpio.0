Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793110470;
	b=bAYXsqFeVEnnMEYE+2GmRn+nNOy3qrg73DpTno/CjCIGZGv4vrQYp1pOL8Tr1HzWPBQF
	 iY6yrICiQSpbI7Czdz1Wyg8JE02svrQQ5J7+ulNQjd8Q6opVm41LfhCGKpTG3Kr9RO/De
	 lnPaRpNuXRMK4xxhfjrJOpkpAkNAz5UqvK0xORznAC27cLGsWW+R5BgPvwUa0Pzwj0bFV
	 C1sS1jo5WZfUMVPBLsMBZCAMll0/UI+C79QMH9WnBYfYe8WYfqY1zwd/8xPkeAAyJW2vo
	 p3EshzamLKqi6JUTVIA6zfDjnWamZuLAL+2vey8yM829EQDZAmM+VQ3N0iarOYc5D/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110470;
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
	bh=dusm5IG5lvbGIAYoWTrr0Wl3tC0rJ3hUUsS5Lou2YuM=;
	b=hsqzv+GG6pzWn0YKl+FOmJxaEpl5Q/weurVhkdRewey5pLZKuDI8LEickYojH8aMG3+y
	 xf7hiID+e+Q4NxNlyy5A7Y7Z0te34lAsQqjpQkL3da2uR/dpR5iB69TzDacFC+by9m0pC
	 63wKQdAWig3/qt2l45GaJx4rQ+LXTWZCvRznnVuy68LsF1cIO1pwbjwrBbxRp+hr0y4Is
	 ZUGCRSG3iHs0qr4TqB36xLAKwBj+ZpzeqmOs7viAjI1MRdNqFmUXeI0Ah9jaVuGaedF7h
	 92F9H/iAqPqrfYpE0CCj/mo2T4T3KvIHbGW/cZJkK5/oAhZ5D88xmxn3t150HjzK1OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ti6iT7rL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.16
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A892606A31E;
	Tue, 27 Oct 2026 14:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A892606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ti6iT7rL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUv4p/UyDwjpvVARL36f9bphzQitEzIaeMKlC+VQEx3yGv1bjfU6gTCoMmq0iW75O0sP58jUEhsskZZbEsLgS82V2uMILCca7i14v7wYfdWAlyG93wtctH5I0LO9wZU5yUgG10RRwas48dv6LSHS6NxzHnK6p01gzYklIhmU+bFhTMPVfVcvFI/ZuxmyikDpaycxWIXBYqflw7yeU1646FozsE1CWfiCg9fPsqdlbSOYnVZ5oJfoVKY3B9wAm95ewN/EWq/XXXe+5gxbUs8G2+Acgq6OPPEi1+XbGCmSqdJQsOkQHHUjqxteke2TF+zyi/0llIdACoeIQrCm03IsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dusm5IG5lvbGIAYoWTrr0Wl3tC0rJ3hUUsS5Lou2YuM=;
 b=qnHBCP/svQeQ2w8PUSQSBcg30vK7AzGq/tjGz6hxHQmAbMcroJ0AB5/9Ghsm/Dpg8+Dd2qh8ykjeLhZAZoyrnuSqBwnKYfA388MCr+7/ohRY0jK/urUKKD2dptT05vH9tEqMdOI4q5QG5Vg9lQCn+uph2LR+DOWCEyH4LI6/Dp0JP36bWsy+2PIqp6URO6Gh8koPDul7aWUKfpvSO9qh+EnVhXQGMK9BuyorV88D3GCFvcBbAihWRaRzzwrClHztMqiTQkGOqfblKYWbEth/asPugBdWqcgG20ihkEmnOzifuEPtgTi9yV24MZ7GbLP1Sm1rY2IVN6uEfks7Jkmcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dusm5IG5lvbGIAYoWTrr0Wl3tC0rJ3hUUsS5Lou2YuM=;
 b=Ti6iT7rLzpsEMuOArtYP/SDYorhXxEUuMgrVhdAGBlB8LJvF3XXOAst99IVnDg4Etz2W4nrGE2j6UvFFay6zzPWTaIRGqXsl+3mtAQA9VeUReFXJD+ERmI3RXV01H/D+FtSPGq6x1uy8Xod0Qgg2RcbpEFl7+YnmAljCvTy2ZrcGaIRwEpgOVhkulfnfYQYFrSDXbKbaEmZNiAW96iNlNM8YDaex520LISPrq+6nQtBVvVtGePKTQZ0yEj6/NZAz162B45OkKQiiO8c5uZGNAwBYI0uIbH72oeKnYn//f8dGeCOvkqVbzx0W7yiSz6U1qgW43CXp21UJiX4rFWrZwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAWPR04MB11673.eurprd04.prod.outlook.com (2603:10a6:102:512::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:14:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:14:20 +0000
Date: Tue, 27 Oct 2026 09:14:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 12/12] MAINTAINERS: Add an entry for gpio-mxc
Message-ID: <auCxs-ADoIE63d-J@SMW015318>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-12-7b602d70c149@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-12-7b602d70c149@nxp.com>
X-ClientProxiedBy: PH3PEPF000040A6.namprd05.prod.outlook.com
 (2603:10b6:518:1::55) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAWPR04MB11673:EE_
X-MS-Office365-Filtering-Correlation-Id: 25aca49f-19f3-4899-7539-08df343497c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|261009223027099003|261021121427099003|261022105027099003|10067099003|56012099006|261026140227099003|6133799003|18002099003|22082099003|261026121527099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	NxvUVQKHKrpVvp8eV96xx2CNKz/OpsWIO0XXIto8BUMlMiesRQd5RQS/xMezBQAWvWoPjdSvOM0c0EU+w1MZFJj9I85wDGwFuYaPJ5AKaKXQByTFFCdchH8daH1s2s6SnpLckhRUtPT1cNVYUjjXs3litHp+RBJtvZVSdwG6x7cxnV+bAPFvniRq3tjmFpMAgFkK+AlJ2SsE5fo6ZEwc0zTUK/BEvkVEldV6JsslgBIqj4rJb6bP01dWC6KAgOLcW8P2VIg/hPaw5RQMmB3oSpbY/UjDYp3Lfaw2jyZyvB+wiTRBURW4mTRr5U5md8RrafeMeUTtYnZ6qjNuyytsFwJrrWbweVaDOOA2FS0GlLD27j/QRExr2dh0hwprHa9hkdA/Biw+S6a1S5Rdm47usX8Ic38MqZFb0N+3kiFzdDSZX1mDKkUrCQialNmKLWIx/Ww6KfVp8nlkKO46krObgNugkVeO5sdak3BIzERVa79OgsQpSdE5XerxxuiSwOIjerWOe7gKJc20Dt5pW+9+FoA7Cf1yWjP8YzYL9ttxsuL9mpzLtZljMtZx7j7Z1QBdnKqS24YR2HaYKiB4lUlBPCDprkDQAn9GHID/CP1TgXNLajDYafvYsnAhZJBiHIdH3P0jxcuJzlaH4vlq27lwz995a6BVZqwPphQJYgumjdM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(261009223027099003)(261021121427099003)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(18002099003)(22082099003)(261026121527099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BQvtsvNnxZgdJwMeTFPpWQ29dD4OaSjuwhDYeeAXuG1+Rbjsh0+Lk3/epRJp?=
 =?us-ascii?Q?NsbtUeCEhXNXaFIKPDBi8FdZ3xxX/0awgagPU27J6eXNm5K8QHu6eVnR8PvB?=
 =?us-ascii?Q?YfIEC6aTZS5/iBq/ZEdhCWeweAuRNtqrE3nPSyBdDt0jZZI+L4yC7/tf+4nm?=
 =?us-ascii?Q?hvgaHv6fMNRTpXe6sO+Yu4lBrWhL0Yjd6lMwfXlRqEq92yAELeSbPTjeHpZg?=
 =?us-ascii?Q?eF/e2V9IOOXMp6Q4CUbdOrYLH9o5Pu5QOS7G0MHccQ+IRzwgW0KTxDIe3tA1?=
 =?us-ascii?Q?mpL1vWJHtc8zpLWg7s4INixjJ/sYu5fIRZoV8c7o9O7C11Djwo3x2w34vkX3?=
 =?us-ascii?Q?VIKeHOWOps5PtIT2QQLFueUYsAH6yBdwc4QWy2BrkvVQYvwrb95YWJWqK//E?=
 =?us-ascii?Q?A3NTlp5/NuPkMJrLEazy4uMu+hCYllbnp9kqpZgzXQly9z6DzkGwHjW8YsBV?=
 =?us-ascii?Q?OxPCbrKJUzt7BRD5OglK1ROSi0rANlEaTvMMIF8XjOWq2vSyA8AF2xq1Noge?=
 =?us-ascii?Q?f9o84eJk366t14UfCJT+Dt7493A5Km77c+i41GfoP71I0k19ZAWXq+CW401H?=
 =?us-ascii?Q?OCdbQEh1GSS1uwsHtjmejojLp2FiLIrFwEYPJ64mjbvCSLhyWMTnfhrlgVXh?=
 =?us-ascii?Q?o9jyxEBdZKJqXehSZGxXP+PDEiKEPnlOou/KXgmb9cLHLwdJ1ek4Lj5gd1Ee?=
 =?us-ascii?Q?bI3Y2xgyvqkBA5QijniuTYfraAMsY5NOPa5Q9QYyTanA7tIVFk5/ihXWQVqp?=
 =?us-ascii?Q?ceKcSCEJDzcB9SD3ftjgy0qrJg9cS70oBUMjIrUKfOw5nfFs97U2XW7fATXK?=
 =?us-ascii?Q?+i8HsZUylXR6+3142bByzWIYcxOIrEN4XsR3pvjs8Gt9aHbCYQW5+HFzcrFt?=
 =?us-ascii?Q?cwNQjj7aqMvtK/iQ5eBlINEEqQdecWGa5NmJN1fR3nE/dYtqZKfGdbLK4BN9?=
 =?us-ascii?Q?9IAmbLCLqQCkSpppq7cEG4R5AIKAr1WzouIPa5bAyV6aUZAfnNF3xboeI+i1?=
 =?us-ascii?Q?d3vfpr0Le6D1nqmNIDNY8WznFIC0CJWT5o+WFLGptjtOEULP38BOvkNoyHyc?=
 =?us-ascii?Q?6pvjWBVqfYN2GPVmfyO1bdiHxC9dEVJS6ke4qdWVnZn+bDUD5BZ0NRzsn4x4?=
 =?us-ascii?Q?iJfmxcC5CddyiDNfx+awb5MNYugWnSEjWC6sE9ro2GTJT0sIiQ1hr/Hizfuz?=
 =?us-ascii?Q?gKU13ANNMEh2uM4+ZahqpDPEZmmBZmlnweiC/hGePn/g0hrlP3uMb0kzSAaM?=
 =?us-ascii?Q?mo+FYpODpgh+8ITonpyvxQMtCHtJwZDuvEPdnDWRGHiMqNO2cQGPtE+AxSIa?=
 =?us-ascii?Q?hsliGVP+M4CpCGSe8uHV5+MmrWKH4z5fiPPGI2mbImkSaLRzgfOAl1I/PfnA?=
 =?us-ascii?Q?/fRPzE74Flf9xuqUSE7q1LukV3YBIJWzMQ5crPdh1QiR+t5/iRMQGy424Qmd?=
 =?us-ascii?Q?aEl2lgMzRueLmDa74HLakfYiFJQr27p4vgEY1UoIevMm12pUmu2hNcmEETE7?=
 =?us-ascii?Q?+PNmChUKYU6TJtQBGU0yEoi8uGNBi3Hiw0N7snST7Rr6quon/F0nI+jSNi6b?=
 =?us-ascii?Q?I7KHwnnmlv0lPE9Yql1PmX4kWTSyeiHD98nExIDvVTMmku9IG8KzmVfq8iry?=
 =?us-ascii?Q?P5M50HjIReLW4G+kdM9Y8sjrwIsCaHxHm16SN74Wv+fmcVKwGpbUjyqi2FP+?=
 =?us-ascii?Q?WDOlJR17gCxYTsLZqsjaWmTYybBq/NvAXdsx3qsgrsY9rqD7dZ9AfXDscX16?=
 =?us-ascii?Q?TMtQOONLII2Sg0JVeFQ2zvBkrJq515/umCWswgsa/7iiY/rQiUP/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aca49f-19f3-4899-7539-08df343497c4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:14:20.1113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAJRHKh4WShbdPvjmCGXgidFP0HfSHaROockQ3zCWBWZwS86Ak+rcvXB9HmpV9jhLQilD9anAdkhy5Eq5TN1dwyCDxpghKdLw+ESrC041SHURFe8qw6IbSKomGE9J5ca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11673

On Tue, Oct 27, 2026 at 08:09:39PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add myself as gpio-mxc maintainer
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fcff12847485..a7aa9a587496 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10738,6 +10738,14 @@ F:	drivers/perf/fsl_imx8_ddr_perf.c
>  F:	drivers/perf/fsl_imx9_ddr_perf.c
>  F:	tools/perf/pmu-events/arch/arm64/freescale/
>
> +FREESCALE IMX GPIO DRIVER
> +M:	Peng Fan <peng.fan@nxp.com>
> +L:	linux-gpio@vger.kernel.org
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> +F:	drivers/gpio/gpio-mxc.c
> +
>  FREESCALE IMX I2C DRIVER
>  M:	Oleksij Rempel <o.rempel@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>
> --
> 2.51.0
>
>
