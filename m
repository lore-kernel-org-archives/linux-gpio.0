Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2784CB8A1
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553234; cv=fail; b=fagK+nGP7xz3zk6/KlWs5amXbuZzW72qrLappeOpqqEgEdO0HfTIrPKXcx0PmphM/unNS0Kfp35gGJrKgUf9pzuQ3R+k+YDo+0dECJnD6FVe/pyPBuiCBvv6pxIE3oAs2WxgaF91PH4ERgvNXhVjnLtgbWZ2Kocb2MK0kMy2OAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553234; c=relaxed/simple;
	bh=CtlhqtwusiQBuY1wdCM50uejjYexht9F0y671Ll6KYc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JUaJ2Z5oZuzFNC3tjiK/II9rgnGgI/TaDwq6z4gLUW7w0R59D0ePCAegwrpYt+h3/vjyq7z/7BylsOhwoBmUTdKP+vEelahKQ2jvK8zLihvc68+DfZC4UryJm8pwVXA5YFYRaZfWb3/Vuk3aYVgeEn+7ir//cABiHXLGRxhKOQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ont+6Sdz; arc=fail smtp.client-ip=52.101.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ont+6Sdz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVyaVdI1gOQy0v3bDK+KHgSmJyPgK4mf4DB0SoIZAss/7fbg4m+ZP5ROZF3jv7ZFzZw9yEWq84+9iUfKBEENVKSsnHPkIIT2uPcjaW2pWNzop7ExK0eP3K0CY96/UuEnCZNEKIG1FfW+y0tOlepuzfQC+UoCcjv2lip4lFFJ+4qFDZOMx36xksAtYpi9TLUGa5roPjyWtNbsQtrFrQfkOY0jUZn5E9VE9CdL0MyjZQOesMdHvhW8uZ15+XjTVm8FGaysnOJF/ObjKE1BSOm9g4IjiPW/QAzbu3GBGORAycOTvSas3KxAWzp6LDYujC6qylLIDz9aI2gW9zlW50sMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwrFFnAnxEpZmC+wUrYDLhtCrc0L2kOxsL9ywk1Yaw4=;
 b=iJzZCmzbnxgAY0oFDu7A8/JFCu5vk9PvJw5KJspHxjP/ei2H6C8kj3LyGBpLyMDtERMzbn8TME7pcbpIea2AqvGQUeW6r2C44LdSJPeSOLo0WCc/AEpHTc6bW7bMoN7ceg2G+mYIuLP0Uj741inOno8bCtQcjeYIaMPzrlj4z7a5qQ1lI70N1kx06YnKt3rkeP+coxiHCr8F0BSgMrB/ZVtwRCY8Rnr+uG4ZkQzF/V3PukXVdUJ54mL02lU5f7WGpKqKZ1Slsyb/burWvASlC6ICmYzp3DnpBaPmpp1A8fWhlzIfQttJ1myZLdyEqdvuAw1t2IfJ94Lr2Mc/JAO3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwrFFnAnxEpZmC+wUrYDLhtCrc0L2kOxsL9ywk1Yaw4=;
 b=Ont+6SdzCuhER4PiER+6mIxUSf09egXC6TCS0pgS7hJojeQbNKRe/CNaAw5fLPt904k3tvdWZCJa3qLhNdSXvrTcgP7Br9Bwp4yKYF4brT6XmSRhEgTN8ZZcIIy7V2GHBcX4Sqfn7qB1Qysl+qfUUGjD6qZToH3dTolcHKSBoQM=
Received: from CY5PR20CA0010.namprd20.prod.outlook.com (2603:10b6:930:3::11)
 by MW9PR12MB999207.namprd12.prod.outlook.com (2603:10b6:303:301::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 10:07:02 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::85) by CY5PR20CA0010.outlook.office365.com
 (2603:10b6:930:3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 10:07:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 10:07:01 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 05:06:59 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/3] pinctrl: amd: Factor out optional named resource lookup
