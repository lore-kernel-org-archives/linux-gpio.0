Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793110372;
	b=Rq84npvLvQriH2zKmVKK48iHdUnMT0xKPofnubIh5OJByl0YMiGBIfcxqTUhXjOEqG+U
	 Ih7TCMuiZ2zY4ZthBfTLvQBoQxsylob8b2d5gogxpRao9XT5S+175ECDxNZhrq3NBpUoP
	 R/Z8rWqicFbFVLuzG+UGgjDMfSboUcKStXkz5gWjJXEDdv9vRcFfB+bv3DZ/z24BJ1pgF
	 ZbZWJpDzx0g/u98TpKEaPoG45jIIFk/6M0WYnt9tGLHf39LuZSJNWfL6Sp0n2+fyZy1vZ
	 BJLMyqsTWSa1aSH3+JMG99HMEmbV72o4Dw4iu0OfyHdhXXPKJ1J6IAqZXFbKai0hZDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110372;
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
	bh=BwP3RJu4HgJt6YMSxJ/Kd5vPRNnlN/UhGZxHR8D5J6Q=;
	b=typ4F43GjGG1k6nG5hmKsGh51nHHwWkvsyycuDopG97TQuBVtPPqbF6FLpQmL0/Ml9JG
	 OuLz5tSmU/ja1bBN38Jy4iKpCOEYuQ53tlT7iS3PuIg6l1Sd2Ecip8riNo66SzNmAVuX7
	 HCKaIrlNSo2d1rY6OumHsMOHpWoKLgo2Lc1wZjuWWDF+aj9CYL6FEOwSvyyq7lIhvydVl
	 ECvwQotlBdNxYyGsnQSVPlVF6utopbQc+sgW8x8HdSLLPbSYYFYSeFX7BsWcOkiym3gLl
	 i1hjZakze1f0Xz36SRTIaxo4pG7UEdPUHAMDesSV57EEaKX6YPm7arGTpkWC+EQqxLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l9x8zQug;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.23
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97954606A31B;
	Tue, 27 Oct 2026 14:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97954606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l9x8zQug
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osjTbkji2hcMzY6lwyni4lBg/kO/JF1fDq+Ek050JKtznrhMPPm9DLlZUCxT7UPWdpRkMfZxsR8nlRbTrhR1xTGca39psQivl5DrizYguJPEwzZfTjcPiDRdxCZy/Xw9R1fttZ9K6kAaF43w2gN2cbI6RVUhhJFsq6+BfF4pCaL9fqr84yeN1PVW71mF+iF2dcNvv/IyBwa/N/Satfi5MTF8wPrdyg7LfaALiUz5YW7ShmbR6y6XFdSrUuTJI/rWerI59EfRHdHW2nrCKq6k1uoOOx3PMWKGksaErvIzKfT8JhUGj1GWA04wHmtxw1XPAxRjN+mcQdNc11uz6DcVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwP3RJu4HgJt6YMSxJ/Kd5vPRNnlN/UhGZxHR8D5J6Q=;
 b=Bt74lfzUbt4G2TJC1qaQqkSglqqKbqJ8tc+hKkH6/GAGIaMIZkKoUQobj7Ahqm6mnyWZuWg5Hxvjmh7qg4Q0rgjJK886scMPowHDIe4n45B31pTsbIa9qLtcFm/y4PBcIbSz3Q2PoJLiX5WOz7NdZkW2IKSFpo2yA0/959vJ+pv7URoygzsoONPkI/TfYUE9xITZUnjQ2R9gP9FqX7ezooY1fISlAnzM2qftNmeSYKvg8C/EmXyph9/3a/44UtShDQ5qb2IHPGoPLKHPB0RJ0LFLt0FvzUeCEnZKdZeEP9fFRnl8hbDRFiZPL54JxE5RizdOTo/lheeyDjKYyVV7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwP3RJu4HgJt6YMSxJ/Kd5vPRNnlN/UhGZxHR8D5J6Q=;
 b=l9x8zQugY3VV0JvHX/A96jmixAN8kQnmwOISliFNMuPKalrbfb6IysECtVBi7YbV35grVjZwHXhAnH4cIQDxOKdaXhMI4FkMyOx1u/pjMF/KaqxDophulw1lY51Zp7Fxm8a6PQbLkDKZGWNMf1pzK9j9qYsDtJQAbBEkpYUoRJQl42NAjZbi0+rQheJRNkLpVH6Xgik2au+JOy9/PubDtvHqiIwLFkib2H/NBLHpMTOHB3x/1PAFeYl8dRKjja4crpzPnwqJYjVYEiyyFIIMYTfPlAzJ8b9NXM9DMXv1vQdLZy6eeBYfDmVK08S8Cs8ZS8jE4K4o19OCTHw3iwZCoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:12:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:12:31 +0000
Date: Tue, 27 Oct 2026 09:12:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 07/12] gpio: mxc: use __free guard for runtime PM
 cleanup
