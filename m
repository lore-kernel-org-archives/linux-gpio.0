Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52B3F8898;
	Sun, 13 Sep 2026 19:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329479; cv=fail; b=cscQcoCr+5v+cV2nA8g8Nk/3Xv/KtSt7lF6OESqXLRM2QO2TjZvRu9GQ1gTW0Z93YmQLNcHAXA6ZgBmFNIJXJugWP6LUK8ATVzCG9y6kD0B+17pv17sGa3lucNWiTpBe6YY+IZCnKYBfE5hTuk7HMBK5RnT3keszNUDqbu94HB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329479; c=relaxed/simple;
	bh=EzeolW7iEtNj0vAcNB9jLFqf6VOevekaTwCO6wo7sYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TIjHI5FAsUfUNOOEPGkzYL3PbQJRM/UrdhyNcZdWyTg/38ezeRnRsC+qmEuA83GC/2o9E+FoLQyJizupzyku4HzUyU7TpK5onhci+4xJEGnv1jpeKV/Oc/mDOnrN9PsFWWY5lcDCLKznKaIHx4lx15XIFqhErFV6hgpYfmMK6WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dDXCzEq+; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dDXCzEq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpV1JmTwjHubkNaXBc1C1pd8Hx0XgQ2Si9vc3+squFUrsU9Ov+CAir50ms7BI2KSfdG7y7yc4foZYJgqHFdeHgyffa4tomDkTSREbzrk9Op45Sw/uZXV3O7W88YYzBZgUYQrHlEJWqL2ynAVy146Fc3wNqcr2218V4o9fwWUEqvqAYhEm0hDVAneJoAwcHw2GaAOi0XUjyT6FUvmjIsbpw+9sCimurkrnWdLD5tsivoLRS+Ybbr/o/KZAIHqDZAleIWtvDCGr7EO4HZZ/9HkHf0WslfZLq114G8etjWoC9hWB6zfTQRJr90KPJjkCuRCOjps8XP5hS65ymTafQOQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgz2xNZdBGoDpCs/8LprUSeJJn1WngXKz4zQP+mOwuU=;
 b=U+sHGF7IL9VTEXUQc1fumXh3ODpdI5ehmHCwKCBn2TvYPekhl5mnfm4RjayrVK2b3zkHcxqdqkOhEfPNjaiVGqlqwdItT0apGsjlv+ZH41HwtPDQtO3FDtBfJpKr5vWrU2kFC39wXmUxxLkZqYPZuSqMNUeXtry0pmTP380KIic6ZybRzQ2JmyD3MvDm1T7/UolElEFKl7Vit0PWOypvGQI77aWevvM9CFyJFIAJBOcoyjsrmU0lqa19ShC68KXnHoqKddJp8zTQssVE801hJAjsf47CisU7jZboeSheL0fSs1gKKI6KYx6j0E/g9pip/HauDNeauksSUUQK10tdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgz2xNZdBGoDpCs/8LprUSeJJn1WngXKz4zQP+mOwuU=;
 b=dDXCzEq+wdL6Dg6O7nUXtxcYnfkD7pvPCYDo4ogmi+enwlZ2NmHIozpp6FZldAMGMUQg85xws7EkMcLmcF76KqSXnPbeU0MNMAgXLMrTd9uC5maRXxzkaVkCiF8keJl2Cm3PbSGlOpQDUiU4iKn2gyzFVTlvsIQ7OwpidEgRQB4=
Received: from OS7PR01CA0290.jpnprd01.prod.outlook.com (2603:1096:604:25a::15)
 by OS3PR01MB6547.jpnprd01.prod.outlook.com (2603:1096:604:109::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:57:50 +0000
Received: from OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25a:cafe::97) by OS7PR01CA0290.outlook.office365.com
 (2603:1096:604:25a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 13 Sep 2026 19:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20F.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 19:57:50 +0000
Received: from demon-pc.localdomain (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.2])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 146BB3000245;
	Mon, 14 Sep 2026 04:57:47 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Renesas RZ/T2H pinctrl fixes and cleanups
