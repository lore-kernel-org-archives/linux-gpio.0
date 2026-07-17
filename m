Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013064.outbound.protection.outlook.com [40.107.44.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4ED3B71CB;
	Fri, 17 Jul 2026 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285963; cv=fail; b=db4u7f9W2nFSEXm33mraYtN56AclVjp5dIc+aSh5gHnU6ktoLv0iaQiCSSNCD7AKoDw3GRJGSlwr7VAw7J+nGSdl4se/GsDD6Ve+Ho/18OsY241Nj6nEmceIgwL1uulUX6lc7GNeUd+3zEl6vfxgRhe0HCs2fjZKZc69ThVdlFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285963; c=relaxed/simple;
	bh=1qJTj4d8mw5zPfZbIk03jmjyrx/wlNf3Q30ONWEO+5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1FDUhYu2WOOzX/E2bJkqV9rHyoBhlMG3nh/jyHgSKJc73ERgb5X2VacAPpI2MBEGLeP2s2fTaT+k/m5LaSDhaPlugdvU7JxMzK01ajwl5U2HtiC7nSwwmFDsWsXLLAoRp3V/2q9DathEfHoPMP5FH/FASj6bkevpoGaLRTg1u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RIxDz5n9; arc=fail smtp.client-ip=40.107.44.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RIxDz5n9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otCuWDywUENlecXq4rFV6sI55RqinDFf41JGLSj9+sgNH9TXv5gycX2TIYx5SIHoQhV3gsrZDBR3XLs0xagOaoICoj7tfMmjADBPK6AIZRhpbDc6gUvo70YJq1ANxZbQZrU2MkzEFlkQDLmwRJJpaxGzpOd2c3NUqWpQmeLxQBHZUMO9e6G53Voqv2zDXe+RCi0sO9FNQVc+dr2Ny+DwlkPAlbYTkw696se8Niky4Iww+UTgLOReURclGXXZwh5Ts4oPQtcQqFJw1HxNWbYoxeBXyShSpMLK7IrOwZ/2qG5PCQc6eanzi9xaUnuc1Z4doLSPSBMuPxAXWUf3YkbSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8RYD6zSTBGTpuRoftwLyXV94IFA2vFMBxYhdYXkWSg=;
 b=UzEAIijrUShrRO5Hro621RkXqXgBhLHuGUFc4/6gjLrl6DAy2Mccc/9PIU8u73nSiKWG7h74cSDMXoRFMry4j2fiLsjINdr3l/zr1SotsS975Gjpt2byQTZ8y5+Ln9lFMEF1Y22E3gtn7Es6/+vCB7tsyd4vTJox+mkCZaYX/LrubnDCwnfgNmXY5qgvOh6aXi/lVeRU+BUGKQ1JId1x/dRWsTt20LA+dXwgsIBw9DncaHkH6Ly9vD0dh6YP541W//j6/sUam4dcb7NdLClzzYIAACPQCY5DwZbJdLQc2X+Ei3s5Xc43sOh0aaMHv0EXoFBAcck5ASKUs7c64j5cKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8RYD6zSTBGTpuRoftwLyXV94IFA2vFMBxYhdYXkWSg=;
 b=RIxDz5n9azoBbEIGxvzQ15TZOyYyG8CjFBJ9gD1D+0y6uqtdkhWzvLkLdPg/Jm7Yw7zcOaiLdYq9Hs2XvOQRiruROPjzxzNzcWuRGAIJrJZ/CGheMzuIluMQQfPaTw4yCuZSqK5Eqt+rjz65GJfWud4kbL34MVEL4tZUeESYo2gNDgFVTUVHevB0Jp2ZX3LHhh2HvfrcgbOBalwswzOhCnPk/QEmVJgE/oLYDrPlBcDGRvOWRNDBmWVo6ibAXnlpLXkwuFGeUxEfDiy+fIlwHm0mDg0/sIfbSHod1yp3S0SrjAf6NeUwZ3C+H1luM9cE/ID3FOiEDagMNLTkO5P1oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by JH0PR06MB6702.apcprd06.prod.outlook.com (2603:1096:990:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 10:59:08 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:59:07 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 3/4] pinctrl: intel: Remove redundant dev_err_probe()
Date: Fri, 17 Jul 2026 18:58:45 +0800
Message-Id: <20260717105847.131359-4-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717105847.131359-1-panchuang@vivo.com>
References: <20260717105847.131359-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|JH0PR06MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: c5129f39-300d-44e2-d88a-08dee3f26c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|6133799003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	w/bl00LZKu8BDfK+osPq5N+Lm4Aim9MpDIZA0L2VZLpXVfEXJ6oNktv0ZKVRUqX/epXsJKm3N17g4JqlFoTvJmgHIBJ2i/YA6+Ca+LZOO8+cfSEw80ReTGtIj5ZX4fUP/Flo0NMuI9y4fvbap3I1N8lZeIKRxqkpDkL8481gnOp/qM9RCcsshdIf9zIzUDvqS/unOUbEO4T6H4sSXFy8lY0E1Y+suOJ3zATp+h60qWivQnAKCqYWPXts6E+RVqcOoQuPurEM7qVLoi3rteul71coJSNZuH3GVDwwNpZ10+Ch4U8ey144bCHKy/Zd0NdPVz11Tc1USzsGLHcQFMNbsvcdSZFNHzCN0PWW1YuOgFh1aV9eHxZsDAU1qEZyu9UmFZQ7CBO0l484ZcUwBFPTnb+6MmOomIiBECjKHshgJSuX/+NcIp1mQm/asBCpfV01/hRjZHq29oGVphnNokHy/kgVXHUU4QYgnDhwoufnhFBgq5WZecOJF5urcIlLDDQMJFOhXlBWckKVaM6QBvDSCQEfW3HcLEEnP/8nz6qUqO1wOMDKfrgCZyPnDzLVVk1oyCYjJA1cX7Josi2L6piIf2a2453b2Y2jYi8u8BGQoPEMGMKZ0qRmc6YY3FPWPC5CvgJfXBTvvB/GCIbu+TTxclDCisHN1NEpsza8Pa1eaLHT/GMq4vccpk8l3M8XsKDWGiz0WkBWBgYbDAEbKUePU8yJ0uLBNg6Q3E1lGZqsILw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CpYSazIkOE/hia1J77D3InP8l52NTtlGunw6v37ABI7BpPRbvaLHuz/D0ka3?=
 =?us-ascii?Q?6G5iZkg8/eNXJhiFRAsIkVT+q8u2pAlLTKbPccWtnvXvQC8KRyNPCYnhpOa5?=
 =?us-ascii?Q?TDTsYtV/lOdFYnPiAJ+PZN3DlrmuuIabtpYbezuwJon9npVqo4pwFP4bfV4Q?=
 =?us-ascii?Q?t6UmbhgGet67utZKMprf00MiYEDBZQczgzrjfzA4EFF6aCKrwUP4/QfeVHvt?=
 =?us-ascii?Q?/d+w1dCf4sm2BF40Pp1EcHJHZWwozfO2D5CKj5vvfZp2eVHmDt+1Jz1FTIVt?=
 =?us-ascii?Q?AsANOUpNCDjQX+fNzfWY0QPBRU4/0o4ebvRlo6brwPx8Ebsc/f+uQCLAasV2?=
 =?us-ascii?Q?ibaD8L0vENpc2SKAUS66F7Yr4LSAMlRRrvPnHtoH9IgqCROmAUvwe6kK19u3?=
 =?us-ascii?Q?xh/tUdEi/ojBEXx0vWUo1g6oe7B5bzdcdr3twLarl68bR8L1oQgzSL6dDB4l?=
 =?us-ascii?Q?yMbDf86FS9E0V/M1pVpvYfzcahWPKM2WqIWxrtd20W7vUIISuLgFKRstn987?=
 =?us-ascii?Q?Ie7yZXa/SG/YocEwbUaFCt5p09tVrFDxOAAv1YtQKK58v+sJz1RjneU+W6uH?=
 =?us-ascii?Q?uuJhIltAO5TgWgMWdHVq1Yj0lxwqoSO+HN+tS3XNzo96Luh2z4llrmELxfAN?=
 =?us-ascii?Q?upki1wHJtgwzVZ2ZEPd73vmsVTUtgJdnqTo313L1Ofvk2WVzOMUaX3JvdV8g?=
 =?us-ascii?Q?0TztFr3hTwSZjTPz7ED4iBgpkGTgNhyBg8ym89K3eqnOxAK2WqMruE9Er/9K?=
 =?us-ascii?Q?TIvcH5FInGcETIzH2dCGrRHisK6BiXH3Y2dYHvQtVLZwD0U/KyflJhbCIgjB?=
 =?us-ascii?Q?uY9zmsNJXidtiOmZyreSd6fCoqxJOulVM1g0QyE2InHDhMywwJ8PioioB5Sv?=
 =?us-ascii?Q?biZae9JwPpl2wjluI3i1dO7OTfrAEQGaCzcvg0UYDXNM0OIeq9LTPK0sGjaV?=
 =?us-ascii?Q?FsGQaqHFU0Cclhs4GC3VecyE9Q7hGqs/9diUnmbvx+VRc7zbE3RD/0PKjUoo?=
 =?us-ascii?Q?ncEfLpmEZD2ZTGWrbF/VzE1qiSzYH6gPw4tggfCqFiy2nShCowB0WVOICz9X?=
 =?us-ascii?Q?Kf5UsTmbM3cN/Lethl6eR2uEIXpg4cN2C3MFXIjxc9oYa44l7LlyfM334ZQD?=
 =?us-ascii?Q?LSZw0m/ggA5WjXzKK0KX/dm5k/FAupcvgaTxCV7qUSB1GKtalwo1VGATx5I6?=
 =?us-ascii?Q?uEVlr0vyLuUhgD0/Qj2NqnhuoFf99yZDDqiS+SvDwhrZDVZbAFBMhTjmaE/B?=
 =?us-ascii?Q?IJn6wCNyz8LqHfcUUzBZZeyvZK+ToBrSHlDS4rEekZ9Ohtc+jFhCG4YMqZk7?=
 =?us-ascii?Q?LR6hs/NgiCI1bJkdziT1ivnIHtfP9kHGTtVKXWbv+kjzFwzXyMYRmAfxrdSy?=
 =?us-ascii?Q?hbmtVpEiIPqtNZcEKSafsGJF7O4ss/iyUAmId9azvpaMoR4CEzAk9UWU2GyT?=
 =?us-ascii?Q?hou4OXnsjfaXI7ClXGG8K/PL3CXVCiKs3OqeHVWYdSp41QycPvM0xehnAavS?=
 =?us-ascii?Q?1CbqjcM9OuVveFedPhsHeQsVdB80AFiiszGp03Ua+Sdf7Bre/ym1+EoaSMP2?=
 =?us-ascii?Q?N1QMtoEcv5jBR1uZ6a/ZnpOCeJ3XhjCHHvDvc1NxP3QWelWh+CkjD4Y2UJUS?=
 =?us-ascii?Q?HTeC3vcVmHDfx2RaI8IA18v3yIjTPF4tbX5gN29EDmkZqWftsKw3G7nxLN6S?=
 =?us-ascii?Q?hPf7x5046Nze9PTFYoCfI3xx6yWFnI+YAVeRNBg9u71a/8ywluuEU8HVhZe5?=
 =?us-ascii?Q?Pz27Lk6MpQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5129f39-300d-44e2-d88a-08dee3f26c91
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:59:07.8570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AlfYsvADZyc0kCNfvymqp2PLC2hbujK3tpi6U3C+L40iSFIOPQz8U9fekw+saqDd1am6b/L4bnj4goHvkOEMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6702

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 2e2526e01d58..261ec2ee63ef 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1414,7 +1414,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 			       IRQF_SHARED | IRQF_NO_THREAD,
 			       dev_name(pctrl->dev), pctrl);
 	if (ret)
-		return dev_err_probe(pctrl->dev, ret, "failed to request interrupt\n");
+		return ret;
 
 	/* Setup IRQ chip */
 	girq = &pctrl->chip.irq;
-- 
2.34.1

