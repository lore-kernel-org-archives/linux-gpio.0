Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA3FEEC3
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 05:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789968515; cv=fail; b=e2mzjQfjRNHcM4NlPr0bIGvtNwCclamxDDNtZI7KoBCqTqdRS8GIdR0Nx7qqFmRCMK4oYa6UW30QGq4lpX5kNfUb3UMpCt4vPaTLPPmB+q+csCWgjQ+N6zJQARDJyeEsjsQo2v0xp0QymLHgfBTDrV+a1xe1Wu5jJmySlyE7l9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789968515; c=relaxed/simple;
	bh=8H7z/1gdK5SvIJISqsy8emapMqBYTfPfm+KOZLZeLd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUgcHtWyfeT07nt076Rv4lsV/61cZ2s3kunpjFcdb8SJXydNq/0RrHdG+hwyA1gilojjK1OtS1+yAk8Im32EGuFw6i1TJSJ02NXOQLBKmVM1Ae7C9nMmOJKbxV3iuDdHI3sz6x1JLvbwuHFUiJqyyeEY/NvSO5wlrz8K6wpNnSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XTh0Iu/Y; arc=fail smtp.client-ip=40.107.208.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XTh0Iu/Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW/8iEghl9oAD05ygULlyj2UjNmxWtld6IHVKfWLM/H8fczZxBoAHxhXifwYvSJBIEaU9Wds+zAxCnX+Va+GrZLSiVCFy/32tRchUqZZBwaEbK3SP8q+9IgDa5yQs104814lVToJFT/f9iEQFn8QDgEFrjYPYGu2V8ZA1T+JjgykCk2aWparDddCzg6HnY7Z98SG2+99rO0DOGm9tVOQW9xviiWJ96pZ1M1/4ac5Lu2f2Ir+0KIMM5ypEOlOSZ+4L/Bl7DzLBNFrK/vLQppgMtVahbZPSSqqQC/Mn2mpvQsIE+7XZMIiWJPzxkdgn42Y9jCdb8w8LWb9PLo1sEWHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htz3+ZXD3bL5DuAS5ZKCIFFMrCeMqxUSXujxe05Eoyc=;
 b=I3OjccjZUD9oAQz0MwBZtYk8ZV9JX3EDTE0wyCpq24b65zDUJDR8AKf7UD5JEOs2CenBZ5qzCCOOxO7Q2VjRP4CRXIk3SIigc6JNF4wvjz0spQFNskpw8rk5La61hitknfGO5HSzkj1axz9UlE/yP8b2TOAIWFq0NhtZyW/gMe1GR+M6mbO3gZQn80oH4RXq8uBlRM+1APduGGhv6QtEKqk9pVeT1riURb2LJQiZSJy4IVNeW1zHN3zbm2PVtYBqJq9mOqydZCYZM8G+ys4DIv1LPPOehKPATGXrUr7dXUGkKy6E429sWz5dLDN5FgGrOZWRAXpqkj9VSnZW4Mybmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htz3+ZXD3bL5DuAS5ZKCIFFMrCeMqxUSXujxe05Eoyc=;
 b=XTh0Iu/Yd98wiGjVQhxG+rDkB5Oh6ChDedzjhHDSwrAXW4vnX2ovUSOTMZliHjYXo9MpkuKBRWO2ed3JlTp4vCFRP0e720r8iLTJ0N1TwloO1jj9LaP0ZCdHEN6yudBYQri7YNMN/FQSFugsxKaF2Iq2q7Y4Y++W/U4AHJ3eYow=
Received: from BLAPR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:32b::20)
 by SA1PR12MB8700.namprd12.prod.outlook.com (2603:10b6:806:388::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:28:27 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::7a) by BLAPR03CA0015.outlook.office365.com
 (2603:10b6:208:32b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 05:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 05:28:27 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 00:28:24 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <linusw@kernel.org>
CC: <Shyam-sundar.S-k@amd.com>, <Matt.Devillier@amd.com>,
	<Guruvendra.Punugupati@amd.com>, <linux-gpio@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 2/3] pinctrl: amd: Factor out optional named resource lookup
Date: Mon, 21 Sep 2026 10:57:44 +0530
Message-ID: <20260921052745.1056249-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
References: <20260921052745.1056249-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SA1PR12MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f936b24-6f20-48b3-4053-08df17a12a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	kKfffD+AXO1+QVFh6o0IUc9L/8qfBMsD+Sbnu7PaXIjfsDy7tVdl8/la/I1LonfOQvh8w35QTcrQ1KaQfnZrBWlntAF0VxeMM8UpxjhAlDSKMzwTOPC5bdEr71ieQGcfRSozJ7eyAtYh8MMx+0EJEsilHe8eqM8n+Dnpwvkzbjl+e9qrqYGWVs75mqlGwqFIsYjLpTnFTCUkz4IWvttDoWKxcyt1SyWuMXF3LIWJT3ythdZmlO+mcdb3C5sxed7/rVJg9DQuzahM9fLGAdM7h3YEP2aCmYqHRmk2ym7sCxej/7okgk80BTL6dYFMtJHh7buTbBQrnRGUHDce04Phm4L0ZXJN2EKURlU6ej2+hfeGwjQjl1GLawM0DFGe3c/IaT8oM2hIyQjlqjkqFw5X73lSbj7v+CRzL0dnwFBhkQobGsq8xAbX0Hz6livY7iv5FlLXx4H4DNsDHle/Y5AzMhw7Ce4Gu3a4kJbipDUgqB4hgxB+JQa7YCpFr/QYy8FZu9FWQqYRsjKbt49ONVgwovwTn8XV71IXGI3l/OvUcEbHi9WP0S1T8ByaFUKrUWTXXAFteiXUi9rV/nfF6Z8X3G0rhj0Yykyy47EdAMMMXgaHalpntw50EQgJyq0y4ELYa+fI5Fsy3T9r4cbV7Nq9uwueW0vvVXTUBpsDr+t+Vn6b6rmgKqWA7xiqCFsZfMmZzP3SpSRi6bzpc5uSaEBAag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T2dCEgnYinQZ+666M4etseXbEf2AJf4Tu7ABch4YSDwYU0C8OL3AKdOmRQvOgOWNEaqFAit6dDz6MPi19N0otksoWQMViY1MQ3xz1j8I6iq87IyzG/apyNe6SHyaJYcmQBrjXe+ADxx6NWEQzkuU49TpmkzwbVhxFNJxV320EKPIzukdqJuGn+2uIgbwr4BZQc8oUhmoSG8Uu1i7V5mONxnVgxXTi6tgW/Dsv7TQVo1qA9t8vWZ4rEuUhwinNgLWsGF/EetTWmeAAsE0spxS7eQqLZSUXOwbkocVhKrUWTmJYU5O73p9YmHaiEcP3U9MtR2BqyVYXxKdQjPvGCTC1bQEaITcQl+c6A70Yehj5KNbWUZwGl/TdbEWoehAwE2QlI9/LdqX8Yr8d4SAahFV38fpcoWnLFHGF9bEUBmRSh3NQk+NvH66zFU79BfDA2O3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:28:27.1963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f936b24-6f20-48b3-4053-08df17a12a0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8700

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
index 543733c2aae0..18fce75fe86c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1137,28 +1137,31 @@ static struct pinctrl_desc amd_pinctrl_desc = {
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
@@ -1213,7 +1216,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
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

