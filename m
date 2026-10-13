Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEA050E58A;
	Tue, 13 Oct 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901810; cv=fail; b=TMCFJ1VYYWH/T6a1Z7XZrwlRdusUTz9VPawcmu41T2leHPZKxHeg52nCtK++S1h87nhIUVVrHyQtWVDIqQKLD3Wth4Kc7IHy5c+N0/JDTXJcyDXUJDb1Vgc7BhoJ80s+RgPfVzAJpZxwLrJki2uN/ETn3MVbs/P3HYhJWTefRn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901810; c=relaxed/simple;
	bh=jnALIGtY2bOfAyvOEqBm83n3Z3DwXWhC++9NJ8caAUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gAPRA7RjLEmIhO/lbpAPOh+QSryJ3NbVMrYoptXGQCUCzvIF+X4SaNqzlpa9kC6zoqXPUy5MxHMFe8zRprUXYSjs8O5UTnmwkXiDkHCwcn/YNJAg1lS7P0jQI/SYgwRC6mrLptCu5QSaPyab53A8vf2f7tiPZM2m4ym++YJqw40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dwSUpT5z; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dwSUpT5z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXPjtMH7QROR76aKjNpfmHAJqW4rgi5KAGGlJkVNAYhP3iehdbsoKR1ox8g+d/zBbvowTpzYDGgEm+5h2Z4V5CF4ALrLt3+NcsKdQsuf4BP4M/QvIRGQTCPaw8ed3RUoLagismiJ8bPQIKiAWY3Fgav9tGhaCIuy9fxz9tzp/awTkZaLbcNIwfNiCwBxGUgEFwhATqaXBv0+P1VEqezwGvjTrn+mKHowRlp7MjkFaaXgRJ2AKu7B04OBkhy2NTvc9UYyT+ltB/upVaVbm9N6Mxd22d2L8z5OWD4R4GO8wh7S6mjQDJ26yPOrxZPtFF+i/o+Xc5JMpVjWyrnw4TVdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMN+B6uwONdfvvp0L9MxHkML0M7ALOxVPDnmddi8vNI=;
 b=UELBVg5sd3MVWjtv5XEyzUGqkT4jVRSjAOTV+Q5l981JqXCnPua3ZWwQ/nrz8fB/IGWG30Twu137zA+VnOK28L2Pbkk2oRAmzYzS24UNaZMyReFU3anTVt8AvGv/fJlIijaor8iGHYQeoLGIFK5j9ML0bQbl2UDw0gUfnj+JzbhspofZeNuiq4e5oaL4bVUsnuL5ZyyCDfvEu8c8hsyvOaU2SnRPSiZlXpKLDbUjlwnZUGAHYTwrnVDFNetJHmXtvF9UZeQ+ekhRBwDve20TCtbe7U7vylWJgOckdfvB8/bNuezsFhB8OL1xY7uS1/l/BQJt4JLvAHyMkIV67D29/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMN+B6uwONdfvvp0L9MxHkML0M7ALOxVPDnmddi8vNI=;
 b=dwSUpT5zz+TLJDxBn+ADwvSzJOKm2uhP2hrmOuSksEjaA/tDDUBPXUyAdKEn9kUCBJeVBZnpRK7Crki6QBDMTlVJ4Z+EcQSpbtjmyzntWFXdOSGZXMuHDExlser326ciqhebNsKiAmpMgfdeX0pHqZiza+EHK7eF4yEYuMZCsmRaIiCQbcRvLGvMnBAfrEU3IsCUAMeqV4SN4UH0HTR9f7Q3Q7xUgnUrX4dcZpHKwVy9OisdF4TmVseOW0WCnQasFgcl8MivKqM1mHPLNwOynJpYfeXtH8gyKeRyhjE5Eai6Hd1fnEKfDAkUNebtoFhZbSt6IrVYycjuJ5j2ZNOGdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by CPH1PF2D6E07479.eurprd04.prod.outlook.com (2603:10a6:388::3c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:30:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:30:06 +0000
Date: Tue, 13 Oct 2026 09:29:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 4/4] gpio: mxc: fix race between gpiochip registration
 and IRQ domain setup
