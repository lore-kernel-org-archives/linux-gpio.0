Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3B3C585E;
	Thu,  8 Oct 2026 20:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489626; cv=fail; b=JNHLURMuArRTRNuREKVbqEVdqUnPFMhdF9ZyjEUsgcKYkIJUpl+1xEfpqaudjvGBtrKiJllNqS/eBzECmHa7VcBmbig5ssNMQmvT1QU39QmtDdRPA7xTCiLhng/DoifSyeT/Hf4iGy8j2tBCo9+nvuzBPVJnePK4zlIUsAIJTak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489626; c=relaxed/simple;
	bh=LdybQNFpqP3MqQz5e28YP6UWNILt16NPbDb1SXJp4ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RidODVP+zGKack+purbyAHN75dOH7pWR0+kU+fHDGlzXkWxHsgycfBQuKCZmQLJF4UDqsKdKfX1g1wJLMSZDFjpUBT2aVt4eCJkD6qQf/KO9sp85Pmtl7n+5Wu48KRqbK6yW3pm+8LdNfp8kT/KNMKqH1wDtK33eK4Nc5EqIkbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BvAppBAe; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BvAppBAe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRPRD+kk8CLdRfpJ4jKqmpOxqGfgU0jh3h6zDqo4nmtPAXfu8cSfJEJ+WwReWL/34Si8bNH73FpaxVezkkBnUvYJ4nypKtGFeL19UBtB4WYOmcjqHKOwZE8Xe22eSuJxzsE+op3ghLPYEiJjGC/1aYk/9hkEUpk+zhvlBZKq34GfECIUIT8MC9a97eKb8hI2HquytuVhV3TCwYKxX3n0SdM5vR/ZJKqyV/CGG4ThFso1In2zFBAaz/3n8ttLeG/OgEZiHroAMg+1aORW4hbZVmI/bDmJDh9bTwRCeFapQdDjXvpNqlgXuoP34OUeQkUREbf2znZxpU2RvtZtGctWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NImjN8LXf0PvE05S8WwYSCzUhPMxVhvTR9aU+6XS0g=;
 b=ayUJIpG269L7qh3ase0Bl5vJiOKnJqTa8EdlezqAc9oCLuy8awvAkIRhRV73cAcWoBYyVpbEROGVL9iIYx+vyZQdT8qZlTB6v7HMKANsGOuVUeYzmJW9OroJq5Lh0IjsJ42c+SKtwzB9ntTNuS/6x9+JOE0DggRT7yCpJTy4437oI/SG7T32GiWxvFcBnnUIVuNCdRMahAIN9KFyqes1TK+4VwqOoBbHHZBVRDkfZP9HWs3s3I9Ch21uQLAmQog1BO4n4qDZDhySjz1g7LyVvssmPrbcyKxqEiUESQSQIWbnCJChGQGey1BfbbIXUdwah925jzMerZExbZQUyTUwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NImjN8LXf0PvE05S8WwYSCzUhPMxVhvTR9aU+6XS0g=;
 b=BvAppBAe2d323IGTAsALhWHljoPQRwnx+y+TdENkOM86W6JnzP04kgQXHkc3Tpe9WYDVK6Ck7fZBw8ohxxH9+wu7/JpPi11cwx+DjCBRd9BhIfQZ7X85w3Y+mt9Ki5d6Wiyfnikyrc1F8k3MsRKUYBJ2eOLUFMHXnLOBAW7uv+DhAorMvar8+l93uq+87HqwsVDqtDHoafKUGR7J4ejJBcKVANdFJjXgrVw4v9bYieZMgXTyhRdiEhJN91FBmUThmFOsong7h5L7hnv9Tmdqv2GaLlRdF9nzgDJ9AbSriV0e9PUlWxYCHxU+FEOk9qdzFVMzsyDmXS9Y4KlkpsXRVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 20:00:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:00:20 +0000
