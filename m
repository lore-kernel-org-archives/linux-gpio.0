Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794451387;
	b=2tvNl0skwKxbLMu0SdWNcqw8R70NJo07+nR4eyHDOkh5HnPG8IuVRqKaD8UMC1lpuBTr
	 zZ662FaZx19hFpCTkCu3FnGjOQ0D63imFB+7d8s//dGg8XPnI7OZOlvshoz0wnlXGnUKT
	 gZVeUrDlvkCW+jKQOoPnB/s8ITzTo1AvsK3QAMR8nTfFrZLR/HjBzKUOGEt036JmsMzEM
	 NKaNMzITxg2K1Oq+zPgeVJPwJD61Qo5KHJxzD5kB1o54nQ8jIt5EXSAAgQBaX6RCmY9S+
	 /C1qNY8/0dG5+38ejawuW5gMQIhMN+vfjutXGtEmu5d5FwRKdSk7JWF/4Wwugxhz4jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451387;
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
	bh=RsiQZJdEXDMF5iUujGZ9PiIFb9cPbaOip0t29zAFuDA=;
	b=cblXpjcJumBv7tgeMJGn+GQh9ocSf6Y3jsE3nlBREtkvgzGGEzH1aWaNsJFC0c1jrG76
	 +3UHBHbbBBL6TJqakxmzrfja1ZFkur4fbyri68/w/K4HAxLmGDE9olnQj8Hq29WewSc64
	 UB8GKf0tJFlf4KvJeP2IdG7Y+Da+bH/4c7kmaJf6CbmH5Y+gKYtk4L7F6+eUpbYs+xjyw
	 qMyt1oyuKnldeqxkd9BvtfzqV59/GJtaP7KaVxQRvBBB/6EsoxBPpuCPuOEVNMc3PGQ9U
	 iNDzwezjIIUL/CX7TctZqmA9H0RhGqfUbTUEYr6+BQNZ+ejFd8eIJtaLIYMPWp/MJiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YrOI5cqB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.69
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5F606A31C;
	Thu, 12 Nov 2026 02:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE5F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YrOI5cqB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLKbbmRSpxKdj0Zvdzfqd99lN4MPNsV+cClrStErgGr9lOI3hIqGaOokabEoeagG0be11Y/ikizaW6dlROaAkrDpN7GI4x9Z8h9+NgIkISY858DZkL4yCMQAJXeQp0LuihhzYteDpNFQ70/lrfxfKpcl0Rl7YAIfkoAVxWGM/E75Lg1faebrtY2xzVWB77zosfFO3jxkZCbRuubv+nOsr3ih1cBBAeW+EK+qlhMKIcosCsrn8tcsM2YTb6UGBQPIWV3x+DWgx9f6T2x1I8Cwr6pLgp02N7zKuHoYQO9qr/bFCxL1gm5BUTPj8Rct6oEcG3KJgQv76mkAIFPSVUjCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsiQZJdEXDMF5iUujGZ9PiIFb9cPbaOip0t29zAFuDA=;
 b=gFWkTuzOSatk++5y20TTiqKNgzjiildrHjJ5a2dOX/druzIi4CtV5B+XinmqV4vZnDdbzqpqnApcr5GAh6C4wGPSLMcmZzWVkFBq97fQqG3G612vqarCaBv/lRDHBlTP66kzj0qsHA7py/uZonpYgZmitsXXbOQ5P3CZT6m2UpvLwPWHK2KamJlvAMJVjc/SfuX63+0W9OboNzMI2ba1Oo1Zq9+1mhGyjT8fhAx7cdgDa3DCOAT9exuxcYLsdG6CP+1lDtBybmKI5CSr1L0jxZgNBegJZnkGkLsUkjMI54YqQHIlgBeyWe5ZvpWpXRroltvH68oG1zGNZTH1CPSMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsiQZJdEXDMF5iUujGZ9PiIFb9cPbaOip0t29zAFuDA=;
 b=YrOI5cqB1mLeXmCQuaxzjRQ0va0zEJgZUhylTq2bJbN4e7sBU7qr1TgPyZJBU0ltkB+m3Owo8PdM0N2Ke4cKGXVR8qEqDqYpEs6KqL525kmvkWNv/ipnyIn486UWvmZ2NkLMwlfMPK6EHxKYdCmG/OVSpCMMYTjI0Rk5pSWgoVE=
Received: from DS7PR03CA0154.namprd03.prod.outlook.com (2603:10b6:5:3b2::9) by
 DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.9; Thu, 12 Nov 2026 02:43:03 +0000