Message-ID: <as5AY6M5ZJK__qKR@SMW015318>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
 <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|CPH1PF2D6E07479:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5a7aab-a0fe-4c3d-f16b-08df293679a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|7416014|376014|366016|10067099003|261009223027099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	16PeUdeOFmtziu51eb5iaYBLUmOmZV1Age5aK7bm72LQnQx2ddXi2SIkaaGGjUP1aFMa/frBR0zM8KaDyyblOZiR0VN+npDsxG+Yyq/vIggQ/41BVdoxlls0VbrGOkWexXS+Ed533EWV17wpmGU9JCqnzVsNCGltFHLTHzk1c0wpjhQyecqYsgI1z/E9A3c6j2fqj832nXG2M7YkeXzP+yxW7J86YUdUX550ecyfCRy82AhQZuTJ6Cf/UkiC/F1PKIztxLabczSgoaI0Cl/0YL1KFHyO5MQDkBtzG7a19s6VWBmCp1qhKp01+dfvJ6QbGtGACxSjkC8KxA9x1nLGJftLWbY4NB3tWqflWSW13AWNr5N8XYjrbu8QMLNyoW03TMo9cmqkERbUB04PZVzL/hDX4wbKZwYhagx/sFgiwO6qfkfQRoFk0AL/v9zFHxmC5Zru4Aq6DlHNxlCGYOKhikIGQoMG8al0Twe8lIdxrwxJQ5JFNqfsh0hYvBGT5GVgcWy00ovS1/sr7uM+NwLgtj7v6wH9WspMq/0VJVsYbHH/inX9xz9VRlTjtif2GzAs90OFX1QdOCs14WMJF5+5+noI7PrhE41gmCTnWaJdhdBQ6EXJfTu8neYqI5X5eBe0w7bsvBcwos1e5oSfx/FiQ0Os4fgs/aWNc7XQAVmEGIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(7416014)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQ2ZFsXu3QLFMgdS+FDhc2MYF4JD5mEsfUpMuBy0vyeK9AC10ak1ENQB37l+?=
 =?us-ascii?Q?phrKpHeMpnssCybRww+wxUndm5T7usJIosAz1Zviidv7NoY6If6jNY8gvRoF?=
 =?us-ascii?Q?gBitycKhwo6X6UzH5Cxwv6mAqIh9CsukbAMeywKATBebpaKCnZmLSBrVqq46?=
 =?us-ascii?Q?n1zobqhIafY+3zC501uVo4dN7lj1glb4kMj/M9imwTApMl3OhcX1nP6Qsw+8?=
 =?us-ascii?Q?oozXbTd9idOr4C5vJInm9/PT/nc3TD6yKNDR8cKxHZa/s2crG14XWwreD7Qc?=
 =?us-ascii?Q?6KJTvHs1NA+X9+FY/4q6sasub99mOxStJdVNZL/YW5NMITm5g5fKn/D0eY8L?=
 =?us-ascii?Q?XAhYb5FgHZ+gKEGUMj70RQI98mHvfENogVm1oovRi7c/PqUiqEDzH0RaLbYZ?=
 =?us-ascii?Q?g0PBbwIp8F58LGgRoi/qz+G8+o6HbNWXIW4Y1W2VU4rHgxNNoQ66R2rAi15h?=
 =?us-ascii?Q?kP5BNfmj+u9mrNVTaFweOUZYiapY/+ehphVHyX7w3YJAwoMsUe4QkgQ6Nvb/?=
 =?us-ascii?Q?PTmB3XbKEAqUT56YuSbvoltm1gVL3JjmG0ZaT0mJ8mAQmnM85kHZ1WhcjSXd?=
 =?us-ascii?Q?ZmDlWsMH5UUzpF2ngupo99xkgpmVoRwFl8Q+oZyFxk3Ogwr27upJfQ/R/eKX?=
 =?us-ascii?Q?QAXptGxQEcm+8/D8wNq6i3uS6MPky+/J5ZZigFfWIRCGeZowHpixGSdcub5d?=
 =?us-ascii?Q?5fhgwv2Sdbh3L+QDBVGwBjBJ3M1oOq+cZKjIZrgurtLz/e/67pv7OdcamAjh?=
 =?us-ascii?Q?7/9RilDDIK2tOsoQwN24zZKz6I7OBfnPdImnZpEtv0OX9I8GncBUsfnBDv5l?=
 =?us-ascii?Q?qYV6OtoJyUUD9IMF9KPkkFzBEzoDMrx5qDXYO5jFo591GoY2x60PJbDtb2yy?=
 =?us-ascii?Q?XIvRfSHpX699xKSIIrByKxZIODXJf5uPUee75PkAr6idOMmtaQ+Ik7KJWJfe?=
 =?us-ascii?Q?mClLp6f3F7dAAl6tvBDRpH2A7/p5rtdRoouqfGvKs2K904bLz8gBiRVWbbKS?=
 =?us-ascii?Q?jTFhwbOSLh/rUFzCSWfOyc3hLx8dchbWusxUMU8l1Yaww/qSllV3EkjPlBTV?=
 =?us-ascii?Q?sgK6o8gssDFAbk/XeKjACmab6OIZdIuTxw4ucsbWh8NNgQ8MI55E4pu5RH2g?=
 =?us-ascii?Q?RtTBdNLsvHCvGHHtrKBfqCGA6X9D84/NY5hID3I6rPmkv8y/UoEsve+FTUVz?=
 =?us-ascii?Q?HcvjyJFyjNu5oWqOE3hhysbShmO6VnIP7MBtDPIN3h7GHG2wZ9K8ogiB4r2k?=
 =?us-ascii?Q?DYbFmqjLGA7zpQOb+9esLxUhyLp3L5oxzE5y4DFgCZe2sPMTTiltWckurTOY?=
 =?us-ascii?Q?c5uzZW9JKalfKIdN9zVYGPJxY5ZAuljc+EtkFl+gJstnGv9/DLV3wcP+gDGd?=
 =?us-ascii?Q?+0gR/leRW7hhV/SXQA7+aOCnp39A+SSd7yGuEBXG9vRED1O7Tpc/cnOSgC0z?=
 =?us-ascii?Q?Fql2p+ebFp71RYloLuE4G3pjXAJy4mKb322cQaRi3A44Q3qdRYZN4yXoInT2?=
 =?us-ascii?Q?stXxl2hxPLLW9HOT/uNa1//6b6nj4QliUu7hug1R3XOP0couJFNuc4P7/kuL?=
 =?us-ascii?Q?Q38s2v9ArBqmqBWmC/C4gny+DENiKxlNyUFeqfRJfIvc1nKG+MJmcG6rCSba?=
 =?us-ascii?Q?njM1UcW9du6C8Ca5F8uuGeD7hBrXIYLtnt/78TOQDrk+0zIaI9PSwHfI6k/E?=
 =?us-ascii?Q?O03YGlhP89QeTRkJEgki6SnW6SeMd+vR8NkwGmzCb9DCo0uZ6un3NFgX/lNd?=
 =?us-ascii?Q?PkowZB1ogl3bmU4V89GFAQaHkmYFvgrgD29LNRmGFoek52SmK3ZR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5a7aab-a0fe-4c3d-f16b-08df293679a5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:30:05.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWYAggku53mk1BKHtJ9uHgDhPw3ylmQ/k/onx6RqOE/zpVK+HJXMN+rQFVX29wLJ5aNngZ5/6pdRQvNuxodWnYKI4hkuN/v+dMwiXMaAFBvvG1J2jaLUDT57XSXWm3SW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPH1PF2D6E07479

