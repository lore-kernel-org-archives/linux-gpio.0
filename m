Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA24A4824;
	Thu, 10 Sep 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056217; cv=fail; b=mcxh7bKCZityK5W9YC/Fs4DJWpxDnBwgkS6PtQ4XqArNFvYdoX9+wi7i87M6rrKUH/r8narQAVKwcUgVNaWS/CUG1TkZPB31UuBRtiGrNeKUPBQFHiApIFkUB2weg4M7Si/pFHHk++m68n2cQ0J3/M9XdSGsHd5jv/lfkA3AUWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056217; c=relaxed/simple;
	bh=Ov2QI+j6rhvpFsuRbfY6J846dYEHFuTR0iewHKphmFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QStzuo4hjgNxfjZ5ON+tjoAv4kkMV/+4Wxzv+hTLxYxsy8H7SX5MVoJKhqRv4ExiIUCttHVoyHlYBCNP7/iK/IOTtBIqwJqWIqrSgu2Bpkh5mWLSIwGBRUHDbKb/jQE+Jh1fIuYBOKNCfbA27TvRsPDiNgW5VE0CGnCUhhN/Muc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=COGom96f; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="COGom96f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbY7QkPcKxR8J0S3Ha2n5HuxQeC7cWfT4HGxbKwhXQt8AZKpcw+wnu+bvNGO0VW7WYmovk6CdoTvrV5GsfPsJiac1RW7A8m+XmaN7MBttW9hZmaJXsdMbnHUN9bX48M31kckLZ6uwK1bUl30SVwN5JkP5dbh5IwDmtiPFiqdbnlQ6/yAEKlhMZeOpIQB93iRzzicPhMpTBxV2x+6U0loudxACNwJlm3eGZ4eFfqrVVwNJsrCJoGrWuSXc59Dysv/U4NevJSSZi+K+E6J2K8mG9vqIUiAoLI3kIOYxzUMJ+MX0Pi05QA6onQHGEJf40KpB3AQna8R9KTfn/HTj1RCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI9/mGR9ELG0Mq0MpL2BqhEhH00jlLyciCArBz3iDVk=;
 b=JS+d4q1Rdra2MFuZH970XqoQzrw8aav810KCzH+6q0A2kcSwLiCoahAUon0Yw+Lz98xzt0WyLYzJXMeEWPX+Z6xH11VRhAAFI7i2pDxp3W9Oik7uuhH4lAfVe0F7Ic4grvVkEiy1gwjlS6CCrrxVPJjc9LLyuXNTpDQ5z2z2SBUTu0p5/J9e/thTxYFXIUSK6LOQSn7nimA7RguGQnI8bGCrsD+4PB3hVxkpYkdfJjjnCB9gn/q440TmAiMkPb1UuzZnczq56eZcAhzmOl7Pb5M5GSMOcStV15oH7SBI993uYT+q9dz/nGRU15N9N86FTqSBcaHyKLfzh8UMLdAZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI9/mGR9ELG0Mq0MpL2BqhEhH00jlLyciCArBz3iDVk=;
 b=COGom96fzXsq9u0RknRveIn7GM6gPSQ+xrCJ3lxVlpYXV1yZE9YFPS2M6IJxz0Nk/ExS8vCQ8WFcNQ8uXIEqV69wB+rHtglWPhC5QMtAJxBkQy0qorodb2MMgrWaR6Ag7JmS2T831MijJLIQ+Qis0srJY6PEVbs/zZEW9QB/3pA=
Received: from OS7PR01CA0090.jpnprd01.prod.outlook.com (2603:1096:604:25b::16)
 by TYYPR01MB14102.jpnprd01.prod.outlook.com (2603:1096:405:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:03:29 +0000
Received: from OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25b:cafe::85) by OS7PR01CA0090.outlook.office365.com
 (2603:1096:604:25b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 16:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D210.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 16:03:29 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.160])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id B1ABC300044C;
	Fri, 11 Sep 2026 01:03:26 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Renesas RZ/T2H pinctrl fixes and cleanups
