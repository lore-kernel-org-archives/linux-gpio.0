Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFA92FF17A;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142092; cv=none; b=Vg6Qp3iJwvJnXYWRiYgRjmOVRhCwOChEejDBO5JhJ8vLwWQYYDJCLPfIityqUCyeKN1nTi9arPNIpsR5reS2BY2VRHFO7ZDYCInPXjaHvhZlCDfbS/a/ssE8k6XCyQC8Mo3EI2Rdp4bSFNwnnRTgS1ZJgfYaHwqwGabjzCR6Pno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142092; c=relaxed/simple;
	bh=oiLEXyRhdWpejzZHvrLjebKJzafiM7XepMhEKuUFNMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NguL2QYyI8b2y3kEFXYwRrcI2yAJB0HFoKAiYWFo7wCp3+Q9a5qwr2gg2zJlSCk73FSHaqjZWyCCABaJLeYaOCu8zPOMCqFSrNi0AnLbG4Sbvbfh0PpMlMoUxl4N6lOBhttBSd8arPveL8ozNu5QuGJIKW0wTcy103eVF+2iYjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRe2P56A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRe2P56A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65725C2BCC7;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142092;
	bh=oiLEXyRhdWpejzZHvrLjebKJzafiM7XepMhEKuUFNMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hRe2P56Aj9SDyzwbtsmkKbeOOJIAV7JhGm+vD4eyKbZncTHj4BG7BTLOTHKZoo87d
	 C0o4R9pxXKHZDu77EorK4isrYvqK3H8EDzreAOgOOsmDwXZJF3rzdSMoAKIyY0oqkh
	 Wq7djEN+JRRwIvhJRU/RnyBEbBHPMwmOsJqq0WRA8BXA5uUtK6Vd9NxRTRa0aUN1SX
	 laZp47yqt1SdwBbgIhQa+qvTmD5x6enS8HoGkZFCVk0PTcq2EMGvWDB9qK3+WT6SCE
	 aZqB6xfHTE8Po3IY9tMIyqhsoxp35YU9bqB5lszcoeBHaNlfLrLLvC0zNjqB/PmQ1f
	 R67/Ujq+RRlMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C664CD3445;
	Thu,  7 May 2026 08:21:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 07 May 2026 08:21:07 +0000
Subject: [PATCH v2 2/2] pinctrl: meson: support amlogic A9 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-a9-pinctrl-v2-2-49774feff2ef@amlogic.com>
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
In-Reply-To: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778142090; l=4554;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=0I+nUQAPK0/ZQZJyj6bd7cC0tFUiA5rnV9znz28YQwo=;
 b=JkYKjG5FuE+M+pQgOrQ5ZP0g8hhFSF0g6oeYwT1XrkpVqm9AMWvAOSUDi+Bb5CALV0K0wmbcX
 opf6fiXOer0BbrSNGSegxbXsRofZKdw6FV6Cx40e63REQKWWxvU7nsT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

In Amlogic A9 SoC, subordinate bank reuse other master bank is
not from bit0, and subordinate bank reuse multi master banks.

This submission implements this situation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 61 +++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 35d27626a336..1fae372bdbad 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -55,14 +55,18 @@ struct aml_pio_control {
  * partial bank(subordinate) pins mux config use other bank(main) mux registgers
  * m_bank_id:	the main bank which pin_id from 0, but register bit not from bit 0
  * m_bit_offs:	bit offset the main bank mux register
+ * s_bit_offs:	start bit that subordinate bank use mux register
  * sid:         start pin_id of subordinate bank
  * eid:         end pin_id of subordinate bank
+ * next:	subordinate bank reused multiple other bank groups.
  */
 struct multi_mux {
 	unsigned int m_bank_id;
 	unsigned int m_bit_offs;
+	unsigned int s_bit_offs;
 	unsigned int sid;
 	unsigned int eid;
+	const struct multi_mux *next;
 };
 
 struct aml_pctl_data {
@@ -124,12 +128,51 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
+static const struct multi_mux multi_mux_a9[] = {
+	{
+		.m_bank_id = AMLOGIC_GPIO_C,
+		.m_bit_offs = 4,
+		.s_bit_offs = 0,
+		.sid = (AMLOGIC_GPIO_D << 8) + 16,
+		.eid = (AMLOGIC_GPIO_D << 8) + 16,
+		.next = &multi_mux_a9[1],
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_AO,
+		.m_bit_offs = 0,
+		.s_bit_offs = 52,
+		.sid = (AMLOGIC_GPIO_D << 8) + 17,
+		.eid = (AMLOGIC_GPIO_D << 8) + 17,
+		.next = NULL,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_A,
+		.m_bit_offs = 0,
+		.s_bit_offs = 80,
+		.sid = (AMLOGIC_GPIO_Y << 8) + 8,
+		.eid = (AMLOGIC_GPIO_Y << 8) + 9,
+		.next = NULL,
+	}, {
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.s_bit_offs = 0,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 17,
+		.next = NULL,
+	},
+};
+
+static const struct aml_pctl_data a9_priv_data = {
+	.number = ARRAY_SIZE(multi_mux_a9),
+	.p_mux = multi_mux_a9,
+};
+
 static const struct multi_mux multi_mux_s7[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_X << 8) + 16,
 		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+		.next = NULL,
 	},
 };
 
@@ -142,13 +185,17 @@ static const struct multi_mux multi_mux_s6[] = {
 	{
 		.m_bank_id = AMLOGIC_GPIO_CC,
 		.m_bit_offs = 24,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_X << 8) + 16,
 		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+		.next = NULL,
 	}, {
 		.m_bank_id = AMLOGIC_GPIO_F,
 		.m_bit_offs = 4,
+		.s_bit_offs = 0,
 		.sid = (AMLOGIC_GPIO_D << 8) + 6,
 		.eid = (AMLOGIC_GPIO_D << 8) + 6,
+		.next = NULL,
 	},
 };
 
@@ -177,31 +224,34 @@ static int aml_pctl_set_function(struct aml_pinctrl *info,
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int shift;
 	int reg;
-	int i;
+	int i, loop_count;
 	unsigned int offset = bank->mux_bit_offs;
 	const struct multi_mux *p_mux;
 
 	/* peculiar mux reg set */
-	if (bank->p_mux) {
-		p_mux = bank->p_mux;
+	loop_count = 10;
+	p_mux = bank->p_mux;
+	while (p_mux && loop_count) {
 		if (pin_id >= p_mux->sid && pin_id <= p_mux->eid) {
 			bank = NULL;
 			for (i = 0; i < info->nbanks; i++) {
 				if (info->banks[i].bank_id == p_mux->m_bank_id) {
 					bank = &info->banks[i];
-						break;
+					break;
 				}
 			}
 
 			if (!bank || !bank->reg_mux)
 				return -EINVAL;
 
-			shift = (pin_id - p_mux->sid) << 2;
+			shift = ((pin_id - p_mux->sid) << 2) + p_mux->s_bit_offs;
 			reg = (shift / 32) * 4;
 			offset = shift % 32;
 			return regmap_update_bits(bank->reg_mux, reg,
 					0xf << offset, (func & 0xf) << offset);
 		}
+		p_mux = p_mux->next;
+		loop_count--;
 	}
 
 	/* normal mux reg set */
@@ -1159,6 +1209,7 @@ static int aml_pctl_probe(struct platform_device *pdev)
 
 static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
+	{ .compatible = "amlogic,pinctrl-a9", .data = &a9_priv_data, },
 	{ .compatible = "amlogic,pinctrl-s7", .data = &s7_priv_data, },
 	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
 	{ /* sentinel */ }

-- 
2.52.0


