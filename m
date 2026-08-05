Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D064749E5;
	Wed,  5 Aug 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933337; cv=fail; b=UI/s9e5VTAMdaA1qb/QaJ/lstubnXyL5BxYa3eMTyvMC6cqr2RbNeHmn20OP7CP6OxN4XJwL5KyvB5X1CxFkH5HjDVX9JuKPB+Sox6d4FTnXWxfqzj6d8/IepMi0WbLmTAmMOPzcQKUvQNjMMirsbvw74KaEXhwQyWnPsMWdlYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933337; c=relaxed/simple;
	bh=3bFWHbzXLIXFGJOtadv7RMfqBxWuJQm+bJOGo7hP2LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T8Vq0NVOmnY5GNe5O+AO4G79do/e9oRgNx6n3bcMICFyvwfLKhry3kJrdGRXwzaXe9LRYNBFwn+xhOSymtClskMBJs07q1ISN+OTGC1XPmBdIKGRPGsrMJiQ5VAYGyhu3zzQQV2K4N1Ky7ICPoR/aAfYTAH55NXNB4vuIfT7RiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=RVrXMsPP; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="RVrXMsPP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vq2SbIKD1TqVU+SDrAXPeyMbzfMMeM7IveGAh3ohKtFcM9iarHX77NnyUs/sCv+bM8sY/9hKeDzesaQCLROynh3ARHOqX5YtywiSBihcQXhsJyDjdGpCyaMwDT4tBvS0syGuNaetz+qfyDAtyXkjzPPoNuXrIn0u9z6uRh/hN5zVWayEfMPhEQFKs6bCn49+vlqFpHJiLyDHDWx2ajlR9oYAh7BcgIdFcN0ihoGRKgtpZ1iymYXuIQISp7hD7Bc4+hLn17Z/l9HOn+HprH+WJ1k4hWEyQSruEhkHZUu+KV9VbphqScWkj5h/3zq1HiHAjNTof/j/0cF6/aucr3g+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z7RNLkxIT80k+IBX/KM1Vhl7f2kqCl+TGnvKdSYTGQ=;
 b=QCGUk522Mw6xo4iLkcly8qCM+QDcwt6fgWHgLhrx6an7m59zKNp27M+48TKPXOJ6t1XWivLZehIqs0P8EJH2cFTbL1rIDiXoq8COwQJg9ykjw8GVLfH+2wbPsAUNxDtNFtl3ZPcS00HBEpWH8rBKnkFGik1moO76iTqo/o4vvejSiK9nlcFGFxeCESGqGSs6r/0e3NP6/N8yHsfmIjnJVuL1kCplhH2YcWfIMP4DQKhbhMbJnE0DHI4Ngjy5h4+e0AnXDXhlePupJcwylbx3Sso1PXlw8hLMJeCq8lutSS8LOgMnLAUNC1a8OncS2Uzc676TVVktvdvJ90wg4JvrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Z7RNLkxIT80k+IBX/KM1Vhl7f2kqCl+TGnvKdSYTGQ=;
 b=RVrXMsPP8YSEeSL8FetMhvdeT85x0NIbJGeW6XRkYxjW5CaQ0jTKuDVjJqAyqh5ThdGQh6V8vbI51sk4MmcXFs/7iwZ2Ik8ZQYlevyMsd4HnMChhTWrRyHELsXhC4dKmloLKiW4NL1JGGkny03HMcuWgGhmqwg3v5ZU/pqyXGJar/yLTYPn2urujGaWUh9Xcd5eycZk/YlorboOzTnhgjKA590gpQzuuBg4nmDPbDyKRRtz4Uk5bClc88/wZ9zivgU8l3Jd/JQOpbECWQ+CvxyxPn0DxNtd94JMbVO90duPRza3j5rbMMMYe9ZZdp9m2v3253td1e8DPuBohIlpE2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:26 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:24 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v10 33/36] pinctrl: airoha: try to find chip scu node by phandle first
