Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F793AFCED;
	Mon, 17 Aug 2026 18:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993088; cv=fail; b=B3PpQrfmcXL0hpSc5+25LcnXSsM/GW+ThONlACvE8kIDPtStFOoyiJx+IPAGLH6BWR9s7M6iJrzsGeUD4g/xMB5/dXRZSAMveDgcJDrZurmdbl1LjKosx8AdzGmHlgp7pfsdZ4P4vSp7hpOzzk2S9kaWOvzkKsJxNTxN4PP3Ark=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993088; c=relaxed/simple;
	bh=KkgCv5ptEWj9dQy+zIT/yhwd8awbAE12BaDKGfoNi0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XWgJrVtBEWU1AVQTJrSBv1OeFbWCax1fDkZ2I8Jl7WWsbBqpYueYne8CNjlb88MhqgicZOBtlGLgFGasZ+d9dPy2QbNkrUIUZs9nGZ0DOcvrG1D/fMpHRiQmqA5aFfKIVBNW6Pt6YPr7OluomvWgxFmqiQWaBCIpcQSHb3eqEUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pc7yxf9L; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pc7yxf9L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3O3PHj+O0IEfh/U5Xmj5b5Hw3tr1mBkI9nX4l2nE5jd2szYoVjkvzCIuR3uHDu3Db8Xzf+GIOD/rR76d+OWsBBPRQHt+bLVW59ZhZNmhmDFRwfBYCR09k2FRvwS1yZfW8jg8VSl71i/J+b4tP8UjixmMJpMKoToteCrHCdDtbgkIpPT6qxfSy9sIp/iyidPyOfo3V27LtfCxhE+3FtV6ILMltlflPmsJONFVa7/7RXtl1e0BJQwGEzScfy5HIdFkRBqsHQTsM0IKJBz9gnAq3tyAoFOagDxyG8ur2a+F1O9om3U86VxqSM+D5YtjQAKvbnUGqprE7oEohRqak9lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+wwdL6+Ea+Vw3Ikiu2/BzjW+p5jtA0ZpVAdMdQA5kc=;
 b=iN0AGa6SlbKDf5Bw9tCbz3L4Zz863LDNCFdxBRX02kPTqH59DGA39F+XUQqKeZ9CR1KZTur6ZxH6gLYl8ST5SFcqok358/qVtpmJy9DrMQl5A3tahejePGXIyzUaeCRjmIJcHrquCQkuD6MCAhCRgBXictZVBgp3HWaNeHHIDlieXxPYUQFsCVAY228W5iIsGF9iWIdXcgLR2DbehyK5PbScOvOfHw/nrF8d52mx16QtZ/TGNBwcRman8YhZ6AnN9XXmq8BnMEpUO8mLmt6IAhWPguy/0jtocwN/ZircLbl7E0eBK/vZ76/Wg7hkQjz6eLtAcdPgTC+ytfOEuISTDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+wwdL6+Ea+Vw3Ikiu2/BzjW+p5jtA0ZpVAdMdQA5kc=;
 b=Pc7yxf9LbxpjFLDfyNsoY9Yq0XkP1BxIpJB+2rLC5Olnozi79dTshZW2DC5BBnliW43pmF1YNjWK1oTNbd4taFPaUOfDA8HJCZiUBKOUSPa57ujG9wgu7MfPW/kZM62gIGlq+KIbBQDu2+OSiHrd6JIcIOPQzNXH3+RCptm71xU=
