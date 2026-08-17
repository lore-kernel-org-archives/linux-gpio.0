Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489233B14A4;
	Mon, 17 Aug 2026 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993091; cv=fail; b=Rpvgl3ojOwxvXq1xfCUTO0WNEUw1zzkzFEPtcTsObw3KN8oTJaTHsI5IBeq1i4Q/fD95rUvD5nzKRAlJRLS5fOArSZ9hPpW5iM1U9uTmjMnoiG1Ldj10kAUlYvAsQVIHXESFlL2F/jqzWFQjtIUxtbZlOKPD3qLeAXjqJ2uuk30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993091; c=relaxed/simple;
	bh=MMDV1nRfOAi/6zPRDu8b8lH9ADPt2CmrfXDCf4M4CE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkPNNNeEI5SpyRdHmVW5JYRNyCKaaL+DV2DfxT0a92pXsF0rfLHyokLcrV+0D7N/DWzdf5JzQ/1kquU5lnHbejGWtf4ivyQFmkrwciLYscbBvbkp9vVA5qYRd/+fBSnAPoFwTqGcP/knBcU/oiY4bXK++rws/qUt5UzjVWHrCg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oWlvCKE9; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oWlvCKE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNYZt8Y2SGIKWWVrGU4p5fZJwHT6P09I/Pb//+3x8/1CAfDM0EMU2KkiCXRY6Q4vy6+hGgWVFaph1XMOYw/nbiSskOlCScyVL7PbpPjzKeH3+UkipUBLjVHRyVn5GiR9XKFrEbjSYPcsiTthPTU5RMU21Zt/mbmbNBhkoR2f5DNp1MXU4M/IU8vZ07zsn7CAyjSrvDJXkYuIh2CWJaCJrHvViINrWuOkfwozMTvbZuzaePfWQduTTDC55iHW8QReGLiZfy48pebENx1YCWU7wPH/BBTUo6vwvDPo4qK8Tcja/b8xWQ102AeD6VPN5Gg6bnzgfqhizU+4vsycOVJnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjUttWSJl0qWv90O0m7S9uxzqZnTUq/ZeK4GSaNLEMU=;
 b=I0IEUIxJmFymr6FD2WAqceDjyJHz4qpWscfVf8b0tvpt9B/Vgh/rcTZCVXvkvzxrbLvRySjqkioCJd/gtXjGJCtN8fsPlXc34aH78+IwPXSxRcAOb3yY1GuxFQPJVYX/LiZgvvYhyR1ncqCczsifBLZAZtLoSyMkAZdCBW+DDyqCNa8yRrxiodEbGdonE/5evQh1/wfERloUcU5TPKB82gAY6FASds23D1FgVMD/HeDL+75UA/y80jYH0ZzzbYk8HqFuzPFsYdepfTdVb7t6gt6c2y/h30poHILhKCwKV/6xFDyaW7+fDNXmPw7i9JDxlJlShM+Bm7OBmwsyH0Cwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjUttWSJl0qWv90O0m7S9uxzqZnTUq/ZeK4GSaNLEMU=;
 b=oWlvCKE9PTESR3fiPExOXwE+eJUNjEBEzEIFCPcqmo9ubH+xpmc77sM34QHB3NyWtBK1/WWgmIt0ckqcMhhJ+CQqFxVMHcjdiLSMSEzD0ZEFYVRO6Dr30lxV7s3jNKbsFIwckauq0t96+h1nu55So0W5tz5+nZMjOaVCDBW2WsQ=
Received: from TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29c::12)
 by OS3PR01MB8317.jpnprd01.prod.outlook.com (2603:1096:604:1a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:07 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c:cafe::2d) by TYCP286CA0114.outlook.office365.com
 (2603:1096:400:29c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:07 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 15D8D3000262;
	Tue, 18 Aug 2026 03:58:03 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH 1/7] pinctrl: renesas: rzt2h: fix used_irqs indexing in clear path
Date: Mon, 17 Aug 2026 21:56:54 +0300
Message-ID: <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|OS3PR01MB8317:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 14bf247d-227e-4523-db05-08defc91797d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CzKf/hETJJQ5u+2CNCzlgwGRuUMqdVYowQEzQ/GG7KoQ7pa+PZizuiGwdLDXa+ropUJROvfMWBAjfGln3Pw+4Sf2NP+cmNzKU/kG6mh9A+0nIynWCWA6DUjkLFIk1gPEvk2i2lMELjRqGidUB9gFlqQJToNGggjfGz1mVNtZ/4oQ5X28zP6AUvGZJx1m6ElJMMRHIEh7afjljZUhcdDwItWlZkEyVZ1QdCDgAgEHxBEAGU/uerrsAbMCdK/7DYlLfA8MOuvGYu8HM/yCyblyusvXfaLCYN4jpW8dJ9RbGcdoEBMWN8vV80P8bYx9pfOwzcoprgL6rEpks9Kxwg/UjhI/d47IA1blKUNTqS7uUehPbXS4QuygQmlKQLHxjJqplB0rncK7DsDxNSDXlC+ha3Pnha+IaWasnMckzJ4r1wfvT93p8N01eOFtL7VZ/l3yEZ4NWRTQKMv0HWoz6F/KM34gBplMuEqRiLe2vu74UXqV4P0lieuvXKgkRzI0bV051YCX1Bj+IkFiQ5HYOo6g5DtlnWbmgnY5V+7bJslSGfMKnnng86Sbljl6yTHL9X5m3DfJnovd4Svlo5Jo4G3+8+XND6fZasD7x4NFLkO2k6eI5s+FMg8akJsZ9pkrhVZK1ZKkHZyh7zfJQ8buYdKjTsusqpMtdjDOeeDdmLZq5vHYNZO1aMyK/poPt73a+EJ5VvBhpEIKy1fxAT3UX9wjzQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8zv3n0rHURM+QSMtamciKl9byp44vcwHbJOxLIAzIco7NvXGFL5nurrp4ZaE2tAFSDlnhMFlb7wajlzfAks83yjXgMgGqCibGB1GN35Z2BxhmUmiEBVviDJY7n79BMJY44W7UGMHyESAHOrvYxc0EzAA8V4KcLmn/3h7jgrsL+oKypeOPeCBBZ/LQFt0fDtUCnxJY9dPhD011eml8MG+mT4/5Jm1ZF3uAywIUir5Gbbi4jLJWpQByT/EotOx/AFbGpXQGHaRdFVlWOScSt4D8VMqpfxaLMjgHd4g7XRPnmoFRDDIOx88Rjl6Orj8JZUiUIowOeVmmIx+uvLBtF2o///ZqMHbXiP9xwS2zUm0VjvCj8Y+2cMkaxpwuWd+ZthaZj/qwEDkyeYUg4KgqdOJraZFUuGFw6PMWuOYF3HZPXukxjPXqo4819dXp4iaoVFv
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:07.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bf247d-227e-4523-db05-08defc91797d
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8317

struct rzt2h_pinctrl::used_irqs is supposed to be indexed based on the
parent IRQ number. Do the translation using rzt2h_gpio_irq_map and
clear it properly.

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index eb70aee39f1a..a37f1e399446 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -1050,8 +1050,13 @@ static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int v
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
 	u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
+	u8 parent_irq;
 
-	if (test_and_clear_bit(hwirq - RZT2H_INTERRUPTS_START, pctrl->used_irqs))
+	parent_irq = rzt2h_gpio_irq_map[hwirq];
+	if (parent_irq < RZT2H_INTERRUPTS_START)
+		return;
+
+	if (test_and_clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->used_irqs))
 		rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, false);
 
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
-- 
2.55.0

