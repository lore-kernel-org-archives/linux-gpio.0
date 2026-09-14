Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30C40F743;
	Mon, 14 Sep 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375972; cv=fail; b=MWZWgIdyOoN4XsBWf3iQcHY6q1uAuyKkVR6Hf52qsN931RQeiE9T2F7I5yOidM3E/RvdXrchOW268uEa07qeMe0oVoYSl1TyMA3mWB5nKiitCw9SaGIfh5Y57GvZDwHM/O24pw4nyhxKT36+EFWTW/P0cnxn9WSrquN5B0Z11Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375972; c=relaxed/simple;
	bh=4oJijptQlzUPkTFJAh3l45t6UUpoCKN4sIv9hGEeKiU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NvVF1zSzm/6HkFYq4LhFEtk8Jbf1AnZ1/wAlqjJSio0eZYWfuvUMqajfXfDiXtSldlYFiDin/DBJBa4/kLjXdwNglCgPVyImaE6cs4BotAahHROsG7BmB4iON0o2123sPRZypQZ9TmLY0iyGcy6vER0Qh3cw5LdDjUz2EJz4AjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FeX/eQFF; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FeX/eQFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PweAKjctPMjPtvfQ5W0YhcJAblHKUpyM6VsaeaUeYOnxKncXKy0lT89vYvRWj1zkZ9Kt/BTRZwiyXjvENos82CCGRoOGywC7YyJfQ9glmtuokwlNO+nRZ3mO3R1Ix8ZIKeQpRE9brs8GTXPKGLpnWcc/SkEVhXOvBAAI6owRt0fTaNj+WaG5v9dN4XxbLGVta8q1CDBAE1fidqnnOS5zEgEI5tMbpUkRJCF+VNf05Z3jba5lQ16/KQ+js2PQM+GjioL8co6y9/obX2qBzk+pNxJ9fxgwlLlK33af/dcAKqOnnK7JjoNLUXG6BUwrzIXuutMP1tvF7hMkQWFljO1HNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzpk2HuAlkRP3hnp4Bu4yztqgoWxsT41dOQwP4zymsA=;
 b=johxiaAKomR3D7ccyKK6l1DsSNsy32dhUXBuEpymyqCHI+9sugjaP8bngtgplqt2Fw9zOlW2XRqLoNwtTCpqBlogtfecWv3lUP++4aqwIcDK/MCUcSusxaoKu34HeeJxz5yTQuH7/GHJFIPS5mZjGWKc94Bt3oicOeCLwGuUGI/bzCFFYfQC5AU+17M5HYO1yTlTNgLSF250O7lIIIGRiHK5L9KzHtmXWZVhpdJVJ4kJLJ9heZ+QsgJ5vA98K00OWkHo7ZYJu9qu9jIstlFoNBKZRygjsAIM0/iUS+e7rumDaP6ORuQQ86/gJFKny+FEPWtU/pXBNan0zFt3UhxbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzpk2HuAlkRP3hnp4Bu4yztqgoWxsT41dOQwP4zymsA=;
 b=FeX/eQFFwNaYA7P/4nTqpd8aMPbB3+nuLD8wL/Fx79Tf/s2DWq8IKuZtPLagLBdevHd4chY6auL7tc3lwIzhlFAEsELqBgrJ/OzuMAv5oiG+Om1vf0R7jKQOGuEKtaYdClGHT2ozzS/+blRkuqNOX4wHCndbiw4cDJ/xvZPq0eE=
