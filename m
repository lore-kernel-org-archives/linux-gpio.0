Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D4371D1F;
	Sun, 13 Sep 2026 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789329500; cv=fail; b=JiGBwRJhGHUXY29Khr6eBm8IVFCAAo7/7+0XiP8OXVUK3Eq1e+oq0k1lMhf+/yRnwPq6Sx4+YyyAG7WMPH0tN5py2QKPFR/mi019ke9Jo6BA/jV664LmdHZY9kAWaARhK5YGjqsZ6n+13bspPgo3TzE1w0N7NSbGaGh9RCuynnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789329500; c=relaxed/simple;
	bh=4pxzAZlZHnbJ3Mg3iGhMnv9OwVtTV3SQAymDSaeYbOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4gZJhzzlCsr3bgNKOS/u8OSHP+P7UCm4oBwqQYWQ2ELoR4cHiEJcfxUfq1wCQ8SgqzfE6ZjchqYQPnMfCPD3M4FsGsvqXG8zulSUq9L9okw73SHuIlNI0B6UTmQTOvNLglE9EbWtxDe5mMBsWBjFNg802euSKtU3k+1OcKZ+0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h4/Jgy8a; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h4/Jgy8a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG2yRz5s0w9DX1baqkSWLs1NdtIjauk8mRoz3xSXFDdfbZfnOthdSVnWqzNOcwFWujhSgFthn9uzOEu6vfMf7eAtVZ23OwAfn2n9dipgRjQkWmyXGqXQlCWBKT9hvbppeLSZGcp22TwM9qQ1heoMugWTmIKJs/PrDG6Qa0xbnviLYELF0v68FV5+d0e6zu55Kx39/AUgOciSusE/aS99TlVI4zrmoIhPabhEJjkWCqtP9ex9mClWiiwUc3aDTiAfYtByzvv2BxUJvHmL11ljxR5YjOuXSYsJGX3vkbDio6qj1rxFOu83zBmTGF0u3DFhNJ/EJJHwjx2BfJNSBBFJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cqXP860+wwnRl4zPm2QtmsbhfhTPbASOgWabWGvyXw=;
 b=Ypc0VNDXMgPa8XlGhU7PEkn8CkACU4GC8NF9Sb2wyb7p1CqxjSx2w+nnNH82cepEcI/xeUUBZd9pNT2E+Zv+CSSr6Y/8u9Xyx1iFZLZ3Sah8TpnpwXRtessSV8VqSNhtCMI9+e+DQqo4VWHYrKa4yzUGibfIanT4vZ/R7qC3yamBCoCm5d8jofo8KL8Hm+urfkBUu92ips0ufNxhZNTvjilMXQZLbYtIXqT+I1GTtxVBoL6jEjX4bbD3TXtOay4pVdjPLriy+ACwP4QmbuOGvYvxqpU113h1dnl5eTyqSVh96tBwWsQfSgBrCtWFpW+B7yVyuUfEOANH6rhefjO/kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cqXP860+wwnRl4zPm2QtmsbhfhTPbASOgWabWGvyXw=;
 b=h4/Jgy8aPVSEF1wEmyllci2utaQJhJxpN8vJULtiP81fNjltGFbwva7iXxrH98uZNXPqIoA5UP02tzJNrzCEx/G9YYkf0khDtFNbjQomZXGlEZkqnbAyE5Hs8+GMnQjSp15Tzg9a9Yf9E6Vkb52nsuQQux8P0UzfROah8KQNx4Y=
Received: from TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:385::6)
 by TYYPR01MB13055.jpnprd01.prod.outlook.com (2603:1096:405:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:58:08 +0000
Received: from TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385:cafe::43) by TYCP286CA0200.outlook.office365.com
 (2603:1096:400:385::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Sun,
 13 Sep 2026 19:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005026.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 19:58:08 +0000
Received: from demon-pc.localdomain (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.2])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 8336530000A8;
	Mon, 14 Sep 2026 04:58:06 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] pinctrl: renesas: rzt2h: add a helper for reading PFC
