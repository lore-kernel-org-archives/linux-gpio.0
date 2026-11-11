Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794413251;
	b=pDnMasLtDKcuhgJcfvF5cf4IayoEvtRCjeKD856z4vMPQGMmLFu4zg6mVTMX9W4MIOiB
	 f9cxUVIADfJ6F1ADw0EYEEbcOZpa0nNilYn5/uuFRK+lJHNW5GCb7XhlIyvf+idCHvh3Z
	 70+iZ3R5mSnrkMFFiy5nD2spzDmTDjH3Pw/1CKtSa8citCwmZmlxEP8CdzYxxs84ZWg4/
	 RkkHAZpLKkaIBk1WjF5FIGQAXYLioDzsqeBygLPSbxLhYYXgIRB6wgsV2ifttJN9Xyz5E
	 sYuDLn6mYciz+oBfPS/xfgcOIY/Aar2F3honDqi2xxrf7S2eJkh68IlHlen49UFpCsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413251;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zBikkaDDN4td28+Re6ZUCsDvsCb+YwDM5oYc3o4ntCw=;
	b=juvLioH1ZGOhlQUKcz0EkzYxr4/tIR2lDbK1eOeiRJ67cWRMChDjz6bvT/NUJLlXpsuu
	 o+ZPSlz8ylxB78Hl8XwKwjealH6OdRA6dfvusL96Dk5BSuqIXCBMVIBf2zv7LTcB8xAEZ
	 k246Ct0MIndWTz1lYCbTtM4+jU0gAp6cI6SQuMhS/Wz+5108LKhNEEiC+P/Nvi3qBm56Y
	 Om8KYuHcvmFfQBrVaTvorEaYmbuRBk7q44sW0pAseuLY4F3VVu/ckbDuhuiAucJwrvBj0
	 sSh0zuncyBc4Rdw91S+WyKZcGWOMI0DTLBlzek8rAP1AtCXiJss3rBfRuuuUvkyxuxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zSdOcALW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.39
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BD606A32E;
	Wed, 11 Nov 2026 16:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001BD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zSdOcALW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLa+hEMGedl0hfur1SLWLEVHKCRIW/2HtecBfHvva8xYhuC0/3PbKVMcmtJgoogkMLB+atfNnwi3tZVt/TaEVmt2QKKqyk5Pm9EZgInibGERrxrYVvKpVZ6seaDe+3yYGE0K29BA7w+EuR7sY07hV6st6QyV9PCAyydx2fnXpJ4YbUQVkFB06vyLnXDxzFfSup7sBkTHERlLckerKr2EA74NnhM/OgQ/pqjZGueD8UPo+QeGX2RzCRjSp7FLEGAuNB4vtwYEL8EjSEsjV9LcmHLl4MpaxKtE7INPDMcYElGt6zeEARYq/V/Nzu0N3JvAxPaVFSX18v1HkMXY8UCbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBikkaDDN4td28+Re6ZUCsDvsCb+YwDM5oYc3o4ntCw=;
 b=ZrrkpasCtadTvqwcnMh51pER39E43aQdbWXcbG2FB7SGczdCrBzvxlaKLeZKSxqpxaTDNu5XOx2GJdN2aVeElZ5fLe0sc7lqEmaNycSSMB81EqRyl/QLbdM2NYl45yTWlxJNWqxcyCBa09rFggfsIFZ+l3BMAEyPFdffNY427pHrttqSmRBK6qJ9GMM3p0j0/W53nTgAzavu3FBE3Qd+u6GYL9Fnz2oPo1o65nCOCPWuqP4Odwh1hLdLcgDQmmNstqx1MZmJHIHddESOK/rcfaXwPFKDteSpMGEVZuOHhLYSqjDegGhbgqmhbM2+TVeIsbCchYixA7uWLYHi+4ddlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBikkaDDN4td28+Re6ZUCsDvsCb+YwDM5oYc3o4ntCw=;
 b=zSdOcALWWcCHSx7lBoI0gFSn1ulRIojd8YTxOagr0puqw1UYrTBA7Wme2x3sSqBduJmi+cX7MXxtnnBFIny8uviIXhT6AYuQHVgspl7J8bmwHMPVVRmtcB1r5QjLntHtM6WzW006KqNlJZFTUUmQ5X0I34UiCc+9Dn+tbFcPZ6Q=
