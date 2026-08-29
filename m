Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2125.outbound.protection.partner.outlook.cn [139.219.146.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4D320A14;
	Sat, 29 Aug 2026 03:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973222; cv=fail; b=BnEe4mNkH5HT923W00alWRlGDvTykWkiCECST44Eq2tA5RlsTYt4JHrG6CQeP6j6znBBHVzlnAWC6IC52XoSWO2ZfmgnYGcsr/+xMrwLw3ZIhvcgE8YG51NHgKgHv2Y4ai0OP4M4JxVmBuyYo9iS4fcXyDdrZf9S00tsnpSV5vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973222; c=relaxed/simple;
	bh=DrE5eE+dbobAXP0+q1BbQLbq61sM9oOA8w6L8FF6LcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rhp4n3VTt1Wm8TzXJJ9upKxanhlHmpBfYu/JDQJafAUbrTrnFbdUtYst8PZjOjfynSWVvBpDAOlm3X5+5Z+jyPNItYvl0WerWN0OhubbHch2rkVgU0pbltxI3NjThhQKRhJQ0tQnhWfyTX+LlOAJlAohLUMfuiPh+tEoo7u337c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOo6GCZBo7WQZ1s/8sijtwYSD7x381rX8nAI+mU6GTdqFyq9VU5dLxId8UASTV0hweq68+G1l3veAlxs/+K1AWroZhpp1/kqmOGMjcQXI6LgsQc2kKpt/ZaAtDzRJfIjkga9DUeUPZ2K9HVwq9C640ERCt/kMuCAqnvxypNGDXMMCmNGgXf4nuklPqTazH11byNewg+iFarajofGiVp2ec4PumyhKUDy7Js2XlWgG0E9aQ4lMy2DSREIRUECKELGFL3j9eC28pSsx71/AR7wjrtF7lx5M1tjrWHx3KD1DCxRy2a+aa56Y2CXlsJ21goVX6CgI+ktEyLQoWiUpxyetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh6OYA8GxBZMq/6N0w3OLTCjyP1UVt+l7FUZr1HRbSk=;
 b=Ijsi63h0g7w21uDvmH174sshg/YahstZhRDwauBOPOtlNrizl9GVq0yh7+lsp3U/FO1wz/bRWTrpmVPgPw+gz0yarvEzDhhwbjtS47VYOsgVNBg121xOOm5dW01Dy7gigfrYCVTnOLWGfdh2T96DCQ/W/8dyb5niIB2KM2HWYlbig1qcXqSinRfzryvbX++5SlXblt3uts1rZPXuucw2IJl6urmNXu6zjZwc2S/kGygD5cBcEmavCwjiYSQLy+EYafuNla+oeIptaQmsyeVynN+xMRHVnrkhdtrjJedvY25FfHcOy201PHxvkMc3T2lVEUXLD7CPTtY72uD7Rk8Exw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:36 +0000
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
Subject: [PATCH v6 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
Date: Fri, 28 Aug 2026 19:57:01 -0700
Message-Id: <20260829025720.23915-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4abd90ef-2d67-4aef-fe02-08df057947a5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	JUKV4b3+fKpVnPjMjtK31pQThleZrM9vjlOj7m07LsT/UUiUUic+E88Wz58k+0b22ZndcdItS6ll609F2a/xvtvkTbAdKsK3g8nTOKx3jNd7438jBzuxeV1gQA2jyed4wZRjg+Dp7GddGjm/LYuzI0ThWZyFqV6i1cSP9Du8Jt45LM5sbsAFABrYKLURjE848x+lLYe16JmOKaJsO4iFxvtYmqoAF91rk3uD6J4kcf4kkC3QaNpOLS5qMvE3Ar9Eufn2YEXRRlKWws8ax7ZR1fU7fJcJ2WsyCySepgAD1i5f7hwWyhHensO/npxkhjexovEjDGfr5977nGsnb9cPjzfZsO3Klm+pJ8PH3zDW+uzVaO8cS1WJj1F7awfpoVhh0+OeIAYwVTw+xPKfAozaDkNyGzFGMmjtXC3gK4jBbQUMaufNKzoLkc7dvrEnnZKkNMscS6dJLS0cJd/t3NLiyv0by2kQgWoRx1IAwK3UG6b1pSHYBYDd4PjI5d8cxoOBr3q2xanLxrzDlqKehvdi98lIp03Dk1Re5huycLjdJ/ARYsoXdwlqTCZWjUJu2fPNpIs9NC14yKDG/KZRODGhNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U0YZTWR4hgQIBoJtLVdimfHrTMxoDCJUj/ASzWP97X7m9m/INRvlDFF80pZo?=
 =?us-ascii?Q?zBDT6BQdUFtpCfw/N+w2y8QXPR3NA2MOPeyol2tyR5YgYwJSsEhzBX9is/Rr?=
 =?us-ascii?Q?6Nl1cFq7CKbBnSaTx15tY7KC4VX35xrxktz5HLtlKeCx9xw2GiM9cvvn050a?=
 =?us-ascii?Q?biUNvgV9r9EuGAOXQi7bqGYOAXxHqFh+THrN+dqCfF4LYRbzhy6qV0Wfl914?=
 =?us-ascii?Q?uHDjIY/Ylef4JZ0J+uEf6wh2lSwftIt7sbziklO8H+Euhto3MqTp/IvyuCGm?=
 =?us-ascii?Q?h7qKH74ULRZDeM9vLACYT5Ik6J5iW7Yn/xz5U4TKJW3yn4qAHbYTkVyrAvvT?=
 =?us-ascii?Q?/vjOMKKWdvrE5gmycnXgMtWcRREvAaZZ9UfYWj5v/hTHgT/h8N4lhf6R8In6?=
 =?us-ascii?Q?7HjJvNNI5AomQ1ZnJl7cD3xh9kIb+nB353Hmr2rZgB9gGIMQBl/guZkSgp66?=
 =?us-ascii?Q?QL8i1u1w8VloshGGk7k6BNWZv6tiix9BiOiBYARnPO0wbs4qTwesT8HwMa7Z?=
 =?us-ascii?Q?qaVGlzrgQ2NCEwaoeCB92LCSeTenCd+D8O/c1X+CYhbezdQO5Vh0tu6GGGHn?=
 =?us-ascii?Q?o6pxWygQVx4BYJOThV0+/bUs3iv3CDpSPTWkz8mJqyj//ti4nmADdWldmKY/?=
 =?us-ascii?Q?3J8QHVGqayFZwToex9JJ8kuU7M6IcGxwfWgddGQSvS6nvJkuMZtsdT4+S5vA?=
 =?us-ascii?Q?27SN8M3rBV2vEdbupe1lSRUhzGSg/cAOR5thqBnCW83XtDQHBPZN8UffzJi6?=
 =?us-ascii?Q?rpktD08Cs5y1P+QqpeJaEb0vPY/S8uR/rGapbevxoYbjHXLszazYYsR326FE?=
 =?us-ascii?Q?dJCsJlxviDme6413jfa1ptG80PLK/LXw2bgCn+qaFzMK5QaXpCPGCHj2rpuF?=
 =?us-ascii?Q?J4UDy0C6C4FqlRcex69G9wOxcIdpcrHMEoPyCFJpw3KtN1v7RuQGQu90eDXM?=
 =?us-ascii?Q?gW9N5iWK5OMHD3a3d8jRKYATs7Llk8RUVMxnxRRjQwPjiEV9ZQKkDm1KANFg?=
 =?us-ascii?Q?Uooqf3Ll4txYs6/umDGWpKZPNCiMJQN4KUruZfklWvmaIBJdZqWnZNnGfIQA?=
 =?us-ascii?Q?bwOuRwr/iSrqN8Ypw+WCW5WRT34lC5DyKDyq6DF9Zz/0B9twC7l49BKx0DLk?=
 =?us-ascii?Q?DyAL4diyE4WrW1FYRr/Vp8EZUhGdek9WuP07W5MpXBVfyNSqUT082N3qj7sN?=
 =?us-ascii?Q?X0LH5gD1BPjNzGzbFGj3NYAnv9WpEyOXaF601sdkKNxLUXTbrdOUpLR/LTj0?=
 =?us-ascii?Q?GDjm4JJSxj6h7wu1u8txl0BF47y12O099+6dJLvsV6VZ+rxGfseOlA6yvtE9?=
 =?us-ascii?Q?FvXBwOnzDFzl8w309M+dItuTX1+Ltfup0fpBpPiohX1zXtwfe+5vh3KHiSHO?=
 =?us-ascii?Q?51qAURGHNpM7pXdFHHmtY5gMedvXC2O15Kqe7ZTOwz/58wY6FYu4oPsUipMO?=
 =?us-ascii?Q?aVaNXoA2GGWafP3obZHSHNEfPASioiE1A3cHBrh89rH3ngGvnp4X5ari8LRM?=
 =?us-ascii?Q?R23acx1p7cPvmU2la2vXX6RTlHb4OqwtnxStudK2qj8pbPdo3mQ7f5hR4olb?=
 =?us-ascii?Q?RhUnlAS8dxl7DIOOpuuNZ/bwasRco7Vne2TiqK5DMWSp2C9dB1N0GeHMgUyP?=
 =?us-ascii?Q?MOVZSq3CT15ojB4t4ozoI+Id4bPBjYcgeE75sik3OFAFKUxgn6aS+o68v2bh?=
 =?us-ascii?Q?fl8uHV9b88zOCVj+adgpb6P5hEPNTWSqnh2luWCJt4yfJO7kmJxXw5dc+tE+?=
 =?us-ascii?Q?VRdvosi7zIwWssWmqa/L1I95vVzVclzb0LCL38y5nPWFl44Ghg1U?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abd90ef-2d67-4aef-fe02-08df057947a5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:36.2240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfHNJILMhUqFlfjIvrD4toivl3OmeP9eKZRAd6z3w+T7hrVl1XeodUN5vyX92A0qe2VAbEpLCQ9WZt3RZLauXf01PZhTR64uXq/moluooqC5Gzoto+4aFlKVSCngcnKC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

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

