Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285167;
	b=P5TcUdnhFRypWFSP4ak3xgpMs1+NOjoIVD1FizkD2hBH4z8TKGWqUkRheEfGoVSJRWWT
	 SmXCSqwwHG2qF3hvJdq58HkGM3e3jH0poXDGMkZzxeU43DrdiZgI0e06pkvezXeGxRePT
	 KlSk4HwaKdpNMvcup/upSk+vseLihwvlwvdfkNEuPm7zpe70O3Pus81QXfVC1ft8Qon8U
	 H7a+cq953A6Un0TasijKZ04par2GdmDRSQW+Vr+DoUmEp5Kh9hykaT/O0L2SZz94s26jM
	 KqDsIzKMlXLaH5zvCoM1wWR8W4mUGSX4M/gPMv3Z6xS73D7a0Xodu91biFMIO95c26g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285167;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=nuW2BrIjMp3zoEzaT/qHfUx7S3UTSiNxuWdgYvKXSTv/QZMcci8Qa5E24Nb5Jbld27/q
	 latbsaw/Er28StwlRXfwjiT57wp9Nqn7r4DaYcOcX9R49uQh9tvojmwRladOxHDitwG/t
	 J95fgOBLLKOP1IFepY+Lyhm5cKFsAVNqpykNGLt6ajc/m6/HUjTAWY74nYDtLRSWHdOks
	 4l2DRhK/hWINkj8V3jfr7XpPRFafjxtG+KqOHGBVk8pTh8e+sxrHY3wTlZMKHwru5ibQQ
	 qhlyFxEQR0kFVxr483+g5KGp9n0kf1L+5gbZb1wccTxYGUS8KBvZvFytE65+iDSfKcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgnXt6gl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C8606A336;
	Tue, 10 Nov 2026 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgnXt6gl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285166;
	b=Z378CStSMwTIZc/P5aYbQsazLh9BRp4b+nLORvtNB/A+2BIX0s+6BYX8uk2SL1Qidab2
	 0xfCocerkydMUpNC2MzAHq/MuE5idmC0mnnebMVI5jC/7ziGV2bAKO6obkWVvhKwAPF25
	 WvQs56fmnVrX3BzKauAKlDZxPdyivI80lBWJFGyfJxAdszrfV2ahBECEdckTqterV2W4/
	 F1xSCnlwBg8HGS1RnvfK+zbJnbScggbkf9DQv/VzL8N7U2UipcEuebisrnDGrNIIW4M+m
	 cvAl3GliVdwTJPSDNhiNcviI24rXHbcoo10+0VQgPqbC3GnTwVU73Ku1bhfc8QJuGUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285166;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=DpAQ+Aa8Ac2U1Dvy/Cu2/IPlfaMlIbH7V3zuSnwSwyhbMtsJEst68eCWAJLbBKdNBy1u
	 HzQrQrAqYO5xpSS49mjKqW7LLVRTkX0HYdQ0xuaTY4whwxWIEdY8jfQaax+apNoX4CEGN
	 sTDs6AwhC9vdIaomIY2vzjjrGaK8HRGNpYLpE3a0CdEgf5Tlv32CaEdAcI9mYADaHr2xl
	 nVMfWUkOaYRFDrzZUwCG1p0Qz+rhuF9Fq7pWhjT60VFp2OHBwEN/A2ubWVs8I6eninOpB
	 dCTmVZAitdErkK5Q0UnzaGjy5h1Q56XvuSNmpP/z9lk0n7W8Yf65Z9rHbha0ziBanig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 488501F008A5;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285166;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AgnXt6glt27Z8uemQPwxjODeGgM6+uRQnOo7BTbOwVh5qo9w7e2/Z8mzGRCJa9Y+n
	 rsZL7FcSbxGvr/zI5P7x4cRhYMQMz0vaUuilvrBqZgu7OE3vjbNw+y5rJss0KyAWpj
	 0fLt3vniLxOqYPOa3q3YC6X5/a8pShSJzS8IbpB3j0e5PZkWtJspLPBW2QryrKBwke
	 WQHDNSBjJR3FQY3iP8HwMK+hWng3bE7IhAOoXufBldttcPaKtwJlZjQt4rkM6+f4/f
	 aoxdpXlS3wNjwxDO07exVK6VHXufY68lHH0l5N8KuCO39LH4aEd7fh/Vqae+LPabH8
	 kE9LK5rGz4apg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C625A4885D;
	Tue, 10 Nov 2026 04:32:44 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:29 +0800
Subject: [PATCH v14 04/14] gpio: pl061: drop redundant pending check in the
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
Message-Id: <20261110-cv75-gpio-v14-4-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=1082;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3XWHZond2pOFeGIXcPtw+mHYxFL9WC432M4BN6DutlY=;
 b=eaFAUfP4vaZ2PfPolFZj7JveFBZiYQbjbetYBLL31HHus+sapJGy1TnNFjczsi6KFP6LhcWur
 nx1PwEx8QkfDNXTHLgspWLoR5MbEPqjQpCNuKMzF91XKErG3wgQoh0g
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


