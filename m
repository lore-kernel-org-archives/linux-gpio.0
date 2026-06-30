Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36232285CAE;
	Tue, 30 Jun 2026 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832964; cv=fail; b=c4kS9mZ2z6/y2RKmIeJfzI9EOtU80oe6/gUk+kfofAPd4x8MbjHCBwFqlbpkr00nJ1E16h/HlTbiBBi5F89573VyCOeEev6ksV9rCHYyTGqTzKhfszV3guB4+YoRxzKJMAeoLB7rGgigw3VTFIiTCnZPRY9gL0PhJO+Zs3GBV6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832964; c=relaxed/simple;
	bh=2hZh1cwa3M02nr5q8SD7SgXUeQ6F68ZITyj4WCtJuJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PxlbBC1jRoHGvjaokUDg/DY6ufBynw09AzYdd47riZ12j16ai+RAqIgfZHQ9vI3XkZ/TRvRpP7XmOfBLfm+HCO+iY4weG48Vr9vw1bpkRhlefoe8BvbMCHTT5VpvuHs7iBMP5mjXkbIuv6nHaTJpI7ED13nU3GshgoVkIPiGoNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dffs03QD; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dffs03QD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MM7AKqcdDUWpaIuTYezhAf0rzUG66S7N+IzVz6y2jZrTDbFLRpMeCj6Wn/OZo7XHnArEO9rYq6X9DLswG24rARJgH8ktYxItyWqd59ZdrByCMF938ELbajwyrTqvKmI6BAQa9M7udZi2OWy5j6rbb2Xq1Fc3GOuMHXA2k6y2bZzBIEqe3do8IFYsne10ooO0v89GUHSbzoogSxd2lIQXuztyXtWRMmxFT5WEA74Ifxmyvdr7882y1PTvZi1ZV7c2H/pGGk0xGJ7riaPZDjfIXI0LeEBiYeRkK/fBQWKT04i43k4Kcub79iymn4hRF2/UUFfJ2ydtN24izIxBcDxNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJdzUIZDuZiOo/p1ZlDv5v8yOS+mF6BuS0iPUhtWFF8=;
 b=j+HRuH2nii4gGms9pSgM6BFtdO3QED45slLy5uMvkAT4mVW2WmTiOX+3sh+Te2KY+eBj4cglCDiyYxOhguRiw0pjBnzqnDAq9/610hlct9QHOoTljXl0FyQXedop1FMsYXFs+u+JuNP4+ZDWk1SvjrNjIzPOXpRSx94kEHJ17W7UL10hqLo/Keb3YWM95JJLy2lwsIyNuflr7Mky5jF2QWDmfdK88kRnx2sqblZhthyQtf/bK7k8gVqP9XuoJ1MqQnvqW3PST418ys99Ckvldzs/heJsFtwBq+iTXvlIkRif3qZSMSeBkUoA1B6yhVKrv8/xYiisbpkpI5fPo0V26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJdzUIZDuZiOo/p1ZlDv5v8yOS+mF6BuS0iPUhtWFF8=;
 b=Dffs03QDHrvsLNrz5VI+mFam9ajRFOaGj5dgv6iykrZOCkjClJ7MtjDGLi2YcyeeG9v5aOLedASwn9ehHWlM4k75VFSXnMpgV1IzevN1Dob0IZ3GSd3j8Z5i6t5Ypz9vhjhuazkqBNOV8uo168VCtHfJWHj4girCgb+SKSlwDHx0AhGjcusWPnO96jrJt81yCaHbI90G1wnK9EAvjUWYC8TnOICvdl8xLVLAYDpgm3q7Sk/gfN7Fmve1go2XWVthmDSZqdTI9dSBmFlJnxRHKy9+Ct/MVRMb843MjZelXKydr3pimvNmAkARh7zhG4o8ac1Tu6GoqVEptLMgEhwxCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by FRWPR04MB11284.eurprd04.prod.outlook.com (2603:10a6:d10:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 15:22:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 15:22:39 +0000
Date: Tue, 30 Jun 2026 10:22:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v12 2/6] pinctrl: s32cc: remove inline specifiers
Message-ID: <akPfMWrGlVMoFBCZ@SMW015318>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260630125403.546375-3-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630125403.546375-3-khristineandreea.barbulescu@oss.nxp.com>
X-ClientProxiedBy: PH8PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:510:23c::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|FRWPR04MB11284:EE_
X-MS-Office365-Filtering-Correlation-Id: d00feeb7-cc07-4967-9280-08ded6bb6ba8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 GxhQzIFbRA+2QDp7HmYNmqh4JMc0YNfXCOzgsxS+2sWJ3xKORL4G3xclBcnlEwFefiCo9B1Yern24IiYgic2ivraz+ZhaPKuDNu3ayVOHksmAK2A+5kCsyEOqik0haVjqhZPA/kj64DbJC+3Tf/uFz0+J3UNYE1dBPKY0XhtoGx0aSCZz3r5obMxWaXPjWsaYdPEQm492gxxRsWWtXdDBFCDelk9Nmz9KGm3W24Hwj01ur0JtyikuE+L8rres8s9kzemgfp1QJKqQmp2Ott8tWj2Yl84XlpPriqEPQ89jBLB8HXw4VKw+dmh2lG0RC71mMZ1hREOBmlVqoj49uvXLroaj9x5Zk3D+pqkAQZDN5Yt8LCju/TQE8e2+xoNWwtE/njfv9xf8Hznm4u3/NzT4feC7dN7oH/lBbKUegw5zmsy+XTd3OTMAPyHgA7VbEJ9dW7FrAVvXIHgg7YV4H8Cw7lv2omo/8nALWK8b65ZUdydKZz12oXTPOPztJHM+ddoBWWVbGmTti8Y0HR+OxnaNxRthLKo6F81X8rAfXApZQ26UeExUpRgeWjMYK6dBdOL0azxZCjzo0Hqv9+rz+vL0tEXvL287SijM2HuzG6XPC/Ey+psuZL7WRblN9dOeqHrp6d4au5wRgh5H/ZYS1gHtWddYtefE3fYb7xVq1v/S8I=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Z7kJ4E19H6cN22PGPUmbkOg039LyfHkZZhiNpqVzA/AcmsUZnLJk/Siz+GFj?=
 =?us-ascii?Q?YCsrdcpwFt7tTEsP0kBz8fh+/eh3vminRL58rXz8GPY/ybP+RVbs2fYAVHWM?=
 =?us-ascii?Q?5TBNKQ36yK+FM6DR0BjOrR5sBd261lvvd/5d6T4++uYZCOsApc70SgN5nJVT?=
 =?us-ascii?Q?3aEKQ13UOEn5l98SNL1LqEMYl8b9O29g3HrsSXirJmHug7B53VkoV2tWl6OX?=
 =?us-ascii?Q?vDp9nd/v+Ec9Rm2XnZh6y5PVRtZFRNN4tILrCvMRNS4MD/tT0dGqapg7JD8r?=
 =?us-ascii?Q?59VW6mQh67QsRJq+IYLrIM8YAa+5ArkcVfflOXTEwhStXoB097uALEBkMMzH?=
 =?us-ascii?Q?xJ8ncOlbhh/Tindi/HHW+MavLzSxsxzOhu8XrA9VLbVLVxkbx00JraCDxBw7?=
 =?us-ascii?Q?d0Wd2+9xlWJV4csriSlw5498HN98EeAC9SuOkGeP/OwFXlOep2lYDxoYIyVi?=
 =?us-ascii?Q?E5fm/m48nYDH7fhA2kmzSnlWb79GMoAHav4Q4EGaq7kcia6ro7ymM+9+tiEo?=
 =?us-ascii?Q?KtsdJZlnDkwzfMKAT3eD3wcBILi9YZUnofDAyHoy1jmVRRRVlQQbuGoqrNQ1?=
 =?us-ascii?Q?zHeE9rSsp39guwSrFF4KPY1dYN+eYgZ9g6oYRRP/6VEpEvfPQ6i7s3ObP2+c?=
 =?us-ascii?Q?FJDQQK76dzWPd5XG4muywNuxK6MqA6Q+TxRvVjEJeE4v6mFLC5FJZ09cKlCO?=
 =?us-ascii?Q?3wW2aS8+wgdzBcW/Im1IKzhcE11PZJio3lXGzxpiYXp+CkfZqEyMpPMYSsKH?=
 =?us-ascii?Q?ZJnQd64JtJGiCrHiN5s+AwPkXe5ibDuejXsoHZAXGg+AlKQBWXNLr587FYN0?=
 =?us-ascii?Q?gzlXL8GWEycqAVTqMHgovTG7c9Vs/kqMFj7zm21fYYOTpHNPQlR0/v3l6TQM?=
 =?us-ascii?Q?B4M5Xr0IOZ835pZi8ZLMTV0tTTWxG36IttrLxhK4rMI0gFzamnpjcdrfDefM?=
 =?us-ascii?Q?Zvl54LJbyjYUi8/P3mNLP6yDa5020tks8Eg0ZNBX7oWlp+X0hEBvVl+IGpil?=
 =?us-ascii?Q?0ML4pEA4X7nzivML3eAats3yuRMbUWeDcoZJJ5UuagnMQ6OmHUALb/KDgeXr?=
 =?us-ascii?Q?R4qdb9xIe8TRoO0WE1u2t6Z4Vyg5OS+8TGJ9L1uK6ciPjMeH4HMANhjLte6O?=
 =?us-ascii?Q?R4bKk1Vny+jZwApOdcdjDK0lM7hMwFCMa+rko7m9EEuclkyCCeIUfc+6hb2i?=
 =?us-ascii?Q?0SGRFvWnj1d8yNso8qdW3cDE1iEYQU40DLRuBrtMTB9NFOPK8NCVBA5UnyhH?=
 =?us-ascii?Q?bmRC60lppHtvw85WSw4OxFclGeMQZUtF4VsRkI7ScdVlJ4ZvUZKuoGaIO46t?=
 =?us-ascii?Q?S75KjRyZ+BJGf072sq8PTFi/rRp3rbGSVDeE+3wuoIq522wJuuLV4bPkpx/A?=
 =?us-ascii?Q?6uiipvcvavWDECDTCugVYsmmJoFpz6ac5C9v0IqQQfh2yZTgt1dEdyDSRNXv?=
 =?us-ascii?Q?+YigmW3HIHbqf3Tpjp5oebn4IiIDs+qSmST3NG3JpxN8N7vvC/RDNkSyqclR?=
 =?us-ascii?Q?FbY21uRJkstFumYEzi8pWugDFnT2WT4tDPCD+uAVqZ6SoZlnDFDUXIOD5tSu?=
 =?us-ascii?Q?dVsf7Mnp6dF8HJu0bPuMxwKNYDmVly25MdVh6/yUvd2Gx9ichdS2e0A7Ok8h?=
 =?us-ascii?Q?EPy8lcukNAXpHuvD4FIuMp+bJEP10+B7DFFJ2q85/lk8RIuvXRTRfGEEY3IG?=
 =?us-ascii?Q?ok64iuKxELaMaM5WA2c5ri0z9ok7LpAfcAsR/QgPl2NADk8afoIiI1DT7jIe?=
 =?us-ascii?Q?afTbOmedjZPepjDbgnB+QtuxFJxZ/qfLvA3+QS/ZIOM0ds/7xRBL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00feeb7-cc07-4967-9280-08ded6bb6ba8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:22:38.9826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTpRk4xi+l1surL5ZH2s/+ViryOksBVNnin04zHC5VhmaXPdkVxL03vUFWchb6VhV9TOaSSA39qYH4cKx0QL1oUgmIBtXEGkh5jsRZKCLdycNZUpx6j+OeEUlBV5+UPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11284

