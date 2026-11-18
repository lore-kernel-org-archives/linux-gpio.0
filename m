Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987758;
	b=C0v5YHC1oG0j5vcS/me3nIBmE+Mpn6RWtUZJf0cdk+NYpSlOF0OgCYjydpcejKYK8nR5
	 1hrkdCLff1ULeMFFMtTSJG+xrNICd0U1rP/lF+IfcafxyrLAqx9CNveT37xrHNIsOfnsE
	 ImY208j6h16dl4BhpYrVRnUJHaMTOD8aKKqI+htlAPsTcNfjYtg5LINTk45RqAaJE1m6v
	 tioF66f1xp72COpM7kVgWrP1xMU2MTvWDvMlVCg5FLX1rXKH1l8aq3UciqA8dxuNspFjR
	 zq4NasQKs1pmXpNz2C6mD1m49UCBdceeQZyA4QDIzqNqeI03inJzyw9wrUg/D4ez9ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987758;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JgYNP/CnGsB7Wp+9CpnVyebG2MLsMoDD2UhXdaa+Qew=;
	b=mq/n4LNrA9pC1W89mUJ1TAzi/peTNS8HVVNBBd9wa2GGNea/0y15Y+lcQ0Eu4hlaA8zu
	 3PGp3tGZPbIDN5fmGLIRXf2eTC+hBOVzTGNFFVL7VMQvgjc12W+lGn3IvMcuzuFXGz0K1
	 hRfydwKRXZAsWBUt8MGkkSOQmqCYk8lN9rGEoCdj9QXJLV9U3hHOcQTuPfPH/i0MOlB/y
	 4ENwhzuxG53h3H19kX1EFTHEUfaQrdpx07ca35fqxXEZe9citddnxhW8IOOy5KpcTGGaP
	 g4uRGoAmLT7k2uG5n+yz8inhQ/L116gRFUt9m+JkhW2esluAvsOPMwEgNi1sK0g4BfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q39j9RDd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4F60A2600;
	Wed, 18 Nov 2026 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q39j9RDd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987758;
	b=VQBj6DMJ6qZQbnAUMgMAjKoWpnPEMn0a8NupdS/5xjXjKXH92J6vyWu/CzrxgeBy44Gk
	 tDj6UuvLOSCEipEbvirAaKUuzqlaistg6HKG4IN91NvNl6OhIEp+wnz9fKdH0cDmpnD+E
	 H3veVHZhpx4lVp1Tbnnf1PzCCkdDe5Z7GZVviKU0utEz303sJvB4xwX0vA8vZ+h/w0Hus
	 lk9PjndMHKer9otida2F4em+iiDHfu70QnwxyclDBIv/w+o/m0UmpEIZ+8e9BPa8ShPoY
	 1cS+pCO5WJivKPWn0zqd/OC+guNpOpa0h4HZUELjlcxE9/cG87Sct3qecVoMZ6uEUTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987758;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JgYNP/CnGsB7Wp+9CpnVyebG2MLsMoDD2UhXdaa+Qew=;
	b=u0A8ZSrmbi+tvgO4mkzih6jWepFDcr8c7poWYl5CnP+zpI1qOLhn9HB6gwlWpttwkrSc
	 YffwWLyG3572OvPH3nBMT43IHGkbRt0HRbSIOHCEaZxXxbxkGeoxj+zNMKL7dByxYkO5r
	 li+XtIG2O4Xl64UuldJo+/k7yo18ntP/CfkTPWqNcoRcFyg0cYuEo9MvGOu7T6dkPNlbg
	 QnS1WCt0VV/rhBuR5hey447wYaOBbQWFKftNzMHsD7rNc79SJ7cTixELwQXhEumyVTpRI
	 6bwIJh1pH7sTD3mIkOElxvvEED8YhwujULOg5N7uuZnbbtdOCjEccugE7uYoTQ4hbYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB8EB1F000D3;
	Wed, 18 Nov 2026 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987758;
	bh=JgYNP/CnGsB7Wp+9CpnVyebG2MLsMoDD2UhXdaa+Qew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q39j9RDdu6UB9Jv8t8kvu7BKzIj+h9sgajzRCCY6WHcNaRvAbEZ9SIczwwxrKSc5s
	 llo6U/LZbdHDmxSODU1HKf4yLj7cV3AFzosKeeSS/Hd5nV4ve1MWo1fvJo89Qg6WrD
	 9T4NtJXsOekGyenPbi9IvAB181Xlk2FYDtBwCLFE1dNy+7ZaHIy5oiAqM7rsE++SrH
	 H18FbjrJ1/GuMak/spKpOWP1NgXhbVjs72GGpcBqh5lZJwvKwORB2C7UzeLhvya1S1
	 PIsveUdJtavYOE4NUR2WA3BwSjhB+cmfIrBJxvi89IzWCCeyw3yQ3IdyoEOymMH8Kq
	 s4OnQWd12QesA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 34D734AC72;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:25 +0800
Subject: [PATCH v15 08/14] gpio: pl061: keep the parent device in a local
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
Message-Id: <20261118-cv75-gpio-v15-8-e3c563673fe1@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=3327;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=U7nepCgkgjETq5eVgsmzh5zmWKMmPTFdo3YH5lWwtPQ=;
 b=UkvhbA2Lbs5Z3lW3/TzbzgJBn/OUUe/oXFfvcletGJeOlbnvRi3rAsOCIg3YRzMVX4K4RkNH/
 +fXOMRLaLZcCx5p2y10+96/TPtbZrfld2SZ0FTg7dN9fR6IoGTzzLqj
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
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index a232b63fbc0b..27ed759486ca 100644
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
@@ -225,8 +226,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpioibe &= ~bit;
 		gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_bad_irq);
-		dev_warn(gc->parent, "no trigger selected for line %d\n",
-			 offset);
+		dev_warn(parent, "no trigger selected for line %d\n", offset);
 	}
 
 	regmap_write(pl061->regmap, GPIOIS, gpiois);
@@ -307,8 +307,9 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
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