Date: Wed,  5 Aug 2026 15:34:05 +0300
Message-ID: <20260805123408.3767648-34-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 286edfc5-1e4a-468f-45e9-08def2ee0551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	Kv0WPdbwa8ds7HkYDsAtpv8+kyeNYeBfgZBdlbzA2EJY7Q1zNBTqexhQdKXtENdo+SlFVKdpPFmXdXjg1ywoOKeGfvTFBVHy0eGtaSfebWr0rzpKdes3laoHdnM3P4+qGj0qfb8cIWyMs6ocN8g0Sc6LnTAmRlqANGbkfvBfWZPPXZRPsTMDMvNsuTbip/tzYvD3XIWZdzyi/ajJ73zoVY2QLZeMbs6Bc1BB8rtqdOKVa39E+4tp1zAyOHWIjCNBtwx8671GTOzo8apUnJKNGck/Iq4MXwB3tIwhanOb7I6JTbmadD3WOu+VH7tZGa7IZjte/7waSsDrGyErEfhfaIfMDHUFEVMia9LC/dlrgX1QJWdMu9C2IWIF+Q0JTKGhl+VPElILx5SiKq/3mKQ4xjTn68fsO5QhaNiPVdVWYkwmbhCk1nvweAXr2o5CLB1ax1cXIP8tkZWA7N3BFAwfcmUTxT2IJScj+dzf1WlDD3nehd2yWCxeMqiLx8rwfXb2aIjDofEr5pRAyA54Ra+VRsb7N1ZP5RltRjx3MCyyXAwLgdmpXvUOV0kwJYDc3ja8to2pTDWYGLVIb8S3rvQvk3BAvX0aZ9QatbhEdbuF865z1LSQA38P//YoC78MHzViiTYG4ofxLq8EOpeNoWXIeRrM+m5eozM+OnPuKfLJzhZSbAbhTmgzW4c3XCd0cs/QSdEzM72hPTX27dVftB4CyALG+jz25rE7evmx7sBN81mlLY6eioez/hoPR1BWBVpJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B36Bd2pXWH1O3aCLLVZmTtld5+CicIGQhcilNUgt2bn52gWQvuWbYn4xD0n6?=
 =?us-ascii?Q?lLfQdcu/51wiHZxQUfwnKHfORFCA8SCJiFpvMs8gsiCiVA/5AKaK3XXcni7h?=
 =?us-ascii?Q?mMXPSRgynQFoyV3fU37gsHCXNTpPzCaaiMkhy+NZSL95aoKeG64s2GORAyi0?=
 =?us-ascii?Q?sJSsO0uq297OQlLlgHRm0fZrHBsS3jQ2dAv2xbjJqQwqmXNUm1JfA4AFVXlz?=
 =?us-ascii?Q?p9KaKP/OqSqQ/kcLjBXbhSQFsY+Kk0oo8SGfmlsw9NEO0D5inaJo9gBTupSe?=
 =?us-ascii?Q?iTh7ERhp4Esu57TEyJyH0A1VfnbPiII0uWgI2rKYdmXbM2UDJOIOS35pWSbn?=
 =?us-ascii?Q?HPOzXdXbBbMvvLteNWd4HWT2fMpm5pqCdXZfF44Zy+onkUAVTvUYvgu9aHhC?=
 =?us-ascii?Q?keU8C8+umlUfFWSGvWIwXcxAxDR89C/lYPjLqMMHevJvjdCpREhMsIYxEsve?=
 =?us-ascii?Q?GWjvj+1zlbzVOwa6dnTm4iDM0JvTHTmuSnDVRDDxU3aulwMtw782t60Xuy+a?=
 =?us-ascii?Q?tzsDpdqFdOhn7k3k2xrkS5VqZMaZqzH7lnuYWbH2e4d/fYH6q055etje6a8K?=
 =?us-ascii?Q?W9teWaBLje1COCJDXbUyWqf1LJHPcBvJUyDlfspVoB7orzjkfRv3qKt+ZvyR?=
 =?us-ascii?Q?bcWZUSyqLzZNdZAPsewpoMCD06XdQ/p9+aaAqDPEXsGK46FcrlgNT16eU5yN?=
 =?us-ascii?Q?Qpog/ypqgDWeJ8jrIFXQHBgHs7sS9NHq5McUqeISlzoqvYvD19Tg+pLe/knz?=
 =?us-ascii?Q?SnMdN6B71fI9kVUBbVrOPZrYOk+otgiSrJ/5NmJwivF+3FvqRvrRFuLWhB2J?=
 =?us-ascii?Q?H8mC5Q+cSbnK9VMRqHcEijsKm/uLLfk+sAE0migOJlq37MkWqotLCEzlapRO?=
 =?us-ascii?Q?YCSOg3CyQopcFYE6ocpU3tWSrl7pusKW2GX9HqJGiHHYCFhki/7PemeC+ug3?=
 =?us-ascii?Q?Ppx4O2Lwr5kGjGhPLE3WOLbGchu0ioece5opg+j5s5R7X3fPkSrljCegPR3S?=
 =?us-ascii?Q?z2eWivVCYzGRmpT0MfaCzHqnJNESjk3ZU7Y4Dh4SklY3WMYeu5GaiPFd5x3W?=
 =?us-ascii?Q?PSrl1iyYLWUWUhi59QTs/95IycrRRk8cP+18sjfysn/Oa8B6G7cnV0KbNelA?=
 =?us-ascii?Q?jwd+Bhdxz2tNDzyo602T75jOIbjk/ARvQLYmud2XXI8MFIJ+RPodtme+nlUa?=
 =?us-ascii?Q?60G67gAp6dlEGds8mrs78gT6ntMyNsKT56ChvY/QKt4sxgZM4O0mQ/lRgZWu?=
 =?us-ascii?Q?DXXVp7mMgMp2FQRLW0+MAWkT180fK/jTFgd+Vy21r9PZLFWc6aLgcHbxCJvD?=
 =?us-ascii?Q?KHP/aVBRtyCkwjN6eJdBBdkWjSHjNcdJPQUxz4Aqz5WPzuDfOGWksIpnq+1S?=
 =?us-ascii?Q?LL2XvnGKmUs2MdZjXi4u9YhEtP/nuLw9s1LcawWMowVnjNrelnwkLzjAuQVE?=
 =?us-ascii?Q?b9v3SYxqVGU3fUUoElZo58wdQJ6qZt6hGm4SdXZOcVkxaiJc4hjqmAKvEcUp?=
 =?us-ascii?Q?NMnck89QTG3yXrrTh7+uVgX+lZ/Pn1xIo/QIkky7ehBbY+V2eUy1f1t+MfA8?=
 =?us-ascii?Q?/UQQPhSj3rvnIcov+APtuyf3KK/LnLjzOF8Z8cyClvz+WXqe+xBDOHgYBNmK?=
 =?us-ascii?Q?0gHkgDpeejWLqfYeh3w7Khu91iwoYhf9cEzF7aaIJEDN377cZi/U+o/kcOQ6?=
 =?us-ascii?Q?VFWlMlX+b1EEbbk29txK8vr9qY3N9NalJ4B0pETchuJv7xZZrEhFpZAxHTrJ?=
 =?us-ascii?Q?0jenHRaIc6ECekefmn3yneaWEKpA4WM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 286edfc5-1e4a-468f-45e9-08def2ee0551
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:24.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHvC9B4vWeH16BBS4BpGC1FIMJ6apxcQKB6WEcpuOEWGT+jTML0Sybh7VM+Hv0a+UqZTNKdkVOX8x+lAm9cb7/Xo47B/ltaodxQEznX1V6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 9 ++++++---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index e6b60c8f9fa73..c1acbfb7426e8 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -130,6 +130,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct pinctrl_pin_desc *pins;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e2de134624a78..d3f59c9fc1c47 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -790,9 +790,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
+	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
+	if (IS_ERR_OR_NULL(map)) {
+		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+	}
 
 	pinctrl->chip_scu = map;
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index cd2a78382bc6a..2fcf88106e11d 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1432,6 +1432,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 031a8b36e0024..2c3a75c35915c 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1462,6 +1462,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 91490418e9ab1..5aa39bacf460c 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1104,6 +1104,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
-- 
2.53.0

