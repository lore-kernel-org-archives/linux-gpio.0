Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7B348CD6E;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061672; cv=none; b=gOpLTISoWAjeZju7R+ZBcoUOTleOfO043RIR7w5B+hhtWupPZAyTGYz72uG8Aj9UnUyHmYPkOYxYkCeGrqAKCt7VmBddXw3z6MdQbsmNmX9VxcBx8SVap3Y5bFII5EeFULZmIf3kXE3BMCfyw3qu8YP0YoVgDT2Uklr1ijtQmzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061672; c=relaxed/simple;
	bh=Mff/B6KrDyJDZhBIvcMHjwi5K42GpZG10pIuRbEdaco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDSr/Law/sxFZVi+KI0ObmDqTWQcoDWqyNjI8L/dSuKWXdHWu2pQ0bmIuYA1V+q/54oyOksQnPfL5PNRwy+Zhi45lYJbanVvB8rbWJy8RAUPwbx5GUsdYKWhYuh2Hw8p5gIVp26bZC41x7Zl3sg1JghFdTbPYqeoBf2e5zpd/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJZNqx2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJZNqx2X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41B16C4AF0B;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792061672;
	bh=Mff/B6KrDyJDZhBIvcMHjwi5K42GpZG10pIuRbEdaco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZJZNqx2X2GUiQ4jLi/Vhe43U0MxrCdez2HW+FzVaVzGzY96HW5quVKVeWaeHavPjb
	 oCzYbJSum5QclvF/BWTC4lrzx+Sc3aaORybGFdLgDf2iVuvE/J6kvzeOtJv1cZO9pA
	 uvUBLrJFaX4zt65TYURpykcz+ZeK0hLINWSsrdGIAxNS/lqkqFKHnk9imoK96428sB
	 yVfevL8XoFzcA9cM/4AkEgBC013uerGwiUv8Q638eqf3Sd7G7HKIcX9vRg4HCzdtyQ
	 lFEiuzMyvO2iGfXQ0Hm2N6/XoPVMwPBK7BKvHPxzZMz+oR5MTXoy2huLdxyNX4El3w
	 Rq2e+9nfdzCQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9B7CC6B3C;
	Thu, 15 Oct 2026 10:54:32 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 15 Oct 2026 18:53:32 +0800
Subject: [PATCH v10 5/8] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
 IRQ_TYPE_EDGE_BOTH
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-cv75-gpio-v10-5-3fe3eb315a55@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061669; l=1433;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=i69VUgL06b6s6zvJqrONL7Iv9ThIepmNiMLeX6t+Su4=;
 b=y71NvbXkU1h4t6N4rhbsMTVAGgRfAUqXQmA65lpkO06iRJsXWr8dJayydzObPAfT8eLHHTkvK
 GwFHn4g7KdsDdXHQqcom0tX1hcmR8ZBvFbqyD3Hug1hEoH3pHFJ5X4N
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Use the standard IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH helpers
instead of open-coded edge and level comparisons.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 68d5a9e362ef..8f431d08573d 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -170,9 +170,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
-	{
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
@@ -187,7 +185,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
 	regmap_read(pl061->regmap, GPIOIBE, &gpioibe);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */

-- 
2.34.1