Received: from BN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:e4::28)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 16:07:24 +0000
Received: from BN3PEPF00022BC3.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::a3) by BN0PR02CA0023.outlook.office365.com
 (2603:10b6:408:e4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 16:07:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC3.mail.protection.outlook.com (10.167.248.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 16:07:23 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 10:07:23 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Wed, 11 Nov 2026 10:07:08 -0600
Subject: [PATCH] pinctrl: amd: Steer GPIO interrupt to low power/efficiency
 cores
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com>
X-B4-Tracking: v=1; b=H4sIAKuS9GoC/yXNywrCMBCF4Vcps3agSYtQX0VctOlRR8yFSVqF0
 nc36tl9m/9slKGCTKdmI8UqWWKoMIeG3H0MN7DM1WRbezR1nJcE9YaTBFf0ySm+oCw+aVzhEQo
 PXd+384jJDh3VTlJc5f37OF/+zsv0gCvfMO37BxWKxrmFAAAA
X-Change-ID: 20261111-superm1-pinctrl-power-improvement-93440daeb293
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC3:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 3661ce51-d114-4ce2-bf72-08df400ddf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|11063799006|5023799004|56012099006|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CMpRT0pyZeMplmtJSS74XC8Q/P21GOowFEkDmBQyjvWHwQ/rmEBSlojwEo8q6yr+5m0nZLK85YVk6KnSAqdSKK6W9ncZhq0pNMByt3c+ty192qxMrXyatB1BeaaSVJzywvyWSnBg/tKGCkpwI9LoR0KYMV2jMqw2gmif/pa0Xheb0qM+ChGSF/2/OdqNFg7sptalEphlaXKcciAAVe4u5yubfXVXlV9utpUDMdl+NIV8OjSrpxsngU20OVlTOgknS967mmM+/qwOwX13ykFSQRahknhklRrh/icWoReqszE4jzJnoMKiSSXZYqFmmwEiocA6Nl3i6W5vYrWzWysqDWmuQ8kxWE3IeRTQjmfZA46+zkKybbPcv0l869RHu9dlRVqsBonz+e8Jp8qv7uje5aGk3paJMcSYMyTDthpYIZ+YH2XQQ1iR+rGXd+tv6KYaoLQvpAucAR5iI3wLhWSQGkdrR+whrRvith6CseyTDWSN0myFwXq9FcvWeiHWAva3NpL9oQUwHLdCYKvfHDAa2s8fOPUzCm4970nQJ6S+WZgXwhfYZCDhETAdr1uma3hu11JNCgOgWDoo3PM7/OZZlSWGIqUWVK+7afKAgGHuXdQI/NPgnetPLhmS8bz2f7KJlXRxU3LXW+ZkBUseu/Q0fkHI8yV9V+qqu2L6l91G0yAeUCDgNYEqlEKKIqn4dA8lf2kgTjgCuG0F+FIjiA8peg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JNROHDXDzQX61wmHOnWG4fhXe+sUV0yCO7RMv8poRwZhRswaMPqfnXJ1XrpdH0STaN8rATvcpRaIOD72PLIMBsVFqoaQ9KRrM+3JGdowTXRatxY43zB5pA05toEpHcNDdUeiX/Kb3+fvimZKk1OzOAI2M/dvF+euohqm4fkYD5hkzWnx/Ehz6/58jwgCDg5yJQA2g/+yshQLtwi0m0flLLcRasKT1W69AmNGu00bGhn58kmm8cguEeNogTmqjpHuAL4o/QuTX7K2DhN6zd4pIW6WJSjEVft6tL/RAYrPhfTPR89b5zJvrUMTKIIoBCFSdFDvYVbgmmAI5w84BuXERCytrSUaaAGVj+BM5/yODDd1r6RidZINTSEgK37ViaYFwN1PlwH5xqNVp27QgQF5KxQEwiik5iuj/iyrcN0H8hexAG9RX5DYUVXSZBOMS5XH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:07:23.7265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3661ce51-d114-4ce2-bf72-08df400ddf75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357

On hybrid x86 systems the GPIO controller interrupt can be a frequent
wake and handler source.  Servicing it on a performance core can wake that
core unnecessarily.

Prefer routing it to low power cores, then to efficiency (dense) cores,
using the CPU type from the x86 topology information.  If the system has
neither core type (non-hybrid), leave the affinity untouched.

The placement is applied with irq_set_affinity(), so userspace is still
free to override it.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 30da75bb93b9a..3ae199cc93435 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -31,6 +31,8 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/string_choices.h>
 #include <linux/suspend.h>
+#include <linux/cpumask.h>
+#include <linux/processor.h>
 
 #include "core.h"
 #include "pinctrl-utils.h"
@@ -1272,6 +1274,41 @@ static void __iomem *amd_get_named_res(struct device *dev, struct platform_devic
 	return base;
 }
 
+#ifdef CONFIG_X86_64
+/*
+ * On hybrid systems prefer to service the GPIO interrupt on low power cores,
+ * then on efficiency (dense) cores to save power.  Userspace can still
+ * override the placement.  Do nothing if neither core type exists.
+ */
+static void amd_gpio_set_irq_affinity(struct amd_gpio *gpio_dev)
+{
+	static const enum x86_topology_cpu_type types[] = {
+		TOPO_CPU_TYPE_LOW_POWER,
+		TOPO_CPU_TYPE_EFFICIENCY,
+	};
+	cpumask_var_t mask;
+	int cpu, i;
+
+	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(types); i++) {
+		for_each_possible_cpu(cpu) {
+			if (cpu_data(cpu).topo.cpu_type == types[i])
+				cpumask_set_cpu(cpu, mask);
+		}
+		if (!cpumask_empty(mask)) {
+			irq_set_affinity(gpio_dev->irq, mask);
+			break;
+		}
+	}
+
+	free_cpumask_var(mask);
+}
+#else
+static void amd_gpio_set_irq_affinity(struct amd_gpio *gpio_dev) {}
+#endif
+
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1377,6 +1414,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		goto out2;
 
+	amd_gpio_set_irq_affinity(gpio_dev);
+
 	platform_set_drvdata(pdev, gpio_dev);
 	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
 	amd_gpio_register_s2idle_ops();

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261111-superm1-pinctrl-power-improvement-93440daeb293

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

