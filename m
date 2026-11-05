Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901688;
	b=HkpsFmOGPlvJV4aRYypc5IBwn7xnykVElUHCPNLGCVAb7FBbXPZc7thi7t1q8lPPwVQo
	 YSPiLSL/wxMDqsihwrgNu4lSqfNrCY4kZNEGKlM/QABycQBZG0taJPkjZgkx8L7b2M2/u
	 B2UumSwExwUQOx2D/ESgiAugahEVFmjp34WQwcYwkzyHNxrRymuJbC7t8DDPWvfDzdujf
	 sKfXI9jULgweJOJZj28EsZErmhxTC0Hp2hxzG7Ot60bmTBUoi4+bWqSqu0oSjWyYehkcU
	 LNYdCKteOeMQyWgmDqGQvOLkoyfaqjGwsYNtxOW6Zu1wMVLBAgm89GRe+iRpXJzm5jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901688;
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
	bh=EhOV3oPzu1x0Jaw5YMyQ+q7eF/WI+6qt4PkQrv3Jl5I=;
	b=OKIFzFx0K+l3/y0gSah1NkvMDGRswo1iU1XyhLh36lK1AAClHlAVl51GxmadXcZiepch
	 2GkyQKKYN4iQk/a2XzDWBOr2BpZcjoBmjM2k0sg9bbq+Mhe0seVk2gj6lVApjV1T9hPU3
	 uomlDX1iE1sIfKYuIufpjqbQqNjUFMN2mr68TEjjFBJK9pVQ/z7shQEetUMFgO0+IrehC
	 W7dvLaI1oZQNeFZ2vq2EuQ6NqXB3nqMZiE2zKg54gjMyy20GBrgFJdI1hwofmkgKcybe2
	 v7VecQO4vXl/J53DOjZ9p4XS/Xg+sRbsSoRhTLqH28x9I6VjalkKSY2DPcAtRay7/Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ckt00JyK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.22
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCB606A31B;
	Thu,  5 Nov 2026 18:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCCB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ckt00JyK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rctx9aBsOOLjfwhjW8xRN7JI2ruVnSn8mKjHNWndaoB8CVIOALv17+eL6dWDt/ncC8W6Fw6iJwDxeyqSyTrNvS6bSp0ZBhM5IIB2eLNQH4aMP3gyqbbXj6m9FKuFc5dwFQKj87UcZizs4rTPVRZHpiPTATQl+F8FZl5RlD5+K60i+2uhhwYg0rLGxYzkkgQobYmlkB579VumpIj/Ihib3mvMIzFhegfmmSojA+pLADM1uqmdI9vGGlSp4rIS8gPvsx+UCNS3HHJZ0mC2b8MfG7qoQaPzNVylXAgzkZ0Wz6Vw3pn69y76ZtPxSfJjy9Luov2c99VG6LD0QaLwpyA6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhOV3oPzu1x0Jaw5YMyQ+q7eF/WI+6qt4PkQrv3Jl5I=;
 b=frTuv4oZAQoeQdlSU+UXJtmFsJUY4YRWsCs3BPHcaXZ0LcQwx0BUtQhSOG+K0WGqAxkc+7MZ2MuafrvED031KnlZhzVX//wjYEa2YKW9h/hFHbZ2URkBA/xJYQ/eBa8R1/6m5ka2buIV/k7oed3UfhAHZU60hN9+xjd4cat0/3lkrrTiyhlirYrUYqcKMCn6XtUCZVQTHukJEe7is3JSAsRVeOeYdCh3pJvwpVdDYoCygf0wjnsQT+bIb99D64P9iImRICLEpUxv84a5kZIUxiFv4H6J96yayBHHMe4gS7RglrBYd7Z9Ozd5zahvduopJsHR9qxpFFv+g6H3eG1Bbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhOV3oPzu1x0Jaw5YMyQ+q7eF/WI+6qt4PkQrv3Jl5I=;
 b=Ckt00JyK21sClj5TfcANwVfON0RqPZdJQU+KSmTHrxAlmsssrHGRDPrefCirLHHxX/i4kEA8R/UEA2f1j73z5wx1mhJRj27gsYj7fZlL7bxwiCpPUuBuDqeIMtZZH+GhIEpr3DIey8uzkyxiLY4otLdC9CXVeXppgwwABEFmqMU=
