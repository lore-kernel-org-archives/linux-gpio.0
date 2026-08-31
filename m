Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2102.outbound.protection.partner.outlook.cn [139.219.17.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAA3E44EB;
	Mon, 31 Aug 2026 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176149; cv=fail; b=fa2QyR4RBYZpF3J3um10Jz5goehGvE4B7cSV3z2WMxFsUgba7hT6w5Zjra0qrDbbuYD4Al8OCuX7FqgK6F9kHH+havcX57yp6CRotHeASUEQdZf8oBLKfztLYW16PlDQFAujIZYp+TAi5XUAFSy+iryUe5IlP3/3n0zhkf85Pus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176149; c=relaxed/simple;
	bh=DrE5eE+dbobAXP0+q1BbQLbq61sM9oOA8w6L8FF6LcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e+DvaFX6PyTGmHSYWTI7lDb15w7gJHGnzgnJLW1DkBIdn12ZRiezsoTgEuA3F3aO+D95jWRlZgDxj2NnH2pHLd1npDUYXmtkPsn+ro6oUJyMKrvXinnw9B5vMayDLD3bmaXClYSfkk5CGcEYbRtISQu2KHbJ2/UwEaYnUpDDj10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn1BBeSBQ4WK1GqF0V43dlMueomk1Dyg8wbtLgTXQ8Phc76xseifCRsTdHcpBpGnPPLsWVwN2PhUuIYFvtTU8139C0euA3TiKpFH2HqSRStz9UlS1KSzpWHSkfGyh2mraDPR4w4+BT8SXpr/MGj7QM3172tNePX6OxGho1LOETpX28h7WU01T6yWaySqrnReN/6Mla9gh+WZxBEpG33a62oGazrWocWodDS/3Sv3x5miGaCZu/B6ohexdLS2J9CZ+0VJdEhfvO0tLzqY6Ke3zb3wQiVdjBzReLLow2EadUAr7EGyEJfs2bm0MBxE4C5PxFhktBFLEyz/ydm8w5UP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh6OYA8GxBZMq/6N0w3OLTCjyP1UVt+l7FUZr1HRbSk=;
 b=excHzHS0ZL3I5/rkUpcahBruxggJRmTW4mJEel7wbsjDyQpVfmnZo7oYTvZICLQsyzdbMgO0GiirNrg/Hh+YMyleZQ1AZ27np9CVUh/prrBX6Alq0T4MjX7H7f8Km8q20Nl9GLdknethRfe5EhUEpQokJ1M7KivcKE4izj00J0OVrGKDz0/WOpEQdioSgVyBX9LWvlnJXT8JWTKl8RxkzKeSfLb5Y0rsOiL+EHx5ayyjRZ0tDZMlgEjKIdTleiJ6h/EUWMaK6ppEHEAkSJDQSpORapGFe3as0a0mTPuC493rIC6ez26wk8Ay0PYSkt2MpJ4dLNqdqXH0iApSRplcHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Mon, 31 Aug
 2026 11:35:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:27 +0000
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
Subject: [PATCH v7 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
Date: Mon, 31 Aug 2026 04:34:55 -0700
Message-Id: <20260831113514.66382-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: cd89dfbb-60a9-4fb1-ad94-08df0753f421
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|52116014|376014|38350700014|921020|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XmRC6+A4SrUvGIX/ecJ1gL+r35TG2CxmhcxNHL1uwKRwVQiJ79HrUuLRA45BgPdf8ibErsSxvPJ1iImSx0uNfXsNDGyxz7oB4242o2afqV/G5rMeACFdkVgn0v+sxHw0Zi7blnvIhN+vnE/BXe9ueOZlna3tpsza9bdZLw3/K4Ci877E5znz99uxNK/l8FHGPpV4OPpvhBuyq307ntnzU/q3dpDyGXHLGKsyCdFGkXtR2qJ3LhTxxw1+6smH8Udq31LsbESnLFHvgyuumQ2vmOQFyYGArUiXgEbXlaP25C/jqFvPKheQww/QO+/vPrpCdX+Bd+WkIJiX1eDVd+agn/PpK/BbtRy45uXkR5MxdYykSzJv/kM9wH+cSzlY5pJZ0m6ppO3aJUdwWAU4AcUSo15bkg8Gok0yJgNjxsMFEv42Wp9C0mKDAgLWmKJYZCxhqcmXL6UBxVinbccZW76pPcnx6JzjwBLsziVb8o3XCxeq36gpyxoLvRX8AG3Y0r3X7sMBYmYcfk9xgP4sRHrz0vdAreJE2AteKtTsZexPoC0rJ35udUJWOAWOWj+483Nk4OFbP6suGeYOyk67xLoNIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2eCWyIrvt0WD6Umu0s8a/Pqms9zmABmoJLN/VnwGRM6c/zla2Z3BxNjlUOb?=
 =?us-ascii?Q?5yEz+YnNjjwUpH1texH+5RqJiHJGkfn0VPM/LtkfVj57zB+la8mIA6NHnW8E?=
 =?us-ascii?Q?Zd6yuwEeWWNs2NNaVUwzY0aq/lEPsXiUpFMONw329vIZa9TaOBL1hEYTFteD?=
 =?us-ascii?Q?xogzFpO604cZxYLO44lU8LsbXAn1Qu7tYzc8vX8r/dgHCz8H/hqaxX9tda8E?=
 =?us-ascii?Q?6IaNWTU7C/vOOXgC69KLlicHj/efv4nEKJBolxcDmDbRBLDFWhtW9GTnvPeI?=
 =?us-ascii?Q?QWtdJZycP+BfgQ0hWOw3chTHVuEyWujtg7ZtPGIiG4Q7Mks8UURXRvSTvvu2?=
 =?us-ascii?Q?E9gO0crUzwM0BC9dLCsT7jHtVqHPSpI57N592N0GTIwAkY/GWdRjUcJIO0hz?=
 =?us-ascii?Q?BbovrIY/MZaOvPW91wrnBGFWvuZBo11X8VFFsAp0YXPGqktqgUvmOvLEo5X+?=
 =?us-ascii?Q?nYQWgAOKx/49Tzaei5rNGHMUc1X3FQbOhjRlXfC9mkKgkTgmQfr22rNr0EPP?=
 =?us-ascii?Q?mkwK8w/kmwBIOr+RxVLjyfQecjvGTrDUp0eXjvmuJg2EgxhEnENd722VLRgL?=
 =?us-ascii?Q?kD7BjsSOzJTfXLn7vkmyI2lv2uVPvpju4lWqE+LcSP/NSjw+SnzMuLO9sWDF?=
 =?us-ascii?Q?kWwY3anLr/lcU4Q/ydbLkMrwB9f83gGKmZIdngueNLlgY7Khjbbczvc4YM5D?=
 =?us-ascii?Q?0KGBYfgXD2h+W8bQFD2msZdoueG3ahVFLZRDh07ALfW/xIyIYbO4TzecZ/H0?=
 =?us-ascii?Q?ig55SkPw7ivIurACK294PiB7+53sOyD7uNn8ousgTgNzM+mEGG2WGfqOVTSE?=
 =?us-ascii?Q?cb3Btxi1MloYWwWUgIshwwbYTSa7Z9sqqIh0N58sQCCTFM+shHOG7NAdeXYc?=
 =?us-ascii?Q?8+eFyUjDhhMVGBWQ5n3Y7wxCs3mffX93PolrykMtm340XXEXRN9keG5kLdGb?=
 =?us-ascii?Q?2C+vHBeE3NuXcnSeSWxGZKHD5M72ch994FsqYGpT/eQXCo+xg8S/wdBamXTN?=
 =?us-ascii?Q?BVzmatdRJizTCNou0ZZbMJ2DGZ56KJ5otwH1h8EwqxemV1RhDFe8uxfZBr4K?=
 =?us-ascii?Q?wM2P5RbTWUX4YTi9u4bjVneSaX/DPQTTQZFAysxTlEuK5meCwntDj5Yt5lbA?=
 =?us-ascii?Q?Fxv/9I+SnXwSGLxhj/MSh+JMFLM3UsEsitP9A3mCaUnsVgm57fe/OuTDIJcb?=
 =?us-ascii?Q?J4ZY29IF2N2xtSqd0PF4in6azg60tJd2vyXJO+Vpf4mX8N/Sc8ET8DldRgEP?=
 =?us-ascii?Q?Ke19j0M9mnFOb5JZaadaV7Vs2BH44sSZW7Uhdr+aGkeSxo2Uaf54mmx9I7rb?=
 =?us-ascii?Q?jJHKoqduaz02sMmGRLNO5Lg6OpNUUSKWQC4n15ryptUgoGiMNhRzbn4uVpMi?=
 =?us-ascii?Q?3+IZSbK2AQbMCKzrSM4mm0Pj5F70AX1BLtjINIE/xZADEmMdOO69eUx9kzh6?=
 =?us-ascii?Q?/zb4QKBUtHqTebcrR5xQfEWbLKHQCTyQeWAHOrmvQuvUsSbyy5gvwJDZ5XpD?=
 =?us-ascii?Q?bbyV0EEvnIskHWfGahr7F7ouoXRVdWwi9+Ayj4DVM3WH81o0w3ta2NyN7UK2?=
 =?us-ascii?Q?+yCfvYwhndGHFTUyRapXQALJtuz17xdxb7yUVXHsmxbtE4UX81u/PMspokmL?=
 =?us-ascii?Q?JwM6odIwhtlW2PpJjHGfrpukSthBr4vxyMfvasUoR2BUi2E9Wl4JA6tLvCZ4?=
 =?us-ascii?Q?vrqm4MkqO7rKL3IRlATfwDt5o9U4kBoowJPCRbhLzOoM06wsgFvLk5selvVn?=
 =?us-ascii?Q?ARHxbUbImqz2unmNmU+3vPHHh19MZmndYz2TTE34dgyGgTYYO/pQ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd89dfbb-60a9-4fb1-ad94-08df0753f421
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:27.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRdW+sGln5YZ2a5/GHQzYHA8Z6maQD25UrlQDQg7JPmV7n9IwsJIJpALhPnfwKzKSA6SrAY7IJgcAbVofu5+WFxO5msIgE0w5uBFdfwGKVJI3DVuEv9EFmY4GoaPqpuw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

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