On Tue, Jun 30, 2026 at 02:53:59PM +0200, Khristine Andreea Barbulescu wrote:
> Remove unnecessary inline specifiers from static functions.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index 2a32df932d8a..8c5ec6a76a1f 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -131,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
>  	return NULL;
>  }
>
> -static inline int s32_check_pin(struct pinctrl_dev *pctldev,
> -				unsigned int pin)
> +static int s32_check_pin(struct pinctrl_dev *pctldev,
> +			 unsigned int pin)
>  {
>  	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
>  }
>
> -static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
> +static int s32_regmap_read(struct pinctrl_dev *pctldev,
>  			   unsigned int pin, unsigned int *val)
>  {
>  	struct s32_pinctrl_mem_region *region;
> @@ -153,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
>  	return regmap_read(region->map, offset, val);
>  }
>
> -static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
> +static int s32_regmap_write(struct pinctrl_dev *pctldev,
>  			    unsigned int pin,
>  			    unsigned int val)
>  {
> @@ -171,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
>
>  }
>
> -static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
> +static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
>  			     unsigned int mask, unsigned int val)
>  {
>  	struct s32_pinctrl_mem_region *region;
> @@ -484,8 +484,8 @@ static int s32_get_slew_regval(int arg)
>  	return -EINVAL;
>  }
>
> -static inline void s32_pin_set_pull(enum pin_config_param param,
> -				   unsigned int *mask, unsigned int *config)
> +static void s32_pin_set_pull(enum pin_config_param param,
> +			     unsigned int *mask, unsigned int *config)
>  {
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> --
> 2.34.1
>
>
