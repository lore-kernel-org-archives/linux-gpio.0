Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285168;
	b=UIpK4H28IExejNHue6BKe0dS/r9QryUejblc4yo1JMsZ0jEeXZ819D8Z8JiZda8oeGwX
	 wDIwYalD3lnetIisoG3WGfD5q6uk26Z4L8/mGdiTU1UyBKnU/7VRcGH3axjp47pxiJRB6
	 BqNKswJ5WGnvWvnAoeOPFqbT38Z7S+J++qCgZCVSaaavJf+uWkWY4UKjHtxvGrPnz+/QH
	 ZnZu7kQzqS2AGWisFzHnJdpggEK+u6aYdoicetIsEL8c5LY7ngPyNmdTv4mJU4uwRUadN
	 XNPDGLwx7hF7AsqpGlfIgpr7YPHf74u+J+48kf2OKq1qYvEY84rsnEGnCZx+2JFNLRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285168;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JgYNP/CnGsB7Wp+9CpnVyebG2MLsMoDD2UhXdaa+Qew=;
	b=jzTNnjRM9RICheL5+CofQsCGCv7759AmFm+/j/flnmvdn1XJ3NwoumtIK+i3i6dZrOvb
	 kJ99bUACmbnVGYOFN4Pxj65ptooyYCLMsj1MCZfK0B4hNNvziZ5iY1X4Dod8attivI6Jz
	 qr+PzBUyKCWGNkLvAOHzxKpO1DFhhxLSjWDRGkgHdMcdeBMtem4flxOafJWaB61mskWTc
	 jV1nW2WlrpQRAabhRPW+oedCXuRtK6QtjjR+kMYs30Uqw+sAfOVNN7IAaioR/UGhfSDvd
	 aOdSA9LD/GSudPKeQjYEDtUPGZINhC+qFmngRFnZ4DwDbkqugorAcNM+Bpy5k8EF0cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgYVsoEC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F95606A32A;
	Tue, 10 Nov 2026 04:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgYVsoEC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285168;
	b=wHfboPWR+hDeMYlsnYG9DH9X3a16utG8XpMP27A9hoiRk9xR67czJzSVBlt2+9AVdyif
	 gdNM1AhjdPAd/54r9930VCwI7Adw7ew2BFWEA+XNNCLQlkLz0auHwThMnVZij4lbg9Bxj
	 fTtNvBe+bPwUu+RP6+kHKYIV48+/leNfYKU0+mlM4EdFu1uhhKCWLtEahRS0sK9Ns19Cv
	 PINPCsEFmjJquoXZCLXbNXCj8m+skiHqdcwz6RaIXPRt6yyIRYi5pXbzSFNAa7rexaLJF
	 qplV8Kw0yoc4DEti5O+lV4KWtg6U6ZWaPDEABU+doqzfy5Kbe9P1iuYS6tztjRpJVXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285168;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JgYNP/CnGsB7Wp+9CpnVyebG2MLsMoDD2UhXdaa+Qew=;
	b=LBcocIsBeer9+jloEWaMYSrQl7FER4R8HVFvekX5jmNC63tHTwJe8D6XuNzoYf/3+v9Q
	 gZyuyCAmUtx9pLSH1yBjeQ9hnsITc9eekIQ6vvUEN8+P9+zyYyChaOwUraWHJmO5IxFss
	 INFZDLg3K0/B4nvTWXfoYtFmjtLkh58DYm/26oaYXaFtKL7nlZgqA64cs+Svc/+b0WxLC
	 rJNjPNKS0YCmpR0+8cm5OdMK+EKUV4kytZd85PO81i4sxwy2tVjFJLhnpwXwy4pSM5pLs
	 vyEqgzsJQ5jSAmskqBSyMEd6FgMZ928TWAFsPin5uq1YL2nvr8Wucnqbmo5cyjgqzlg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4E251F008BF;
	Tue, 10 Nov 2026 04:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285168;
	bh=JgYNP/CnGsB7Wp+9CpnVyebG2MLsMoDD2UhXdaa+Qew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NgYVsoECamgzGHpOYGTeWViArglHZspwil7C41vb1eMLQ7GxWUvEDDuFm8No9YEiy
	 r8ih4cEz+/ugwYe/WOS85huB1tvih41PQx0ACaHD0cMom0dJJ3a5sANL+Qa/2Ukg6b
	 lC/EH1eNiSptOeRYIGH6CCE6r+hkYiA7v9uXZigQCIKNpxSVO18AIw7SK8i1C4NR+D
	 iO9FN7DLcHJJ5ZVzhU/In16NVYWMHGSu7T/03JCpNBwscF9oS8XsoNGaH7U/k+ZXTD
	 W3fffZEWOjVPups10IXH05lhs4Q6LKyGrR1nezTofiHa7DXVnz91sZpESpKWH0qtgS
	 yQhueIKQF8boA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17D504886D;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:33 +0800
Subject: [PATCH v14 08/14] gpio: pl061: keep the parent device in a local
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
Message-Id: <20261110-cv75-gpio-v14-8-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=3327;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=U7nepCgkgjETq5eVgsmzh5zmWKMmPTFdo3YH5lWwtPQ=;
 b=Hcb7eyqbLjEgVWScLntr8tmV4hUvl+V1v3XdlWUerIaAMb+lQUoR3kG1jUV0OFuweyob55lnT
 i59bJAWAypkDK/ENB7X7y1Fr9DhdaqYb8AzPjAiIbKT4254XW0JIFnP
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