Received: from OS0PR01CA0194.jpnprd01.prod.outlook.com (2603:1096:604:1c5::11)
 by TYWPR01MB9279.jpnprd01.prod.outlook.com (2603:1096:400:1a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:02 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1c5:cafe::14) by OS0PR01CA0194.outlook.office365.com
 (2603:1096:604:1c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:02 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 5CD413000262;
	Tue, 18 Aug 2026 03:57:59 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Renesas RZ/T2H pinctrl fixes and cleanups
Date: Mon, 17 Aug 2026 21:56:53 +0300
Message-ID: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TYWPR01MB9279:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9f2c1924-d557-43c3-c3e8-08defc917689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	u+ohyjBHCjV0DtoziTlnIr42VS99ee0q2SaN7EoqXCg2n14OrJIQTo+WWoX+jDBcqUI1utbKDmQAM6MaC8VZTcxyPNbIL6fckfYJxuJjsfXPQP+I1T09e7cI485Kcz7xlNpCgRCanOyJC5QAZ8JC8s24V4g7MdPKrsTGOcflrBRjgdlNUYV2phj0f9V3iKQ3U8UuFz8Lk/NWg4s+P47kbvv0Sc9CEYsZ4suas6B9BuZL9NNvFg44p77tz8W6WyDfKFNLG7RskmCi5+dYtXAlKIdmt/KKtfQaD7AzpPaQfzyiwAN6EPF0Udj6SPxg7H+/4If+8Z041PSELq1MIRn5SqPwagLy9AIY6njnQss425PSr7/UOvq90hnDk095OIOAa4Sndo8RKahZ8nETSAnJv+vONJ24BppAOZKxCl9/9lI756eH+iINc/RNOMdlhgCFiOZfJe1ejOG5t0VYDaB5rMojDeFIgTbhdHqFAky4Rntzc2ypfFSfNuU9NqtUxHFsd4vXHNbampLpAZlwfdWcdNFYEnYS+k1XCzhdo1FR90pgsZfT/DQawDLxY20v5utRLfD4uaTbHP3+oSk34BVuV2+PWrJS5o2YZQJNadVweBTV9HBR1HlqJy0pKvOLPXO8yvx2NpHVrJXLwa2ibmHYPX3OKqaxMWQgYn0mSL59GiZEPxZQ+T5qRbOzGHQXWWe+Qn0ve0IR1VmEcgIa+UUkfg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wag/jXosMvTq9nQQAlt5NoelpsJz3FVNzZ0cJjbakk560idczX1U71fGvpxMYfdWuimDcr0DB0azcycVVSlTQSacrLnN078jeh9mHtj/PKZ45aeipVuQv4bByJdCia6rMa/3Mq0epvSVipnNccZ97D3Kr/nlP1X25Hk5tuKbZwrtBu6KjXkgVsz28P/5xO7BJApM9icaYwkNCoA0Xjwhy2VdlpbYsrJN0lL4TDR/yvrsC1hLTNg+vxqeVgUtS+t3DUM+IG6/QOdBvbD89wazpWW7Kzsgs9QxDOF1+7t2WjuQszJ6MOqHLtCrDflJqu+cQQPTHqu4qQpAXqTKnCWliXrcoTP+ND0ZZYRkDuky53mFC5i9Gy2KRHuMalTjLrg+9JZjwntZlv1Y40yvcb6Y4/DFRj87nX4c0fdMldSnwhIN1D9TucX3oCnzpQ9Skvnu
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:02.1746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2c1924-d557-43c3-c3e8-08defc917689
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

This series fixes a couple of issues and then does some cleanups in the
pinctrl driver for Renesas RZ/T2H.

Patches 1-4 are bug fixes for IRQ request/release lifecycle.
Patch 5 adds support for setting GPIO configs through the GPIO
subsystem.
Patch 6 removes an unused pinctrl_add_gpio_range() remnant.
Patch 7 consolidates PMC/PFC/PIN/PM register accesses that were
open-coded in several places into the existing helpers.

Cosmin Tanislav (7):
  pinctrl: renesas: rzt2h: fix used_irqs indexing in clear path
  pinctrl: renesas: rzt2h: restore correct pin mode on IRQ free
  pinctrl: renesas: rzt2h: setup IRQ in
    .irq_{request,release}_resources()
  pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
  pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
  pinctrl: renesas: rzt2h: remove unused struct
    rzt2h_pinctrl::gpio_range
  pinctrl: renesas: rzt2h: reuse helpers

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 185 ++++++++++++++++--------
 1 file changed, 121 insertions(+), 64 deletions(-)

-- 
2.55.0