Message-ID: <auCxR4rrJxdIqlx-@SMW015318>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-7-7b602d70c149@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-7-7b602d70c149@nxp.com>
X-ClientProxiedBy: DS1P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8b9b27-a353-43a8-594c-08df34345702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|261026140227099003|4143699003|11063799006|56012099006|261026121527099003|261021123027099003|261021121427099003|261009221227099003|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wRrKNjt5qZjmJRkJKoBrsmIw/ET1IoQSxW3WaYMmU98/UcbFyPFougJi7CsAa5D1VLdG6ccCbW2xGk0n9JPAcXEjCttksNYMbnlFmZCf09h2wE3Mkcj46XOgt5EscdgJa2Jhocz8VoBZNO6v7JfokggAKxJzEGMNY/oLqUXzdZ7doyDCjvGavwsQvDrHVN6xUDDemm1sNa+pGSBSP/fLS/tiZmK/ut779fbXesn7+ukDesD079+9rNwPxRwAqHtTjL8jX1JTfhYZLFXNQfRmnz406TE3Z109H59pEG4ej7xQR37eX7QqENMKHMBOVAYQTDElBAQHsgY8BafRbeRijacRvKHjjik9DR/hPyH76pXR1l3N1pZu3wDAy3ysLNZikoYm2Baemu14iLAWcsIzfFwO8GQtRAvAeorRZsx9oc2Bnip902dsePznD8NR+9b+8Vqe55gIqDXyTKAAeuU1f6Oehbf3V4otvUi6O3b2WEkrXxsceNyHsz3Jyw03VA4bkBMu1rayYAy/9HbU+vDr32PIB3Y7O3fvuOPdC4eu0ec/HSyl3eaavyhOvUY0AFu5Wc6HjeclSIQh8Mg+AniL0uUbuWlHoj4UPTA71IGcddFwngvGsQK6wk4g/KYq2f375euHSK0ZudD3mLqiQkK/aem8mgVtTOZDgOk8Jdemylo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rMWcxWd8RuLxhYr2RLc6WjkwijSut6kPx3e8c4WeETMwKjL7U4KBvCQsZ2MA?=
 =?us-ascii?Q?TmGh+Jf5aY/ATHw3MFHeUX0mljzroTLPFfjdG3BMJUgi1UQUYWxp1idFQD9P?=
 =?us-ascii?Q?SUH4Ws8Q2sdHpLDyQ38+TnpOLiUSPZm16XhjThdn9frNCpCYeJPbwaQF/OpJ?=
 =?us-ascii?Q?NCqaEvzaRaLL1S14hYuU3IQr8VER6mPYweg34uDL2/ESp+fMjYOOoPSjKCV3?=
 =?us-ascii?Q?bTgbsoTvBXrzJiz+oE+Ii5W6ON7t/9CCGABbuS9+C0hdLb2WsIz1nuYm/h2s?=
 =?us-ascii?Q?wXr53pq1U7rFqqN86v0Ya2YfBYX6QZCv9GElt9AJXoQSwEAfn6T2ffhnhsT8?=
 =?us-ascii?Q?v7FjfNFHoINGrZfVoU0fMIj4P9zJJdKC7BBBatvO8rSPlL6oUfZhj3SwpVYP?=
 =?us-ascii?Q?FyuAShmFOiGcFDT4Sjyvx7cpGYzW+OcOht6lfU97FtkWM9Vo/BnGQvxtwOc/?=
 =?us-ascii?Q?VAowhKdIjap4RHuDg1wsd2HpWYysQPEqdtiPoQ6HanQOyZipOfeQsZMZVCKA?=
 =?us-ascii?Q?fVxLnFTYwg+As9YQIevdxQD3CC0Qsqhdo/xsdujfT2nECGXnQTe2iiFiorAT?=
 =?us-ascii?Q?Oh2/u8JacYny8dscKnjALzl8cGVnc+hgLSysH5+bf7qVjgXsWTxqIk3CtHmW?=
 =?us-ascii?Q?x4ZZibEUZXl1W9trBbFkWUPHZ1clz2di9Ks5ApuMPZ7o1g5OklBZ66iLNld3?=
 =?us-ascii?Q?EpjQGfTa7Sg4b4eTYpzhZcQCbCbb3wtygCdCVytpmLRS7fmzdbvtf8go82UP?=
 =?us-ascii?Q?EVpzYm0EcTXxxcvq48C2C9THoUx6alyLpbb/nFNkpEpBvmCsVCBdeHu5HnA0?=
 =?us-ascii?Q?jWC20JYJbtAc36aBYUypDYFQ3KYv3Chyft+oSg8xqGA66CA480KEv/GM3una?=
 =?us-ascii?Q?2XYCdVLZcStz6a+TY7Kg1lz1Ygpslh8c+RO0Wgm2B4Z90Fc/C0HaHXH/yBT0?=
 =?us-ascii?Q?hYyY4fO+Kz8ixQO9cHfolvNZQB1K9avBV7kGfzSsvShcBj2iFTN0OKa+2juE?=
 =?us-ascii?Q?l1a5dEa5cKLUoU/d+q86pwLSUOhwJNU43svmzDW593YP3m5p9LUwtTVRhOId?=
 =?us-ascii?Q?a4TXcPbI4vSuov4vwnmmRwRzjyYIdjdEcyATPRUhmyizjnuQoH+CsXhi3aJW?=
 =?us-ascii?Q?Cpex58+b0tg/2iI1Wb12mEeh6vYNetV16eoapAjd9zN2AY/VEIZBAgiOTGlS?=
 =?us-ascii?Q?dyOTKWXozFcFiz/jDT/+IqlVwAqSw0QXOrPvtNE+PL5Qvu2QAXygMXYNS4rk?=
 =?us-ascii?Q?vfNgjJaRigz5IGTHLRwPCkCrT2s93JhTBj4eC+jThk7YdTOcuoa7t0CkZCKJ?=
 =?us-ascii?Q?3lszbzPIttZuM39/FkYIpLrvZglE9jJFkeAdBbD2OTuA8TA+IPU4dDfuSOyS?=
 =?us-ascii?Q?a9nswXc5aPB0NnOkcAitdFSVuJo9dHnlf3MFn7uyGZ4/Hgh/94TuYZlgAF56?=
 =?us-ascii?Q?o/uyefVbLVBT2EN9VFrDPlaiGGsUFIVQya8vI2eykfy4OMEf0sOr0jp/riIM?=
 =?us-ascii?Q?bYHZl3J5pYQ3CryjihYi986nAN5AnTgXjr43eL4DwivesRqK+W4V/YNiufTe?=
 =?us-ascii?Q?SQj8WpLoAim7NXHD9R35V+eqO5XwUsV7jJoyK+G4acQy5gEp/CYMKq/njm2b?=
 =?us-ascii?Q?W/hbck1CEg9Zzd6toekJ6S7qE7+M2AB+1ins9fO/yqbuX8fbPWCzfjIuIR1k?=
 =?us-ascii?Q?Rcpdj7x2tevsM3pHeqQBiXRKXxNBBx8frY0ff8e7wUxzh2V6io0ah5Z5wJC1?=
 =?us-ascii?Q?wz6Djtq0p8yji7a6O/Bj+anUGYoOKW+7Es+sb3nvxDtexfXlGXXY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8b9b27-a353-43a8-594c-08df34345702
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:12:31.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eOGAuvsf5V1tezagvvY8Lu8o59C309en9MxjOUw2byjnz5nNpdFwRLDn6x1XVxEqr/FigByzhcDXjYIB0Ao4W4c5MWHpCQBn6bkvkZBb30f3zgh8OhE577JR8NgHYC9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179