Date: Sun, 13 Sep 2026 22:56:49 +0300
Message-ID: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20F:EE_|OS3PR01MB6547:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 94577fc8-d566-4b18-59db-08df11d14a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	mYof08toNGBoF+E/CLQKN9SQszWrD7GNYwqH6nfKB9s/KZonWgK6T/irT/c3W9M9HrqmOHqGWmH5Q40VFZEYJzezvC9JHIxamknboZ5t1gk0lpw9pUcHOC3VHmnGRkgv/pUEpworI0UVjP8j2PEq2npA1G/J300j16seFBRBg0kVb4IZPAkvejyBI5C2RyPMR17qHPBE74HoVL0RQpXTHypg6MLH1K2Bgefy+69G3uwxsR4s7q9MbeAZ1slm+n/wznMwB1btLMEODt5tbPkPB/A5fyI+Y3ppctq7+/wt+jGYFped9oVBJOrhpXGdiDTIqB3FpStg9inS1RpYhMGjnyCkPzEhKoNf0iQKud3R4kC1ncQ1LXqbgoceMow8k6igZ0Hx6jKkfpdVNHT5HFuAw9rWnNokMa5FDQ6Jc4rlhWoO4fPpkhfoWLVBDpZv0cjqlfwYZhWkyUCO/w8xBzZ19YS/oPH0A5LMtRTLvRUqs8q0Zkd5gAAl1MyDwogfVONSZUk89FSw+hElRhovdgUGpYXz14sR7LfjEGZa5bSlgF75qeCHoP3GN+eZaEiwVhDpnOsKhOgE9ZI8fUz2GjVaOdvNTPHw8IkWYNKLNghfIHyzUQvHgRTsNuwh5LLMolaYJkfSfOO1dPnQhIVu5PaUUb2+9iIFuERAJfc+Tj8GaXXiEuzCABYL2r72zN76grr0j4/76s4brpotZ4nIp4jqig==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YkswGD1Gswmj4oI8CVNYxVN5y6cZyr6eBbebJ6+xyVrgiVk2+Any0m1jUvWFPPUdoWJFdc8NLAv0es4vrybOTZXf+jH70WMOe2TO1StSNxoybegJ35TJpTpsIdpt3v3pT4TKeko3qp1zDpFSAazU6Iw/ZFrTmf1mQLaaqU/rVDStf6lCZx6FNGzMQdh0vY64h0ZdPsLKH4j1p9rlkUWT205voF4kdjZcd+Oh25R29FzyZFCxnfB1aRQeuamVQj6PIFvdkjsHAVlg9euIU00hq2056Q7bQ7qFNoMfBFYMfTLU+K1QjelAx3+wgWBgrZ0Dl7cfj9XWM/ZBNhkU2OWVncSHsKKDHst1IUuwIDNBPt0vxRjL3O1g16LbwWUWv3r4Xn9+J3hln9t/KO81KekE43SWZLOcv3x6GBnhv82/1g9knaW5BPTQ4iIaeMXjYVSD
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:57:50.4103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94577fc8-d566-4b18-59db-08df11d14a72
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6547

This series fixes a couple of issues and then does some cleanups in the
pinctrl driver for Renesas RZ/T2H.

V3:
 * move leftover unused function and its usage to a separate patch

V2:
 * switch pm parameter in rzt2h_pin_write_pm() to unsigned int and
   remove the u16 cast
 * reuse irq_idx in rzt2h_gpio_irq_request_resources()
 * mention that irq_domain_free_irqs_common() is still wired up
 * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()
 * pick up Geert's Reviewed-by
 * drop patches already queued up by Geert

Cosmin Tanislav (5):
  pinctrl: renesas: rzt2h: restore correct pin mode on IRQ free
  pinctrl: renesas: rzt2h: setup IRQ in
    .irq_{request,release}_resources()
  pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
  pinctrl: renesas: rzt2h: reuse helpers
  pinctrl: renesas: rzt2h: add a helper for reading PFC

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 177 ++++++++++++++++--------
 1 file changed, 117 insertions(+), 60 deletions(-)

-- 
2.55.0

