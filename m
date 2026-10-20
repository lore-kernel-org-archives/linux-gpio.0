Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482884;
	b=rD7q1dM0UPw9bTlGSAbesEmqJLuFgJK4Kc8TBYIippcFF0O9FwhqMVm0rOJFEaxc5ses
	 PJ0fd0MOyPhyW3KUvxGXAdvOwGwTGtAjUNDbSyDOyDnOKq80oEwsy8Fdcg4PnOmqNOhtq
	 vHQ87i6TFiQFk7kfhZyCbORm/OaWr9tHmno3AjGvonuGT4rjTDGALxvESUecszOqlRD+S
	 c08wLmel+tZ9++IaYw1buE2tXLvXKaXhrIdnzy9EgXje0fDpZZHB3/P2M6Wgq7wLFBjug
	 zsv1U/9ZDORLRCm/BOzjx3oSsIz4lwj4L9OnPPlvoxRCFta1d+gssWl7y0n0Oioqs6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482884;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GfQPpFMtC6cZeWCSESTJCW7WfoLxZM6n4yomsptER4=;
	b=D39TWS7lgrUyr/iOswVBzmUweLOUD3IkonTznAFNAgqKBht5RGNplGoeaOFoVLPa3UhH
	 Wx1EWhsdPl8sbl46ncNeTcMGxKAM3iuI4aDFaW5/4AuEunrAEt0GIYNzRD3ZEz867NlWD
	 /hlFu0OcwJ1NsEDc0l9Cuje4ZSkjYrnBs0abisXKYVRX3cyzWOMM65RHCHT5mu+Jyvh6i
	 j37e53M9AEuHIODAyJ3Wz5ywBrV+hBz9L6K4Ca75WMfOJh90uAnyDDlH97RPAgHIf5juY
	 zJucWrhWaVJklwodU9ry9as01+k8sA5FdbK8C6NMHmOyBE2PsYJoZNzVE28Ve+db1cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zd4es3HJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378960A2604;
	Tue, 20 Oct 2026 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zd4es3HJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482883;
	b=vAlqxuLElnN1mxHa77XpvDRQKA0V7iPWi2ZU3FupiPny9dA99JW6o3/GVx9f7PiBneFp
	 NT+fQW2KgLteWCrmXomGLB8aLXtC+3MkyAnVv5CMJfTFBJ086YrUnsW6oJtsu0rqLk6ZM
	 YSykxd+UmJER7+2P8ynasa0uzEaEWWbJ4lsn/VLtIYsBK8OGeIS0iy0oj2v9ek7erewZx
	 HOSAAUc5E3uK046euAq/ZZLMd+DTocuKZ/uEmsWsODJKuOG2I1RwYZDZMRLAPQYZrMCMd
	 o/ClLa+7kPTraHcuWzFxryp6+CV4lxysb7deHclTbAUWIGHvuk1j+q6nyk/AjFtIdqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482883;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3GfQPpFMtC6cZeWCSESTJCW7WfoLxZM6n4yomsptER4=;
	b=nGCOgFkXrnhCLeBWj9T2xdpiC927we3kFnU3BRwsPvEelHbIHSYFNT8uPRc0GVmhofHT
	 NxTc3RkjKlsZZaOY6OJFIbH8unILaXRf4Z6dC/Z80Qqe+XJ0JRclRs6BCLZuJQoWBR3ne
	 QiD8+QDuVMgdkXqKchZSajh2s1jwDTBX2J7MMUJ9PtH2Hy3ebALpfKHpUmVJFvEMPYhpi
	 RdP6de14/SiLLl8d3jH6NPaDOx75xHl0llaCy3XE3HHNoBzAhJhAHAJa/C7C4A3oIZApn
	 CTXXftIERzsd2LtB4/ChNAqkhrUjY0PBLoSoFFeppqvw8PBjHWtHfMOP50QDQq4P8SA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C02081F000C7;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482883;
	bh=3GfQPpFMtC6cZeWCSESTJCW7WfoLxZM6n4yomsptER4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Zd4es3HJouWp+Zd1RYoE7TwTAdtO+i0IWfa9A13y1wN1O43kA/lK8W4gLp+9PMHfC
	 tuZ1KhjKjkQtWfbZ28cbMzF3WlW06W7MNkW36gL8/O0Q4F5rRZpEdrndUtzDwbKSqh
	 dRoNU+2lPn/h46pexFLFLvbCU0tW1eutHMshxnWc+9Nc6Hh3pj6dL8jbZza79RHR4F
	 roD0NgTThyMMEjlgEKbSbpjhUKbawQGX+yh6oroL6DThsZzRCOp6UDCkdWZWf7qP7s
	 OYKXwSxazjGTM/aJAacZgqC48CFd9m9ttolAht6JLaybVjHVB30+M78+PTjfOj+vOP
	 owXVeTJqtNu0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9EA14430A0;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:11 +0800
Subject: [PATCH v11 7/9] gpio: pl061: keep the parent device in a local
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
Message-Id: <20261020-cv75-gpio-v11-7-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482878; l=3155;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=6urXjfb+bRGGAl/bvW6efRVjuGjwOG0bn1p44oA/Hks=;
 b=N70eUYrcE6dCgrljQNcW3nAxA7wqL9AeWFkrc2bMJHqdlPc3IZSOoC+oWWiP60yrwA1q+HrcT
 j2utV2uE9mWATzGpEatCqw+B5N+XoNw9ixI/aEt1ECjXgkjx176BMAE
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
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index bbf457a12851..585871ff2519 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -157,6 +157,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
+	struct device *parent = gc->parent;
 	int offset = irqd_to_hwirq(d);
 	unsigned int bit = BIT(offset);
 	unsigned int gpioiev = 0;
@@ -167,7 +168,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 
 	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
-		dev_err(gc->parent,
+		dev_err(parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
 			offset);
@@ -193,7 +194,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		else
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_level_irq);
-		dev_dbg(gc->parent, "line %d: IRQ on %s level\n",
+		dev_dbg(parent, "line %d: IRQ on %s level\n",
 			offset,
 			polarity ? "HIGH" : "LOW");
 	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
@@ -202,7 +203,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |= bit;
 		irq_set_handler_locked(d, handle_edge_irq);
-		dev_dbg(gc->parent, "line %d: IRQ on both edges\n", offset);
+		dev_dbg(parent, "line %d: IRQ on both edges\n", offset);
 	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
 		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
 		bool rising = trigger & IRQ_TYPE_EDGE_RISING;
@@ -217,7 +218,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		else
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_edge_irq);
-		dev_dbg(gc->parent, "line %d: IRQ on %s edge\n",
+		dev_dbg(parent, "line %d: IRQ on %s edge\n",
 			offset,
 			rising ? "RISING" : "FALLING");
 	} else {
@@ -226,7 +227,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpioibe &= ~bit;
 		gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_bad_irq);
-		dev_warn(gc->parent, "no trigger selected for line %d\n",
+		dev_warn(parent, "no trigger selected for line %d\n",
 			 offset);
 	}
 
@@ -308,8 +309,9 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
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