Received: from DSM2EPF0000000E.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::36) by DS7PR03CA0154.outlook.office365.com
 (2603:10b6:5:3b2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 02:43:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DSM2EPF0000000E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 02:43:03 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 20:43:02 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Wed, 11 Nov 2026 20:42:59 -0600
Subject: [PATCH v2] pinctrl: amd: Steer GPIO interrupt to low
 power/efficiency cores
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
Message-ID: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBSEr0K6toYWQsSV9zAsaPuUZ+xPXkvVE
 O5uwRM4uy+ZfDMLi0AIkZ2rhRFkjOhdAXmomJ5GdweOpjCTtexECY9zALKCB3Q60ZMH/wLiaAP
 5DBZc4n3TtrUZQcm+YcUTCG743jeuw4/jrB6g0ybeGhPG5Omzn8hi6/2zlwUXvFUKOm2UkXC6j
 NYctbdsWNf1CwhG1ETiAAAA
X-Change-ID: 20261111-superm1-pinctrl-power-improvement-93440daeb293
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSM2EPF0000000E:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a1080f-bda0-4ee9-6ac5-08df4066ac7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|261009223027099003|18002099003|3023799007|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|56012099006|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	wQaamLce6L63La1OTD1dAHO8eSfTIZ41chp+yu7b5BMPY7nL8qCVn7X39Ngf4jkstEznlO5fjpAncmF6fPTJUgP5E8DyJSD3VvScIi4Adt3jsirStdgBMwptFLfgWvNBlCAFOSjIc0RgiS/B+mHIBppXG/N7/cB4fAulsMedGpyxITEwxbs7c23j38bDZjdVDhS2nNbyI9vvGZ/OI15Zc2amhdvd/qa+a5QLc63SGFkDhB1vdxQOJqQgLeTscGNTmVs2tsn5imYx2pOMuigJWY4zJvheXB+IwEzJuzqSXOgplqKx84Wkg7UR8aC+RnB2Z6CItEJZVY2VYEl+2rheff5ChxKK6rrXME9fxb6ypR/qCVt1fHUypWpCv17JTJUFXKI0dbJEkwlkyF1gPjlcZLRrWN807fdg4xQLc4nRAuFQj20Xjfl5R7H2W6B8leY6cXwy0+fx4BLpD27ddOMHTYMC9iqkgYFiNeX40YLWw5b4OrhdNNNvNsbYTqxwZbr8MXTj/TTskrpR0ayLEnF0p6Ve6GfKE4aV6GLFqszOpTkrFdm4Mbd4sP2ya8T9s6Kru+CaPRRR77QwJ2PhF4FQDDsPNwJXRv0hhmt3eaJmvQyAjS5aDoX/3MPUshItax2yRw8sr352+b2bhdLldPG9fvD2B+D/Hd4pQHx1UpGH+co=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(261009223027099003)(18002099003)(3023799007)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DjOyXP57k0wkSydPGEV7xTsJaEmwt2vp5iZZZbtROKazn5FGE8PAOoYlIO6VaN2ueKANWFimy9Xa7tcpDvIQQYY6EJxUDSrsfpmlKu/T3uPeJtJLE9vmtBsZZHEc8+O8aB9GuLZ6dfuSVkdz9ZILEmfqIyVMRozsUpivWs+/vEAF6bR/rKjbvW4OWEOcUvdwQgh61yfZcqir6wKDtJyLrXqfllP0OCX+mCiqeJhAhkTSQ3yWOBK70us0cFisydVcAV1rYel39sbEkC8qUu3A/m7VqDKID8PH0kj4EPk11lg6eThiJ6tRLc2rXCpCoTg8ngzUd/iEWDbmxPQA4BJ+hxjIPBXRL7GG9pQwuiUPYAKWuPeeJBHh+5HsKaDIc5z1/lCltKUWm7sqPFHXYdXmbpfB1Xz2PVnmagc9+CoVqnxyWxb0OQrUaS3FpaRv0Vhk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 02:43:03.3772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a1080f-bda0-4ee9-6ac5-08df4066ac7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DSM2EPF0000000E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245

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
Changes in v2:
- Guard with CONFIG_X86 instead of CONFIG_X86_64 to fix the UML build
  failure (reported by kernel test robot and Sashiko).
- Iterate online CPUs so offline low power CPUs don't prevent falling
  back to efficiency cores (reported by Sashiko).
- Link to v1: https://patch.msgid.link/20261111-superm1-pinctrl-power-improvement-v1-1-4bbe6cdbd2e8@amd.com
---
 drivers/pinctrl/pinctrl-amd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 30da75bb93b9a..c1b5c5e18d2e4 100644
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
 
+#ifdef CONFIG_X86
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
+		for_each_online_cpu(cpu) {
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

