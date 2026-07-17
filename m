Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013054.outbound.protection.outlook.com [52.101.127.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB643F0B5;
	Fri, 17 Jul 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277059; cv=fail; b=pYFXVn/U4V2azLDf+KrX65hMZFCceKucInNnlBinQO3Gu5FLy8c61npaKGI9VSuFQ9I8rv9RZxoxriUxs+Dwew3xAOeG8lSvttdNNCfJkcYfZWLrBTQU3Vr6ICHNeSSdzsl3PdwvCyPjAwY1s07JzxcbHecIGK+w4LWP5ijLtb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277059; c=relaxed/simple;
	bh=FOH93tVwHfTCpkerTVS/4rODGKl2KkXhIbsYyI6OFLM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HYD9EfmXtUje3S2h2WlHpS7qURZfVhiHtkZlYJpgSJyT+WM6u4BGG1DD78Z92XbuYpDMhnFl1ELIHYiDEUnxtC0oMc4fadDevkvyeuWKDrti4QVwT/QdqlaT4EleFTUj5KZLHNucB7+jtck40LFiwGMVHRaZZbNTTeHQIH6zkhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=bG4h4N2G; arc=fail smtp.client-ip=52.101.127.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="bG4h4N2G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzMx+hJFANi2R0SVKuWhUhrj+cfhEshR3PdJYxFdtrsl77ktitGtuiK5SRFI+tY+7BuS7E8ewPg56h8styTB0lLZ6yC7pKcvcFmdSbIGMoGp+kxpH67GBO7adtsa6CfwpNk3X61Fpcu6UuI92XTmi73t1vj7+YMyQHALFqcp28URHBvBOdABG2XX7UD3QRVyBt5P1IOcp1pfo87ww+Xae+IXDnZEpD9COPVTBMCj76oBAYJD7VfLO2L8X+pMICGMgyf4xhPz2y90lVsR3P63P8ExP3ObbiYa48aKZ2OxXHygNLU+vFc4ItETz4vb6a1XAWJC23l4uc0uEUm1RjAXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gYkx7EcHWV3shf17a1q/Ed29QWSLOKCmlQYwRO2qMk=;
 b=CvRryfis3Hkf0b6uGdO7D2RsG8tXeS9nKIGcIb0s/uJkwQ/I/KB+Bo9Im1V/c25P2t9i1flKlddgEppegHyH8sfU46VKjkai7wIgNWXhF2sdCcPAprL3k0byq5zfkmbuMIpfb0mKs1h2IoGDOCCT7cFEHcsbDqlexapxJBoEYE3DqUp6usx5VYyGJtUN+oA/Vlx/Hcph3SYNlPDH+XZE2vyBoki38nGWZWFFbzRZMrRkKhzODh3jrwSylGKTJeZGm4wZ1dv05GQlHDP5GkxAyEfQ/JKLrkCoka6ZVpJwJtSaAHZ3TDiOdbcyfP5B2In+1iH2M3CAsdW9kQ926PzrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gYkx7EcHWV3shf17a1q/Ed29QWSLOKCmlQYwRO2qMk=;
 b=bG4h4N2GelSSVTPJ2vL+RRWkXXQIu4Jr0zLPmMJqYJA8DOGmS2NGFLrK/9ywF4gxcLq+/04tmXmd+4z1fjhk0feDw7IcwMFPEWXdS/GkZ8pkf6EX4vfkPipGOoNg/vRGQOIPcveY9KeEhevcyhX6A0ByIyvGVqST9JJNmfo8pNu43It3s5HaFInlqqtT1Ef2PcIsIG1vBP8MJ9iYB+HznrzFdIbOugR4Z1XIV5Xfzrf+qEhxdEF+sS7KMFrOGKgaWTEjZyMtm8ycUdPzIStxu7z88YpWPemoiBqUQU3NEhB1vR7N9G+CHEd9as1TDzFRDNCxVn0X6lumAvzqf6oUEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB7240.apcprd06.prod.outlook.com (2603:1096:101:22b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 08:30:50 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:30:50 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Ming Yu <tmyu0@nuvoton.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	linux-renesas-soc@vger.kernel.org (open list:ARM/RISC-V/RENESAS ARCHITECTURE),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] gpio: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 17 Jul 2026 16:30:33 +0800
Message-Id: <20260717083037.284134-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: f5238d98-d069-4617-5fdf-08dee3ddb4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|921020|6133799003|11063799006|18002099003|10067099003|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info:
	onldSdV5h3YoqawMTcDYBORVYGHYhZJrtmN71JxPbWoHsZ87XA7rGHIutNfvyBeFvTvpACrxBteOX014V/kl2TP3qpOZDML9he93X4sKqUQ7XA/fDIMyPnoCyYSXQUXVtPhWQ03qcugVGef7FMynTV3eUWgSu0MunWtkP6Inwr17M+VLBUxfJfxvtIEc14tlIaVl1HvAyAzrd1tZd/i7AO7OSDSCLs/97IhanhoLdHDjzExZIW/gpyhm6494rVLgH4IVRKHLo0H5CMOMnZ1pGdA5O8GI9q5f3ydNeIXRRO/mdKUYZmzRwey6q4OIwYUk4nEg4y/366TcJgx789D46lBACPsRZd1mAyZ4VmH16XYMBWhhnURVGBHWelK+QGlt/FfkVI048V7rnCc5k1FfEZ1HXuoqOL2FpoeHoQ+Cpx1OL52hX73dJQWNBrh65l2byLcxRaEhgfE2Tuv28Gj37l0VK0XW7n0XJR6HdjVVj9eX6YY/kx6NmusD97VLLSgzTX8bmcjr49ugx5kvZbm8lF0coUZQiOeyPNh4tD1yF+o04giZEyoVF2kjM36FgGhm4sIUUNIY9GsIngg6G4Ewo6uxwRrv4NObwbRir0wSRcqowfhVqWyJuMDYoEVY+m6F+pcc1vZgKsXcZK9VqpC07Yr/U6r5k8kTWuxu5H1ScsFnwQfVadT8PrgdMB+Lmvu1RMMYN/LPKiXMic+76tu59WfcZs7ZCIT5Hr7QEh8tvxE7XkV20LFwuOGPcJntXx/rOqEhTz0MRViAJdEwLamFgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(921020)(6133799003)(11063799006)(18002099003)(10067099003)(56012099006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XOe2i9ObZH0ObXuGG632TEq1xGWczIcXtstlK1M/k29zg3WfNjJd+WUoB/rO?=
 =?us-ascii?Q?nrxogckjsC2khNWVGxWWGTvTDIGVHX6Pz1X/a9CQq8LIQ0IXTPVYNCyTjQWx?=
 =?us-ascii?Q?4MAFiwHA/4NC7mp6MdZMizTT/W4+F/tY4htMzER7b2ITfKXYCQQ3+GgWgbCE?=
 =?us-ascii?Q?bMi+XOLPGDgqPYaZLKR6ZwW0yXvi+ozBJMiNoYDXj6fArT1/p4KNSKoL6xBe?=
 =?us-ascii?Q?u9rgwBIhIpt1gW80rPhrNDyP2dtYqMxqyY7qScSbRFBCjImfKlaciwNBQMBn?=
 =?us-ascii?Q?MTe2r+JsFNsbhfH5FEJs2cfHjn+AaO85HiRGCc14Bni2DvaGNUyRosejCHym?=
 =?us-ascii?Q?FEYffqSIZtdF2yR5mI1oJi+Y0X/rTFE+NAZ18Rr4926jvZkkq6B/qwxpPlgi?=
 =?us-ascii?Q?PdcUdyo0bWHR7x4sl/80Y1CggwaZZtS1JShRi7BYUUeA/Le08BFBqVYBsxEi?=
 =?us-ascii?Q?U0rzqaButK0X2cBz9Xp8Hmuzkl5xqFw0EjcRAY3bbdXc36RGhD1t/g4Q1fwR?=
 =?us-ascii?Q?7NE53RWaL+WM6XNOYBpDKfuODTkFMb7o5T8GXmH8mVn5WWXj/09nSDChzodT?=
 =?us-ascii?Q?oqbYLTJ8b7DCUtZBcchDDMV9p579nUYRE3vgt7LqeQgbWumgtIoy5SWCCQuw?=
 =?us-ascii?Q?IfX9p5tMo9qQOdjXx/AGCG9ixD0ftzoSs6hZKHB3s2t37qdfN8hkgxePaqqn?=
 =?us-ascii?Q?VY6bBzuLrxFh7PqjcGAkO2aKbiG8DyNXAW+jF4ai/5WY6HxtnJXTw+yZR3wz?=
 =?us-ascii?Q?/4zwKltPdGdfdCm53HgdXMSnHAwtRIaVflsEyH0oWaeesGG/MjwUTLUwWS6G?=
 =?us-ascii?Q?hw6MIDmOrJmvpWoU702KnuKIOPDaeCbkeiZhuR5u6tifIFlnfmYSNILxx98W?=
 =?us-ascii?Q?HH/Y5Y7SOmsS6zaxzK+5SSj/bEg2tsiAFTBQpH/xuAa8T1jTcdsU7PziHabv?=
 =?us-ascii?Q?NIxFIYJgffIdxXXVhDZuD3K5XHOcg+VHPedqPVl9ufMTLgofo2Qmcs8jQo9L?=
 =?us-ascii?Q?kFBAnbfrjOF6iLk8Vt5LZhqmbcqSVEXudHZBiloERjArIFqew75ELXFJyRYH?=
 =?us-ascii?Q?GkrbPwBqku2kYXPj7QqD4Qr26GLIC0ChgUclWBga+CArpSxDlcSRLTUrSmWb?=
 =?us-ascii?Q?OZ0zoSVr62QzrhPf6fMsLyuXK97KctKJKhY9tvpNmf79vdj5q7eWTVj6/RKH?=
 =?us-ascii?Q?4u+QarN08WEHoBrod3u4LKhUe7YODFaEzQ09PsZuDaCrCiulvwhCBgb8LoLt?=
 =?us-ascii?Q?PcFbsEW49sm7GNVG0vXe6LJ1wJAyr6Zj34K3FxWuO+yFbQMn4VohvRXSy/2T?=
 =?us-ascii?Q?jOgWK++mX9kIDocNb3IO2bIvFhcdqmokMQY0bT0XtxNPDMD+AosZQnfjYsVE?=
 =?us-ascii?Q?cHd+Mo2mNdSu2Z8S2hXyIh+EhdXxiT9dyPmKWmIM90LU7dl11CGRVJY1diMu?=
 =?us-ascii?Q?JcYltr5VntftklFD34XIPIwPEni2i9lP3RK52kUcXIg5XirTPYGIpY6O/FEW?=
 =?us-ascii?Q?bx9fM9PwNxZzHERJ9yHtRm8uPRVeTeByO/mdxVhJe0CauPc9SD5Itd44fC8I?=
 =?us-ascii?Q?BhChgvcaJj1qq6L9VsJkho9NPebg9AnSEY4zxTKr2xALIuSxRQBoTX7ZCEmn?=
 =?us-ascii?Q?wL/km4Vb1eFMxhVor2y2l1OqiR8XGl/iXzfi6bWAHhKkuOzi0zjzhTuwq6Oc?=
 =?us-ascii?Q?y9w5bHUXp9LEACrIeBgwfR8YdV+5zRthR8dfwNK+Ys4wrwAGV/lwsOCzJ31o?=
 =?us-ascii?Q?S17eg8p/xA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5238d98-d069-4617-5fdf-08dee3ddb4a4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:30:49.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESOUNe/aRPoYfXJxOuvgT8L76GAiig5qXFQQFDPxuXHK2kSxKE28Z3mHiVTPXAdbflOGBFoI8xmcnUMgjNy/Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7240

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
automatically log detailed error messages on failure. Remove the
now-redundant driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/gpio/gpio-adnp.c          | 5 +----
 drivers/gpio/gpio-brcmstb.c       | 4 +---
 drivers/gpio/gpio-dwapb.c         | 4 +---
 drivers/gpio/gpio-ep93xx.c        | 2 +-
 drivers/gpio/gpio-graniterapids.c | 2 +-
 drivers/gpio/gpio-kempld.c        | 4 +---
 drivers/gpio/gpio-max732x.c       | 5 +----
 drivers/gpio/gpio-max77620.c      | 4 +---
 drivers/gpio/gpio-max77759.c      | 3 +--
 drivers/gpio/gpio-ml-ioh.c        | 4 +---
 drivers/gpio/gpio-mlxbf2.c        | 2 +-
 drivers/gpio/gpio-mlxbf3.c        | 2 +-
 drivers/gpio/gpio-nct6694.c       | 4 +---
 drivers/gpio/gpio-nomadik.c       | 4 +---
 drivers/gpio/gpio-pca953x.c       | 2 +-
 drivers/gpio/gpio-pch.c           | 2 +-
 drivers/gpio/gpio-pmic-eic-sprd.c | 4 +---
 drivers/gpio/gpio-pxa.c           | 9 ---------
 drivers/gpio/gpio-rcar.c          | 4 +---
 drivers/gpio/gpio-spacemit-k1.c   | 2 +-
 drivers/gpio/gpio-stmpe.c         | 2 +-
 drivers/gpio/gpio-tc3589x.c       | 4 +---
 drivers/gpio/gpio-wcove.c         | 4 +---
 drivers/gpio/gpio-xgs-iproc.c     | 4 +---
 24 files changed, 23 insertions(+), 63 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 0410e3adbf54..95dbb774dfc4 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -411,11 +411,8 @@ static int adnp_irq_setup(struct adnp *adnp)
 					NULL, adnp_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					dev_name(chip->parent), adnp);
-	if (err != 0) {
-		dev_err(chip->parent, "can't request IRQ#%d: %d\n",
-			adnp->client->irq, err);
+	if (err != 0)
 		return err;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 44ca798cf832..d0e76bb08eda 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -489,10 +489,8 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 					       IRQF_SHARED,
 					       "brcmstb-gpio-wake", priv);
 
-			if (err < 0) {
-				dev_err(dev, "Couldn't request wake IRQ");
+			if (err < 0)
 				goto out_free_domain;
-			}
 		}
 		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
 	}
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index aa7c08e60707..0b187adc7262 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -505,10 +505,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		err = devm_request_irq(gpio->dev, pp->irq[0],
 				       dwapb_irq_handler_mfd,
 				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
-		if (err) {
-			dev_err(gpio->dev, "error requesting IRQ\n");
+		if (err)
 			goto err_kfree_pirq;
-		}
 	} else {
 		girq->num_parents = pirq->nr_irqs;
 		girq->parents = pirq->irq;
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8784e433e1ff..778cd48af8ac 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -305,7 +305,7 @@ static int ep93xx_setup_irqs(struct platform_device *pdev,
 		ret = devm_request_irq(dev, irq, ep93xx_ab_irq_handler,
 				       IRQF_SHARED, gc->label, gc);
 		if (ret)
-			return dev_err_probe(dev, ret, "requesting IRQ: %d\n", irq);
+			return ret;
 
 		girq->parents[0] = irq;
 	} else { /* F irqchip */
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 2d0fe3abd5e0..660140198dd9 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -341,7 +341,7 @@ static int gnr_gpio_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, gnr_gpio_irq, IRQF_SHARED | IRQF_NO_THREAD,
 			       dev_name(dev), priv);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to request interrupt\n");
+		return ret;
 
 	gnr_gpio_init_pin_ro_bits(dev, priv->reg_base + GNR_CFG_LOCK_OFFSET,
 				  priv->ro_bitmap);
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 5a63df3ea5fa..1d80994ca44e 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -373,10 +373,8 @@ static int kempld_gpio_irq_init(struct device *dev,
 					NULL, kempld_gpio_irq_handler,
 					IRQF_ONESHOT, chip->label,
 					gpio);
-	if (ret) {
-		dev_err(dev, "failed to request irq %d\n", irq);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 24c67c912954..7713937ea3fe 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -515,11 +515,8 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 				NULL, max732x_irq_handler, IRQF_ONESHOT |
 				IRQF_TRIGGER_FALLING | IRQF_SHARED,
 				dev_name(&client->dev), chip);
-		if (ret) {
-			dev_err(&client->dev, "failed to request irq %d\n",
-				client->irq);
+		if (ret)
 			return ret;
-		}
 
 		girq = &chip->gpio_chip.irq;
 		gpio_irq_chip_set_chip(girq, &max732x_irq_chip);
diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..eb479e1b48aa 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -356,10 +356,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
 					max77620_gpio_irqhandler, IRQF_ONESHOT,
 					"max77620-gpio", mgpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-max77759.c b/drivers/gpio/gpio-max77759.c
index da3c77dd574e..c8761e825e16 100644
--- a/drivers/gpio/gpio-max77759.c
+++ b/drivers/gpio/gpio-max77759.c
@@ -488,8 +488,7 @@ static int max77759_gpio_probe(struct platform_device *pdev)
 					IRQF_ONESHOT | IRQF_SHARED,
 					dev_name(&pdev->dev), chip);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "Failed to request IRQ\n");