Date: Thu, 10 Sep 2026 19:02:22 +0300
Message-ID: <20260910160226.489183-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D210:EE_|TYYPR01MB14102:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f309586-577f-48e4-8d9d-08df0f550df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RDeWI9aEeJDsMFiolfnEKOLrw5b9Yn8uoY99L3IRXaO6gfTkma2xtV2Aol1RfZRIDQ30P+A/H5K0PS9wGMkLCtQRC1iq0Bo73BXq05LbzHSU5BR9XRhCxJYuMHBAvbH6dy3ma2rwUbLD7SzxZyCEyFlKe6bCDYdTM4h2S032MUVN+OrQ3doGZScdpjiZYuZlvp0ZkM08J5na/3bDb+oc8mHS9S0iKIYECHjkqmS3mTlgJFnW5AcyWZaeYDLCqXPmNm7wZcCxUBVrj6mfLVrD+byav79sR19hDmzupYksp2Fh6TrBEOEMYdWHUcIJKZswnmfYrQ4MPrFHUAg+d9TaJO1flchy/p7hgaMXmZKW+dzl1v+F4L1umwFwAei9s3YDKP55xEa6uue0qIRScbsGjYkiqo8lgEfVqY8T3lue+Uw9QZbzI1BudA531llWPHS1wGTq9BYaACBXcOIyJsfo3c1moGDh9Mb6gmouinilIIoEhcMnjc287OrqKAwLj+4Ssr6DQrh3gFgwqAU4OCO1DYWiswVjskx3N29/cSIxqNVMOOM4lYi3WukTUgaiKydAqOyAvPsKjL9P9ocUTVylyZWXL1cxXrR2M8dCyBZq/v9vhNlOqJ17lII0mrRp/tP1JyjKdXWUKonCaqojFJs6SBofWf4kwVnE3MJ+ZfNAFX5f6a1OQIXfbaC60xACJAJHhVjxu5rc2ZoZc6ozauHKPQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cis5shE8SE7ZiKN/Loex9+XB5ojFnWWNPDYs9pC/Mc2R3S/Za/A011G5NvP1SrU62lQLRkZScubzRlN1f8H+UXg6NTd/Wynpw1GkpV/7C7r70iC3u6NeBsgp+fYP07GAf9hRexAwVvgVLBiOoY4ZMzEd9CgOgtZJoIe8v4InJiGm0bF0ye/A6EHK1KvtZ5zdigiFwJPSnllkygf4u00RURA8PjCqgblomBVD2Di6rw0bLqemU4aZDB+BFsqAXQYhFwFZStTUtIWQlrfYbVoBrGlyYnMqYUyP/GggOm15VEUY6+UcstSbQZwcCjiB0urfYjGN96DQAbGKFGMM1cSok6SdczqKL1lzui3dkfgXwwKxcYP2LQlEk7OhE8/na5vBb0TC7p6UgyfL5i1NL5RgTeMr5eAjI8q6y4+G6wHzc1qTTPKVnQzIK76cwaCA9IP0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:03:29.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f309586-577f-48e4-8d9d-08df0f550df8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14102

This series fixes a couple of issues and then does some cleanups in the
pinctrl driver for Renesas RZ/T2H.

V2:
 * switch pm parameter in rzt2h_pin_write_pm() to unsigned int and
   remove the u16 cast
 * reuse irq_idx in rzt2h_gpio_irq_request_resources()
 * mention that irq_domain_free_irqs_common() is still wired up
 * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()
 * pick up Geert's Reviewed-by
 * drop patches already queued up by Geert

Cosmin Tanislav (4):
  pinctrl: renesas: rzt2h: restore correct pin mode on IRQ free
  pinctrl: renesas: rzt2h: setup IRQ in
    .irq_{request,release}_resources()
  pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
  pinctrl: renesas: rzt2h: reuse helpers

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 177 ++++++++++++++++--------
 1 file changed, 117 insertions(+), 60 deletions(-)

-- 
2.55.0

