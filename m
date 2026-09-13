Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156123FA5CC;
	Sun, 13 Sep 2026 19:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329492; cv=fail; b=lFHaO0K8gu3M5GBnRLLsj+dExOa8HZjLZgc5oiNJ8lwBB9+1qOBjkDJYAcJLRmG32MFx1PBL80sQDySPpQMAGHyQxBnK/c57pWAXMcl3EJ3JYtUvZZ5g/Ro0f1CFIBWoY0+7rjSuh1yiAomSwCDLYcHvkrMlMaK2QoRQ03/OGVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329492; c=relaxed/simple;
	bh=oJCawKN+rZnQuOtLMeXqpzntcFlGU41wHhVjC1+pdW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrE2+xMf3ROdaXQSlkDZWUn1OOk8PGXQG+CbRU5GVevIbgW+7o3FlnE2mhyMPr+57rMEjnUdxm3lBWbQWoLwV4ugUUDrpslUwb1gsLOdYIWFzBxRAXrZEhoiQ6FxR4a3cLXnLXuoT+3yKllQy/svLpVPrUR8kmEJer7++jbT6Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kADqq1pS; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kADqq1pS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JysfP1lShxPbYyVE7mFLiWcX14sMCOJ58lmmwRIbJ8jHzKUX8yNQep+4w43qhcC1jW4bSSUxNbto9auaSQlSgoM3+pruSmwc7GXQ9Hl+y3tFEp2Q62BrQbqnNFX9ehmRrJr6JcH0k3t5M1c0CiXJaxCGS8/OwmZK36mVKqaXdmfNEycLcAseb+41/FdFIOKoVmBLMpRn3Rdi+Y2YqvXVogE4nKBf4P8h/jQCB2gmmmAW7M/03yFmIDtfcNmiC43UE5WsJy7TYVqL630evpAtERnKR300oE7OTQGQLONXCatfM3leUGdWkazC5tE3IBDkdZJF1TZ4cwY4Vsng/xU4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7i3Iy4rnjgAdr7LWyaNPjeIa4ai9aI+2XsE2M9eL0PM=;
 b=Av87LRoe1OmME4AJBnVVKhG+fWvhxaHBWgFYVxRsercI5I/BR3FbT+Vw35wFrftpwqpffx46tqQBaotFnPYss9DDy1aFp7zAwGlD7q196aRqfyOIpGNcsAcQMu1kpfEEMp/bW4CpEcBuaezO0bSdRkwQKCltSKO5wfMw59u491TKzC4Fy+M4b7myaw90wwgn+gPqPEASa9zZuUuD+mpssjYoCESLix9KSduZiPL5sHSou2Gm/3h7KqYTPhx2JDwAhR07ak533UaIPRWUY37OyVVzw3dZjGPYooE2h2HcS8aCbHQC/UVT3KXXBRg7gFsEOp5OFZG6hEt/aynM2AwZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i3Iy4rnjgAdr7LWyaNPjeIa4ai9aI+2XsE2M9eL0PM=;
 b=kADqq1pSeD/5B6mmwQnDCM38rNmjo1amNGmuG1PgLC1y8OyZ3KPjFGC5E/RprRiQ5hrsB8A6htIjGdB1IcmSfBB/uwyJ1mQyOcwRDm0IB2jbHYZSJckSwcy8bb2PXr7wQGTnr30siODY/p7GY7p0ygC/feFaAsIeQLeIi8GcWSU=
Received: from OS3PR01CA0026.jpnprd01.prod.outlook.com (2603:1096:604:db::13)
 by TYCPR01MB9537.jpnprd01.prod.outlook.com (2603:1096:400:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:58:03 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:db:cafe::20) by OS3PR01CA0026.outlook.office365.com
 (2603:1096:604:db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 13 Sep 2026 19:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 19:58:01 +0000
Received: from demon-pc.localdomain (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.2])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 1CBFC3000245;
	Mon, 14 Sep 2026 04:57:58 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v3 3/5] pinctrl: renesas: rzt2h: fix reading pin value in IRQ function