On Tue, Oct 27, 2026 at 08:09:34PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use a scope-based cleanup guard to disable runtime PM and drop the
> probe-scoped pm_runtime_get_noresume() reference on error paths.  Disarm
> it with retain_and_null_ptr() before the success-path
> pm_runtime_put_autosuspend().
>
> The guard keeps the required order: pm_runtime_disable() runs before
> pm_runtime_put_noidle(), so dropping the reference cannot trigger a
> runtime suspend callback while probe is still unwinding.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 21c74b244c1f..68857730b5e3 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -28,6 +28,20 @@
>  #include <linux/of.h>
>  #include <linux/bug.h>
>
> +static void mxc_gpio_pm_release(struct device *dev)
> +{
> +	if (!dev)
> +		return;
> +
> +	if (pm_runtime_enabled(dev))
> +		pm_runtime_disable(dev);
> +
> +	pm_runtime_put_noidle(dev);
> +}
> +
> +DEFINE_FREE(mxc_gpio_pm_cleanup, struct device *,
> +	    mxc_gpio_pm_release(_T))
> +
>  #define IMX_SCU_WAKEUP_OFF		0
>  #define IMX_SCU_WAKEUP_LOW_LVL		4
>  #define IMX_SCU_WAKEUP_FALL_EDGE	5
> @@ -487,6 +501,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  		return PTR_ERR(port->clk);
>
>  	pm_runtime_get_noresume(dev);
> +
> +	struct device *pm_guard __free(mxc_gpio_pm_cleanup) = dev;
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>
> @@ -562,6 +579,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  	mxc_update_irq_chained_handler(port, true);
>
>  	platform_set_drvdata(pdev, port);
> +
> +	retain_and_null_ptr(pm_guard);
>  	pm_runtime_put_autosuspend(dev);
>
>  	return 0;
> @@ -569,8 +588,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>  out_irqdomain_remove:
>  	irq_domain_remove(port->domain);
>  out_bgio:
> -	pm_runtime_disable(dev);
> -	pm_runtime_put_noidle(dev);
>  	dev_info(dev, "%s failed with errno %d\n", __func__, err);
>  	return err;
>  }
>
> --
> 2.51.0
>
>
