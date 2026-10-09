Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB2833557D;
	Fri,  9 Oct 2026 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512066; cv=fail; b=SNKsG53V9N2/NXMAwCWjHUbT12ciPg3avJhixHkgLVCfAAGR2+VlT48qSI4o/TUGgoT/lwms7LwWdV1lHysDwV4VWuzu0oA2w15BGqTtRyScTkzfqamx1nb+kgJaVN+Y43om868y/W+tk+XTg5A3bWuz2h05XqK6QE8gHnac+tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512066; c=relaxed/simple;
	bh=r1tNaxv6hM1numpaHP/D60VeRsj2NZOGgSKDYA6GaLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aJnIlYU032vXtTsMBdzpGKY4C+DmrwDHh0/MpmNpTJsbcibBqwFM9Bli9JsDD4vHlaVHpYQzCoDS/4NUc8TnD0/qpHvPc6HnASFDSXCTXXXcdOv+plbVjnqsMTXXdWqrt9axVRW0lxy9LhNz6f8hcsGLYvOUyA0I3Z/Ke0l2G7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SCWN7V+1; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SCWN7V+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl4REuFe19yXxlE9Ilb9Raz/neqncUIwFP+5O5ifFhc6WNvzBydKiy0Q4g0fFyv94QQmpJIF4ARhqc64orJBA63TdJKSJZ273MinGLG+RlQIoGNBKbwwRQlO3YCxvlk+/1FdrdWAqKGnjQqxEJeatcjKps0z+Q5gli7/C8qn84wzDvsyOM6obu1bxc3VkUeF/PVx3igLGP3hP2fiyEYmGfY3pP0E6Z9/Ff3R+h1aDsRmqotgUwabG4BPk5MiR2TKnn5VbBs1pIRtJE3Rn+wXsUa/ejoMigXUIvHaXBsqqE9GXtMFDD8d+8gx9c73+jX7UlRajuk8h4geM6oh7GNqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0QiZeSGbXKnOhWt606Pe6naqnkVGlE5quZch+KSdCA=;
 b=CQrOy1Myvei9OVGcfoStliDwnzsYc5N5zLimkkVN4Plg27SYgw6RbrfC20VIf8x2alUCsxqBmDbRrE850pfDSPKVdB1wokSywQGKaGrupkppVmMI7ndGI2N0mEwMg4qkEAC/fx0fa7Lzb8hf07vzrplpY64eUqVj4nYAU3HJ3bqTHSwbuYbhEY0akH2FXFBdt+wle1kS/VL3Giqvcmrew/oi6f5PS/s02yxtUG1+52FKD8vnGwsIK2JG4VCyrbwrvT9EsU2QzgU867nYFv8GYbPNbiK9lucP3GMUcTQ4e4ZH/M9ijn+s97+MT3G0LC6b4sGzIHkLBwd9oSM/rD5WaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0QiZeSGbXKnOhWt606Pe6naqnkVGlE5quZch+KSdCA=;
 b=SCWN7V+1gig04cMb+kprH5yVbg67okdwjnL/mUkmBwqPWpCD/SXruk5P4XTRk1Tz6JvZJVVldFCNcASqpd1xMxlRuX65soV+WGolaA8gamfWkN8x3KTz8cnwQ+modY70Ov94kuZbVkjmEriJ8AQ1Eewc7518HBgCMbavV3W61RV0OFRZrfVp4jcaXw5yEPBKO6SLwvq2le58wueKFRCcizt0LKQVtNWg0cD+HMP5+mP/J24UuCLhtfL3cfTbIzYTP6K1IBwqnV/qa0bFY5WGCxtRQeXRxuw7vDl5bB86h6UCDfUAI+ElekEtMLoq7IskovnfDg+gke4cvBMxR171zg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10556.eurprd04.prod.outlook.com (2603:10a6:102:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 02:14:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 02:14:20 +0000
Date: Fri, 9 Oct 2026 10:18:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
Subject: Re: [PATCH v4 06/10] gpio: mxc: convert probe error handling to
 devres
Message-ID: <ashPDaZs3TiKCKKC@shlinux89>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
 <asf5O1FoHF_nI3iC@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asf5O1FoHF_nI3iC@SMW015318>
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a6c024-253b-4256-df05-08df25ab0748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|7416014|23010399003|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cE6MYhfa8VlOwYfvabhCpNFLIlxM8JidNkI8WFG9utKz3OfbxMRkGJPA44KMWHICvrfAsiX+Yfiikf6ly9tAYA/I9XbcvltBSr5UOiOz/KbMqKPRyggZYSAWWSFCErny3wJpM0t1l65/evKM2Pnb+U5bl/zSaZbQPej+Y1+0pzdhU+jrwFGvf89uEZ1qirruT+ufXs1T1W1tz6JtK53NW89+8p75JWd3900J3uXhhVCqiCptM9yhT6R8EORqtqP6WbSwDz2HQxtQMIlJShbJBmbSR3N6RZkbcjDH/gu6me0qTzfu26ylv74OkFABnZf7qQJjerMBwosHrO74feuaC+nmp9DjL5yxT1JNvHbNVK2XAmFsxnAmwmoqJB0cXfRmsDVXDN6wWaAfD9iyxjl2TTD7CElSG+qZ2lM07tedhZMrN2MiuhX1hBgFrHCojVeIrieb5rwJY7F9lFUwMenFHRFompCJ/Y5gsx15dDBjVX3+fQ0c49zxFwd5UV/Vi0GwDAL6d5AvUozl3ruFYM5xue85/+Ux90FhX75ogvb1obCRU1JRszgfw62wuQXoTapnU5u9NR0Vqa47tWoFQKlIKxo2wHhWrx8MFx+76u2KFog5FT8/UJU2W/5CTh4J0qyBG+uwqxApvgwHOwmfEHSN9j095I0dqv2K8ackLkVS8ow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7416014)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MBTpDRM9q92Lj6EZLf0QWOeWsKacqwxrKOw5TIshEppD9NC5GXZrVOUwlF2t?=
 =?us-ascii?Q?bJzH8XYiCsWGrZHJOtE+ToFgGbT6eQtHUtJK4Qi3rOWzJmYQMf9QBORTYO+R?=
 =?us-ascii?Q?jOIlNgAy8bI1qn79tmK8cnGrCJDunv1S6MUvV+31xs4I/Dg8td/dOE0NRz/B?=
 =?us-ascii?Q?Sf52MgkIqHOGbcGjtwz3OzbNIX4HYeBzza54MbHHx4zziiym6uk949LKfJZ6?=
 =?us-ascii?Q?6cDnNKW0ui8uOWHw9SvGrf17uVBmnbejhg0k4hJx5qRSE2GRAJZTGx5uC7pa?=
 =?us-ascii?Q?xBwWsogYcJYcfsO6m0FnjcoyqKiq+hAJKIJH/RTfyjdE8g0UnS+eHgpWPmP+?=
 =?us-ascii?Q?FnLV/tvwZapOJc0CiCFrqmn6Hh5yXfnpkJ1der4tTki4Sp7Xv+ElWkx3BEhy?=
 =?us-ascii?Q?2oRgjl89d2jwz2gdeHO8iVfAfBsI312fw+48BIr4JA3Hw+Ldt2CGDqW5DRSh?=
 =?us-ascii?Q?W1LjCPs2hGSXWm3v+lIbevBKSmImHR+92gcuzHJqoWDzdGEtbxMW0CBHR4nr?=
 =?us-ascii?Q?XO/yqMoBYYABHWM+4nO26YRZU3w2oTLJJ7QXdeUdf6gx/mTsTw8TGUt1/ndl?=
 =?us-ascii?Q?jIhhKliAbgQN3v3TDiyAN3et/wiBMlG2gEA0WaVTAoVsvz6r2PkFcWTjVNQa?=
 =?us-ascii?Q?yR4Qdgcj6XRyiryiWqjLaLUkAkqDRMaBo9PNm/l7dx1GF3ebRA8TUOtuC0ed?=
 =?us-ascii?Q?STWF/os39sb1bH2a1p2BOy8AyorOkY/xgabwJbKWZ/5yBpDEzG97LKEasB6W?=
 =?us-ascii?Q?bEpO/E0YqPcUg+3uUQ++pXNaqVDgpfJXWZV6SxNZ6BGs+bhaExYXyQjud9zt?=
 =?us-ascii?Q?g1Zy1jdIETkJJLtYPpMpxKnXKg1mGquRZZBmvg8rar1RAW4LyIjQG8OPDuP/?=
 =?us-ascii?Q?5u5pUpXwvtKD/WwvuJbU/6aTuIB0nU6Iq4oxoe2RPCAPhRToNTCYF66ePFLG?=
 =?us-ascii?Q?RllHgKgbWZ1X7YHU5EMI+OqhnLlEjaFjgr46fFpBuVQRS7KbcqfBQF1PwcbA?=
 =?us-ascii?Q?hc1yM/wZ2Sq6k+kEjaVLo1Au7hIVtCcSxsHJX0oIJDUgYFCXSFLoI4ZEcuC/?=
 =?us-ascii?Q?v8PY1IFzUTBpn7eSbZ/0t6WOU/vHhPs81FyGOsBZ70/j2Z5gpgxH514nfUWS?=
 =?us-ascii?Q?lF2YJ9YIpcd+XR6kkHWWP/+/FzH1MfcFuY5371VjNXNGoZ/5yuU46qqrM4pD?=
 =?us-ascii?Q?uP5UavSaQtC982Iw7uGMeWsDanHcICGZeOphPp/S5mbdWfhIH+NthSfcJRsL?=
 =?us-ascii?Q?ZsqnZofO2uxmM9yhHmPY+Ly7ccpP8anXdamkPUZzIWyOQJMltgSRvxhvOg3O?=
 =?us-ascii?Q?vLlGkUUbpN9EQXH2I+6FOphDAfA8C1UgjTUH/cWn+8DUe6hAtG5dHwNrT3PE?=
 =?us-ascii?Q?4RfcIKw2qHZtRXAQmhvYO4hXpaVCkDeuWVTSG6H5pU2F0q7H9vKqQKmvB7C4?=
 =?us-ascii?Q?dFLPAMwRQiHa20hVNPBfk8YGt8OO6outLSJfa9p/+aBCN3tuwn+hdbhCuf3m?=
 =?us-ascii?Q?hjIWTA/Z8ACQXdMQ8xdLgOUioZ7MP/TjaF1Hg3hDb7oD2R2Xy85wYYth6wyT?=
 =?us-ascii?Q?9NKR+bwgJoyiYgMbi8qQw/G1RzniGxbXyD2Aaz9r2BfHJD6nQgdV3DjHJXKK?=
 =?us-ascii?Q?P+0ktCTqLDHE0MkAlbU4RKaCZc0RSDlbRrOcrX8y6UmRVQUrfpMGYv3IK9pM?=
 =?us-ascii?Q?g1TtIz/StQSBLx36oz/S6JT6lB3B+aCk3MTlr8niDlS/5RetHg6YVxmkfBuP?=
 =?us-ascii?Q?IJiCJIjncRIsfMJBCAi2ctJ0xwijBbfk6KlodmNRj73rO0NHHip/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a6c024-253b-4256-df05-08df25ab0748
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 02:14:20.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKcixquvkCgwm4XPchs+L/ZKnmi5Z3v0Fn6MX1UDfBXs82Ntnnm8PfZxgJsc9Z6HNxTfdDxUJxsl5QE59kMCHouBxRGOBB+c6q/YkxFlB9J3wSChjcnLGqGExqq+4Dsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556

