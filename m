Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68D2D060D;
	Wed, 16 Sep 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590221; cv=fail; b=VzXM+ecJmETLzu0CGk4MWFRj+STzjHcZdmakV9Q1N8Ll/O+IeVAGKDWZtbD3UftxDIES8MANOToq03fZaoa0mE3QItqe7C+ygmiWaZR8YW8FvKl0iKIqx0qBSm9dsZfevWfWn9MDB6mVywz3HkLyFhwK3DHzS0TqiXZZVwI7Vx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590221; c=relaxed/simple;
	bh=Kf7PQBjse0FQ19HXxXuZ2pU1TO9sdVMIIkeHuwRIA+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eZnCaVdISg8Hnd/j5o40EXqeQwzpyIyCRmA3mmuqflw2aUvn0zyDKsnSNcOvGDYGCCQN75e9h1evRtCpo1VXiEvvda2+g1DEAwNwxWwkuqXZmXOC4wUziOyWd0DRBOjG1w9JMHI3W5QXF+ARfctSjSB00RKOCOHyFmbfGLoAlcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=McOhunjZ; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="McOhunjZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdK304MsAbROBBsAVHPMZeqytnATjPUwt/Jn/eb7/32DNU+0bhXZEBNbsGk/hhfMYs+KZt2q9TKbkX61+Gwg+blXBwqdhB1sP2pOZYSzs41YxGbKw5b8ZTIVVxu1Cb+cuSavL/FmFgPlwJF1mYY24pstnrT0+l7TJSRb9jnCXsEQfIZXUEFPTI3msTlLBxKK8y+w3+JPGCtWDPorgwQ7CvliVhotMhMSAFJSbfClsJ20NgbGvHgJFCFirpr+R+NzCXObr+rS+JKDP7xk3q29PfJwfT6UTvKjAXd5llVGECm0WnYYw45d62eNqVCJ3cFv+4eq3YBgmlsfYuDZt2fOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d+rDtSjJ5ACFXKzUMt0MJR6cnx/9UCZsNJp1VbfE24=;
 b=w5PuFib7hZ14DT5iCxpHHEHN5Gw+3vgPCfedi+CSWjwtjKRtVBg21XPvgzvRv3fFFvc4S0SeO2r5JnoCnOQPBpLEywLrHmoF5vFRRP/y8phstXhhElpuCOmC8in2sbO3tWL6oE9BNINBBqTDIOU6VZU882AmcUPu/dkqxcEntNMH3v7ZWYsnN0mKIvu3IU1s73uN2YWnPVuijK3E5GzXK9OAoE5P9yFlgBcPZit91eoTgT61+Oe6d3IT8qI1ZXlraR9itBd1Wfu8xCtFhVRi5XLoAHnXxE6eJln81WEGUP7B72vtmgGratrVThh44j3ULgKSKpjrV/BoxsC1S9HXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d+rDtSjJ5ACFXKzUMt0MJR6cnx/9UCZsNJp1VbfE24=;
 b=McOhunjZM6Lc/tgbxLa1SxMOSc8cC1UCwUSpkt2s+wvOi9CX+wQTlCuIVKf/TKcTcLZc8c4o9/q3x+hz9LIahB2rzX/EVXCZFt1RSjdOasTv2uj1dUhjZbyu3FbeHwVQoVOeLMZ9yjViLTRp203NoFgtJV5pz1beG/O+KJKVwHfF62j08KMCvFjXLYVyBA1kNQiDnpcXjEZp81JyEZHyPEvO8pBU1NPjqOaTrE2rE5O5nbUtMuR+642Z+VwpTQnPK0qEGUyy3hpEhqN1jsyomCXSmqQsxEusXsuQgqmaCAnjZyFKZzeECXXrdduXthQtqE7FwWTBvGRsycRRw1bAsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8935.eurprd04.prod.outlook.com (2603:10a6:10:2e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 20:23:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 20:23:30 +0000
Date: Wed, 16 Sep 2026 16:23:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: linusw@kernel.org, Frank.Li@nxp.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pinctrl-generic-mux: Fix provider resource leak
 on re-parse
Message-ID: <aqr6u62EOwjXZSSx@lizhi-Precision-Tower-5810>
References: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916030435.4089460-1-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: CY5PR16CA0020.namprd16.prod.outlook.com
 (2603:10b6:930:10::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c116bc5-fb0d-4fdf-f2d3-08df14305f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	6fomCs6GlCLpkK6342KIAoP2WnngqSBU16XoV5zRzQrs2XJqozUf9DyxVY8Zka+GDSzzDk9B1E5QlUTKMkJw3prKo1ELruC+gfwYNH6lymkWhi8My02QazLhoJrJWyoLKBuJqJ00OltfC0LS9+bOHA/UuPTURUPYdi1XOWNNjcVqMfIyqhGTwuM1B2miGoj3mwXyb4b5A4LXDltpScqLhclBCpTnZXfvs43SDbkO36UEmHek852ScucJe3dEwxzW4g95HGpvTbw4kloL4vN6ifrqQ195GfurgF1TLtFMXoDXnFuOOsPCym3emR4ybJW1Lya2xZefuCzpDSKwzQtf8lXYf4AAl1CUS2a7zgd+xze+k+81WCn/xUaA8wewuru8Bbtg8Am7F1379YWim1Ro5ggt7aT2z0wgrRWi6i2sBSJiJ36VC96S8xqYC0UfxpKXV1GnJ+ChnQtZEa+p1X6tYzFN8n5YCSpe565Ela5ceBTRzPnv+DokYdoKe0ZWHVIdQ6tpgse0MaXgE3M85INs8EjomLVNwkG5Q4fmBN/95zlV3S4QU00UtXbBHh2rYGvem2MjHzdCCrDdVewIgLO8sLGBuTui2kAp3XppASd5IRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dbfz6zL4ILpSqivWRXUAKoyF/P2Awisu7/1kw4PJs4h0zGp9p9i2+AkE3H+X?=
 =?us-ascii?Q?lxq9sOwqFax/vPgRCfIFW2p/iGLisC1v9j3PL1E9x5GQu+WeDBjr/yPXSjrR?=
 =?us-ascii?Q?bzgYm6USyP4QZL/47JopBpL8LutvMPJJew95rttyyOwuOpr0XF4QmiKuMUOh?=
 =?us-ascii?Q?pMMYTWfk30Ci9fXliqI27zIXMTksBefJBspEg1n5Dc1PjzT3JjnC/+wNLmdF?=
 =?us-ascii?Q?szRTdtZIVaYpq/ClFhXgW2VZ5zGAYXfCLmlPMriWwSa5RyyZRCPc/mlWubK4?=
 =?us-ascii?Q?wCqUeeSXeYl9AcxXt26ZuNwEohnL/8nBQoGbUk8uRpZFEX5cEveEvMbxaLiY?=
 =?us-ascii?Q?SDH+ngTjdTo7jZL/UPhCWFpn+DPUpSPwkzETuaws8sKlHQCpIzdJX9BoYHWW?=
 =?us-ascii?Q?i9oYAZwK+t5XiL9Ylw+6taVaK5tXOb0hWtR8nOSRJLLyV3A0zTjpOI2fwgkT?=
 =?us-ascii?Q?7C25L1GLXtMyrqUMcbZdIk4i73ob0CPgOtXVA/OEPVHImeMuIy336LJukI6v?=
 =?us-ascii?Q?7CJPQ0XIfWEYQPh+vijsyhnZbw0lspOOlxmSgUFLevoxM8qxjysTJzaDPFYD?=
 =?us-ascii?Q?ruCdKMjODru2Uatlm2ED5AK5A5v5LPLEdFJumhlTbC0YALSuivf6uig0ZsJF?=
 =?us-ascii?Q?xReHTDxQPF2jGI3LgOm3mXeAZsEMYeZkB0k46ETxemqv84pvjpg/HMQqNXdn?=
 =?us-ascii?Q?yGRlVV9d07yVQHVEsrr46O45nmgLLc9sNLx71PsyBv7iQSbJrHPd5UowB6CD?=
 =?us-ascii?Q?bxvg+REhdXAl99PYdP3sss1Xe6G7PRn5z6NZK92MaX0CO7/Rd1CEm+CBLc33?=
 =?us-ascii?Q?vgBSTqfBpAJxYsfaH4vrBgbZW692rNsge5/Ylaxa+1XiReNd4hzqf+eeAfDf?=
 =?us-ascii?Q?Iqzrnh0IIvrX3M/7q7GohUXqn2kramCEUtM4gJpF8ZCNbhdjvGGwudUe+Kpu?=
 =?us-ascii?Q?5MXaBeYc308VixgOEX0deib3OE8QLELNNT+j/ArOpimqVxSsgglbKYCMjCcA?=
 =?us-ascii?Q?v4thZzAqECD5ylNsrv/kI5p8oSs6l1vL2b9r+Oq8aE93p2cesmN0CY4vyXR8?=
 =?us-ascii?Q?8pdrcSalKesrAIjvwfU9FEKUTKLGruvhKPqfOeOokRrsLe+X+7Jf0jvY2qZG?=
 =?us-ascii?Q?kjys1dp3OU2dCyDvPKNBEShbIIRNuQd5wmioHJpuvpqIY0q2PPe8OMtzVMde?=
 =?us-ascii?Q?I7tmSbjsElSx3OqoYjSD2FCSlLSylCs8sXYFzcgxQ9VL83QIGuebTrd7crkE?=
 =?us-ascii?Q?0ephzWqriThxPrQZkvTALU1IqMK7v/2X+OLGgKknRyZIUWhWTSkJEH+t6GKV?=
 =?us-ascii?Q?HuIm5v+6Hy1xqEag2x+bKIP+JjstrpVGOuHS8rjzmBiVeuGWBwHoVF5hZWoa?=
 =?us-ascii?Q?GKDFMgid+IOa43DWjHre0J/UoeAuVsHgR7FnY+iypgqogeH60u4Wcm138LiU?=
 =?us-ascii?Q?qqeZl/ZEDSw6fHHpUTLqAMO/eccCtpSmEBPULFNHGU3/4gJPjMqoyZiq0lm7?=
 =?us-ascii?Q?m+UnmaKCtPI2eIWx08QmHC0cxgwK4SfvJ04REcCjTN9kw+qc/lyI/azDaE2Y?=
 =?us-ascii?Q?3FzW4HYZ6h4oQJfUjKJegLiVaWgzj7N/BxBzkblgTlCqf+8vZqkCdPMey5mp?=
 =?us-ascii?Q?+DXCvkRKUhYOq/ruXaCdv6x5/sIGS2PLbTedhTDspaZjfJPvrOtUFeHBhCga?=
 =?us-ascii?Q?stB2oBRQiAEpcXGEC7YHAfDbTK1Co2d31afjag3/+YyeTW3xjaccUtr52hAf?=
 =?us-ascii?Q?TVXfQtLA1Y7kQ6fy+ShAR5OxjQ1z26irDRjLtHz61iQTujLqnHZZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c116bc5-fb0d-4fdf-f2d3-08df14305f60
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:23:30.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbcozjaJjbmTwf/cOfax3qzzl9sPVVdOHKYEU17Azs/lQjQTMXIn/wZat5e9qUEq3K2PPsCGpREZ8QPn8RpQrlzGV8ICxYpUGOdPhdLAWeKhr1kVRaQjGF63uthYvAhr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8935

On Wed, Sep 16, 2026 at 12:04:35PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> The pinctrl core re-parses a consumer's pinctrl on every probe attempt
> (pinctrl_bind_pins() runs before the driver's probe(), and again on each
> deferred-probe retry or re-bind), so .dt_node_to_map() must be side-effect
> free and safe to call repeatedly.
>
> mux_pinmux_dt_node_to_map() instead allocated provider-side resources on
> every call - the mux_pin_function, the group name table and a mux_state
> reference, plus a group name and a pinctrl_generic_add_group()
> registration via pinctrl_generic_to_map(). All of these are allocated
> with devm_*() against the provider device, so they live for the provider's
> lifetime and are only released when the provider itself is unbound. The
> .dt_free_map() path never touches them; it frees the per-consumer
> pinctrl_map only. Every re-parse therefore adds another set of
> provider-side allocations that are never reclaimed, so a consumer that
> repeatedly defers probe or is re-bound leaks memory and mux_state
> references on the provider without bound.
>
> The groups and functions of a board-level mux are static and fully
> described by the device tree, so build them once at probe time in the new
> mux_pinctrl_probe_dt(). mux_pinmux_dt_node_to_map() then only looks up the
> already registered group and builds the per-consumer mux map, which the
> core frees via .dt_free_map. As the mux has no pin electrical
> configuration, no config map is emitted.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260824022020.2812810-1-chancel.liu%40oss.nxp.com
> Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver using mux framework")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> Assisted-by: VeroCoder:claude-opus-4-8
> ---
>  drivers/pinctrl/pinctrl-generic-mux.c | 76 ++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> index 202b72351efb..de85b4e75eb8 100644
> --- a/drivers/pinctrl/pinctrl-generic-mux.c
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -10,13 +10,11 @@
>  #include <linux/mutex.h>
>  #include <linux/mux/consumer.h>
>  #include <linux/platform_device.h>
> -#include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/slab.h>
>
>  #include "core.h"
> -#include "pinconf.h"
>  #include "pinmux.h"
>  #include "pinctrl-utils.h"
>
> @@ -38,39 +36,73 @@ mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			  struct pinctrl_map **maps, unsigned int *num_maps)
>  {
>  	unsigned int num_reserved_maps = 0;
> -	struct mux_pin_function *function;
> -	const char **group_names;
>  	int ret;
>
> -	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
> -	if (!function)
> -		return -ENOMEM;
> -
> -	group_names = devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KERNEL);
> -	if (!group_names)
> -		return -ENOMEM;


devm alloc is quite popular under drivers/pinctrl

airoha/pinctrl-airoha.c	dt_node_to_map	devm_kzalloc, devm_pinctrl_register_and_init
meson/pinctrl-amlogic-a4.c	dt_node_to_map	devm_kcalloc
pinctrl-at91.c	at91_dt_node_to_map	devm_kcalloc, devm_kfree
pinctrl-axp209.c	dt_node_to_map	devm_kcalloc
pinctrl-generic-mux.c	mux_pinmux_dt_node_to_map	devm_kcalloc, devm_kzalloc, devm_mux_state_get_from_np
pinctrl-generic.c	pinctrl_generic_dt_node_to_map	devm_kcalloc
pinctrl-single.c	pcs_dt_node_to_map	devm_kcalloc, devm_kfree, devm_kzalloc
pinctrl-st.c	st_pctl_dt_node_to_map	devm_kcalloc, devm_kfree
pinctrl-th1520.c	th1520_pinctrl_dt_node_to_map	devm_kasprintf, devm_kcalloc
pinctrl-tps6594.c	dt_node_to_map	devm_gpio_regmap_register, devm_kzalloc, devm_pinctrl_register
renesas/pinctrl-rza1.c	rza1_dt_node_to_map	devm_kcalloc, devm_kzalloc
renesas/pinctrl-rza2.c	rza2_dt_node_to_map	devm_kcalloc, devm_kzalloc
sophgo/pinctrl-sophgo-common.c	sophgo_pctrl_dt_node_to_map	devm_kasprintf, devm_kcalloc
starfive/pinctrl-starfive-jh7100.c	starfive_dt_node_to_map	devm_kasprintf, devm_kcalloc
starfive/pinctrl-starfive-jh7110.c	jh7110_dt_node_to_map	devm_kasprintf, devm_kcalloc
sunplus/sppctl.c	dt_node_to_map	devm_kcalloc
ti/pinctrl-ti-iodelay.c	ti_iodelay_dt_node_to_map	devm_kcalloc, devm_kfree, devm_kzalloc

does all have similar problem? I suspect this when do this patch, but I
have not tracked these life cycle.

Frank

> -
> -	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
> -	if (IS_ERR(function->mux_state))
> -		return PTR_ERR(function->mux_state);
> +	*maps = NULL;
> +	*num_maps = 0;
>
> -	ret = pinctrl_generic_to_map(pctldev, np_config, np_config, maps,
> -				     num_maps, &num_reserved_maps, group_names,
> -				     0, &np_config->name, NULL, 0);
> +	if (pinctrl_get_group_selector(pctldev, np_config->name) < 0)
> +		return -ENODEV;
>
> +	ret = pinctrl_utils_reserve_map(pctldev, maps, &num_reserved_maps,
> +					num_maps, 1);
>  	if (ret)
>  		return ret;
>
> -	ret = pinmux_generic_add_function(pctldev, np_config->name, group_names,
> -					  1, function);
> +	ret = pinctrl_utils_add_map_mux(pctldev, maps, &num_reserved_maps,
> +					num_maps, np_config->name,
> +					np_config->name);
>  	if (ret < 0) {
>  		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
> +		*maps = NULL;
> +		*num_maps = 0;
>  		return ret;
>  	}
>
>  	return 0;
>  }
>
> +static int mux_pinctrl_probe_dt(struct pinctrl_dev *pctldev,
> +				struct device_node *np)
> +{
> +	struct device *dev = pctldev->dev;
> +
> +	for_each_available_child_of_node_scoped(np, grp) {
> +		struct mux_pin_function *function;
> +		const char **group_names;
> +		int ret;
> +
> +		function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> +		if (!function)
> +			return -ENOMEM;
> +
> +		group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
> +		if (!group_names)
> +			return -ENOMEM;
> +
> +		group_names[0] = grp->name;
> +
> +		function->mux_state = devm_mux_state_get_from_np(dev, NULL, grp);
> +		if (IS_ERR(function->mux_state))
> +			return dev_err_probe(dev, PTR_ERR(function->mux_state),
> +					     "failed to get mux-state for %pOFn\n",
> +					     grp);
> +
> +		ret = pinctrl_generic_add_group(pctldev, grp->name, NULL, 0, NULL);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add group %pOFn\n", grp);
> +
> +		ret = pinmux_generic_add_function(pctldev, grp->name, group_names,
> +						  1, function);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add function %pOFn\n", grp);
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct pinctrl_ops mux_pinctrl_ops = {
>  	.get_groups_count = pinctrl_generic_get_group_count,
>  	.get_group_name = pinctrl_generic_get_group_name,
> @@ -157,6 +189,10 @@ static int mux_pinctrl_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
>
> +	ret = mux_pinctrl_probe_dt(mpctl->pctl, dev->of_node);
> +	if (ret)
> +		return ret;
> +
>  	ret = pinctrl_enable(mpctl->pctl);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
> --
> 2.50.1
>