Date: Thu, 8 Oct 2026 15:00:16 -0500
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
Subject: Re: [PATCH v4 03/10] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Message-ID: <asf2UA7pXKjARgCA@SMW015318>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-3-c9f5a8b50df9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-3-c9f5a8b50df9@nxp.com>
X-ClientProxiedBy: FR0P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da0a883-35b4-4bbd-7dd9-08df2576c7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|23010399003|366016|18002099003|10067099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ABtfHWuBhok30ZUCS3Ke6+MRSbiw2RqhJ/9Vk8ACJ1JgrEbPgRTXOWffY+Da+adcJq+5FQ3jWFK+S0V4XMFICXA1GZJ5g3ZPAcooYruhbD1u0cjWN89g8nfYxZtZSL7pbRHnEuOiYDd7Rn9dPWg2anAc8KiV7nXFg1oFRbUVVZy+sNSNAXCZo5Deu+a6gk0xU0l/PDz9Q72U+/PmFPtH44InjNJywcJoy3wP9/yO+uLuGbgKe+etEXIFa6kdNUdthKiSReTQSek3oyQ1N0ZkjK+2AmxJhXWjHSl1AtpMEAAz6U0cjk1wIW6vDKNHJQI98id2E6VaPKJ2Tj8+tdRxhnlyGU5hyXLjAhQnR9ke1dvm9tNNTrE65XNc1hBUokIZ+icdwGh5Vn1kPFr4gz4MxdKgwjv0He4oGXNRDtJ7u98HIUBDxW1iAKAG/YAsw5L1cw9S6oE7ZwPWrJZ1h/8wgqRsJv298iuVKN5mqABNCEIH32Pn/qYGeKCDWIWOhMp6th5GQ/DxQqKgipCOLoCb5ihQ14hvzCXYq0ihFsJefD2KfBnjeFXxTzBoI0z8sxYOEFLIkUcPL6scN7O09mLSlKtQay2MQhYNvONrEHhODL8j58ExCZFWhSgR14gJDQO23cxOkRr+pMMkhnVSxyF/DcX4dAOoa6iDxdZCxA9WHOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(23010399003)(366016)(18002099003)(10067099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bN6999knwRORgQabp/T9gzXOQacwGTYZciYwbf2BM8+rrRGeNylOcDy9avZE?=
 =?us-ascii?Q?TSuTcb1lo6YN0BDCzW5xvfZGcNI7qEgb3hyogp6zvlnrBMwgyxKVSPm5aJVB?=
 =?us-ascii?Q?b2j6y8rKuyRX6fCQZCa61sEmTzNLViVSol81cilMxupv7CyqbvJ30OV3AlpJ?=
 =?us-ascii?Q?2dfnvEmdUUzRdYHOJjVG0kDE26SnoqyjukQF9xhvD0z8NJ4n2Ronx+j6nxSn?=
 =?us-ascii?Q?on0R7qcS9j+6BzKZdAxx9gaQAAq9+zEuzdCYZM6D330dj2jF8yknOXm99HZ2?=
 =?us-ascii?Q?4IkhAFzpEy8UvTntGbeGdBe59JbEkZkhuFNeI9estYKyFNnw1yn9rHguzQ96?=
 =?us-ascii?Q?S5dF2Sy5sR5oxB5Ws4GJostZiWc2XiviaIxtTfru1fEzeTNLgQ99lXur38YT?=
 =?us-ascii?Q?Janq4y+3v4M/ESC6/9jJ3y1g6LsoamjIzgm89MCtbiEIJBrYk7DyrEKdkZAq?=
 =?us-ascii?Q?UCw6gsVC247CRJiKxI9K3Be8TOGriEoelm1RFVG4fEt3JqDUrqr6kxbnjFw9?=
 =?us-ascii?Q?gMhg5904EveWF1jtNrfBnltrzJT0TanHUoR4nk5ZqoLm5R1i9v3ilV/MfqFi?=
 =?us-ascii?Q?VxJp8mCpc7PxQ18SnpnvELdJkGjGJYrC+6LkC37B1hk5Bdt4BtjbnstDE99f?=
 =?us-ascii?Q?1WFhccg37+U2UkvkFUD8DbFAnzWjmpHvjDXHf+jGeawlK3HWED1Zm5D7Hyk3?=
 =?us-ascii?Q?mbce8OTyX6zcBI3SQsb76h02N1G8AktwbgjRM+s7xIFqhs8Excet27lr6md0?=
 =?us-ascii?Q?Z6PxfCvR/nSgBpfTP3Bo0FlxcNeG6NYb+blfVZOs19SSVwCKeWAbjK99vcrX?=
 =?us-ascii?Q?CVNDRj4uQWFYOnPol+8Sg0v91a4PmvgwwOfy+UtoBuJRdtnme7Zn7xaAMZKM?=
 =?us-ascii?Q?ekG7QRz0zaA5Igv2ajEzTw0jlrh6cYKKdAqOZfPnFB17Mgr86+cTKnuVxDqj?=
 =?us-ascii?Q?n4aDpaCChBeyLgPH1WtqZZhQ447LjeIJny1Lc5Kjf6ZlqZcbA16OHjTjnU4x?=
 =?us-ascii?Q?bub34bsqEFykZxTaueYOIoWab+0K+r1S32fi3qhbvJ0dS6WRre3cOCqJGhgo?=
 =?us-ascii?Q?6X6T46/pEP8ESGVdpPesa6rocW7EwnoY1GpOevaNrhS84gc4Rfli2zfPDCE2?=
 =?us-ascii?Q?ZY/sA84w+7FSiyeiYMXCbord4bKrsIWZ6OsM/pk4Z0d0bBt8zh6xXw69FrZG?=
 =?us-ascii?Q?Y8s4EMPGPAQSlhxDccdqhq1UPd15PsrRXnvRkrk2F/1UZRA4fivzZCzo5aYn?=
 =?us-ascii?Q?jTGCsoI+YCuhxEvsURQZSuG74KrTXUB5JHlz8vLm/wOpWqZz9SOVbGEJ0X8m?=
 =?us-ascii?Q?DaEiLd7mEzNDcA4oewnOxMEWG7hdVvq0U2NDy6O6uCVLR93SRuR55r/6zmSH?=
 =?us-ascii?Q?BYPPM2Otg+aWSaa1ZWXh9H7PdwKkTjQgf2CTyGUvzknCr0RoGe1mkuiaa4zK?=
 =?us-ascii?Q?nZL/DsGLe2JmCN41IR1VazFtO22aLGmfOrOARlsx6zoUQIubK+SfEBDsWwgn?=
 =?us-ascii?Q?TZa66d2x4Akvn79ub9OUrnRdhginTdy7NopArxq48UsRK9ICqAOJMQJvoKxx?=
 =?us-ascii?Q?Pd8N0yo1+OCGImKw9Ggh8GiHgGnv95Fq4CUD94hpEDGh/eJEDX1m74/xN/xg?=
 =?us-ascii?Q?WIRf4d7eDjBJNRnTDMaIUC+IFda3vxeWpt/cjFECctSnddTYDHyDBmLq/9Q4?=
 =?us-ascii?Q?F/e298DVlhJQXLNwFkH3GEGGhwuPr+2wO9ejAg2VnP+GLoIkcsRwHmcGlrY2?=
 =?us-ascii?Q?tAZGxfmnOYhe4G7qB8vrt1PonTxDwholXKJyWIUKBub03lH4HH/M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da0a883-35b4-4bbd-7dd9-08df2576c7ec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:00:20.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8igz2/SADdmevb/WgReJUvMGnsowoJgJsBlU4QE7JKzpBGvSblM/Dy79i0hVW7aM9FaEprtSPtoW76vVMIDKgqIc82o08LC+Xv/fFo5JF4+rW8CTBoMF9h5j20pHGjl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103

On Wed, Oct 07, 2026 at 06:44:18PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 627fff6f1886..1ff5c2afb2e8 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -593,22 +593,20 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
>  		IMX_SCU_WAKEUP_LOW_LVL,		/* IRQ_TYPE_LEVEL_LOW */
>  	};
>
> -	for (i = 0; i < 32; i++) {
> -		if ((port->wakeup_pads & (1 << i))) {
> -			type = port->pad_type[i];
> -			if (enable)
> -				config = pad_type_map[type];
> -			else
> -				config = IMX_SCU_WAKEUP_OFF;
> -
> -			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
> -				dev_warn_once(port->dev,
> -					      "No falling-edge support for wakeup on i.MX8QM\n");
> -				config = IMX_SCU_WAKEUP_OFF;
> -			}
> +	for_each_set_bit(i, &port->wakeup_pads, 32) {
> +		type = port->pad_type[i];
> +		if (enable)
> +			config = pad_type_map[type];
> +		else
> +			config = IMX_SCU_WAKEUP_OFF;
>
> -			ret |= mxc_gpio_generic_config(port, i, config);
> +		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
> +			dev_warn_once(port->dev,
> +				      "No falling-edge support for wakeup on i.MX8QM\n");
> +			config = IMX_SCU_WAKEUP_OFF;
>  		}
> +
> +		ret |= mxc_gpio_generic_config(port, i, config);
>  	}
>
>  	return ret;
>
> --
> 2.51.0
>
>
