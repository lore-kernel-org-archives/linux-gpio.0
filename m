Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371D1D798E
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 04:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778210; cv=fail; b=LWz9glFK0Ben93NGLmSO9teXD9Jnwj44+nMsB4Sef/746T2F9kzDtV9V45lnUp6Yj4yBKKFfzJd+R9aOwi5GiT7eaqRqhXCExShlOKjn806H+vE9AHS6/9cqnYkIAbJQG170Zs3a+spuhJnc/tPlku+QWUhqPSKzYLPMXX7CTno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778210; c=relaxed/simple;
	bh=YEkYh8b75rQr14/+iYReb7uu0S2tyDS+cWFZ0H9SNbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ElbJtgdm/fpN38t0jiB4fSPjYIedb0LPWpkOMHQ1L+1O+mVctNEzL337+ueOOa5E0M4jxxyiFdA99S8QCl4aR1zIndrcOkQPfioPRjcXuOreNDzdzqFqdDcsGoJOqGVHYbZU7tsjc2z7qTbXz9D546/yuz9hLQwxsm4NnSkTfyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=suzPjP62 reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="suzPjP62"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7llccQwr8Dx0rgBFXCGYSXew4MOD2+ZAxRYhBp+6Otp6QDs65w1Rvkmck4oyUyfvCs1ZJJNmmjq1QxhIhfPchpwaf29BmAsamBR0kNAQQ2MeMM2NRJkzSd57CJdbm0HU1hILvmB+nm3rVvbr16kQTn6DvvG6q4ligDMRGUFKC6pq3V4OKWoFtLZY7QAeVOv0T7VnRBHXBMWMwBacDEvqeoX/dTl4INeKYfuVSc4BG0KLP7Bu3wYvuo4Qn1tFzLgnDEto77ueONByUVQQTvf54ZInXFlYm3fJum3/GZpPHYPVwZEGH+Tg94sVd8e4T/VXjM+w8/iZBN68HFjMQludw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8kg7+vIWks7oek28fxtelQ13v/vkxN0Jd6c1g0zv0w=;
 b=dmguHNEQEr4fO7m5O6MQNlU6mI9LQ0ES3w6pUJr+6La63n2lJRyQkyr4C/gbeG/GQmzoqHyAaNmQVCObY1exShf8ry1bzZTmKBXCeyTzGIjolhAzoIxw8jTlG17YTvUsPtRGR9JNzghSU5HzVcaK+G6l4/Vf93hVpa1N06gqBkYI+93EpKuN3irtNALIhdLa3Gr7PQNtNUQHWwdBZg8gHAmAgsXyaRodaB5qA8TJZ/BzPCIGPfIJSocdy7WpY16WeisVJzIZr04tkBMd0zts/ylpRKA6XT/kKut+25xRd0gsmMiJcRdsbOYBGqqpo7YrN9pqf9SNy0UnYkHOKQtmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8kg7+vIWks7oek28fxtelQ13v/vkxN0Jd6c1g0zv0w=;
 b=suzPjP62405JXkfEt9JqvW8x0G2DcntKdmC96nuW1EsqAifPrtKK3rya9Rbxuf3riR/ILAYS95lmqxUmNE19pCZvSxxg/G5QNq9sQykjf7PEdRbjP/laVb7iv4qvDzVbDcO7F7KZg5V5KXvpWGyZBfym++WBdvkaZznNjqhZ4q0rCmM5Rtuf5uSx7azuRsxZJdy7IfsKFKM//ul8lbNsWMnDiRZ+dtaOF7y5rJNBFmq00qQ+pVjpEj/Zavt4aS4Rpvr4acvW/7mgYIsA0RB+MGf6I0CkWfPh9Aum9t8LGmiNJv7COXPYcbdm+UCw6E+KzpmlAEJ9Du1/rh0zxe+T6A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB8707.eurprd04.prod.outlook.com (2603:10a6:20b:42a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 04:10:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 04:10:07 +0000
Date: Mon, 12 Oct 2026 12:14:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v6 01/13] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Message-ID: <asxesWmhPRSeI63z@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-1-cb47ce2ad758@nxp.com>
 <sashiko-outbox-167213@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-167213@kernel.org>
