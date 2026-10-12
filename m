Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996783750BE
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778115; cv=fail; b=s6PeJdHSf68TiVCBVTtO2UzHZX+N7G8BeCIg2e/0XaFKHLhi+xZIBDPtjDGpouEzEmk2e6rvi97lYRP5uqFIbiZ/AIReDQco9RPVobhPf+CicivtecteTz+6SCfgf8g010pEpm21qV54EnQ83oRJQWcsdPneWccaWycg65RgPw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778115; c=relaxed/simple;
	bh=i0d2SXaD+q7WCBxuPJv7DpqEPP1VGxJS5t8LeB0DYnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IL2tK27RZLScvwb/QaTebb7+dOWckCBTKYbA2PucPpfsp8eS0w7uYKzOB36EI1FloqZPVTKIHozPLUBztCaHgw5S40aFbVjKWDQjkJMjH/8aMxyvB3k4XxjvHhbyZ48HY4+Tc6sWX+xRIrT6GceMpRthZa7wFLCpb1dsgidg/D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZZNBZbPM reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZZNBZbPM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv1QnvpVn42CS2AehulRtJNJnmHu/fTsV2HWHR08HP0BQk3iTY9Ftn7hUY/LhWCFn65958L4p9TgMIIw5/nxzugUzOsSssnZ5et67tAgiDzkCj2b0sQBlJxKmOAQfaBZt48yzJzlAVbD5VLGJ5BCnWUrXv2t5s//TBj9p0RO4fVqNzt/DIDbbDkHl4TKa7/l2hTOpI7JgBXTKPbhRBJp5qWWz3g6idJHx9rauqEYTtRda00Fy3fFFSh29L3aJo+YUglROSPbWLZaTfGAFSim65sQ9NTlpQAj6yZ+KJMuFergdRFCxkZxE3DSLHt9vDuQLILhFV9ZxU2KeC9dUP4DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwmdgpzXMueTRkV7iiHV0JQ42nfd/YaJHjm2wYnkhPE=;
 b=pyd8f95E3D1jcfYOrI8+v4adqk4BjMNP7uOsjZkANtsNxK39E1Nv1bXAlq7ZnOC7cc1vDV5ndrVP6qPhXtja9rlcl6rx4ZVPaVPB5NZcsGkAQw/ky4QBTYA0Zq/Ff+k/QBSQKy9+0teWvJBifBeVngbuirBHluTjNn9i7fgfi2e0UVARvs49QFvAH3EJgUbAVCGUE3YlZnE7+Bl+TcL32tFkFRXYyNNkKDmLTx8vwRGlVYuG1OwFafMjx5nHA5s9Vx+vIEfGuVyUPLGaAqyg6EYie3o5jKoBwuCTMICHTbSirtp2yZPr6qIe4nsDFxagodCcUaSfJRlOMBAsWrX9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwmdgpzXMueTRkV7iiHV0JQ42nfd/YaJHjm2wYnkhPE=;
 b=ZZNBZbPMW6oxXyYNFgbcz7ofIFNj4sCfI1HKYGAeSFhKAi9p9jj3xVcSDEb4+rQNGeeTW0iV+ocYSkMVeS4vQ6pCwB8D4PXaZ+V3eaQ3ev8B2JIbkWm3C5KSTW1WVpyW3FPcUSMPvFWi+WelIzc2iFiKhrDEKJadCk/mMGGPGSMDNLcL7gQTGE9bga9CIhKre8tz2U3NpRYV6t5DXzyrxJdup5Nx473yCi2tPbdUTFQHdrZFH3ZIl5g/f82as0y4KrSeF/MW3M9Dr8LGSN36HDaYJAAvDmlxQ42uEac8ym2id+NEcYiJuQAXVACE2u8SNkZKtSl7IHQbmRcaNyGffA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8707.eurprd04.prod.outlook.com (2603:10a6:20b:42a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 04:08:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 04:08:30 +0000
Date: Mon, 12 Oct 2026 12:13:05 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 11/13] gpio: mxc: add dev_err_probe() for error paths
 to help diagnostics
