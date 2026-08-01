Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54422EEE67;
	Sat,  1 Aug 2026 07:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785570126; cv=fail; b=uaxuQB4gVTA4am29jihzIVO4mH4fbb/AGMt2nA8u9+wWRS2KX4fsoBcCb3jpKf94x42tid2nU98nh+VS04urB/pHojnbEsX4ggRPh3uH+Wlx2Pp0ssBpg8BpzFtQp/FMEceWrVWWdZem1cyOPhx8mniGxafWPr7uvSTmtAZewW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785570126; c=relaxed/simple;
	bh=DrE5eE+dbobAXP0+q1BbQLbq61sM9oOA8w6L8FF6LcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WWST+y68eT5iEDckreYjZsXBFfLO/NgMLeOM9kfN1gNu8hl3HQa27i9g1wGUbwv1mdxx3OQWpQFAG7FmeXkT5WNy+ouoG/8krVb+ezCGpohg0tv3g7WdSXPVlXFX0aUO7dzFTnBMlYTbYYs6rfQWPKHfhjp/Ws1CaMS+uE+cPEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsQb4ZN9YcLPzHKBUDaQRePRtwuFPqyKxz0yL4m0JmuRU+noqk04yZDtWEnrqNxQLTgdP/l2j3f+rwwgmq8/x85uHDxYDFUyuoCW01HtVtGQO/uBwCcQQyacU9ifMYwhzHHspRskKY6phTc4ZvPTgpXgFFi9IKLbdbLlY5KTu1z5qh+JlpdQzOZPT5hTjQe7Nj/pi+SM09UwO4nwqdtt82tVfnXWsaD3G7woMApiVCJDiUFPBGZCp53qAVKa4nw51TfgZoSwAoxFU+sP7ahNIbULAUZZDidfDx62A8xlwyZ55CANirIHJtuxtCme94GMOyta4Tm1eAUtKl1jCgSWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh6OYA8GxBZMq/6N0w3OLTCjyP1UVt+l7FUZr1HRbSk=;
 b=F0VjzSlp3OQbGsm2vMU/cxvw01J6qf6SogB/Si0zXOp64b2+nirq0u7VA5wGKpL3J5fWPD1amv6cRvfXMoHAINqjDUuRt1scRpxffu/nBgaKBsFp6ZIyvJFMxCftuQEjdTLYRZuQXagjI/Y+KPOROF/z0YenPLinmczVdqgWDKbF9nci6hTS9+O7B/Rn4CohpRLfeWPRqqwFS/e9r8z9PHO89ppgisM8vvlXiOCwt/YOTAIQ+dRPCbg5HFqUiouGo20G57BUO3MouSw9RqbzAj2f+8Kyn14FT9wmXHqzpqVHiOuvFDIS9g6SHpO8+CaqeTwSGt7d20NGWccJdxsdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:22 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