Received: from SJ2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:a03:505::19)
 by PH6PR12MB338919.namprd12.prod.outlook.com (2603:10b6:510:3dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:52:27 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::97) by SJ2PR07CA0020.outlook.office365.com
 (2603:10b6:a03:505::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Mon,
 14 Sep 2026 08:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 08:52:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 03:52:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 03:52:02 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 03:52:02 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Date: Mon, 14 Sep 2026 10:51:54 +0200
Message-ID: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=michal.simek@amd.com; h=from:subject:message-id; bh=4oJijptQlzUPkTFJAh3l45t6UUpoCKN4sIv9hGEeKiU=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQt37om+NOXo+f/c+456Nva9nB9Ed/b7W7FdmfXn2bes l9837p5WztKWRjEOBhkxRRZpjPpOKz5dm2p2PLIfJg5rEwgQxi4OAVgIjMdGP6Zz1UXW+OwNlP+ 95tftVpyHarHt7fk/lsUbXGwj0taMnULw3/HzBiZTvtmS7UFy97nL95g8VxOMtCgfn3wE9kbX/Z XHWQCAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH6PR12MB338919:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2be39e-126f-489b-9118-08df123d80b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	lK/Nvv8UsRwBpW+A633bTOzf/W6qV1jT0yXJJWB1rHjdp6CKzlWqnqgzcRVaTkAFCWq4ZIa7S/5uV8TaVGc4gnWEutgJ0Kv5iAbg7DCpwq6wxe3E+pPkPGjvi8Jq2ET1+Vkk/iSXbMMvBJYKikzhHaqble9YgUsfsHql/JdGzoQ+MW8b2BAmQVIaNOE9qubjOTlMbaAcekIq5pLWsCfzIUzGHGyH3h/8WdQhUW+fq6X/RV9mWIb1FAF+Y+8sLIuKIxxMQdOD5w+WNVMFe9VN9Cph20Batd+EzvOPmGNLFATyKS+LZWOy1iBqTkyG8XntOdFpYkXjrkQJuvqS9XGG4eY+aed5Q86vc0RYT/nd9xC2gACPOyq/7d/sDZlP3StnotnCK+AoD4Ynv5K/Y4JmKiqNboBb6M1srSGFE4wWNuXeOkIqnMLf0dDkh+OR8OYPA8/cwXkECxbkzH+UDTDBN8pZQAfj3TElDWEsL+pivsw3Fdf+C7kdV42VVZz1PqBRsRVt5zRdr55guInhng3p2MKkvPeFK//453Guf/Ru4dB7mCneGCPPpiGP5G/TeK4Mxgu3fwMq0/s8ukShV08a/qDuqf5ayie/BASOlLypL0Gul5pn6mF2P1rWjmxAE4Dg5+iaOC7TuhkXKsJib5wRCh3mksgaW+5V5qZxcoCfKK8mZx9Pivoxjwbhrunw8RIg8A6cgczy0Yh2HcImrdA1zQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bmnRbwXF2h7N88vyWp81/UnZKfAgt4ixnck2JtozC6Jebx0ufkLe1IimbmDVIwSF2EKKaTpGnQC0nOwlmH0IOY+pKXptD4hXIqTrlE653YTeGrEdMoc8JJjQ80LDwyFGgxg8M3Vwsbz85ik06YJiVGlHwblELLu76pRrbWKuftNsaTezhQHd1UX4V4d2gNVDz/AW+7gNdpYmWt0eNGXrJbwdCL3hcD7pbGsKqyT/ojHeVHUu4u1fOzjETUMezLW4dewQ607Wg+PuYE8+3i2cnKgFOYWPF3M2tTso3APM+QKd6LQfop9m66ore2VKKvZDsLbs/Z/0VK7etkRBH7fbNSKibcEcpwqUAJ4+6bsbGKAl/MLjExAnm4jrXbpRGxjyVQJ89d/2fBCMbgkOTMXKw5Bhb5OPd6MPRCaDxCSL+axXYruQTSQyz/1NQYha1Two
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:52:27.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2be39e-126f-489b-9118-08df123d80b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB338919

Allow parsing GPIO controller children nodes with GPIO hogs the same way
it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
hogs parsing").

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index de24bb361e9f..fffeb5ec0645 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -45,6 +45,12 @@ properties:
   power-domains:
     maxItems: 1
 
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - if:
       properties:
---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
branch: xnext/zynq-gpio

-- 
2.43.0