Received: from CH2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:610:60::24)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:01:24 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::86) by CH2PR14CA0014.outlook.office365.com
 (2603:10b6:610:60::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 18:01:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 18:01:24 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 12:01:24 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Thu, 5 Nov 2026 12:01:16 -0600
Subject: [PATCH] MAINTAINERS: Add a review entry for pinctrl-amd for me
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
Message-ID: <20261105-superm1-pinctrl-maintainers-entry-v1-1-c4cadcfbd984@amd.com>
X-B4-Tracking: v=1; b=H4sIAGvE7GoC/yXNMQ7CMAyF4atUnrEUBxoJroIY2uCCEQ2RnVagq
 ncnlOEN3/K/BYxV2ODULKA8i8krVdCugXjv0o1RrtXgnQ9ErkWbMutImCXFok8cO0mljtWQU9E
 Phj644XAMxHsPtZOVB3lvH+fL3zb1D47lF4Z1/QJJx7EChQAAAA==
X-Change-ID: 20261105-superm1-pinctrl-maintainers-entry-6b60f4961e32
To: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d14ccea-f656-43af-f85f-08df3b66ce60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|261022105027099003|261021121427099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	U6YOI/LjR0GhlNpUA95B8HBzSe4ZYW1x2LPxhvFRnJGb1HKPrIcpXbaLq/i7gMlgZm52Kdvmx25oijXj7SY7udJsoGOmfqN6wQKoxa0ZwHaFbAtIIVA+4VngUYeJQfKt360wXLgIOSM4G0NqcZQ0XBgkgR9KgIUMVfOB5R+XiltGk7G3Xx6alwd3hy2x0hP4ceIgooUrAZ1G1wX0jvcW9t+DSj5MsvGkyshBu2QKDB5lr3/wXOY35cW1Hogb1jyf1GDz4qDHIlz+v9rSs+0YH85D5BVco3kDnCXQ0DgUlAaHmrLjLQL9d7KlyCF6OsOzeHRX0GjdtyZR4a127aP/jUFCZiGBX6aMRGwH1Tz+XlNzoWjMsLv1lQtyC/0G54FUIdWMm2P+y9+3wqyKA1ucGTw+iIvnYiKJFNdqH3zBBZ9+0Ji8EgdbZnU8wr9EuTgxMXvJ4h9sDG78UsbJFBfN1wbWu54lWnTQafY9saU9tcV3/B7jv+NPSG85qro9xnfSRt0BT2226XL4/EhMggpmEvFMz2eoT9S3tssi4mKNkwzBux0Rd+Pa+XpreVbevpTg5CXr707nYKT0mwZV2OCKASeY2DJ1nHv9a0H4EoyIZbT8k4BmwokJjb4/98UD5jjv15DrB5izSSrL5jAvhSohUMbkd0OjZfOqP6HGlXgjXMo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xkYYWhE3x/OWmqAuVDlU9ncWl48Pmz3ZlDRWOEEb9tOwf26qqHKmtxpsdktbX8e6mj98YN9/yv+Wt3+sBhcmx+vlR6BQgL5qlg2XVB3XkBtchn8wYzEJsN5ABI49VmJEOVqWDyi67uawOq49zeoXviFN2cWe5IdJRQQ33YRjs7YQ4ZQ1MiYZFzvlY3QNmVo12Bx6kY/LU2BjqNz69l3gHwLtd3GOMUZzyOY6EJ47SPf78a7+HPlYgQbJ4+VWNnHCaAqROX1khlw1Ml3ubcIyTomE+W7J74XzZ5HKpCBJPjjYRbx/+VWqhC4fxJ+Kuc1njKzqHHH1zeJWvmsXyRytl+PHbeuA7qHlbq45Ax7Ww0UY7EGEezlfzpdZ5HtIyzBCuGUAtqJzJGf4MqfEy1ZvEg+wfhXw2BBchodrSmei5rzrK98pI1icm6VELk9rP8je
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:01:24.4745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d14ccea-f656-43af-f85f-08df3b66ce60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774

I've been looking and submitting patches for a while, I may as well
be looped in on patches too.

Suggested-by: Linus Walleij <linusw@kernel.org>
Link: https://lore.kernel.org/linux-gpio/CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..a4c1a7ddcb36d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21998,6 +21998,7 @@ F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 PIN CONTROLLER - AMD
 M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+R:	Mario Limonciello (AMD) <superm1@kernel.org>
 S:	Maintained
 F:	drivers/pinctrl/pinctrl-amd.c
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-superm1-pinctrl-maintainers-entry-6b60f4961e32

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