Date: Sun, 13 Sep 2026 22:56:52 +0300
Message-ID: <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|TYCPR01MB9537:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e2b7769-07f5-4c1a-cdff-08df11d1512b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9IjHbwaqXKBDCAyYolFyn/k4zsw5XlVnBpPse/En0MOGvrjXIlHMCVCaijrz6XuBY9m43yzvQL3Yr6Ifle5m3BZ2wVbGM/2AbOhIPNArvLqftV8QcIiPrlPB0h1T/S0BDLY7t/pK4icqVsD5mZgo+sKIEkt492Sx+7TywWIEwK9b5FH0YvkYXvFYZz952uHVf1dHAtv11ZItQbFBZzrWeb4f7ESopld1IKx8FYTToENHAU9dcrfUhuTMAPLz7goi+R0dh5DIbI4HOtQSw/oSE35C3NmVgoZXVAoh9TKrYR1uPlRUB4yvPZXhS+qkpAjRohw8kOk7BZj+v6ZdMJiH7K+iX0aTd8qdCnfBDl9ka+gn0u+Bl9ecpc4mWRSJcCtTZOeGPuswuYi4/l9degdhd+ADhyF9gEtyilBbd35JHfyrpus/mZQgbtYI5xo42OjIcZ6f8lulegvAXB1jjT++Ow2umn5hgDwCBAqoKcJxodDZwJmmejg4+fHmcMjlihcVimaCfiBK9dRsX/iypWOsnRSCR5QSNb4z3vyA7rCoVx/YgfS5uNhageFFOhtFrG/VUCJ6sAI/PHXxOgOFpHBSrllvEEsNVD65tkyopdE2rtTkTaTWFeC6oAM5+EoSmLSbJbMkewo3FcTcj6WbOpl3yFOJXZSRmtsVsFMRnHRamknH6CO62S4eh3Ap2GjDiSLoiGdkpsdINcW9gMuitipQOg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PyxsCwI0r6DPfanQp95H8pHuQ030+rSGgx1Wxy8peDx4GMBpz2M6nh7VI/7TCbxV/OvytabEY7Jd8Ww8cxmOhlCz3osvzI16e0mN8hMtbBZCdOwd2kAMY0LI6wcasOdfIu9+Y3J1FfUFOctMaHVkUlC6BWwH8zMlb06w92LOlNFhwQXK9DYxfL/pNCUTjdtuKBVpETC1eTlXiC6ATV5bAj4UP3UThUxD1RkLwgGIt+7q8GP2NwmkbuaPHZg/qhRFuo9wi1vsAXYvcyNxFt4gw9bFv52bv6+YSvdVG1LOO3AgE35cCG5PV3xj0m70SlEGHUm9W807I9rFP5WXBlvQZcAV4rlWS8zoj1uku0GMvrffqCZ+9k5P+P1S/pO2aFY43pwyhTH1q36sZjmI/BAFi+VLJzvomHD8nMhmXOyZqFqFStH3Ve84bKOJkZa/axaF
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:58:01.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2b7769-07f5-4c1a-cdff-08df11d1512b
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9537

rzt2h_gpio_get() only reports a level for pins in input or output mode
and returns -EINVAL otherwise. When a pin is requested as an interrupt
it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
value can no longer be read.

gpiolib calls gpiod_get_value_cansleep() to determine the edge's
direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
Non-zero values are translated to a rising edge, zero to a falling edge.

Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
returns -EINVAL when the pin is in IRQ function, every edge is reported
as rising.

When using the IRQ function, the input buffers are enabled and the PINm
registers reflect the live state of the input.

Report the input level even when the pin is used as an IRQ.

Cc: stable@kernel.org
Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V3:
 * move leftover unused function to a later patch

V2:
 * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 796120e70bc4..9d7e4cba85c9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -170,6 +170,16 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 	return (pincfg & BIT(pin)) ? 0 : -EINVAL;
 }
 
+static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
+{
+	return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
+}
+
+static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
+{
+	return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
+}
+
 static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
 {
 	u16 reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
@@ -847,6 +857,9 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
 	u16 reg;
 
+	if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit))
+		return rzt2h_pin_read_input(pctrl, port, bit);
+
 	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
 	reg = (reg >> (bit * 2)) & PM_MASK;
 	if (reg & PM_INPUT)
-- 
2.55.0
