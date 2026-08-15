Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1B39099E;
	Sat, 15 Aug 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786787121; cv=none; b=qBQQTDwoUtQX1HYuBfN1/Zx9Q7+EoTdEqk44Ou0qnjrzSL84cwLO/0pqzNYZXqJA/Fm6wSao7zYxEMPSSZqts1cwZPPTi851AYMx1bJZ+R0g01bDyjwQvVcFoEvA+XczEiIGVkNo/hKzcdUmygdX+gDcj54eJmyf+kafYClDqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786787121; c=relaxed/simple;
	bh=d+LwmZOwyCG9zwHI51gv1lxQlQGxVKFHZaI8LM6iYkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtSqrQPmKOmOudkjt7veFTEOTPQdjXY2PYs7e5s2OE4cRJEQ+rzM7Pa6yWNHew3maYMhImCgWn2qaCJ6nXcIcXIb8/3MCVAIKmGnYjX/z63I1y1YDIyqF5RoWJL8RPlmNcCbx7vCBUXkMlIBbLSav9FnrQnL0IWP7vxEU7X/Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XaVsbyaF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XaVsbyaF"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B48218838D;
	Sat, 15 Aug 2026 11:45:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgtZX9krEqU2; Sat, 15 Aug 2026 11:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786787118; bh=d+LwmZOwyCG9zwHI51gv1lxQlQGxVKFHZaI8LM6iYkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XaVsbyaFr1VStYScIQ6pRUgFcIVUPFydAKM0Fzv9zbsBKEQ7rxFxQ1s14Wvx7gXkI
	 sQXghEtbSwf41aXs/rY2e45m3xwF/AoLSAAtaGNIYmFBIZGBSWxJJ/HeYS/46FCnnH
	 xS5+Q3faDgERMQ3V+vUVAQFK02ANgG6m0Zw0iNrvbgAhJCjkS/hQ6nc+zF1GmrUA5C
	 h85XlRYn+UHEZKyS0P0FZDa0MOWsYRAklS84STtMG0BBxgHZf90ZXF/31aRuOxVoZg
	 IDEJu9mhxEAvqMOd2Cld3CRU40P+KqoLsbALdWJN/uomEMm4xp889iAQU2ej/1c/iY
	 uvo7NVInWF25w==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v2 1/2] gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
Date: Sat, 15 Aug 2026 14:44:50 +0500
Message-ID: <20260815094451.31792-2-adilov@disroot.org>
In-Reply-To: <20260815094451.31792-1-adilov@disroot.org>
References: <20260815094451.31792-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for upcoming changes to how bank reads and writes
are defined in this driver, change the ioread32 and iowrite32 to
their __raw variants. The realtek_gpio_update_line_imr() function
is used by all devices regardless of GPIO_PORTS_REVERSED flag and
thus this is the only place where there shouldn't be any byte
swapping whether SWAP_IO_SPACE config is enabled or not and that
is only possible with __raw_readl and __raw_writel.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/gpio/gpio-realtek-otto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..491fde846d46 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -176,10 +176,10 @@ static void realtek_gpio_update_line_imr(struct realtek_gpio_ctrl *ctrl, unsigne
 	u32 reg_val;
 
 	reg += 4 * (line_shift / 32);
-	reg_val = ioread32(reg);
+	reg_val = __raw_readl(reg);
 	reg_val &= ~(REALTEK_GPIO_IMR_LINE_MASK << shift);
 	reg_val |= (irq_type & irq_mask & REALTEK_GPIO_IMR_LINE_MASK) << shift;
-	iowrite32(reg_val, reg);
+	__raw_writel(reg_val, reg);
 }
 
 static void realtek_gpio_irq_ack(struct irq_data *data)
-- 
2.55.0