Date: Sat,  1 Aug 2026 00:26:52 -0700
Message-Id: <20260801072711.153217-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9a6432-bf3e-4ebb-afae-08deef9e5386
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tKrQjDQkpaJe+dZkMeBkLD96axzm/2dNxP7wRcRB55w9i3eRFbOjoVIXV5zVt0bUl8SOo9QbsWYSFQve/KQGSjD0VuUReDCKrb8tHayjGWRvcixwmSCH8PcRDslxz0gU9q+bpabx7AKQYM5z2UeuCJOKlpA37YCkiwpBGEMaq8QM2dQPm6kKbq3djHQtCYMyS5kXHrXIV7WobU52VHmzew3nhDz+vBZESmkGIuyz1/V3XYuyRz0FmlE+3OJGkVFRVnG1L3vJM4ErJkCguNQeBW9khlfCNqwTD1krNIX/w9ORsukTIbkICrCjlV845Oji9H3sGI+O+3Yz2xcnTfet/vKcFYmsiM/7NWMFeZEccZnMNp4RPmO7meVCGjt6pXoZi5yrG+IqmEE/eUqvS3oOh2fp52OG4Nxh8VFICxtNgoXLpHmSqZO9GXUjZSRwPY1w5kcmU4o6eEOMrFNH2xCxr5LNo0/n98zXoeO5Jgwee5qAxTDMbjXRviyqIiqTbIMvQWDalj5uApRdM4EhBwwQLMmCqejHR2QdrqXTbINKFB1JVWr2jb95vLWNAdeV8fMS0c2E4L3wQO/czFTy9FG0Ig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kDNoHcLGpSpEWytCS8UzdzJtuoH2SjolZ6ZTzKt7yY25e7NROFS8VRuycNKG?=
 =?us-ascii?Q?WB3wX9XmpboJ5lBgzJ5+5GtqywToXfQQvebusDXs0yVRQA3gn31xHvIQIR4r?=
 =?us-ascii?Q?SpxEgtVFZQxIojuaTEYmZsKpId1PJ5tbfqwrwbNktpGmfFBdf0Ivx0xqGQlG?=
 =?us-ascii?Q?/yvW9KKj3kuIaxVuibuJqQwhiIIeWpccEC5kx+6ZPJ00cOrW3NgfwfuNajH0?=
 =?us-ascii?Q?KejPAvsXa65dRw6Usn7pE2ZmwskYh/98CyWFrQR64gStvkhLLkF58PNTuA/z?=
 =?us-ascii?Q?7pq+zrHeLHqXgmcvANaba0XcVY9gg9yZNpOFgPmhrzmKvQU/prL9i0kyGRFd?=
 =?us-ascii?Q?G9nsKjFgZ8R1M/fX83Nn/qzO0aMWgTM7kb7/Ks12pm6XzsqBd7EfuWHGUEgR?=
 =?us-ascii?Q?CFwemoyMVcCY0LeX9dlAX1nBEhIuDU5ZzqpbmMES+qD/kr5mRWujn5zgGEr/?=
 =?us-ascii?Q?BdOJhIlqkbf4cpcCcOmvW9GyGGRbrTCBDPO1KdhprtNARhFEGEeQMH02oSdm?=
 =?us-ascii?Q?iKjxk2zTaEXVfFqy2jrmBpLm64Fzxy8JYf03ZCalKQEHV3N2LCKnwrmnHUnw?=
 =?us-ascii?Q?46aMNgXZyeaXd3U8qCMzDBKkAZ8HxFRH8716MGFXWp/24YGqVARrbXWVg7ds?=
 =?us-ascii?Q?H+ESoVBKpa/opWYofG5hTHmBgzLux/uhZkSvZcIbrNNO3YJG0HqeOlRa0N25?=
 =?us-ascii?Q?vT+JnawTaoiSj+wwiwaK3reL3ObaO/NwHKkoo86accBnA8nBGU/eNTiVp9fT?=
 =?us-ascii?Q?EuvZQBB3nVSPSyy/ACFSBGtOYwTvZQJUKRE2W4o1GyQC/frE3ac/pDgLzi8T?=
 =?us-ascii?Q?7WvrWBY7dNTOv/E9FsGmEihzfdu0qiFndNCV96GzpvoGwNpiB5okdyLDXvI1?=
 =?us-ascii?Q?6ASb4//3ZoxFEAWPRciDOCHaCkQNP/Pej6vUyfHmD9lIjvL1owjwdSASWOo1?=
 =?us-ascii?Q?7jaVXe54/2K22gULKU+Z9wKFeKM+w0benvgaYZTLEOxBnLRnS/Z0qVGs1e0h?=
 =?us-ascii?Q?HqEbyIQm8QoK+Eck/SIqK+yhTNKqEuIuVQPlbZvxetCbmge+eW0D4fgH7Z3X?=
 =?us-ascii?Q?R0A8u+EjENvY1bGIzvtTq8WYnWRRjviNJCh3G2Jd4D/CqxFaKMQrvqiHBA6J?=
 =?us-ascii?Q?A9PCi3KDk3rLby56x7JwU7tHloXhpBIl6onFxXSbyH7XumDBJHejyP8D42Bh?=
 =?us-ascii?Q?+SuD7Szlfzp8DZ+UFaKCpUsxLggA8R8T08lE9bWzAqYJ6MvYbV1JXkackYGn?=
 =?us-ascii?Q?4oaHPazcE7e/mdKNsW6YUZXItMVh3bdXPPirqv9/FuDkGWPltFA3CcH10QrN?=
 =?us-ascii?Q?q4zu2leVGGNEeb20QzdbASUGxn3ehfjPgvFrdl3ckOqLobm02FZwoIdkEKrA?=
 =?us-ascii?Q?pXEDPHx6uJLn7vmbfJCt0eivpTJPJug51knEFudYioW+5bGL4b/zODSKikHC?=
 =?us-ascii?Q?V+S2hDNX/0HwjBK+r2QsuczBBw/24kjTFd75TnVOIRqysbaL3DCNx9PRFQq5?=
 =?us-ascii?Q?lH9YlJDrb6Q7ylVGEM8ksNkzwL5h+xxeVX35hJC9+NaCO9PqtDen4BwRMG9h?=
 =?us-ascii?Q?AjfVAWjAhP0t4GG3ZHttj5azxAoz3tgDZ4X5YGF0hXWJkuTV2AVysrs7pYVH?=
 =?us-ascii?Q?dZ9iVRLgbGkGJuhFYu42jyK7t5stlHgYibBPwXXDdDbBsIq8LwUpXcK3wLng?=
 =?us-ascii?Q?a/Sc9PqxBHRnINE472hMF690uFi29Zx1pmpNZ2gEvfCq6HzNjDpCfqcDa8CR?=
 =?us-ascii?Q?uZDjDIReE6vln5zfkbYG2H+hCVE/78iJNlBWDUWMvBlIx+7jkga6?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9a6432-bf3e-4ebb-afae-08deef9e5386
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:21.9477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjzrURvFlbEemO+XNKdT4p6YX59R1JfW+/ww4KL/kMlvqWKwOSEWvmTgfeLP8VvQfySIz7u/0zHPAKKur1pTBXFvUqhE/HngRNEDf2NmF0Tn5bTldXytx1DnEP1ddn/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add 'input-debounce-ns' to the generic parameters used for parsing DT
files, along with the corresponding configuration parameter
PIN_CONFIG_INPUT_DEBOUNCE_NS. This allows debounce time to be specified
in nanoseconds as an alternative to the existing 'input-debounce'
property which uses microseconds

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 95c803c40a7d..36845517984e 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -43,6 +43,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE_NS, "input debounce", "nsec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_UV, "input schmitt threshold", "uV", true),
@@ -185,6 +186,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
 	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
+	{ "input-debounce-ns", PIN_CONFIG_INPUT_DEBOUNCE_NS, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
 	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index a5d4b2d8633a..1df63c732b99 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -71,6 +71,10 @@ struct pinctrl_map;
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
  *	argument to zero turns debouncing off.
+ * @PIN_CONFIG_INPUT_DEBOUNCE_NS: this will configure the pin to debounce mode,
+ *	which means it will wait for signals to settle when reading inputs. The
+ *	argument gives the debounce time in nsecs. Setting the
+ *	argument to zero turns debouncing off.
  * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does not
  *	affect the pin's ability to drive output.  1 enables input, 0 disables
  *	input.
@@ -143,6 +147,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_STRENGTH,
 	PIN_CONFIG_DRIVE_STRENGTH_UA,
 	PIN_CONFIG_INPUT_DEBOUNCE,
+	PIN_CONFIG_INPUT_DEBOUNCE_NS,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
-- 
2.25.1