Date: Wed, 16 Sep 2026 15:36:29 +0530
Message-ID: <20260916100630.37849-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
References: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|MW9PR12MB999207:EE_
X-MS-Office365-Filtering-Correlation-Id: d082b43b-9b6a-4bd9-bb9d-08df13da40a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LJXd2Bs0jtPt+wQWMR3WX/TEsYTifvO0DJUXNYRp7k8+/QHyNTadIbKGABAmpqd6avheABunFGL8F7ak/aifIIjie9Coupt3pIkhJN7CObvn+qbXaFLhoXO8sRnGI7NLpfdRZ3OoSAkQNVtxaDfa0DkYwVcsjbTr6stMywv9mWWBP8sitNougT9ZSJ3c2DUFnypzXQ4Io5ucc+bhUKJp+gJmM+Sv0nbRTxHpIaZYG0Nf+GSv7aeLiK8LkkU8Rm0Cb6UM+J/zpkd7CzJs+Fc22fnmfa7ulGE+fA9mcIRncTzaJIQlHEq2xp1TQOD9GAt71LrxSrDQgom3cELdfIxktwD9c8Cm+QRMheEt+vBOkDSThoxuZqyFZ7J3qHBmjUQfru+oK6GFxbP3D5TVsVlHe+0eZSvRLYdNaWCZ9xMfRvSZ2VD9r58zyk3YbPRnq8Zr6OLmh9Bu1n8A/k/GAs3OqlWxwDoBXOBviff38HRWbLUnrK85agxjSmn/huUY28qkI4LKjIEwRqTe1Qjp1NaHeuXiUacLt5RZCiPOGpfNk7hHwHrWOnZNOWm7yzS75M1wjUSE4Iy9hQgiHLOxK/c4piplZ9+iOE0eNsjI1XyoM/5H4ot6Y5TPsfHheXQCBGmy9Ltn8AZU/n6ECcmHTqK0OnLIKYUxEth9lZvpTPCxtqSwDZ/rxMocihzgKIlwe0D+1eL/drR+XLqY8nFV2nlA+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dmxo7AXdulEnvmf7eQ4ksPoz4zgwfLoPH5uCrdKlsbxrGiUGnEUIR6Gc2bEEswkMgphqUDUtik9kyXOBeJi7hJDecA9k2bSKrxJzjmZJu3d1/bfYqZR2Cu/pO/3nr9wGE+XTfVbDpHPyTaBI5mx6y47ZHfgMoYdrkeTfsO3YPCWBKSRg83OwRsDp2W4oqhgeepOlnNcygteM81UedYPdyjBRYM6h80vfWBfY8wmCtzC5GWUAvvM2buenyNuZnN/EKZH3xwqXgM0mGRrBSXIeQxzJkmOUuSGonO27glFsbYNP/geRef2w+FhTlkJ4gRMIOesMg47+Kc1qetPzMSK+NXMfTjydS4K6Zb3jBCtLCQJc2lYwI37nfHYab1mwy4hCRdkjQc1078hh2VEARUp7CN83PIOPymTuTtcgEHPGF82TbBwy7uP3OVPpxGDcF86f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:07:01.7393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d082b43b-9b6a-4bd9-bb9d-08df13da40a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999207

The optional iomux resource is looked up by name. A following patch
needs the same lookup for another optional resource, along with a
minimum size check. Factor it out into a helper that also rejects a
resource smaller than a caller-supplied size. No functional change for
iomux.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7befc81c0938..8bab4af0a7a3 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1135,28 +1135,31 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
+static void __iomem *amd_get_named_res(struct device *dev, struct platform_device *pdev,
+				       const char *name, resource_size_t minsz)
 {
-	struct pinctrl_desc *desc = &amd_pinctrl_desc;
-	struct device *dev = &gpio_dev->pdev->dev;
+	struct resource *res;
+	void __iomem *base;
 	int index;
 
-	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
+	index = device_property_match_string(dev, "pinctrl-resource-names", name);
 	if (index < 0) {
-		dev_dbg(dev, "iomux not supported\n");
-		goto out_no_pinmux;
+		dev_dbg(dev, "%s not supported\n", name);
+		return NULL;
 	}
 
-	gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
-	if (IS_ERR(gpio_dev->iomux_base)) {
-		dev_dbg(dev, "iomux not supported %d io resource\n", index);
-		goto out_no_pinmux;
+	base = devm_platform_get_and_ioremap_resource(pdev, index, &res);
+	if (IS_ERR(base)) {
+		dev_dbg(dev, "%s not supported %d io resource\n", name, index);
+		return NULL;
 	}
 
-	return;
+	if (resource_size(res) < minsz) {
+		dev_err(dev, "%s resource too small\n", name);
+		return NULL;
+	}
 
-out_no_pinmux:
-	desc->pmxops = NULL;
+	return base;
 }
 
 static int amd_gpio_probe(struct platform_device *pdev)
@@ -1211,7 +1214,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
 
 	amd_pinctrl_desc.name = dev_name(&pdev->dev);
-	amd_get_iomux_res(gpio_dev);
+	gpio_dev->iomux_base = amd_get_named_res(&pdev->dev, pdev, "iomux", 0);
+	if (!gpio_dev->iomux_base)
+		amd_pinctrl_desc.pmxops = NULL;
 	gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
 						gpio_dev);
 	if (IS_ERR(gpio_dev->pctrl)) {
-- 
2.34.1