+		return ret;
 
 	return ret;
 }
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 6576e5dcb0ee..c77b6e6abf08 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -469,10 +469,8 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 	chip = chip_save;
 	ret = devm_request_irq(dev, pdev->irq, ioh_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
-	if (ret != 0) {
-		dev_err(dev, "%s request_irq failed\n", __func__);
+	if (ret != 0)
 		return ret;
-	}
 
 	pci_set_drvdata(pdev, chip);
 
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 4e2f3381d82b..f7b6a260e93f 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -411,7 +411,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
 				       IRQF_SHARED, name, gs);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to request IRQ");
+			return ret;
 	}
 
 	platform_set_drvdata(pdev, gs);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 566326644a2c..369c34d34b9e 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -248,7 +248,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, irq, mlxbf3_gpio_irq_handler,
 				       IRQF_SHARED, dev_name(dev), gs);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to request IRQ");
+			return ret;
 	}
 
 	platform_set_drvdata(pdev, gs);
diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..6cbfa90e723d 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -476,10 +476,8 @@ static int nct6694_gpio_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, data->irq, NULL, nct6694_irq_handler,
 					IRQF_ONESHOT | IRQF_SHARED,
 					"gpio-nct6694", data);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to request irq\n");
+	if (ret)
 		return ret;
-	}
 
 	return devm_gpiochip_add_data(dev, &data->gpio, data);
 }
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 208fed631975..faf9ceb9a323 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -694,10 +694,8 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, nmk_gpio_irq_handler, IRQF_SHARED,
 			       dev_name(dev), nmk_chip);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed requesting IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	if (!nmk_chip->is_mobileye_soc) {
 		clk_enable(nmk_chip->clk);
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f6b870b7b352..703f09e6ba6e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1094,7 +1094,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 					IRQF_ONESHOT | IRQF_SHARED, dev_name(dev),
 					chip);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to request irq\n");
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 4ffa0955a9e3..96bbaf7c23a9 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -397,7 +397,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	ret = devm_request_irq(dev, pdev->irq, pch_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+		return ret;
 
 	return pch_gpio_alloc_generic_chip(chip, irq_base, gpio_pins[chip->ioh]);
 }
diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index cb015fb5c946..16851647a918 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -332,10 +332,8 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 					sprd_pmic_eic_irq_handler,
 					IRQF_ONESHOT | IRQF_NO_SUSPEND,
 					dev_name(&pdev->dev), pmic_eic);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request PMIC EIC IRQ.\n");
+	if (ret)
 		return ret;
-	}
 
 	pmic_eic->chip.label = dev_name(&pdev->dev);
 	pmic_eic->chip.ngpio = SPRD_PMIC_EIC_NR;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 5d61053e0596..d0a6f93a63c1 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -683,24 +683,15 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev,
 				       irq0, pxa_gpio_direct_handler, 0,
 				       "gpio-0", pchip);
-		if (ret)
-			dev_err(&pdev->dev, "request of gpio0 irq failed: %d\n",
-				ret);
 	}
 	if (irq1 > 0) {
 		ret = devm_request_irq(&pdev->dev,
 				       irq1, pxa_gpio_direct_handler, 0,
 				       "gpio-1", pchip);
-		if (ret)
-			dev_err(&pdev->dev, "request of gpio1 irq failed: %d\n",
-				ret);
 	}
 	ret = devm_request_irq(&pdev->dev,
 			       irq_mux, pxa_gpio_demux_handler, 0,
 				       "gpio-mux", pchip);
