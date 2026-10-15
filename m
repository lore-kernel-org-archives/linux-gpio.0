Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7A4BD360;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061672; cv=none; b=GKRFGZlwtjOE8CX78qPy6Zf8NMToY9uwRKypOUk3wOho/VXrHH7A8F4yYZHmbjWKZUmodrXNthjqfkJtzsgy8mwFI+4JVbHZwaxjjJajZFJBvmW2pPYxTiXXmIRoShGvsOO92gA+/dfWh1K9rfXRR2tFECHhS64MrOPOC2B5v+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061672; c=relaxed/simple;
	bh=5iVsx0esljQMsMNbNHsXk5qGRl5hScwGXeCgjwaBc1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHm1O3bSgYaF7NsagzdxEO/CE8WKluOX6r1nvqggVogmTJGShD8whvNCbOT9Ce8dyrmLUiTKzk3QUO4a4dNs1hrIQWLPhWmyc33nzRT776RDhiUa9vITtOJa38YhTB7NqiQ0Llq0T1XuEbd0lMlp9r/mCEjIm0pg3hy/nOXswRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5sq11Uc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5sq11Uc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21A87C4AF09;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792061672;
	bh=5iVsx0esljQMsMNbNHsXk5qGRl5hScwGXeCgjwaBc1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y5sq11UcQ3BpXW6d6WnV8yHJlgTGQ1nRgN4u7aX1AQuAwqrR8qiW551lyyaMhGJwK
	 eIj7TG+RebaeoKBsZkk6lQdjatXfNOY0pPcQsG+UJqRJOcPdNg2hExjzKbSFtTryMB
	 tjZLOkpe/VMKEZ063Ofs6okFHIe3o0s8yZKAHP7s1Ugwx/qEKzShfyLl7dgV1rMZNr
	 oVqYmaUnrAQA37J+kQQXxYJjOnFomfSQebmPAh5Gw4CDIRO3mYytiZHj7wpy/XadVM
	 CS2H/bZDNrfnrce8pGjc47xk3n+Yj9ACpwaOsyI9vWh25hcA2dVkfXRAPiPxSI+ukj
	 Y+YLU+OwXlaaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B8DCC6B3D;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 15 Oct 2026 18:53:30 +0800
Subject: [PATCH v10 3/8] gpio: pl061: drop redundant pending check in the
 IRQ handler
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-cv75-gpio-v10-3-3fe3eb315a55@ambarella.com>
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
In-Reply-To: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061669; l=911;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3vJo2yt93pgkrdZ4lG47j+Zlec72mroOPt6GOk7rCSM=;
 b=63KK+e6FOijeR2JzPNDLKsicpKL0QhGHmRR82dIqQ7b6df26VAxBp1HlnSjh0dX1sl5+kt5Sl
 OZlyYqbBYw4D1zYdi7YTmCED6bVZFUY/4Kr5Sr6QOlxQtvcvbr2C3Jf
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

for_each_set_bit() does nothing when the mask is zero, so the
if (pending) wrapper around it is redundant.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..e48842601310 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -219,11 +219,9 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irqchip, desc);
 
 	pending = readb(pl061->base + GPIOMIS);
-	if (pending) {
-		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
-			generic_handle_domain_irq(gc->irq.domain,
-						  offset);
-	}
+	for_each_set_bit(offset, &pending, PL061_GPIO_NR)
+		generic_handle_domain_irq(gc->irq.domain,
+					  offset);
 
 	chained_irq_exit(irqchip, desc);
 }

-- 
2.34.1


