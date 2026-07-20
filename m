Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F33E8C55
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564970; cv=fail; b=pwgmarlTerSvVvRAa1SMyewWUPb0Z7dm84SSyURP9sOs6GIYwiC+YEDszVYYbtAXMFumWM3LlsIKx6YLQ71/+S5/3iHIy1vyfkkZzMNdfQaSJMcC9LMLJ3BFoHxyEm7eLzpjlfhVfDddQVlrLFng7FKezla2dJ8bH8cWn5u/JzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564970; c=relaxed/simple;
	bh=rbhZ75QIpJXMA/dBRNhQqe9TTFMhJTZN3sHrl2O+QFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HuoTI7OHtJAO95+gxCVtQlH0wNFiLZOceiI9bPjJe4fciSO7XD7oirfIYWLxTLcsmOScdeioUAWUj785ArzlrFeSByrNKeNyZCKzgb2tzgMXAEUEfhF7+RwTGUBd4p5FP+cBto4Jp2J045T+/3Sb3e7QhhimWAmy5ZPmCFay/Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QF6sER9p; arc=fail smtp.client-ip=52.101.52.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QF6sER9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIoq2doc2Pq33fXgb5jF/FlzNgbsmZed+3JTqNspLrg2+4Fz4G3L85B4w3tNwY7DKjn+bwhdojgPovRZZHOvl/UGK5rBtR7eVfYobitdwxPW9MnNXjZubbSRdWmutZwKOCAyofu+sbyJ5teX7D1N1S4tqszSirud/YfvCUJD2mPx1ZIIleisv+6/57LOpZt1ZhJkPzDKTS5A4Ca5VTurUy7tAMVZJxJoSo2GF4eMcASNXathjFdTAvX7vHHHLCNRC7pDpGfqIRIYKIEKDTKP/IHEVJVCP4AJ1q8uFxg1q/zfqH5/jasY/6cAxZoJfqZ+SruP5KIA1LJnDaOtIeWyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56okOScC3jM84+8SlDxi30z0duNsntOjZtK04Nc4Fd0=;
 b=B/MBHa1Bo2L3715VTLi0e7wsZuqfiYPCyyEqUfqNPpOCbM33V4krxhVunILr5tTSc8Ov/eRGaTHqRYf8vLKY6123prQnircEkZf6gkonCwlSdatjnVaebFEi1frE9RXuR8pQrDFkZup28hTUoFxJYFIKY95LHnRzMeldCs7YyZ/np3E2KrWBg6RdTyqz1i1yD1NLOtpSiOJrsBc/HcyrgqbutMA20JR3qmhkVWyyEFjBiVNHz5avDbaosKJcnyp4+yeHYd2w9kbpHe6XMf37a7AirfiTAbfI0ci45N4d1wUgg4jkYx7G9dSoVoQfwe4tiAOi9yVHu78XsHLc7YOUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56okOScC3jM84+8SlDxi30z0duNsntOjZtK04Nc4Fd0=;
 b=QF6sER9p0bWMCINSMHx3vyVe5nj7nvB/lA9pUUhDN2H5TLtcTamjYn07Ej4P9aYUEDUittU1PbWPwR9HbVLxAwGRZPK7M4evCs76zvSKBxBFbRV9X3SF2PKrqId2z9+Ot/ohyqPBj863DwQchoYU5MXtC4BSUeKdKRGiOxoVPSU=
