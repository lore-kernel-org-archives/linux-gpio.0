Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074771;
	b=l6+HsLDdVymmrAmofpkCFowCH4r1nonUVL2kYuSQeIZ7G1WI3NYkmd7wPPeZ2dWIynN6
	 f7IkZXapu/05hzOFl3kpQOLbPxjrM+SbKT2aoG14q3JDaO1gVnUn0NmKqEPnMid+BKXCb
	 NYZpa97J6VWWGw4WfbEge+l1sMyBhzND5HKmPFd65HXnVQgrY8he090EMspD2tjaLEOxB
	 AvH0bubGjeWnfY0zPZJZZHnLjQhQyLTIOP4L+SKnCShHZdUGA0nwWwrQHQkF/M/pyQuzR
	 o3jXORRdd7j6GWYjrdhLFkijp8MiwXjM23GvXS8CSTfnrL7W/bAo6bOgRYFEu51t3AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074771;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XKHFwgzqeHB+Y1YoBF6gmZQCA8PS+KoAGrOoZWFeiVM=;
	b=qK/oA0PM6p4EMMFtO5KqaMhN5MXLQ/lFgwFyC5W1KBgCl0NOYq1FA/W0/rx+fdtmOeq5
	 XvWDxzwLfMx8cOLfh9kc51ON5WHyNupyGPpw5C+OwnnmuyBUH0RTyWdeLqoFNvD+DcvUC
	 Ghnyh1M1ymd4qtt1EHRnYojhtGRCXA2uM3PRzs4w9DG1QVorwCvYiOGIFr34ZLfcKqV9/
	 tPuHuQHrGyuphDADy11Fcx+z25Ydtc2/7VPSoYZZIssOx7/Tmmp4GYHt+f9+fTgCslWw7
	 Aatn9irxCSG+Js8Nw4I5AizWnVXvi92kLK7qaaePRMzhD1r5Es0DXoiMAmUFsx95toQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NG/R6eKm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115C606A337;
	Tue, 27 Oct 2026 04:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NG/R6eKm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074770;
	b=zkp5b8BY44X1Vv8J6qQ/eP4Vqf87HArrNtEeWKt7tRVXc0hRTAuzmc3/dBqWTGwwNVTS
	 mrsRTx+PxcCd8i9OTJrrgchBCu6951oRx1Or/hrTACYFwNCpwaSl5XfergWhJPiYXc/Ja
	 lZ3Axt/vw8sLAz6TUCSYjbD2DGNR1TFflM4tU4OGz+N43WgMUDLbBA60moGvRHYainjVj
	 mYWV1ZiQeOs9/GJUiNocDd/qTtx0gQYw8hrdDKXKXtO64ztQg2Sts25Q6BDXHrBMv15sD
	 zaAiOEu+sgzqhmY2qUZBuIpKLSX7cC+oL240aunmiixt5PlGhgsLxIJKJBMtkitWc1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074770;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XKHFwgzqeHB+Y1YoBF6gmZQCA8PS+KoAGrOoZWFeiVM=;
	b=U8p0ppU405lKlsH/dGBaprVWXPUOB5n+4OrUFyIlUQ23+nbtNObzWsUNGyujhcd8Zd88
	 HCdu5/ImvQPkQtvnUnFf8TDgN3ZSf7KEZ7QbmoYIUD4qFeL6/S0g5WfMf1Pswyb5X6Amd
	 QqMzcfVLvCWLBM7E+86MYY3JVlo0yx3s+YgNDmzo3v9I3ExEIgZsbhw7JMFpNy2gKCxhS
	 vZ63kifFwJ3Fq1j7Dqy0F7dKqj00Vf1f7Fy6NXVP9VW/pv5x5xJl2Nq3C6xLlMxoMMiv1
	 wGU19isELQ4ideLr4x8CvWGIQSL/Rzhwfxeatm/YNfiEqll5mP7K6JJxhKzhZAPhjbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 333111F01828;
	Tue, 27 Oct 2026 04:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074770;
	bh=XKHFwgzqeHB+Y1YoBF6gmZQCA8PS+KoAGrOoZWFeiVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NG/R6eKmYHmhfijtSv4XfYJ5sfqa0dLkZKuEnfbBGBYXodW7Ex6UJgEWxmc1eI5bi
	 cSec12CVy2FNTEbaKSmRegkwDB05bZzYccgY+B4ZO1NQW07H2jlVQIYHdAFrGeJxNr
	 FqMh9zbPrDTASwjZaWg9ZtCh71zgcgN/uR4YRY5v1gZmbbosHqbIfEte+zgT5HsH68
	 ZBS58YCleqrlkjzfwJOQmeGKdHLTgRHAK2I009d2vekx7X5xLPOsb2EHrotIOylpGR
	 c9tVSep0yWdSXNOnWy6kAQG2aNiIOjsS+0pD/+o8dmmW8UcO+Iac2jKpLOPyfhQdX0
	 W5a6f2In+Mc4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E265744F98;
	Tue, 27 Oct 2026 04:19:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:54 +0800
Subject: [PATCH v12 07/11] gpio: pl061: keep the parent device in a local
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
Message-Id: <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=3221;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=WNqCHzH1dw3Ux1gcYHg/p4RW1NuZp0FcGl2iaex8mK0=;
 b=lHyX26khjcb90kqudsuvFZ6peZRRFJl2UPSesizvlyStvg3mf8gOnA3lYrWbb6yoN8NRe7w/N
 chgF3dCgNASCRfV2wSmA9C+5w6VsmAQXOiGpv0eiaXE9vrTtAhKtHcd
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

IRQ logging uses gc->parent. Keep that device in a local so the
gpio-regmap switch can change where it comes from without rewriting
every log line.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index a232b63fbc0b..f101f48ce68a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -156,6 +156,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
+	struct device *parent = gc->parent;
 	int offset = irqd_to_hwirq(d);
 	unsigned int bit = BIT(offset);
 	unsigned int gpioiev = 0;
@@ -166,7 +167,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 
 	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
-		dev_err(gc->parent,
+		dev_err(parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
 			offset);
@@ -192,7 +193,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		else
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_level_irq);
-		dev_dbg(gc->parent, "line %d: IRQ on %s level\n",
+		dev_dbg(parent, "line %d: IRQ on %s level\n",
 			offset,
 			polarity ? "HIGH" : "LOW");
 	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
@@ -201,7 +202,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |= bit;
 		irq_set_handler_locked(d, handle_edge_irq);
-		dev_dbg(gc->parent, "line %d: IRQ on both edges\n", offset);
+		dev_dbg(parent, "line %d: IRQ on both edges\n", offset);
 	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
 		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
 		bool rising = trigger & IRQ_TYPE_EDGE_RISING;
@@ -216,7 +217,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		else
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_edge_irq);
-		dev_dbg(gc->parent, "line %d: IRQ on %s edge\n",
+		dev_dbg(parent, "line %d: IRQ on %s edge\n",
 			offset,
 			rising ? "RISING" : "FALLING");
 	} else {
@@ -225,7 +226,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpioibe &= ~bit;
 		gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_bad_irq);
-		dev_warn(gc->parent, "no trigger selected for line %d\n",
+		dev_warn(parent, "no trigger selected for line %d\n",
 			 offset);
 	}
 
@@ -307,8 +308,9 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
 static void pl061_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct device *parent = gc->parent;
 
-	seq_puts(p, dev_name(gc->parent));
+	seq_puts(p, dev_name(parent));
 }
 
 static const struct irq_chip pl061_irq_chip = {

-- 
2.34.1


