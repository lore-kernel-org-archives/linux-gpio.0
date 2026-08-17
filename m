Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410053B14C6;
	Mon, 17 Aug 2026 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993110; cv=fail; b=q0BYyGInS69yhp2vRgf+l+5j8+jRxHi0eLLMzUI725CE8UhrLhdPZYtRCFEyfS8nktIGnl5RSHemGhwVr6grLEhf2tO+2yOGNGO3SHH1iXdm6THglAwutuUIN6lkoXMNabMf+GXn2fVgiehsY17Yh8u2BAOmB3G7yYdY/dKVftU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993110; c=relaxed/simple;
	bh=rqntFx8WonnuJLeDTzA0c0+VuPMX5QPybJ6aIXSrrd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pl1oQuxgD26jZMEoxum0ZoQ1MnXl1PVOXEX6zTuuH2lh3O5B7QFBuho3fLJBYxqQg1kwiv7WDxS/XareUY4hywL2/G/M4lcQYV+haUKKikoiG+BswGoPz6dp5sPZBfcVFd97rNR30gYnZqU5SY2z1ggV63v1Ec09Qu0gW70dumM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KhdTnBzW; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KhdTnBzW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6juC1IBYlP5+ObCYkAlfiu3oc39oKg7+pWVkIf521qpAVd/0qj545WM0b9uClJRES/KDucLJi2IfF22bk1QnWxG9W1BcVYsO57PXTaqHJhc7cpMTHzkoTqq0PPLiv0XmrSZCaSJ+qtn5I0OBc3ENzQLs1vFppMbQHRoO5PhMqQhf2HLoOm3gxyAyj6axmN1b67lCaosFxiYdeZ4xnUg8+C42a1srzy0ny8qRvNkEgeJbH7ywH3S4ZSFqX+MFSA9FmxfVuCCa9uYJqrs3BO9jMAuRCGLqO3dI9qcJ9AcZEbUE1WzEx7fCW9IvncDtRKLRxDU8MLg7Myr5d38GCDotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJdqhj/b83emgnqhz1uMkJB617QxbSqa94L6GnXnonk=;
 b=EkOypk6lMymd4pM7vJsHyRbjle8YsEGS3g0pGZsqRRlQ+t9Gfo/IegbzmsPlzM8PNLQZ3hMjKt4KYo/p3tkYDCQ5YCVOYp/x7702xiL9shrFnJQvUAc2J9w9m4OdbK8m98k4ewPTnipOfcLMD6piFHrYNR6nbdtjsXob/bydsx8ifjlTdpzOTQ0T56hFgBZkWBpGdFD3159ZPc+5BLFjS5TNHbJf2fNeD86+hSHrvFudSPe0ShwFFtWIg/9DWLDoWb1fFQCxejEIbcjIK00qwqlfDY/kjMjwx1wDDEg+to7sIn+FxkndaAGP2ES/hSLjIZVRmu7X05p1AJ11L7FYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJdqhj/b83emgnqhz1uMkJB617QxbSqa94L6GnXnonk=;
 b=KhdTnBzW4GALjdha7PZtj1aSoR4aM0DuRy71KcbsQQ+kKX6jATXdHiTJLmnaa1BDdoSA3K1d7r06ga4xgUehv9S0saBiUkdKEugSgKYs70GJTngX0FXlPznjP997mrlfDtg+B9Iz2oxOi4oXyDH5oyDbccwFTWZK5amDj9URC84=
Received: from TY4P301CA0035.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2be::8)
 by TYRPR01MB15808.jpnprd01.prod.outlook.com (2603:1096:405:2c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:58:25 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2be:cafe::11) by TY4P301CA0035.outlook.office365.com
 (2603:1096:405:2be::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 18:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 18:58:24 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id B78963000269;
	Tue, 18 Aug 2026 03:58:21 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
Date: Mon, 17 Aug 2026 21:56:58 +0300
Message-ID: <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|TYRPR01MB15808:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0dee82a2-734f-4392-3ada-08defc9183be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GQArrMFFHJvy89sS/t3Fp3ofg2N0cBv3X4ROEbheub9NOVHoGA6i8jfoqft2KXBkq9R51wfT+UABeNDGRI+0zFCUEhJw1viqEUm23gtCCa4UComAsmSNLX6wCK3YG963p6b84uMRgp+fP9vw0qN0jR9u1Iy//hXjY0gp0J5S8RcOvxCmPC7fObSjfKCPfYqKbYqmq7gGjMB+JtYMun9VH62PLhKUyxq08t+5BQ6DeJBLNXI8u15Ek3D8b71H1n2fQgHUwvjRhjkt5Wz9zQDckz4AlVXR8xAeVjRVAUy7mGhhJWHU0D57JZlN4ZuHpo8xlGhcMuC39Y7akXRMQcWg629b3fb6JeU8cuYquBH0ck/80u5eWgwp3A4LiADrQow5GJwYmF28achzSjVRlbmawn6rN1E1sXYqHgoSnkKf73L3L+bhnBWPQiYPbapbuan1KYPNcuJpOO2l4DFibHVazfdBDDxJMpxWKRqdX4w4Q10kTSporBmD3fY6J5gvK2I4E4DMJzB+yqtXQydVxUr18EzzNac3wfkt/SRCL/zrtRYdIYIF2X/DdTu+PQWKCTPoPvZ1WMyV6dE3SnUXWp8oJZnt5LDyav5gz0z6UO21+mwas7/DwnK9zGx5CTpofeyVO5aQtaRKv5STkEcYmN/zB2Ds4sXSf4uVpFhS2wZP7FyM8fw4WajDNqqr9puMWdz7M/gZ4jS+zW7STVArp2dp8A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3sqr/mmTVx6Kb+NrlLIDJ/597exMjG4rf6tX3k8zFINZb2Y85Ncmvq1MdVG7vrjnh3CPUuL+5ecxFJFaXd1pIIiff3zXVYVo1JacYaTssaRfZDe18CKL38667gsXPP4xGFudrG2PzDjWgC/c5b1LyfJOUK9LzB1cuoXENB4gt1o/USyL7kZzHVAulzHp5GFZ5q5Lks3pJkMwkgBvocBwssnulWQMMimKHMAqJ/XGvBaW7miu2fpvHQGR1Xz4B4lxUStgiDcxp385PWg2IyijpVdnDj5LnNNylROLQu41Nr/2ILJYQuuDGs3vZmEjKf3thzOe5tNYL3nianb8o7qDPd7cDHFyJv4uEltjI0QLXlfxjtar+DU3EK8N9M+xb+gf0k8l5MooJQuWp4/s/cZSpuDzC+uBN72Rw2v/FutIeUTzOj2UTx/0/A862UiaRukr
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:58:24.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dee82a2-734f-4392-3ada-08defc9183be
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15808

Wire up struct gpio_chip::set_config to allow GPIO settings via pinctrl.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index b8d5b6af5be4..3e33543953a1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -1192,6 +1192,7 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 	chip->direction_output = rzt2h_gpio_direction_output;
 	chip->get = rzt2h_gpio_get;
 	chip->set = rzt2h_gpio_set;
+	chip->set_config = gpiochip_generic_config;
 	chip->label = dev_name(dev);
 
 	if (of_property_present(np, "interrupt-controller")) {
-- 
2.55.0

