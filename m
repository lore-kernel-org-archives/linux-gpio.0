Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648543AEF46;
	Thu, 10 Sep 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034682; cv=fail; b=o+VnqJtkaTJmrVmRojDKBgYUtYxJtoNhQ1dTqinpQiDBKjQXBCq1iQSMLh9jlqgW6RL5qyr+iZl4BSERqatkvJb/h3WlHTPMhMEFd0L+MYuXKXNk2xaFwfZtFLr2Chge6t6kvtpNyH0kecQ+2IlcMYrgCkEeYAAmSWDB5UrWUFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034682; c=relaxed/simple;
	bh=DrE5eE+dbobAXP0+q1BbQLbq61sM9oOA8w6L8FF6LcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cP4W+9ewmIvIQ6aLaXUXAL8+trQ5KOq3sksLHuRi/01fb6OVeB3OUVBcoymwhj4ouvVXLiTyBJRo65uqbzLfqn3RssV7rPnxDzXVrkrZVzhrxOEdoshHVrhTLZItN8wQMeFee/KkqfwzS2AcXgkN0JwGL6T8IGoy4lOaGQV6dmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSefZGLCvBiIx1Cxx/+N+Zd2pekqgZzFR8LDFMeAkSKwvyXaCF4HX4GHiji6qNQS4JiWU64zuFCV4B4aF0ebLKP6ApC9UIjedy8vGb0NyyoZRB73nsUTV5hxgEpErkGTQDUlTZcdzKXoqnJqGuEMVkZCSC8bXDx1uDufaC+TouBdYdX2B9pMUr7H+dodPlS9HiE+ZizR/G1wN/GQkvJu2hOjDXPrHJjlUnY7Kto+TSH7sVOtlAJB3/BVHvifFoOz5c65HJpOvrzbw8y4mZuvWENujdTEdwvr3DsGATD4lxhtSYF6aNnDXlK/wxt8FyhbhP67OYStsw9RokL0Hd6szA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh6OYA8GxBZMq/6N0w3OLTCjyP1UVt+l7FUZr1HRbSk=;
 b=IdUXD6Cf/IzQLuIg5SAaC5KDfSp+0hm1d/MbOg9zcvxIw0B7/S4Lqp9xNOd0UuYdnKaL4PtTuAb8OThNmRxe/DhLNJ5OnRdHv/mlc0+UbPy5dzBeHVgvOkpUwHV9eYC7xgaesMWnmma7kpW5uahOnKzS6Q4JwAc84gZ8+8riqB6uU5WQLtK5MpOg+vx7G8GvE1tzM7kd/adpD7Gew0A9YLLCFU3i7n7JPlSuWF81uaxPo0VFCgiQIpkR7rJYONfk1RVqWTGZD6ZjdqUiYa5fLP9kFtYw5KqCVdadyJfn3mU003FgHfgF+k9Moa36QgVz7nyWayb52V9oOzkPyZDgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:11 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:11 +0000
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
Subject: [PATCH v8 02/22] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
Date: Thu, 10 Sep 2026 03:03:37 -0700
Message-Id: <20260910100357.130134-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: bcec7ac2-7e6e-40a6-e566-08df0f22dc8d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	KN4QPjJ6hjOpzXO4yiiYHOdNIB8UJn6OOGIr/Zj1/eXbadP2VfZJFLkNfiQp8/pLKorZuZsGf8JtYK+VNiu50AxgVG/apS6O1heGu1We/wae35n9gs6JLESM6+qG7n5oa51xssXFRL+Q0V01ym4dFEgEjxYmwKtWhSaGefyq0Xm+RPAIl/n6Sef3WQ7MzsZ1zrcVxmqejKyfGgFEwDj5E8jzjt9ZbEqm96yqsNPBk4wzHDhqzknvwyhiB9nyqyzf7rbZsqma7QCbYJfFjBdcz4p4l/ZrZ9IXXa195is/7nzBJ45+HSbymoRyXTJSHVKsla/ay8URyJAcE7DSVFNaaZWL61+CI49VJpXmNUZVt4P7VLvvsXSeA+cIQHmWKcWoYO6WxKqOcaC9c2fnhXHw+tTivf7wHSG9wy748UFjePjKzN2IeOsCs4lbE9cbzNqq5m5jhn+0CSIdkenwZKYfcXmmv2YomB7QWCM8ahalrW47sOVrna28b92vJpZyDeK18y+l3ghROe1McnrNVgJ2QtZmdtLfrJ2qydTPl0Z32GDaSbwt1/l/rJNA/3JiD75Cz5gyq1znVFrhSKa4s2ux/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vAwY3InuBuTxRaDUGOrvcwjtpH3nYtFpv2CihxnDvs95P8KOcI5GEVe+ijvs?=
 =?us-ascii?Q?bzfiIopykr3PBo6Tju6eMMMvdnNNh0kzdXUYzUKuktLLOKG9FHO0fDYDNueM?=
 =?us-ascii?Q?a+caaF05e+aTGLhfKZVBb9QU3rBgrT7f9w/xUP/+FfbVQceSRpyi5g9pF1Ex?=
 =?us-ascii?Q?x/bnWwBzdW2yDIE3RTn4j1PkXmM6OmtpEh+Vw2U26p9Z0N6VceYfQ+FExy8C?=
 =?us-ascii?Q?49n/YYEXLPi5Xo+P9YJKWewrEf3QL/pgVX7x4efqGRSi+S+PwB/34GD5AlW8?=
 =?us-ascii?Q?QRi8HOYTTg9HoNGPhIHS8jrTop0VlAlL3tC2HbQa2Uwv/IxhRfd/aVyyMn5g?=
 =?us-ascii?Q?7RnEt740kJkBXo0IV1Z8Zj+ddFakW7JpnOIw1rAV+/PXoJvSCtVpb8uAIfX+?=
 =?us-ascii?Q?x3ZA2gn5BC6+0RkeYfi+GFMqB248Mbi+zl7fBM4RhYDOF0U7zSWTW0wqsyZv?=
 =?us-ascii?Q?VQaFd9hVkb4Bz+duGVwFOkDNW1y/taS460uB89zKuuTAwuAgS+vfPaAo8okp?=
 =?us-ascii?Q?IUQHpbRJRhSpqpTQuOY2GrmQFh4bvfUw4ibMC1ZnCjiBLtZLq8u0RSi8Jcm3?=
 =?us-ascii?Q?qYoO9yhUYqtNxhbDwoTQhOX+TJYKif3r0LJnOFle5/NEB4hX42WDgPwY1wMu?=
 =?us-ascii?Q?GEu6M3hJaG63h2o5QddPMZgfItkdkCgOktJs/ZtMyTZ5TVqDJ3af4DzvqKtE?=
 =?us-ascii?Q?WtyDkRnA6bZMpN5rlJQ6kTqG1Xd0GxPqJf0Qc1qYYa4V6UhemH8XbSTp0+5s?=
 =?us-ascii?Q?N1GZpqmyAF2P9YJ0wb5/xbbWIEtl3hCChNDAFEXZBkbXywzqfR7+IyIIsQXt?=
 =?us-ascii?Q?lh0KD2YttqLEqlBNWn/NGYpcNhtb44YUu+2OwPm5o0FmNAMFJL0CCfAUyUBJ?=
 =?us-ascii?Q?HXwW7J1g7iR8XxD6GIky4GiwrT3vzHFaqKdIfIJnNd+tQy7v5wDERhenf+jM?=
 =?us-ascii?Q?GpgxIEhrxtsAQn0o+/FtURCYu3bUod+NwlTJdiIpASA4ejZRhXkHTaDSiV/q?=
 =?us-ascii?Q?xDiGDEmJyMq9DxAhhKp6Coqxq/YIyM5Gb1pMF3IuE8FsHsz1kGpVSQdAu8pM?=
 =?us-ascii?Q?dDuk5EO5t/DLVnov/KfQB0sYlgNel7dPhn0/pC9Qf2efYdZQcjsbZf6pwW9Y?=
 =?us-ascii?Q?wKj3hF+rbQzBzJDigU/9+3SBj4Y89oJIUprrCBbYU4pGFDocRxsbk7diCORP?=
 =?us-ascii?Q?GwHqhBgKDM+0zFpp4ZI2j34wwJZwZEO6tHUO+gqe/IxthGhxvff11kKJZUZ/?=
 =?us-ascii?Q?7ysMzl8IIPURijPoGsgTblM76fkbQ/Enm1dFAQ21pnCvrp8pN3cqqpfG3mK/?=
 =?us-ascii?Q?6vZpLc0tOVe12XRrVkcUQsHS9jAMQjkP8sNOEVdlCPSvzR7EzwkvX67jOydJ?=
 =?us-ascii?Q?/4PO4mhpHrcG03CQFp4isfzkXqp2dYZKt+2lW4LPBgUjEi2O2kytFEXqfuP4?=
 =?us-ascii?Q?GYoJ9pmsqCY9FYCvS5rvDAtZHKzmsvKHTnL5NcqIAqRIIcOC6rc1pmXGfKvx?=
 =?us-ascii?Q?aa+Oy/biCP7XwuVMNCyOHL1AmSrtNHaADy+NSTC+HVl6A++7BqaPx/b2vC5t?=
 =?us-ascii?Q?43sWqJ65bjKEporcjOWar8/cj3JDaPW53FaXd7/Yg3XD9lzpADINuwDcicT2?=
 =?us-ascii?Q?ESJTbI5zll03eZahZ5e/V2yYnbYMc42h9HnPDkJ1IThySWUQy9w7HntDcdNP?=
 =?us-ascii?Q?ec97e5YDGoPHNxC1gp33R0afDfBerMFvso7ATmFLwMXoScQfDFQqrl7IkKYJ?=
 =?us-ascii?Q?EBSIu7VC4QHSS/4nfktrS5EtV/OWoUGBVXtxNO7ckITAlHnOcIUj?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcec7ac2-7e6e-40a6-e566-08df0f22dc8d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:11.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdhmcS4ULJaigFgl3fuzmCqNUrkHxpmHKDa2uqGiWv+MQnTQztR+v8Nio6B8+rAsXM5Cc4YwJD2yIqySB8VcS6EJYLG2+0cXFByTnT5+IwPITYtZCNi7qHfbwX+eXEN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

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

