Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987759;
	b=OB9oCmjlXaKafndmVl2A0grPfk4JsdyIDdERpaokEiH2hgn58Mr8Ej2mTJ020QgBRamk
	 LIYl9SC9xhQWV0XvTiDEXV4NJ7Tb83afDl5ILXWgF/OxFlViuqRXhk4Jh8jZCtUbdRdIS
	 HakFhxit39MYveWjB10PIVt60z3umYo6MVSLNXR+tCLDAgzwB8OqIry0roRnQjqI8ACdW
	 G64oDminzK9JiD2aV7GK3c+8MpQiKWy0L8ZwuQ9yqAeg/YP2MQh9wwXZPEdVWkJzI5j5M
	 bBUoJcPOWbI5aH2hoOqxgsejx+RhvvaGUkhvJ4ihHORs6iaBe9ZEQhCohoRLLWcXu6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987759;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HeIjXjaNOFF9xA1RhXhE/ePL/urDZPveh4V5J9FyOxg=;
	b=zwgoSSE7rD/BoJac/9mUQU3FfuAbpXN9GQaJKvp3d1Ke6vGc8X+iLLWl3EMuoHdEJLkd
	 e5DPU4tXUZZ1XIdyjeYZqYo7SfDXxLUrLxmxLW6L9FWyPf5ZRh2bCNpa4QU/GMpMjGuGF
	 /zOKIKfGU7Ul/0ytX0LJyx+t8V9kdz/TZ7dEOfXsH1pxZOxivHL6jA8Wwd4hszqGbQ6xf
	 3xMlrWWAjMfRbbnEAmQgqKSdr/qyNL9R6QQSnFlZhE9xwyoE/eafgWYRcljnU6H502tc5
	 4cVbgacXLlUQRGZHkC9IZZUIa1gj+hx8uSEUS0/BV6WmfC0oMBVC+sJnf/VWghHl7ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhjv5Yrc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB58160A3812;
	Wed, 18 Nov 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhjv5Yrc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987759;
	b=Nhm7WXMlfyvY/oJO4HSiIU4dWdrpl99Y3MnYkUsOSTPeGEM+o0anC2H6r7zQDbz2OjaK
	 QsUrHKtHOGPQDENyf1IYjQzDNmJTNhuze4X+tUeVdXV+e19FA2/u5QYSk+u1w44qZDadX
	 +y+KT3Nyghedp6SiuPgtFefbFyDpDL2sZIjmlIfZzTQZwsGv5PYRaGx+8V2dcf+aXzQm/
	 xdupZn1YOntQzOYJg/OT8LOUw7JQttcWp7hLmBly0E/6WTiBIeAa/zAUYS7rqqOIwda2Q
	 Ff+Lex2gh4WYahbzGHy9kF+bNIqZKek1bKZUTkA6CSdi5Tnh3uTCHWXVJKkq62yVnFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987759;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HeIjXjaNOFF9xA1RhXhE/ePL/urDZPveh4V5J9FyOxg=;
	b=aKdV/cdBsjmcL50eXEiRKT9JCkzmf/QmGgQIL+diqC69Uch6melMTKXTtgxET7226zux
	 iVExPFkJyIGNVEqHNVvA0OXeFa4cK4/GH5qAZ0Ee8qKsahSRPVoLsi/BBmf/TtVCQUx29
	 ulcRIiDBf99PMban3chtU3nQRkA8KrEgHoPzMitQ5ycyZSLQvyTB7+TiEUUgckr5pZm1F
	 s/UqPJcEoK6jC5lquNDJ8p9yylCXihtoyrE8x7057QudSI5NQS8T1efTEMOfa+w7c5QMM
	 /p3khe2/S/TV0JaysMuFYhvcvTGym++F8B66zQQ+KY3u+JtMJS4FuK8XtDH11yNjLHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FBB51F00929;
	Wed, 18 Nov 2026 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987759;
	bh=HeIjXjaNOFF9xA1RhXhE/ePL/urDZPveh4V5J9FyOxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dhjv5Yrc/36l/AV8YCdfTRvsBfS82oz7tBo5/4Frz3ziBYRFAGCz2CO6aGX/opEUQ
	 yT39pGeJcO4ASV9wgSEF1QTKgc+KMw8dnX8cu17TsFrxSLuwJUtKsKzozP4gsw1YUu
	 YLZ1n0YnJAjtSoaoNaaRQaQCaMqcgqgOCZ/Ge/QbuxfRcmrKLe9d6tw1xB/qI0yUFS
	 OvUdZxbOnSwBRSQtkUBOB3EQO9mYSXqx1irl+S6PlDm70IBPoNDIrzlLYQT6nBvb7D
	 orV0IaJ34dpYMb7pDQJe4DprXhS6lPAAZdOfE7TOZB6e+Le1FL+e88ySkY5W3+XCqD
	 1umx1jXpQfAXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1EB74AC8A;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:31 +0800
Subject: [PATCH v15 14/14] gpio: pl061: use string_choices helpers for IRQ
 trigger logging
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
Message-Id: <20261118-cv75-gpio-v15-14-e3c563673fe1@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=1532;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=a7Zv7sWhRswQKnzwxIZzyUGJlVmYrAux3J9xHm6ovBY=;
 b=6qiYfngffnWoupTneWyngvaVnY/7ggJ2hXJcNyxhfBWOH/NWcTe0C750Eff/tHBbvFR6t36QB
 O7wFizjARRID8eydCX9qWuO+U7IWckIIEZkuYx4DUkGbZ7J1+W4PleW
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Use str_high_low() and str_rising_falling() for the level and edge
debug lines.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 332fa51f8ccf..47a804cea2de 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -27,6 +27,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -197,8 +198,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_level_irq);
 		dev_dbg(parent, "line %d: IRQ on %s level\n",
-			offset,
-			polarity ? "HIGH" : "LOW");
+			offset, str_high_low(polarity));
 	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
 		/* Disable level detection */
 		gpiois &= ~bit;
@@ -221,8 +221,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(parent, "line %d: IRQ on %s edge\n",
-			offset,
-			rising ? "RISING" : "FALLING");
+			offset, str_rising_falling(rising));
 	} else {
 		/* No trigger: disable everything */
 		gpiois &= ~bit;

-- 
2.34.1