Date: Sun, 13 Sep 2026 22:56:54 +0300
Message-ID: <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005026:EE_|TYYPR01MB13055:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98739d7e-bd60-4398-a966-08df11d15564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GfOZqMC1dv1gE0l34fOWjGX1MpuzHiTgwXHhYl3IYXmiJVg8d5xn5nUeZ6vm35bHomvHfi+DUdfCpNd86fyze1b79N/zYL7fu0QSLB8boOVPp4Qzg5crL1qaQt6FKAqbbH3tG93gebQS4cTKrvTi8QwLi48Zthze+q4Y2JAZtAZcjQtoOsPiEPNVFylaDo38lGorp9YtsXPNx30j0AMCe8/ZU1VPj8LgoKVPUJJVxvmyOiCtMsj04zi3XfpD2jGJ01hwteLToyFGwBojJFi6bKjsOVGTX4Tf/qi+NZ9DxgiJ2YTFEb6w5VnzAbk7dqQvn94FxJ82fhphYEgjJX5+l2jS/jXX8VlQ38zuly1gHbVtglkaLsbQC8NVH/cst68vXaSduWblM6SuZZatUpHgLhtUVf5MOYxzW53tSzGvacL93ZuNH0yXvXU7bsh4hU1cEF4zWqHt2OTR8J+EADWh9F4u5NOEPHItyLMEN9oSdKh4cx9pSq6S4LpAOTCeTkN0jPV0YKcwic+hQaP2kSEODYLdq4FrgRc3tciHglfuli29X8csbFIn8SUDHzFZJPcFYy5lPfpCZ1k6RHW/bhX4yGn7jkSkodpMl079dGnODi+d9w6Nv+5jIuMXmmA1hXoSULiFNTEnlE2dOeAenZTQg6gBFHSX4rnsd4XKwueLYzE2vXM7gluYKoZ9GkvBN47pp6Olrq3/+Z0Qf+iS/Dg/YQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a9o3OPyZmarRXhNH7vZINv7p3w0gstOmGr2zeA14E+yJzkfRynLXHz1FNfeB+uBGDUNDmVHCA0WIE0KtMFfaU61Hv7uv7+jWZWoN+pmTSAkurlW/8pbkyppTFJuR/IdAewQ4+prBQLmu1IFRPL1JFkuKqZhMSzQwJJn0W/tI5Lxjd3VUMr0I2dtBkqBmah6uDJRWtYI81pNVhvKiDgd3bBiO2Oja6GOYPPEDhv89gM/jZ2/WFsAVdF3IwRkjKKSQClEbJOP28FVYzHVZfDX51rhTBXI1BkzmAuXMIubtqRuATq50lo8BoV40ku8jUtHqhHzQUpHMsYtce3UbkrJQ4mtDP5Zt2RwQ1POdqHj4Tdi0kyWYwfD5p6tIulD4sfx1UTSN53z5Ssk1j5yBlrGk5hky37QrFFDX7QRrqevLhm6d+ymCOGLHrqAbcmV+tqu1
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:58:08.7903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98739d7e-bd60-4398-a966-08df11d15564
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13055

Introduce a rzt2h_pin_read_pfc() helper and replace the open-coded
implementation inside rzt2h_gpio_get_direction() to simplify the code.

While at it, use field_get() with PFC_PIN_MASK to avoid the manual shift
and mask.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V3:
 * new patch

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 80a581fdef37..4872a208e0c3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -175,6 +175,13 @@ static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, u8 port, u
 	return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
 }
 
+static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 pin)
+{
+	u64 reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+
+	return field_get(PFC_PIN_MASK(pin), reg64);
+}
+
 static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port, u8 bit)
 {
 	return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
@@ -785,7 +792,6 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
-	u64 reg64;
 	int ret;
 	u8 pm;
 
@@ -805,9 +811,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 		 * called to enable the IRQ function.
 		 * Default to input direction for IRQ function.
 		 */
-		reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
-		reg64 = (reg64 >> (bit * 8)) & PFC_MASK;
-		if (reg64 == PFC_FUNC_INTERRUPT)
+		if (rzt2h_pin_read_pfc(pctrl, port, bit) == PFC_FUNC_INTERRUPT)
 			return GPIO_LINE_DIRECTION_IN;
 
 		return -EINVAL;
-- 
2.55.0