On Tue, Oct 13, 2026 at 02:01:12PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> devm_gpiochip_add_data() makes the GPIO chip visible to consumers
> immediately. Since the chip sets .to_irq = mxc_gpio_to_irq, which calls
> irq_find_mapping(port->domain, offset), any to_irq() call between
> gpiochip registration and IRQ domain creation will operate on a NULL
> domain.
>
> Fix by moving devm_gpiochip_add_data() after the IRQ domain and generic
> irq chip are fully initialized, ensuring port->domain and the irq chip
> handlers are ready before the chip becomes visible to consumers.
>
> Fixes: d37a65bb4663 ("gpio/mxc: Move Freescale MXC gpio driver to drivers/gpio")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpio/gpio-mxc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index e3a80f17d041..32ded7b548fb 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -500,10 +500,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	else /* silence boot time warning */
>  		port->gen_gc.gc.base = -1;
>
> -	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
> -	if (err)
> -		goto out_bgio;
> -
>  	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
>  	if (irq_base < 0) {
>  		err = irq_base;
> @@ -524,6 +520,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto out_irqdomain_remove;
>
> +	/*
> +	 * Register the GPIO chip last: devm_gpiochip_add_data() makes the
> +	 * chip visible to consumers immediately, so the IRQ domain and
> +	 * generic irq chip must be ready before any to_irq() call.
> +	 */
> +	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
> +	if (err)
> +		goto out_irqdomain_remove;
> +
>  	list_add_tail(&port->node, &mxc_gpio_ports);
>
>  	mxc_update_irq_chained_handler(port, true);
>
> --
> 2.51.0
>
>
