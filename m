Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987757;
	b=KfFN+3ii3aITcQZ31o9Q4ZEvsJTb47nrjLpDpOsbF8cRnRFKcGTrTCP5AyxgrDrJcJRk
	 jo3QOrXBJWKA2DVzelSOlosAt0r7c3n6JhF+o+/1u2EOS7NZ+SK7U9qT4ekN3jxEb/Bks
	 FAA9iE8FaNyNDuL6JEDeuDSF8ig5+g2HdqMGlKueUdqMRscwxyn6Ah5SeNe3w/dfNNVQb
	 4roZS0uDe6K+Lv/ceirS9xfed/knjRbyJxogZVODYgInBMf4hi3k/WU7/0DjpwMAUgNqR
	 ISmve5eH1TyIxWrgYFXgXRvyj7nqlDhAXIgSHKUIWucipxhkW7WCNIjhHpJXX4gTr3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987757;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=b+XU44HrhCYFMinku1qpiMuZkuqPnrxRalAV2eNINsYLu04MbdLKhifuf/FSLMTDja6c
	 o1XaAqB3c9bUkgwBGzjOIXBOvf8X7VZthc155G+yzV/2cINGZcmo4HgedUUUQbAqqHSWJ
	 IM5E5TERZ3KPVgboDz8EuPTJ8JTkiEfbpTmHafeeNoYf33cYs5/0oMjMXKZ5qO7Qm1Mn3
	 ZK9SJl2OTNE1fqW8vDt6oavmC3O3DAr0n5HoHgLAAGpaQeCvuImMowmRc6GY7U0O90ZuF
	 IIJVeu/SQbWn5y8k1txXe1Gh75QUdpSNOfns8xbRFLbezH3O0h8c76LFbZXfgM7dvBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kaZlrkjN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1F606A894;
	Wed, 18 Nov 2026 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kaZlrkjN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987757;
	b=DkF3KyYnW/SPn3GIEsxBqZp8tp4ehtKR4EyiFNy1LAIivwdv0I2cbqhmgsvWSb9Vbcbi
	 Se2RWXY2Vm2zJdWp9FzHC7yMgUw2I1q8rtP6JdtlJ6S/ePYUVzApyUEI2SPbUkyXE+ctT
	 PVc7Tr47PKfLcrIgNmrOXL7qxzQvWBShUi0zTk0+WDyWQXS5Vc+z8ORJKweZXodddN3xD
	 SgLGgi+LR8PUsenst29oXZDagE8Sup+ci5o6Ql6yi4Z9VTFE/J9JKEsmyfKLv3wtOQRzM
	 o5y5mihhp6Qsyj+7o7QvNF2CLqUL1fX6/2fPab0+5Jrr6DlB7ocGAhFvFWnfEeWwr3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987757;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=WAOF0LRug0hF82Jc6d/zT3zgI1iE9dwL/v5yva3eWw+RcDlaWhNhX9Rvpivcrvw4BK+u
	 5fG6hNvFGhImt21WADtiMlWh4klRNLL7TBu8xczMdUNLFEHVcgceOZ4i4vFBhzna1a8eB
	 KjGEqXip85tk0ZXXF6W+Y/NxjrxyNzBF3G4M6zktLP6hcOLAYARUyBvOuGWmoKoGuWhzR
	 xkEb3+lWB3TCjFxuLxAcMzcatK6Az6zrQlx5YzLD2LlmjEwwHjRnpqcqCIwc8G4ZwvtF9
	 3ohNzZe7d4iDS4tYYsq6nAQoQrPrPzSSFMOZsHVnod5vA9cQmcVYnc/E5TKvD7GaqtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F6F31F000C8;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987757;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kaZlrkjNCHc2c+UZrFAMc1LQwgInvDksWPbe3osOHg4ch4amcdZrA0c71Z1vaxj/G
	 bMaqJv2uHr2hJHNSntsb3Osmldk7Z2dzldoINJMZIyFjlECiVZAfwv5JSSIAcWs2oF
	 qjq5Xhjp6IBSXS20goOas4w0L54x7ZNSNnU/3esdx5dxfPpdXTOzWtE3VqxWbB4Rqu
	 qDVLVL453vhDoBl6Iup0E/SOk0bK71gG2aPAmUVyEcLzYhnJyNboalE24UZ8oxR1+a
	 1lsFWSsxm33IsYl9M5O1DT59wlob3fS0Sg6rZch8dSDar9T76qrmur6OQC1FuaxZ4g
	 LPY2oSt//AoFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CD2F44AC62;
	Wed, 18 Nov 2026 07:42:34 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:21 +0800
Subject: [PATCH v15 04/14] gpio: pl061: drop redundant pending check in the
 IRQ handler
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
Message-Id: <20261118-cv75-gpio-v15-4-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=1082;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3XWHZond2pOFeGIXcPtw+mHYxFL9WC432M4BN6DutlY=;
 b=ZhZt7h8oLm97sjmXZmQesDUQx4pHDi2d/bIaZ+IeF9PMMJcf7NFuUi3Kctn8zGTkEEMTuFv4F
 f/+KKZH93P1C/8PQBAd+cIvy4rQDLJwSsXRePbkJKunRlCecofQo9oE
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

for_each_set_bit() does nothing when the mask is zero, so the
if (pending) wrapper around it is redundant.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..721f14cf404e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -219,11 +219,8 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irqchip, desc);
 
 	pending = readb(pl061->base + GPIOMIS);
-	if (pending) {
-		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
-			generic_handle_domain_irq(gc->irq.domain,
-						  offset);
-	}
+	for_each_set_bit(offset, &pending, PL061_GPIO_NR)
+		generic_handle_domain_irq(gc->irq.domain, offset);
 
 	chained_irq_exit(irqchip, desc);
 }

-- 
2.34.1


