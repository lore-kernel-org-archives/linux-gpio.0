Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C23563E1;
	Mon, 10 Aug 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343838; cv=fail; b=Axd/HV/wUFXPntIbmp9JTz7GvNrLie5J47B9Hm+9stXjVC15N+XrehZjwoqbhT1oJYxoC2pfbprX6D2cyvOEtI8lW0fcrLZ40VgJCVDab7+0L9Z5aMNffDv4/Z+9Q47Tr5VCyxGJI12AJDtqdeB4g6It/uggVWeOjFCyyFeJeV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343838; c=relaxed/simple;
	bh=DrE5eE+dbobAXP0+q1BbQLbq61sM9oOA8w6L8FF6LcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j42dUBfPBOW+kUj+Fno/wYKVcaLSIJqA6yRfJqwQU2O8OYa/zxfTY1XWyvUiYzfUz/SbWbqp2Z5ABmekWl9acvSNZhIrEzDZ+tnh6xpHT9Q6rOKf9u5Mn9tkr/Gq80ctstrlmy6FmzfZIfGrgaQtxDa+RDLiVoaqLU0rR/WvBXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3rLQTtFkk54tKnti//x5VzOkBJ1Kl9uTdEyjvmEWzLbNm5TOltdvZM1RfVHpQoWSQHW5G+f3Yj8V+O5l0EUXQ9i+yU6fMsizLse21/ONivAU4anLSh4tEw/8vo8Pn78Pw7JhVuhCrrNsPaVwGy6Wo5KOaPgLy1v4XYrgqi1TzcqYxwbFCUtokOdoOK8Xp6FByW88BXw9kU3r+td4WmX6nCGWWuPdN6i46VVRlMjhWAYBSzEFb85FvJ8suLs4FhrmUWjcYQCwen4w3zuJq+sNpTBXBEYOgHDmyBcvPJ68zetY4+QUuZ3vAeIp9yY5fbSYmkNbnIBDatFzyBer4wwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh6OYA8GxBZMq/6N0w3OLTCjyP1UVt+l7FUZr1HRbSk=;
 b=e6wZY3lGJe0AygP5m599fQj5hN4gLhqcQsyFFJXec2wffe59SGlxerqdJbO4Xvhk740MIFUQtOp7OW6gNOxLnV0inGT0+FkI2vZTerx5q8lFH4k0Ck8UbX6NxxoS2jrbY72wMUrzX9xkhi6aB/qC3/SWqHxlK25WDvWp7zyPEORwXqYaQt2HgbBWpKxiKCJ7yo5WW0i6KGzmEeuaXG2doKlPUFzw/Dor/dEuKRvpKo8QGldTRjrvPwNHfMxG+Pc537tWJJinehw5qEKtPLtt6OWTz4cbCE8vG55HSJGoQvIhIvhZ/iI3J380eaUArh2f2uhmqLRL+6zAUYy+x41bpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:00 +0000
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
Subject: [PATCH v5 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
Date: Sun,  9 Aug 2026 23:36:31 -0700
Message-Id: <20260810063650.239303-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: c3865c07-0ac6-44c1-bcf1-08def6a9c88f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	hvFc3Hpfzt0SS5XVXPSQwesO9HLrIptVfh3VErm8ZtGkryrvi9jYMmDG24PZ+xgniX0oGdo3zpp3fMAFhuNrujYPG8bjyYCOX57X8VMtdGEfvgXGPw6hNchJqJWCDpWPUmD57H0njQIPauOmxlugfc9qTAlUbLT3mAgQb7OskvdjPFZ3kxC8RWTbjkjcxCwLkmxPFpRH7SHdu06w6nSQXs6IExwejZ/LT6xwdt4V2UClLfsCtA/xtsvgxLLbU0pyPgdejHjfP5RjYZT+FsUmJMxRs6J9sMtR4XA1QnvNwmA1t0FluOdbt7pC/9DTVraTU00OJ+xxz0HO3hGWAqcUPX0g3FVPcq2xRQkpSPuZgNazCju9PzQ41eHnidYlua8d2KE58wvtUNEzrNpSL2+0loDq9qOtqIgWsnTp537/doWqVlcLh3oqESe4V7mVfvqTdQVUOS3G6fw1EjdNI+ejWWGce0GwKfr5iwdVLykP9/hXlrT/QOmFbfEcyy4GLZ3oFaLl/vNytcRf3m8uBulA4xhFhonYxN/PQCg9ovUepa4Gh7jTeydblu+12mA/WjexgRfGkyBeducmV1oK5+g8Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H5C+YxsxFe4DioeWV89DbsZWAx4BYDzKhrm7hgVqLZIZ6+sc1ncjhz93P+mI?=
 =?us-ascii?Q?O4HVQc9RuGBCxvrYWSBunfsW5MyMQqT3qetsjDqISuWbFWDgqgHTdrotatQI?=
 =?us-ascii?Q?isjlNgqXptVMsJ7MnNxZT9lhGRLKkLlsHldg1+Nj7GEOpLbU05wFkEbGu1ma?=
 =?us-ascii?Q?Hb8yCK1kHipgNk7nOZTdXFvkajfh+PXr4ftHy6JUEAdC4ZCX4Xny3XnBU67U?=
 =?us-ascii?Q?3VMobo6Siy5vbP4oLFjgFFTyXPQsxMuRlo1nXijAqaZ/hyeTsmwflzPklWvu?=
 =?us-ascii?Q?4Sp7Nm2C38A4eYGj0MF5r0mcwSq6jPOPYYB6PmuiKGuqRej5aebJHFST8AKU?=
 =?us-ascii?Q?245zfutL2IDW/t/qsco6w+Qv6Kq1pDVuDmAMOmLVZFBjug7qDMZRgwxr5WtG?=
 =?us-ascii?Q?ISG0N0GyDW/d8moYPPblOQ5JGaDjKU+8pQ3u2ykdMhZNaf7diHaBUKMtaWUq?=
 =?us-ascii?Q?70Kj5/JTL6a7KT8SJufU2Xj8xDBmUreKZyeeWdjoBjBWHulq5zkjRzyDaFao?=
 =?us-ascii?Q?tkIyAHKICLBci65jYzL0U+YfDOAZ57s37hU8cWfR75pmo0P1XwwHgHo3U1qT?=
 =?us-ascii?Q?9it0aaKaxbJw4KyV4J41AFHLerBu6BlmWOAS6N/4BYW4RDb39chBVYQNzbQy?=
 =?us-ascii?Q?jrYfX1BwaPrEVZzMTGj0QJ33McU0G+kY3uK9nMWuIlgYFc26t9M1ta3x4cla?=
 =?us-ascii?Q?O1ZLWy/rOPxxzmaChJxC5ud262JbAL5HK/oqKXiii4X2kZsDf+Y2NKCQQJnJ?=
 =?us-ascii?Q?bPJr0bsNx4Wi1eB1ifKd5iryc2QSZ5y35Cr6HQOCzkMHOQFpjzQxIQrGuLsY?=
 =?us-ascii?Q?TqivOiZ/bxf3HiQTPQrC1mz7m3kQI9qjX5e3EmUQo1RHIch9d+EIoYxizbtz?=
 =?us-ascii?Q?Nmq2Pd2DjUkYLPAKRGnEesCZ6l0OewkVAsLD/9ttSsNrgiIX0v4IAWcb9n58?=
 =?us-ascii?Q?m/INRfzwWVTQ9Tou8ZTstgq3/nx0QINftVQ99RhBwK8ZGTZ9b79T2MlgXmDK?=
 =?us-ascii?Q?Sc4dVbjNLXQ86MNG/V8h83D2tqK/H0NppyBk/tKMNPIcvf+hNYlE5Sz1m5ez?=
 =?us-ascii?Q?KDr6Onwl+k7YnGz0+zS0e1RR/tH18L17lKrbItntaWmyIwjDxxfvQHVgkz0D?=
 =?us-ascii?Q?+/fsY129bxBww+TCUOhpGEDztXLUaCcqIIZfomDpcswUsxDp5HL7ofDWaQIP?=
 =?us-ascii?Q?QhE1DuKOU8FfG3zuXyQhSJiU2aI5clYM222gQUuw4ZKI7+Cv+80WCZxXxZ4O?=
 =?us-ascii?Q?tX4Cn97mcymqlZIJDw0l56RFM4f7FMzT06vzESPrRSFeaq9sPLWxcHMOzJLi?=
 =?us-ascii?Q?f1/zIJjGMICwMaCAk6u//rWu1Crsm5p/6G/3o4Hn+PyLD07iYUqfruvuszja?=
 =?us-ascii?Q?XzKlwKBUyyxXi3dVHfTw9ney088ul+//IG/L9431/9eZL7jGFi2UH7xIC8fr?=
 =?us-ascii?Q?CwUt9N9qCKRU8E/aX35lvGc7KPtRBy1xxcnQoD3n41YB4KHZJ2ZipoQuJAJP?=
 =?us-ascii?Q?WZKMloH4ESRW+q4bHL4ndeV8O6MtxqPo27mHqB6LocjSUWBSz/ALM45X6SN1?=
 =?us-ascii?Q?YTgdgqvzXDfStiZ/ZjOWAwoh6iwXvg1+OIit8QIAr28YS+wNC3SALiEqkhkT?=
 =?us-ascii?Q?9PLIC+IYfBuIvTl9MDrbEq5Vensq3GdkeZzGVFSNE38XIROuQikIlV+XigWx?=
 =?us-ascii?Q?Dd+rhyQLVGPL5MOL/p4TOlmQ+V2Ih+r7FXX8lyv/GgXHWFG/NBvoh9bIfql1?=
 =?us-ascii?Q?1BaSMEZ1Rfrv761LVfFDukyVTzEea0QHC7AwshiN8H1ulzQSsmiH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3865c07-0ac6-44c1-bcf1-08def6a9c88f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:00.9370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vkttdbm/BUSwv+MaQ3RvuBNnmvut5NeXC+L3hSg0bre+ZcHY+5fwExYIjcqqAFsMfU6aQSVYzMmeximCS5qUWVB3tCB6nx4XR00nnE3PWMzcwnm/SB8Y/XqLxaXVP9Ip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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