X-ClientProxiedBy: MA5P287CA0229.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: d638d370-d9c6-4a72-3710-08df2816b327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|10067099003|261009221227099003|261009223027099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7w3rdBddJS1gDPRiisMiB+PBTyjPT5+BEd1chxO79Jil7K2YtSuo32CUIx1PT5zckvBjVb/xEjdTeefjdkEP7B6D2UbmRWK1rmPXAp2ShZLKyNq9RRKvnZhmlHgiiVIJbRjkE+Gs/Y66WFJa13wV1TIJEXaa05NvaPv9Bg6jfaQCeiNcbXHA+FegFUzDwnsz77+xYecqzSErd+2T70mch9aeZ+bUWkr3BxtNUyAlmnx78Dl3ca9r7nmG0QJEbs3VngTvW+4FSEf/EyWW+8tg6+60q7yyhZ3s4ViAqOu6IWRwPnUIOpf9ULMsMBZu+KufRfzl0rfSwxbDUbPzLcQm36KamhL3L5GATG+DwHXPNkCpG3Ta3RjCrtypE51ejGPt9OyQ524Nt/oXcxohQYkq9DaU8lWzZFEheb/yvBCnPc2bxk6TxT+U+cIwBNHdYkhKb6pUxWp40ckdJde3DzAatGUQsOA7qsz/cFe6dkCKeBTy2YYBOlf5+sTkVPb6dUtLY1uw8HVhpbYA2EI8jIJKTcrSYobH5Qb83SAiH/lhJonvZCMi8em8nmkB+LIHU45YmLO+3RP0QYGTKTur/mr9r07I5fMKWR5T1OuTzPsZjlw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(261009221227099003)(261009223027099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?IjMSLFGiTwJknL5VIFACqx2jJ86sOcaDtlgiBdj54Ch579K3IDmKRL2lBX?=
 =?iso-8859-1?Q?sezhnoseTAAu5j/77GmaYOq00tZqt2tiF1EsRaY/9vZn0BMNPuxHwlNTqm?=
 =?iso-8859-1?Q?DLkW0sw1tEMbEAjz/PpLUaN8LF4Dd05AEP2kbDRWrVKKK9Db5ByDSxrFMP?=
 =?iso-8859-1?Q?/e0Ty2dZzgUM4Pj2TyOkBVuoFvF49ngIOCQKy2dPxq7ntoLtiNNoCli5VJ?=
 =?iso-8859-1?Q?NaDD5SQPrHWpVwWHWgQQmNopanwvXK0CC2uyX73oG8Tld0iG9AZ+f0tqND?=
 =?iso-8859-1?Q?J84MftmxLa8XYGBqsGRc+zdm03DcRShaIoNaO10Vx2NRAJqGbRr13IR8pl?=
 =?iso-8859-1?Q?BrpYKpmDJHv3AU1t3w7KVhKuDrIhfZ+AAfOxWIzAfoKXsEQ2h9kM1Pjqln?=
 =?iso-8859-1?Q?2pOJfJXHe+nbk5apYWMXIr17clNLzlSfjvgwI8dXUaJyPn23VSR4yvAxaz?=
 =?iso-8859-1?Q?/6MUYwVqrcA+yeODndk6yEYYiF0VZd4HSTge3JT9VVcZG7MfnMyP5jahTG?=
 =?iso-8859-1?Q?aWrj3MljlE3gVKe8UGI5mGr7CCIyGgXck7txqDp3iSHowt0N4a76wsgg+a?=
 =?iso-8859-1?Q?2ljZ/o+ML5Y0nTaa6zcVPx8p/k2XCIrRxfAa4S6WpHg3/rzI61KDLAo+8k?=
 =?iso-8859-1?Q?J72wnMMcgJrM2r4x1Xa63hRfR6WiaBr0gsUVAh2TW+0rgCTMkAPqMmojBt?=
 =?iso-8859-1?Q?TX2Oo7kgRe13vSbEdJ4BshP6Qmgm+raD0Y02YwdavK43umg6XNd4DdL7Tj?=
 =?iso-8859-1?Q?GQyH17qJubiHn0kvaBNuyiFyP+2VautZNcs36SsPh+HE+zPLQqOOSAFzql?=
 =?iso-8859-1?Q?9H20PaHko8CTFKfWs9p7rPH0owZbTk7V8xMG2ZBKqv8uKFJdhnYmQhX98s?=
 =?iso-8859-1?Q?qttZBVH6vVt2/3mV3XMWfdavud6aTA+f1z7n/S2ttPSfEC30orDNercPV5?=
 =?iso-8859-1?Q?k+5oz6PMJZjPuXAH+5tzwXDL0xaBHoaUTfh/7NgJD0FDDR/7i65Zj43MPD?=
 =?iso-8859-1?Q?QTCIvWAiD0B+nG1mhCG+cSX5LNOLrN2MwSqdGkF61lXx/rago75iBH0rWW?=
 =?iso-8859-1?Q?tsY3oLxa1HHqB8KltiagbiPqKylh1/swz+JUcTQiwfy+rwLegKYwexWK6M?=
 =?iso-8859-1?Q?U7bVPmIfeZ9Jf1bKKZBVD1Nh9HhUtt9lt+Mt14GsLlQzMriqhsPJZ0ygbV?=
 =?iso-8859-1?Q?IMMLdD3V8+EBgl/ZK3Zh0/4A5WbEI0KClbExl/mcZedeEyYA/8IVE/k9yx?=
 =?iso-8859-1?Q?oP3tJKd/hht3SPskmo/FnQN+2qdT9uS6yK1cOc/KM0sBvEIgbrRXOChkEv?=
 =?iso-8859-1?Q?SOLlnx4J8AZUwLhsFaw0AXOIxnwf83ZmbIuPptQie4MDfcEor/BsustARE?=
 =?iso-8859-1?Q?T+T89c6MbLQvhsR4lBUdz80QUs+bi4AFvJxz/fKeTjMg2JCtfDbKO4YUF6?=
 =?iso-8859-1?Q?Hr2hKrAmW5IkTyhpFzFlYGqhtjXnzQy0cjogyzuGyt9QQF07O9w+gj6s/l?=
 =?iso-8859-1?Q?yrhpa1z4r+4wz+8O6SZ+MD6bi3ZTHDX0FvVnIImNWKYh06bQaAiZ7MulNe?=
 =?iso-8859-1?Q?uCM9/7c0oVbqahI6m5mG4Y5ZTO3cZUnnaghI2mAyFsTPzB/c815rpxjU0y?=
 =?iso-8859-1?Q?iqJ1WuuZv48bOTI+egeFtp1pLTjyx8V8DcKDy+UVu3FQHIpGx97sYqUzfW?=
 =?iso-8859-1?Q?5auDKsVFLaVPnsEKF8ZIt2/JQsEjIZIHfx7xh18StlTSPhvcxSybJZg50e?=
 =?iso-8859-1?Q?MDcIZwjQ+R+gFo30FjXsDsntynRl5VrU3pVewrk1ddwByTa/2v6P0oY/aY?=
 =?iso-8859-1?Q?IPhy1ZZgew/+u23WBN7HkDVvmuLc1Y7U8ko28XinRhGlNNRtOjvm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d638d370-d9c6-4a72-3710-08df2816b327
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:10:07.1154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWOQ2mSvB75XWSXKLaIpMGtfULucLzoV2XpV50vuS+DMxpQnN4g+yIWVyU+1G3SSJuJXwsOJ/XEzUjmJiJDFtHudEaw78jvAg0pB0oBS6ZBlL7Uah7Ve/Wq7uBmSRK9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8707

On Sun, Oct 11, 2026 at 12:05:47PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] gpio: mxc: data race on mxc_gpio_ports list during concurrent probe/interrupt
>--
>
>commit f3eaabd7240ce61fd8c78877e57457bbc5ad25e0
>Author: Peng Fan <peng.fan@nxp.com>
>
>gpio: mxc: fix race between chained IRQ handler install and probe completion
>
>This commit defers chained IRQ handler registration in mxc_gpio_probe() to
>avoid executing the handler before mxc_gpio_ports is updated and other
>probe steps complete.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 7e2690d92df6f..e05f276a50e8d 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>
>[ ... ]
>
>> @@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  
>>  	list_add_tail(&port->node, &mxc_gpio_ports);
>>  
>> +	mxc_update_irq_chained_handler(port, true);
>> +
>
>[Severity: High]
>Is there a remaining data race here during probe for shared interrupts?

As replied before [1], this is false alarm.

[1] https://lore.kernel.org/all/asg749Hk%2Fhaiis%2Fi@shlinux89/

Regards
Peng

>
>On i.MX21 compatible SoCs, all GPIO ports share the same parent IRQ. When the
>first GPIO port finishes probing, the chained IRQ handler becomes active. 
>
>When the second GPIO port probes, it modifies the global list:
>
>mxc_gpio_probe() {
>    ...
>    list_add_tail(&port->node, &mxc_gpio_ports);
>    ...
>}
>
>If a shared interrupt fires concurrently (either preempting the probe or
>running in parallel), mx2_gpio_irq_handler() traverses this list in hardirq
>context:
>
>mx2_gpio_irq_handler() {
>    ...
>    list_for_each_entry(port, &mxc_gpio_ports, node) {
>        ...
>    }
>}
>
>Since the traversal is done without any synchronization or RCU reader
>protection, and list_add_tail() is called without locks or RCU primitives,
>could the interrupt handler observe partially updated list pointers and
>trigger a kernel panic?
>
>>  	platform_set_drvdata(pdev, port);
>>  	pm_runtime_put_autosuspend(&pdev->dev);
>>
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com?part=1
>
>