-	if (ret)
-		dev_err(&pdev->dev, "request of gpio-mux irq failed: %d\n",
-				ret);
 
 	pxa_gpio_chip = pchip;
 
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 09bebde5c426..428c010eff40 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -560,10 +560,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	irq_domain_set_pm_device(gpio_chip->irq.domain, dev);
 	ret = devm_request_irq(dev, p->irq_parent, gpio_rcar_irq_handler,
 			       IRQF_SHARED, name, p);
-	if (ret) {
-		dev_err(dev, "failed to request IRQ\n");
+	if (ret)
 		goto err1;
-	}
 
 	if (p->info.has_inen) {
 		pm_runtime_get_sync(dev);
diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 5fe813b7f9bb..d73d1b71ee61 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -254,7 +254,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 					IRQF_ONESHOT | IRQF_SHARED,
 					gb->chip.gc.label, gb);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to register IRQ\n");
+		return ret;
 
 	ret = devm_gpiochip_add_data(dev, gc, gb);
 	if (ret)
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6faf30347a36..090f91590fb0 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -515,7 +515,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(dev, irq, NULL, stmpe_gpio_irq,
 						IRQF_ONESHOT, "stmpe-gpio", stmpe_gpio);
 		if (ret)
-			return dev_err_probe(dev, ret, "unable to register IRQ handler\n");
+			return ret;
 
 		girq = &stmpe_gpio->chip.irq;
 		gpio_irq_chip_set_chip(girq, &stmpe_gpio_irq_chip);
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 90d048f9da08..5cb85649dc36 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -358,10 +358,8 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 					irq, NULL, tc3589x_gpio_irq,
 					IRQF_ONESHOT, "tc3589x-gpio",
 					tc3589x_gpio);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return devm_gpiochip_add_data(&pdev->dev, &tc3589x_gpio->chip, tc3589x_gpio);
 }
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 4a5e20e936a9..d538cc0d5d9a 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -467,10 +467,8 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(dev, virq, NULL, wcove_gpio_irq_handler,
 					IRQF_ONESHOT, pdev->name, wg);
-	if (ret) {
-		dev_err(dev, "Failed to request irq %d\n", virq);
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
 	if (ret) {
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index 77eb29dcc217..5f147d3bb0ee 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -271,10 +271,8 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		 */
 		ret = devm_request_irq(dev, irq, iproc_gpio_irq_handler,
 				       IRQF_SHARED, chip->gen_gc.gc.label, &chip->gen_gc.gc);
-		if (ret) {
-			dev_err(dev, "Fail to request IRQ%d: %d\n", irq, ret);
+		if (ret)
 			return ret;
-		}
 
 		girq = &chip->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &iproc_gpio_irq_chip);
-- 
2.34.1