On Thu, Oct 08, 2026 at 03:12:43PM -0500, Frank Li wrote:
>On Wed, Oct 07, 2026 at 06:44:21PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Replace irq_domain_create_legacy() with devm_irq_domain_instantiate()
>> and the open-coded pm_runtime_set_active() + pm_runtime_enable() pair
>> with devm_pm_runtime_set_active_enabled(), converting the remaining
>> manually-unwound resources in probe to devres management.
>>
>> With every allocation after the PM block now devm-managed, the
>> out_irqdomain_remove and out_bgio error-path labels are eliminated
>> entirely - probe errors simply return directly.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/gpio/gpio-mxc.c | 49 +++++++++++++++++++++++++------------------------
>>  1 file changed, 25 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 5da603569d88..54b09f1a4b50 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -449,6 +449,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  {
>>  	struct gpio_generic_chip_config config = { };
>>  	struct device_node *np = pdev->dev.of_node;
>> +	struct irq_domain_info d_info;
>>  	struct mxc_gpio_port *port;
>>  	int irq_count;
>>  	int irq_base;
>> @@ -484,9 +485,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  	if (IS_ERR(port->clk))
>>  		return PTR_ERR(port->clk);
>>
>> -	pm_runtime_get_noresume(&pdev->dev);
>> -	pm_runtime_set_active(&pdev->dev);
>> -	pm_runtime_enable(&pdev->dev);
>> +	err = devm_pm_runtime_get_noresume(&pdev->dev);
>> +	if (err)
>> +		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
>
>look like needn't call devm_pm_runtime_Get_noresume() to pump ref count.

We need pm_runtime_get_noresume to keep ref count.

Without it, the device is at usage_count = 0 immediately after
pm_runtime_enable() (inside devm_pm_runtime_set_active_enabled).
There's hardware access after that point - writel() to GPIO_IMR/GPIO_ISR,
and devm_irq_setup_generic_chip() inside mxc_gpio_init_gc().
More critically, devm_gpiochip_add_data() makes the chip visible to consumers
mid-probe. With async probing, a consumer on another bus could do:
mxc_gpio_request()  -> pm_runtime_resume_and_get()  -> usage_count 0->1
mxc_gpio_free()     -> pm_runtime_put()             -> usage_count 1->0 -> idle -> suspend
That triggers mxc_gpio_runtime_suspend() which calls clk_disable_unprepare()
while probe is still accessing registers. The get_noresume keeps
usage_count >= 1 through the entire probe, preventing that.

So the correct order:
pm_runtime_get_noresume(dev);            // hold active through probe
devm_pm_runtime_set_active_enabled(dev); // set active + enable (devres-managed)
... probe with HW access ...
pm_runtime_put_autosuspend(dev);         // release, allow idle/suspend

Regards
Peng
>
>Frank
>
>> +
>> +	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
>> +	if (err)
>> +		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
>>
>>  	/* disable the interrupt and clear the status */
>>  	writel(0, port->base + GPIO_IMR);
>> @@ -512,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>
>>  	err = gpio_generic_chip_init(&port->gen_gc, &config);
>>  	if (err)
>> -		goto out_bgio;
>> +		return err;
>>
>>  	port->gen_gc.gc.request = mxc_gpio_request;
>>  	port->gen_gc.gc.free = mxc_gpio_free;
>> @@ -528,27 +533,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>
>>  	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
>>  	if (err)
>> -		goto out_bgio;
>> +		return err;
>>
>>  	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
>> -	if (irq_base < 0) {
>> -		err = irq_base;
>> -		goto out_bgio;
>> -	}
>> +	if (irq_base < 0)
>> +		return irq_base;
>> +
>> +	d_info = (struct irq_domain_info) {
>> +		.fwnode		= dev_fwnode(&pdev->dev),
>> +		.size		= 32,
>> +		.hwirq_max	= 32,
>> +		.virq_base	= irq_base,
>> +		.ops		= &irq_domain_simple_ops,
>> +		.dev		= &pdev->dev,
>> +	};
>>
>> -	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
>> -						&irq_domain_simple_ops, NULL);
>> -	if (!port->domain) {
>> -		err = -ENODEV;
>> -		goto out_bgio;
>> -	}
>> +	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
>> +	if (IS_ERR(port->domain))
>> +		return PTR_ERR(port->domain);
>>
>>  	irq_domain_set_pm_device(port->domain, &pdev->dev);
>>
>>  	/* gpio-mxc can be a generic irq chip */
>>  	err = mxc_gpio_init_gc(port, irq_base);
>>  	if (err < 0)
>> -		goto out_irqdomain_remove;
>> +		return err;
>>
>>  	list_add_tail(&port->node, &mxc_gpio_ports);
>>
>> @@ -558,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  	pm_runtime_put_autosuspend(&pdev->dev);
>>
>>  	return 0;
>> -
>> -out_irqdomain_remove:
>> -	irq_domain_remove(port->domain);
>> -out_bgio:
>> -	pm_runtime_disable(&pdev->dev);
>> -	pm_runtime_put_noidle(&pdev->dev);
>> -	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
>> -	return err;
>>  }
>>
>>  static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
>>
>> --
>> 2.51.0
>>
>>
>