Received: from CH0PR03CA0437.namprd03.prod.outlook.com (2603:10b6:610:10e::17)
 by DS0PR12MB7703.namprd12.prod.outlook.com (2603:10b6:8:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:29:16 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::77) by CH0PR03CA0437.outlook.office365.com
 (2603:10b6:610:10e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 16:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 16:29:16 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 11:29:16 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
	<linusw@kernel.org>, <mario.limonciello@amd.com>
CC: <linux-gpio@vger.kernel.org>
Subject: [PATCH] pinctrl-amd: Don't clear S4 wake bits at probe
Date: Mon, 20 Jul 2026 11:28:44 -0500
Message-ID: <20260720162853.173801-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DS0PR12MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 24898071-ca27-4d82-4735-08dee67c0b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|10067099003|56012099006|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	+6EtYu2pL9KYEPveXjPvsbAz1GCxMEafjSQBWbJZfY6bo7afqAiqdL1+JnjKNhgI2+pLnENfRKTmVFIrmX7rGgeH8Dmoo2xKYNZ01fHHOKI3e5kSULJNPBrhraXiVh4DwCc735WKlErj4Z2A/PPxEV1Dslv9OWDzYlvtdZjYU56zSKX+ZlOLtQ09/EG3QGxjEXvSRh5OyOP++pu1S4igo7o9RY7CeFItHUdKuiJmst/V2gFMSZAraizIoZv1iBvXoIpJOyOZNN+IGhMo+sBUN5e/m6OiERQmroqSmJvYa3CZtDL1ft97UAaqOLrmjf+kVdmGJTVG3by6d7HNXYX6/5LwQr14YxLNhRZ+IG41oXzH1CwtAETK02HeXVwd0eT3lSa3fHXtqqgMyY+98/+Wo1zl+Dh4bLczUzlLmObt57kg52GnZWo78IT49XWCI8PlkjQ+aGHTft9QO5u3GKxt9t4aUdGboZxNaHKSaRhYxrh+Id8XZtmwD0D78MIkAJzs5XInQjeESAF8omw8cbQo/UL1C+nXqj8eKThEfr9HHvnYxJ6mtJyYi+UHjyeYyIe5ZZW88H5pkdOwOT3AAUSSY1iDemvReBzpQEYX89sKFhH7wgBGR9Rjqz32N5e8af0Rnu30H+eiC69KVu+VEy2NMvwH+d54ORGlVDalSEAGGBzd4EH9Ewa1H9zb1KRFzZKwt7CqHU3NzFEZLw5UUZ9U6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YIEedbuN/WWz9cC6NX3GcqGtGsuIA1ttjqHDNZER7RWjPMXL+87gVYjGx6o6kWbcJ3tIro0Q1tJi8lhGPcNdaARhz6u1t4mRIiZ68A1VpFvdRwWqfdK/NNvwthfD4hHLa4nzd7DDOPYDf/rITDYLOeCYk49UDj6E1ajwZ8uAUDuQDWKUZBJ+Hxan0HlybG3ITpC25dr06GYVNQrHOtqvVSMYIy0KViji/mabD2kCR/RdenhhKTOLr1xpaH8BUD+7NtavDudycZhTb79QY6T+Ky+iooLpenrIK/C0e6zC/G1RZcmmIfbKHS2nBT2psPfzv4usNTn97VrWTm9oh5I6kGGumlgrx+efEKSGUy+BMZlmT14LRtDwaIrTJ6Z4RhQmxAJYxpZoNsbo6t6wvEj+2B1ewRRS5iAoObLdKTVUdMfgGcFAQ8twB1It1hF1ye7v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:29:16.8142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24898071-ca27-4d82-4735-08dee67c0b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7703

commit 6bc3462a0f5e ("pinctrl: amd: Mask wake bits on probe again")
introduced a regression where Wake-on-LAN no longer works after suspend
or shutdown on some AMD platforms.

Firmware-programmed S4 wake bits for devices like PCIe NICs using PCI
PME are cleared at probe, but nothing restores them. Unlike S0i3/S3 wake
sources that use enable_irq_wake() -> amd_gpio_irq_set_wake(), PCIe PME
does not use GPIO IRQ infrastructure and relies on firmware configuration.

The original intent of commit 6bc3462a0f5e ("pinctrl: amd: Mask wake
bits on probe again") was to clear spurious wake bits left by firmware
to prevent unwanted wakeups. However, S4 wake bits are used for
hardware-level wake sources like WoL that bypass the kernel's IRQ wake
API.

Fix by preserving S4 wake bits at probe and only clearing S0i3/S3 bits:
- Firmware-configured S4 wake sources (WoL) continue working
- Kernel maintains control of S3/S0i3 wake policy via set_wake()
- S3-only wake sources work correctly per commit f31f33dbb3ba ("pinctrl:
  amd: Take suspend type into consideration which pins are non-wake")

The trade-off is that firmware-programmed spurious S4 wake bits remain
set, but this is less problematic than breaking WoL.

Fixes: 6bc3462a0f5e ("pinctrl: amd: Mask wake bits on probe again")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index e3128b0045d22..15a398bb3be23 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -884,8 +884,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 	u32 pin_reg, mask;
 	int i;
 
-	mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
-		BIT(WAKE_CNTRL_OFF_S4);
+	mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
 
 	for (i = 0; i < desc->npins; i++) {
 		int pin = desc->pins[i].number;
-- 
2.43.0

