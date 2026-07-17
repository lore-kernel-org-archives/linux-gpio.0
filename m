Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013064.outbound.protection.outlook.com [40.107.44.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E53F3F4DF7;
	Fri, 17 Jul 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285975; cv=fail; b=NzyKqkHcZ88nVQSrQ2kPmoXzlPmhA0OVNkouJ8zxXJGQWHELu+XWsvH02VtdckqDnuEEXxzcvk6NEn5KyIpVaTtgetLRKKGcWcxdGBIx+DA3fUBXE4vT66DEBIkYiWOT7eujwWO/szo8wV5XMx5wePKFvd4Rl5sMCFlvSYAXhVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285975; c=relaxed/simple;
	bh=mZ+gj2yfuo5XT4xxbEUJUrTpUBNwUjaw0Vpjoyefz0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ohWB8rVHdmS2IcVF9Nu+ZwWMjfh3gjUS77JcZ+6EGULscGpeTOqaVnLrb0hkmMRoWrnMzxlINtdw8WRsg9WVpp/6Hw7kLid2NO0QOKKv/CJwPmoSmFHOs5hKzVRHYcJKrKZ7FjfY9V9XiMnBAfvFaafot+ZcwwFcL6GYruNuyTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mvLG0XHR; arc=fail smtp.client-ip=40.107.44.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mvLG0XHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMEs67BRVYIxurSI74JfOwb4ZVS5Nsb2kbtlaXTegZX9MKvnsY6TbBW+vKujnm8QpPV65EoUWvJ3znI2dOcdhb6O1112+Q7GKC3xJaKsRMnIa7mlRqCW5SvsIbFDyd9kkR17au9SwGi6Op9DWvW8OBlVP+iFEqRq+Cq5w9AcTHdyf/5vRCdK0Nezs+vtRoF12xwjLkoz0Lmk0JlORFIQxlmb/46+iQK1JFCapmfuYR8Zb133hFDQXrise48hCOUbbUf6qPQsgdUg2PYzTn72/XpF4Y7nXFwYySDl9WTjZ4Ggee43LGbA8C1PtHS/tPXqOF71vWoZxqr/+bmF08H0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifkHPWss/sbLgGjJNGzATMNQNOwFwfAMevw/wBDNkKg=;
 b=vG/wqUVoDDvtZAg7Nt4nQODGheYet7AWcHinwNnSbVb03+TJAHtGC3F5Kg0I1LSiaYTk2V9N2/P1zQPzxYBcvpUGRtDCAPNupgWq0cE9hky90JsbCg26cxtLsWsx/QhNdykwQ07l63HFX0bhakX9xn4pEQuPLjv0/GJ3NJOdn5wLn/5jgwTxt1CAzr0qU1ZnaOuafKMEU5XUR2Hku7Q7B6Yfuv0maBTMphpSrbMf13y5djlaEMQhIGYHcHIK+ZMCEOjph6UZd9/0UlUKlgqgjIcWCkSs7B6FJoId3Af+l7EpwY2ABOaDZmT76ji6OZRH+oA+HIrN8qyuUOGUoOAoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifkHPWss/sbLgGjJNGzATMNQNOwFwfAMevw/wBDNkKg=;
 b=mvLG0XHRaChywGpFjaL3UcR6pWwuY6SpATZAlGX8zwD9SLPRjbfdRAYuMBNntEB0uxPLI5JGlXUppJ8DuI6gmYwvGSJZ4Ofkot8HZekpOXBvQYXoXFY1hRbZ/RzuFMpHaO/jEn6e6ZyUXM2M9LBLAN1JItr6thC00E0FtzhFeUkN3/3Vpf8gl9zdn2uKkEIWvGYUYh4p/V1/PFsp7t2PpJrfSDwFsclZOStoO3XjDC18xdIdtJfLDb+D4irEEawIZmnBLGmj6FEFHClUV++TQ32IJ8271JxPh8VhSHgSw2aja5RWvg7UwjPJ+IX7KyFa9PVsPa2A/4cpDnng6zFSvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by JH0PR06MB6702.apcprd06.prod.outlook.com (2603:1096:990:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 10:59:09 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:59:09 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 4/4] pinctrl: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 17 Jul 2026 18:58:46 +0800
Message-Id: <20260717105847.131359-5-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f472ea65-554e-4378-9a0c-08dee3f26d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|6133799003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LL1800VZtzK5977+INMp7KocXnj5AtNTlNYC+NBE0DS96ou7X/Hf2XSVjSSVOUZMJJh4gTmro1qermrx3wR/xaQT4C8QopbzYkJbyJqKwbeIIQMQCO+g+rK1B3hH8DbRIJmhFF9THCgHOxj/KQYyiNOzgNdfaWpo4HfjpOz1TvMO60UsrVsaByQu5979f/S42xsCxPqtDDCLUP3VBUSuYVGExujfxa2dSfDKdCHC87NZININzut8VAytHP4v8buNzR7txxjUuknjJvsB1YD7DFEAQu0sOuK/SXs4wvfi3Xx3J/ABIp8C7rRoYVM302VZhLJRVzPCTBBwMuksxCA7qhgO5w2+VWR2orwbMYFG3ix9Te4RGxuXNYsn8+WuAmX3gKqxjXPIl4oOHy8epnCjpQd7zlg78sC3NVwHFEUo28m7//q63/SjThg0ffV6+hMjfqD2z56lZBhxFAmEKyKlc/FbafgIkvbNIp7JeOlIaULZ2j5I9/RIiiUOhEOx2/rPutpijaUkj87TL8t9fKXhz9WzrBrw/ktz7Cx0yUqkLVh0Vz2qPeBayqcC4eZ31rcekoaGkNV08w4VJMhuHmjohgVpZlRn1tkFJaqw0qd7W+cXbLhmJMsq+bJQl7BRJIY46xQ0Y5k4OJMTXjh+s4vq4PO8W3P1NydFJMxjoMGoZas72AgPXeA/RfbPOW4U+nRawpXVq7l/KcsGSg3D85R9y2XUhBE6PE/oPBaQGws0xl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8+dGuizVYbrwsnu7klAWWcjK26iK/Ik+Gsmgv8YWCt2pSIHh4M/aCDRxVBOm?=
 =?us-ascii?Q?v7r/V2dWLu5dOL5/Dzh4CZasgatINOBFjykuBBWBu8pEFKGf9rwokBAYetj4?=
 =?us-ascii?Q?XZYP0IkKTdCMS0p7yWrAzDkFolrX2BInLQkFsiMNogCKXy3obHDaUV2bY+LF?=
 =?us-ascii?Q?NL2Z4rxjRhoZ5LG/2oJauYMtB+L2KD2iDAbJeH+Wu8Ba2WifasLLtfvH1Wf/?=
 =?us-ascii?Q?cGCTqxhdFEJK9vd7RYjHCtsIS8y4teuIZFobwC0LKWrWjTSuuQrNIQpcivPa?=
 =?us-ascii?Q?uVRw9tiQ5PUclsHUy8LvGoaxdzF+wO8kviwW8fzLtnz/tNjNYvGaqkYLddDd?=
 =?us-ascii?Q?rg7oprW+1wlPMsCdhcmJ8LNtC9wwGlMxkfivTnAxdLD+w9KGE97jC+f7LoRS?=
 =?us-ascii?Q?toPpIxrqXzy3YBIJftAL1fs/n04+706nf7t6n5aDI1ucHhpDUwHFrJbX+8LM?=
 =?us-ascii?Q?FoJiaMkXwl6NOGdBvu+Hi6FF4rUBTixDFukWl1EMYFIuR2/15T3hnePp3OPv?=
 =?us-ascii?Q?3NV+G6ZxKl4TPpc1zx/9UewCGuo8vqRms8Gvtt8AoPMgLptxyDAhnma6EyJz?=
 =?us-ascii?Q?DCNMkhsA2a+Xh2vwshlOJ/oLYLVFCJjL1/gqdMA3j6VIOwPrtXmKXCRFbMaq?=
 =?us-ascii?Q?RtLWApWFXGBX6hLFBpcyXjryXYbW+68wDyVZMEbnbj47aMQ+jcdn5mxDVZoH?=
 =?us-ascii?Q?dHc7NNdpEfCeGnQ2OewfwZEYdDXh7zzgifPrYcuX+wyErBj0gSq4OMgVOplr?=
 =?us-ascii?Q?2XIzoUiprM/ThGc46f4G4kIrTSBHTocv8nNeJxvCBlATfjoHrdLtk7T+OQjQ?=
 =?us-ascii?Q?ivEF2DnVqvf7LxzxTU8RyIKiUKIR8kFQJtA+o5lHrvFjwWCuE7WKfzDMfx5C?=
 =?us-ascii?Q?PY84ulPxLsYjNiagaCNWG6RFa4xPF9JLMFhBQ+z4BA831KKrDfLqLcfEWDif?=
 =?us-ascii?Q?FhvPUPWLLRlI9EfzYXb0MCk6U96EtJCLAu+DzivPMgYmNPo1cfacOFn1MvRh?=
 =?us-ascii?Q?4YaYT9aaTUYP5QkAV1sD6c2Zku2m7qjB99onJe9gI5lbjOBXKCb+NOi70Qv5?=
 =?us-ascii?Q?yrvr91WdqSfSC4LdYib7MV28V2TnDoOoFOLmS+ub4to4kqqcExrr/5AdlmJM?=
 =?us-ascii?Q?Di0jKKFegekq1YXJaH0wwlWOtUsd1iC+4/7+OYxR9r/mhJ3zQvUgv0JPCx+F?=
 =?us-ascii?Q?uLa9FXLwl1E2A3EPW25aLNGH8XEo8UDLEx3cChRH1SBHie+opxB1F7lBIRyU?=
 =?us-ascii?Q?cdi2F/WRvTB9XhBfkTBasq5JKqKKH5UVhGrVT4wobHLM5CwEbqPoTPGTQxwX?=
 =?us-ascii?Q?Y2Ee3ntPFrMXOnzeVoKEIWjdK2VIuHezfescbg+TA6GMlW5UEb28ikWyS97a?=
 =?us-ascii?Q?KEBNunqMZfOeAo8PPV5F+MHfygNjBBnrEht3x4iIPb85cGrBp59i06vpTwOo?=
 =?us-ascii?Q?8/1pz4pDAgOpDgdtJ7S9em9pD220URvnT2rin40tokWoqAFI2zumPVJyZSNg?=
 =?us-ascii?Q?YZdOSEgPeOzoBB9bM0pTR4sTqD7Wbl6KJEoAZ73RKSQsHk1RcsarFl4+orZU?=
 =?us-ascii?Q?W4AQNX7rAFmO8GvpL373WfhWOE1MouJJ6jvIFadabwWUIUpwesXDf87MMyem?=
 =?us-ascii?Q?pY//DBfohx4x/3RcXw3Pd10mu5r7VzPyoDMhBgadMYP4TPD70cz2OOK/NB/H?=
 =?us-ascii?Q?n5yZld4Ix4TateNDgtn09b5CQRvqDkfKE4UUUd4TbLKUHhrNVUklJvN3fCGC?=
 =?us-ascii?Q?mhIRnWElyQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f472ea65-554e-4378-9a0c-08dee3f26d92
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:59:09.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFRUfRAdbvzSlpQzmR3fUQt+Hvzd8iP3CznBFAZMjbreuTB4zqyIR20cl0wMypc7bB0I7WAmzXMEW1Vr1s5TRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6702

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/pinctrl/pinctrl-aw9523.c   | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c | 5 +----
 drivers/pinctrl/pinctrl-stmfx.c    | 4 +---
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index bc94003512cf..a13b1cdb78ea 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -817,7 +817,7 @@ static int aw9523_init_irq(struct aw9523 *awi, int irq)
 	ret = devm_request_threaded_irq(dev, irq, NULL, aw9523_irq_thread_func,
 					IRQF_ONESHOT, dev_name(dev), awi);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
+		return ret;
 
 	girq = &awi->gpio.irq;
 	gpio_irq_chip_set_chip(girq, &aw9523_irq_chip);
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index a4f0ba728c6e..cc668f84bf8b 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -559,11 +559,8 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 	err = devm_request_threaded_irq(chip->parent, mcp->irq, NULL,
 					mcp23s08_irq,
 					irqflags, dev_name(chip->parent), mcp);
-	if (err != 0) {
-		dev_err(chip->parent, "unable to request IRQ#%d: %d\n",
-			mcp->irq, err);
+	if (err)
 		return err;
-	}
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 03ee13844b50..935cace7f645 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -727,10 +727,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 					stmfx_pinctrl_irq_thread_fn,
 					IRQF_ONESHOT,
 					dev_name(pctl->dev), pctl);
-	if (ret) {
-		dev_err(pctl->dev, "cannot request irq%d\n", irq);
+	if (ret)
 		return ret;
-	}
 
 	dev_info(pctl->dev,
 		 "%ld GPIOs available\n", hweight_long(pctl->gpio_valid_mask));
-- 
2.34.1

