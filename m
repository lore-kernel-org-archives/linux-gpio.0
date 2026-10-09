Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647864CA771;
	Fri,  9 Oct 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543580; cv=none; b=Lnz7M4WI9DHP1/7uikbSsTA86L3zCvdINvfE5xeoFd2E2FAyOVJMMIbFrnwy5tcfwSOKvc1jqABXsPsU6joZd3PlvhL6Gf+GAl96MyucFKeKnkAAMvTsr5MsYrD9m1pDFj+dQ2vw7M4FiLcVQIU9S33oAOitATxxnRvkGTXWkuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543580; c=relaxed/simple;
	bh=8CB8ZyXD/Vb/AwDXMmJ595exFikO+h44yXR7JjtTn44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGpcuVu+x7dt42L5ydAceMa/mYAd2S5gLKieEr2GJGaAhn+qJLFz95ngnfV1Yq4C6X4z1PBEsYmNl6ADEQ/An0j/thVjHNM1g8zgCdWWS4ySpTJSktllxYA532FojoPTXBaWcTFYN2AvqX/gHoySJnFsrWrAibm8IUzWxv1dv+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ8CaRik; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ8CaRik"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E67FFC4AF0D;
	Fri,  9 Oct 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543580;
	bh=8CB8ZyXD/Vb/AwDXMmJ595exFikO+h44yXR7JjtTn44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JQ8CaRikyvlHOBrtgkOAYIOO00vogVwBElG5zlm2MZqrQKC9PFEWkvZjizWevRWMF
	 vrPfCD281UgCR5zAg9pnwSzJEidEgW4yVTj8/nfSC09zNgaG+YUkt2GpYKBJCMYW7X
	 2id3gc2SPbqKuR+tJ2x7H+lTY8CyI5VMwz5Z2IggFCmT2/9EgSj/FiRhNKFPReeJY+
	 njJdylavL4DF6pBbRrce8Wz3a4c0yFJZ/K+yLMHLEvibQaLuLOHdN0xr0qgm9Tv8OZ
	 ugFMYaYZlARhG8FUnP+HLDcgjRvhvDg2vZIKo6rXGmp9Kl4IX85lFMc1APVkGzQrYo
	 8YcMZ6tZLrTVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A11CA601F;
	Fri,  9 Oct 2026 10:59:39 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 18:57:57 +0800
Subject: [PATCH 4/7] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
 IRQ_TYPE_EDGE_BOTH
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-gpio-v1-4-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
In-Reply-To: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543577; l=1433;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=DGgaMzAx2L1d5OYoX90rBebPhEibhah8EcuBwlPbh5Q=;
 b=JcFNByyQh1EF4Da6bcIKHVRIEaUJU8bZT+soiVMp90c5sZITAWxkyPaS+8WwFwPT9Scq62CVY
 DDKFkX8lobRCCPe4JQbbcWG6dlL2t1ehO6ufXicFW29VFlemWI1Dp4f
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
index 2b1e23fdb7d7..35aabe4beff6 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -168,9 +168,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
-	{
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
@@ -185,7 +183,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
 	regmap_read(pl061->regmap, GPIOIBE, &gpioibe);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */

-- 
2.34.1


