Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC039B4A3;
	Mon, 14 Sep 2026 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413445; cv=fail; b=h078MBFT3aa1qhil2/tRdYs1l66o0mAG9D3/MJWJCjEfUFZt4Js5esU6KRi4dBBDo8dyJbO1soFgCsvViP8yAAvXIALkSlyq6Ok8Px30426XCIz1ZlckcdBx14jNzlUQ265RRtfcEql7XaZd5VHV4b0gT265+sRc0QpSs2A/YEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413445; c=relaxed/simple;
	bh=7FgIvF9vUtjEmTzIe26yvPKKXlg5HuMm8skOeLT9E6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=neHnwkJnEN1qvvd/A1QicFvFhIZj68uY646xuUftG+oHb4lv9cXUtsuq4KjMI7KG2ZXvoQ1Ir/YLIfcUOgRUgVydZspkUK+PlFkdIvTal+qHEODs6vHosmRc6Hznv1+ERl49EO3PA5IRnob4zDzQRvWQnKmDOE9ogd1geydQ5Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lNnEhj0f; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lNnEhj0f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq+cqOb/N5HGGua42Dm/hTram9R+BKh8C9tNnJOcY4XH9/2TWja/v7q4IdA2g21eH8zOmm3MdkG0TELpOjiLIJ47kUUZiPksX4fJszXZC9Sdbr2It6FYvYBU+bbb46JwYEimRkvzaUlw3xK4G6jqfUBR/DCJDIxZsuWKhMY7LwwhPUcGByoL3gHy9udUIsVui3/dH468DLzd3R8d+jsCQO9cjQVENlVmkr/PIktZ+NsXSpNifYAaGSHOoqqH0YUB6er/qjAHqN0ycPKn501+xgw6eFKMcKccbY6+A/ZyZnXI4z000kBK9WT6FXQYASjpBUDWaB8MGhgG1xoDIUixsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWcbkrBpC3i7y5eb9+geUVmt0XtYih6EsRAFP6DY7qY=;
 b=cqNvu21GFcUvcF+36XEJKbOJGkKVr5mWq1l9hOIYoEif1YSmCBOLh1Vh4o6n3PaUB6LI4ybGWk4DQXhxqoGfyEZlMB1S1zA5rZkouGNzXRI9518Fq6L030M6149MrrR9gg5JOqcWQHOA8SnL6DJs0HN69Jizh/Xpi6HmTdOt0lmfIz62VWTtSOLF78H2P+dmalm7zxONsUdinbw0ok4klW1DOEZB//jylU4EFnN/yndNBC9EoPUcusbHepZM/1UfX7cgKt4grjI13BnrgHxOgHRxDCIHsqNOC3Y2DJ91Uu3vk5fx4sl512kvfZehkJdjFNDv6eXR0UWCxzc3VMMiDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWcbkrBpC3i7y5eb9+geUVmt0XtYih6EsRAFP6DY7qY=;
 b=lNnEhj0fhJyhO6VD/esez+xjcChKUS0ctbkkSEI/e5n8bAmnVVRIoM3Hs09qBtYZsN7Si6k8jgNp1RaTltNTV0keuAqc04ps1U2spbvpO0tcZCek3Fk/xGj0zh9ThHKM71dlv7aCuNR92Ho2DsqfxiI7s275aBxmTUYL/OJAQUspEDJZIB5T4dEkUCOdLR+cBVV0XP4gHMkcmzTwDSyUD4cLkqPxHbhp8K/z2hIR/CKUcaOVv0XcUMTZK8IuPsOGM0qN+sKIgQCCgF0vz08XQ2heKhYf225TI6XxFWAyfZ7Lsq15KVuHt0T4gdTajXq7XQe0gcI5PbsjHL5yEaZCLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9377.eurprd04.prod.outlook.com (2603:10a6:10:36b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 19:17:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:17:16 +0000
Date: Mon, 14 Sep 2026 15:17:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
Message-ID: <aqhINQYbMWBDaIdJ@lizhi-Precision-Tower-5810>
References: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
X-ClientProxiedBy: CYZPR14CA0040.namprd14.prod.outlook.com
 (2603:10b6:930:a0::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d0a876-bf7e-41aa-b57e-08df1294ca0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bCEdT7klGYEZN2Mk6PG6eME5J8RLVGcv5dDzOj2qHQ9tVvsoimzt2kT70j0ZQGzsHJkvvWdLJdG7vIJDbKE8y++nfwM6+dr5o+wC2eUWZObjYg0SfoPahmnjgYc88GLMvMNnGOoEitA97BVKLe4ufLRenk2bJtvNbFAPxNdw60ACatQRnKa9b79ib5y2hYM825H+nA9j/S1lfR6tVP9szmisU2Y2obKmVLzyo/U8hjnYhY+9gW3pkS1o1QOYuWntfzcsY6Lfp/WZyNLFGvBhhfKFRAgwEnFek3e1sEHpgDtuD949eixyK2GeeiijffoiNdhquVgft8IcR+fb7p8NCLekDbb7aAQbIRuG1zNsww/SjW/4EuG4zNKVsV3FxAOtL5fM9wTsxRBZuAQWkc3BYtAeEYWTIjuuJkyNCqkGGYEQU5YdPTmS+608LJ8BBVEboDak70tT43n3GuWVWrjkVXfsaTQVX+uASgJ+qmTUNOIgWTChDn4rUXjmd/iJAE8F5PSokM43MczBtoZn4YFaEIAgb/IDcQPIUAtkXJFkBVh53/2j/sQEenJrHujWJcjb00h+PhhqP7vO+ZuStT+IZNGOLzGgs8NoFz1jTCHUfYhnE8KI1XanIeRkwqh8Ic9Axg2ydTcsWdY26ev73nil+G3NjzgZP38E2t2ACdGyEIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fycpyXr5+sSxikshfSsrIAnqyvscBO49+QGpHsAKwypQ1/Dg2TAPksK5+Yhd?=
 =?us-ascii?Q?JtPm0oYRTMEwoD43k2orb+7821iJ+Qb4Ek4c6qjp2p+NtbpOkgqzFwExQtn/?=
 =?us-ascii?Q?AfNQbxdpGGELyWtsPk6zPNe0IGvXskQlYrEQtld895QuKJXLvXD1mUYtVaet?=
 =?us-ascii?Q?Drf7jRIlb5oL7j494sP0pEjgtV/9Ich24oKWzF9VomrD3sIs0GCEopSu+kUX?=
 =?us-ascii?Q?yp/Sof4s3sfUOiNYOAHp2kZ6QjuUuPsi8ZLI3OmqbIYOmHqsh4qYXbvHAy2D?=
 =?us-ascii?Q?Tq4oFYEX2W9QcY75g5cJdYVc0SE5JfvTLogV3sBJ0cYGVrrbRs7vpeg0qT2l?=
 =?us-ascii?Q?xFhr2GtDJlOfR0cquEkiJJZaKY9mnooHgj0QNnqXfDWJcikKjJppoVJdRbWK?=
 =?us-ascii?Q?mDb1jhS2wMz8z+y1AYV0+yvLy/DmwMpKffQ1E/mtjdR4g5Xos/KrfOJ3LsKb?=
 =?us-ascii?Q?nhdwPFwH53aifkqvflUonuzLTopVoxKpWUfXk/TKmcfmQQO/kBnUa1GJ30xC?=
 =?us-ascii?Q?snd1RCmCUaZ5zAotWj5FvjEYvnVNBXecrY3K/WfBBH9hc2LsMU0duHIvHpTf?=
 =?us-ascii?Q?Kyv4MfeGK+/lPCraqRSVP0Il2Wh0hv6wTSyRDYy5kvEjgxe4YNHjR6hI/DSt?=
 =?us-ascii?Q?M4QXwyPJauxHf8wLm5FpP1Y1Ngy6gaF2SGTzI/PuG4H0zSoir7gIJ+XKRN3d?=
 =?us-ascii?Q?AVlPXSNEzcPfzwjM+p/gK1SiCe2f1JS9FWFDEsKlRyfH/74YYbKMWF8WWzX6?=
 =?us-ascii?Q?wSCZ5yPpMJXJx/niv6ELXa6fkjmeIfk2+6Ywpbx7/e7/QFi8v7ABhQfEnI+1?=
 =?us-ascii?Q?Qnb2JHjT1ChWWKVkXu3Wg88vc4ri3FVaPYHm3mUaOnrZpwTbbcUoEzuvA4BI?=
 =?us-ascii?Q?8mopB2hydEBhN7XGk2ntR2QVafQOpdzdaCcgPgZhbcbspsYfKWaaLedBWe94?=
 =?us-ascii?Q?IjRrhCIrSZM5tgc3/sYBLo65KGVj1J4ukp+fVlLnao+3k6/5aRLCUBmdB2Fm?=
 =?us-ascii?Q?DnN8vGIj3vfiDDplsGPW/a2ZhGSJE2z12+nV7dBp7+p6tU0DRNnBAzn8XVhd?=
 =?us-ascii?Q?rA/VghebKV/EV4/4F4vulDo0tLDoWxypHFBd80VNOjPpb+ouuJ7Jk0eJR79E?=
 =?us-ascii?Q?9oKIidHPbSpgsWHrPDKklRk84gnOMperUiBZGSJwt5aInyVcroj3Lms2KxND?=
 =?us-ascii?Q?8Eyl5Dh+pJ/cxH+h4GAlbDHs0vC3Q/AWIIi3ze0ViWydCuY8re5qWsAz3VSA?=
 =?us-ascii?Q?BayPrfRhGOtUCqB2oHO5wppgZUPc0IYEXAzrl3fTR9aXpuJexQuEcC6wPD5Q?=
 =?us-ascii?Q?QcniQ50AlJYulKZOWehSLEsfvDa8Ch+Ep6yuE3MO50bXTUv4doSOoce9/iz7?=
 =?us-ascii?Q?yrpxBHK4VuHm5B+5HmF/4ChOQycj6ezClmcqpcrl0QCWYGF6KEJxSJDrVkab?=
 =?us-ascii?Q?m9ddB5ydeRofcVxisSXxeEyRPPmvLcHWytbapjkz3/07gqcGF2ceIco37bsF?=
 =?us-ascii?Q?uRrs7B1exkYodgHPhwY71/1AH9dUwCkMDCHQCFCSmmOMItodUg4T0i8ezjLO?=
 =?us-ascii?Q?5/FA0lP1OX3xO6hd9nNSmnqv3ysUJemwI4OZl3AkdVLW7KVsCugucrOfZp47?=
 =?us-ascii?Q?AKflU94MeIgDHbAsni9+OaGhJMbLPU/pYbq7LmNfIxr5E0MOGYGf6YkVe8Q+?=
 =?us-ascii?Q?0TI9rNBvo7ncUt5oDvmVMizcXwjw/jQNDuL18fkMl6XhSepI0U7m/tQ9R9DB?=
 =?us-ascii?Q?ewqgUF9eLjvFSQUkKixIRQEawjGepQFkYYUmk9zFucknkFe9a9Bi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d0a876-bf7e-41aa-b57e-08df1294ca0c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:17:16.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJISfkV9uZo6Fn84OKbps2mOj0BYdyg3WwisQbhGcNy5bBq3bJKXnabEQv85r/kePk5102QvGghW2QmSdtXC8shEvZfBQqvW4/qMzW/dqkZed6eJxSfdS5PHm5aRdhR4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377

On Mon, Sep 07, 2026 at 04:50:34PM +0200, Bartosz Golaszewski wrote:
> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/Kconfig           | 1 +
>  arch/arm64/Kconfig.platforms | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index bd0b4aeceb218f4085978af9421c97e5c7cea94a..b6fcf6c6a6089e26da08a7efb7eba9422f96edc4 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -195,6 +195,7 @@ config ARM64
>  		if DYNAMIC_FTRACE_WITH_ARGS
>  	select HAVE_SAMPLE_FTRACE_DIRECT
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
> +	select HAVE_SHARED_GPIOS
>  	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	select HAVE_GUP_FAST
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 76a6a0e6ae4f1ed496cea090fd73398ed525e732..74c03cb2f9bc84716fbc9d186a38f4646f0f295a 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -37,7 +37,6 @@ config ARCH_APPLE
>  	bool "Apple Silicon SoC family"
>  	select APPLE_AIC
>  	select APPLE_PMGR_PWRSTATE if PM
> -	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for Apple's in-house ARM SoC family, such
>  	  as the Apple M1.
> @@ -329,7 +328,6 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> -	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
>
>
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> change-id: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