Message-ID: <asxeUcmsgeLTMHAC@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-11-cb47ce2ad758@nxp.com>
 <sashiko-outbox-167210@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-167210@kernel.org>
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a0b0b0-1599-4d5c-8608-08df28167993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|6133799003|20046099003|22082099003|18002099003|10067099003|261009223027099003|4143699003|260925021311599003|260925021911599003|260925022911599003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jW5S4jkyP5EJD9qdLSYrbpztr11ZnNBSSnWu88oi3fa0Y9931jyZSrBwG4botR+V+RgcgpwrM2liHOzujkxfvzzfVCnpymWHJ2It5FcfrdggJKMb1Ssv9sM1mFquzUky/I+viDBeyhb3XPoReWUotc8QxVyv6vP7gwIuS2N2fNYeRgjBbmX0tvJ4cEfYvPCH+rVB6ms2KcaG5xNubiUVB2KRx3VHVH3AVV/ZqMTl/IVHd4nBKwTkkg5NyX+iZ7QspISEMskZM7R0dD138kQjY7sbfNMLJB+MkkbhnpbokEHYIQJRVT91D2pPpR3UGJQOBTRyROtJ5EAca0OcptrJav/vdv2BeJjCJyO8THFVXCRjw+o/9S3t3fJ3y/iWeUxJ+Brvxs49v/LZ4eGUs1RM1T7aWDkviUlr1NTugVqAR18daaQ+w33jhc/OCNV4hOkG7+7vdE631W7TdvGA+vj1oMuURqOmT2u4bzSK8usqnBBFkvxgF44xGNdGa3DzA56h8fS6LGMcK6Vbz/DvIGUo5kEW1n9Xmy4f9uKpTm6K2KWDTmuUa+lAjuJ0MPqTOz/ACGEwRXADlbqrxRJB42rEl1l+iJ+MpcMcA2ON5ITOnBg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(6133799003)(20046099003)(22082099003)(18002099003)(10067099003)(261009223027099003)(4143699003)(260925021311599003)(260925021911599003)(260925022911599003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?1SthoC5+pU1MIrWNKqGg2EOwrWz3RqIjNzblWklKOZ8ITzyyLwm9V90WBr?=
 =?iso-8859-1?Q?KDVBegqFKlbxnUe6AAUHlQrG83de2SVMR2RZSuglQqJXjlw4LD+lk2SHuX?=
 =?iso-8859-1?Q?rFDfIEGGZkYwXY8HJUaruPefCSwL/vL5xm6pGHChqqfJvdEBRFguMCNrih?=
 =?iso-8859-1?Q?Xzon09M/GBFzGN3wbGfPhC/wBuptYKepBYrCmAxCTMsrGtt+euR+PIRPo0?=
 =?iso-8859-1?Q?/zBWvTWtVdEhnZy+JH6icS9vDzHAA/mpir4/xV5JcDGN3jn4CmWYFuaXLJ?=
 =?iso-8859-1?Q?QbumI4KeKSp7N4gZqo57M6IbOZbzVkhTCk23VYkytAmc00xN8Lx+1IVwWO?=
 =?iso-8859-1?Q?Jpj/P6XTspt3CO/cqu4VHz5WYiUActvxpVMmh76EznoEbYaJJCsKzHyVuq?=
 =?iso-8859-1?Q?MX9n3E35RZ1uKuo0b4jp5epMIGS34F+hgzADYJK5gZCJWt76MwcmnVc8jR?=
 =?iso-8859-1?Q?wNmJoX72znIpfPX8H3XUrrxSHi6NGi0LiJedL/kj08jKJ4FHw9OoaJ/ujt?=
 =?iso-8859-1?Q?NCxdTMVbaRHw8ti2QOIijWeBjSg0R9jn/Di1Snne0s9imBYpw0Og1sD/Jj?=
 =?iso-8859-1?Q?S1sKIFZF0AcKis29cPdFHzXP7pMukTNaHSP72IfJ4zDwi7N0Xzl2uFe4iu?=
 =?iso-8859-1?Q?sFDQzZ4BwSvbB+mvM922DjgEEtkZcrZyn50P8vFAAjOfKyCflUDMCI8orq?=
 =?iso-8859-1?Q?TEc4Dg1/33URc6nffNiy3t8haT8VBwuacV5PhZNLDVYNYWELghbhhgAUUF?=
 =?iso-8859-1?Q?pEPFWIqc7Q6tp2GJ9Gr3cPZ5gp+T2co1SOaOyypKa3ungcRv+Zu6NPk7Lt?=
 =?iso-8859-1?Q?/nXKesYIuQsDm4zgLApfOM/jqH2JgrjpWayQJHr0ThViuv5BqCiYQu5zYs?=
 =?iso-8859-1?Q?1cW5m3xsVECJilR4eKfIkrE+CkRAlLWOnTVZLUK4ltXd1bTFB/EhrjOi33?=
 =?iso-8859-1?Q?5k4TP8q/RFYY1gGmouKPIG/kkWN8bO+3qAWFTbEwCK2lZ46kRCN8wqg0/7?=
 =?iso-8859-1?Q?4MFYGm7LFwP7XoBrrSRNaH59QTJhmft5p9XKh7oHejb3Ta0sJhT9APEJM7?=
 =?iso-8859-1?Q?qo0jOlfebVk7C1pSBZMlzSUsfnEGUCblVxembylryRFe1oy3036rychI9M?=
 =?iso-8859-1?Q?Aqldv1URTyb25STb/RbvZwJXSc7gslhG3bAT4QvGZacHjfp0hdr36THO6m?=
 =?iso-8859-1?Q?m5Q0DCnEuvmY+4IiU62cg27jG/S4dooe2DEZLi5GgOsY9sVVJ33gh4KoZ6?=
 =?iso-8859-1?Q?YDv3KuTyPeABG+GLcS9v4Z2j3pKy4Y+xwUrojceDVag0/vJOdFSdX/NAq2?=
 =?iso-8859-1?Q?Zj93ha45zCAmL3NvSYSOuwZo9uzvnxKl+bax4V7SrbxdN/Bcv2Yfsh8F+1?=
 =?iso-8859-1?Q?glC3QwZ7/HZvxLvKKCO/ZedSOV+9RavclypiIw6FLfithfDHHDM6bqKzFM?=
 =?iso-8859-1?Q?cZcUOYhXieuPeAHtqHHMtv70dTpTZrxQfx3sUZ025mjLYIRZ9EnFRbIQj7?=
 =?iso-8859-1?Q?DsykArp9h7EfCytEPMN3KyNx40CLG6UbqxlgFJIYEvdss2hmk2FWc/yF0W?=
 =?iso-8859-1?Q?aoHKc/ruQsDw7sd0TGcqFkiC4SVOQjiwUtOUW4iUn/InBJCiLNSezk4TQG?=
 =?iso-8859-1?Q?MjUPm6MPZNelg4XHsriQ7NDlZecokxLQZxd339q1QsWZVAlWzCGGSGQ3Kl?=
 =?iso-8859-1?Q?vz8pMYfDSJtvbm2pOgkahj/S80o7b90QAcTRuJ2iWvNx+b7q+nlOCjqaDh?=
 =?iso-8859-1?Q?2mZrYofd6qA/T45jzHTkx2Yk4cprIXMzySUAaa5qPx/WGJsD/gDZQnddkF?=
 =?iso-8859-1?Q?Fa2TK2aJ+0dlaZcN4zu3tDudmn83ZCXewvldqJ4sWCuYjgzcAY0t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a0b0b0-1599-4d5c-8608-08df28167993
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:08:30.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUFZjh8TxJCM6JRbXJZSR51Z33eFgcTyX4r74GAtp8PkTw/mgKPbuBGYT20bYv5hG+Zo97TFlLWD5vumAbAMYQ3FcaTQhTcu524c2KnhmQy+uL53brstX1JBTKWwbzqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8707

On Sun, Oct 11, 2026 at 12:04:24PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>- [Medium] gpio: mxc: race condition exposes uninitialized irq_domain to consumers
>- [Low] gpio: mxc: missing dev_err_probe() on clk and irq_count error paths
>--
>
>commit 7b3e39d56ce16597ec573873f31010421e588a2f
>Author: Peng Fan <peng.fan@nxp.com>
>
>    gpio: mxc: add dev_err_probe() for error paths to help diagnostics
>
>This commit replaces bare returns with dev_err_probe() across the probe error
>paths for consistent diagnostics and deferred-probe support.
>
>>     Replace bare return statements with dev_err_probe() across all probe
>>     error paths for consistent diagnostics and deferred-probe support.
>
>[Severity: Low]
>Is this description accurate?
>
>Looking at mxc_gpio_probe(), bare returns for platform_irq_count() and
>devm_clk_get_optional_enabled() are still present:
>
>	irq_count = platform_irq_count(pdev);
>	if (irq_count < 0)
>		return irq_count;
>
>	...
>
>	port->clk = devm_clk_get_optional_enabled(dev, NULL);
>	if (IS_ERR(port->clk))
>		return PTR_ERR(port->clk);

I missed to update error path (:

Regards
Peng

>
>Unlike platform_get_irq() or devm_platform_ioremap_resource(), neither of
>these functions logs errors or handles probe deferrals internally via
>dev_err_probe().
>
>If they fail or defer, the failure might propagate silently without being
>recorded in the deferred-probe debugfs list.
>
>Does the commit message need to be updated, or should dev_err_probe() be
>added to these error paths?
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 09acb186c84c1..2847304640f17 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>[ ... ]
>> @@ -536,11 +536,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  
>>  	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
>>  	if (err)
>> -		return err;
>> +		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
>
>[Severity: Medium]
>Could this expose an uninitialized irq_domain to consumers?
>
>devm_gpiochip_add_data() exposes the GPIO chip to the system. If a consumer
>immediately attempts to translate a GPIO to an IRQ via gpiod_to_irq(),
>mxc_gpio_to_irq() is invoked.
>
>This creates a narrow window where mxc_gpio_to_irq() can be called before
>devm_irq_domain_instantiate() initializes port->domain.
>
>If this happens, mxc_gpio_to_irq() will pass a NULL domain to
>irq_find_mapping():
>
>drivers/gpio/gpio-mxc.c:mxc_gpio_to_irq() {
>	...
>	return irq_find_mapping(port->domain, offset);
>}
>
>This can result in the consumer getting an incorrect IRQ mapping or a
>permanent -ENXIO failure from gpiod_to_irq(), leading to a permanent
>probe failure instead of -EPROBE_DEFER.
>
>Could we instantiate the irq_domain before adding the GPIO chip?
>
>>  
>>  	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
>>  	if (irq_base < 0)
>> -		return irq_base;
>> +		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com?part=11
>
