Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074768;
	b=37DR2YfN16esFArVKFfzv8lKmEaD2zZ+4Ar5kr062VFDs1bD7wOLYMqbjFKoNInDu54S
	 kOZxEwKta7q+EUXFFaQZ9aaRrjkMWp0x5oZMS3FTg2XT6B65U0TH/BnGT7r5v/TRazx6K
	 kjm67djnHsxv9m1ZC7XeZGutascEUT5hn0IocUiVsWLAqKJliuWi1TyAT/qfEziRghXcU
	 0g1gesoiqSDTREeOW0xqRVp2B7C9yapCGoguMdW49IQWf5tqusFTcw36kw8rhHM1O1yKH
	 TEk+FskUJWbxQlfSciWNOjW7cYVbTanRjv4Rl/wwC0xS6627/IBTP0wXt8KqxQSdb8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074768;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=B9gJCaCYfa8myQyYoofVuv8KUvsFmEj2PDbB2Yd/RVb7Tq0kTHfVuMFfvKzTJrtk86X5
	 kiBcqiYWfBgDu8qmg5sPCwrXmXrXK5bJEw6RlBGJg2QB3XSIHZdzn3OAXKjDnRBpGCYkk
	 xevlaN1wH5OIjg+LQgKxwtizXLiyrUxa78h9Udne1fxdoSZcpxpmpFN++oQjudwkdKOc8
	 5T5hL+a3wI25aq/dRT2NA48Iudg/nLg9Efqxot7ZXypDAlElY+35XK4L91vf2mpFu9S3r
	 ViARyNzMMQ/anYKE65SySISU8wi+gzDn7m+rGmONuK6w6cG7r4Mgz2rHyr7k0xom7zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nf9isnN6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79354606A31A;
	Tue, 27 Oct 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nf9isnN6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074767;
	b=Y7pUHWxXStEN3STatnnJEdIFFYCeniugGyfTGQuTkS3QmNgKpCvG/aoY0q1ygO+fQUoj
	 kGkVYh3B/i3l4giYTkEFxPfOETVYIQeCn6Hfnv4GXjyKux9rPgHD3wIBOoZFBj7TVvobm
	 M/aofaSjlX8y0shI+7r/w5DsVtVsy2exRhqT/bZiAWo04tEwSJSyA2QaEVzaH/0+mbzQZ
	 SrmDsJDScEDzh5Fqtmgh8DMHXqMMyTLfJXlH6LpeS7ytdr1dZz1MiMLDSkWEgvDGcxh8R
	 00hXTwOAmJ/NV29g/7RMjzP0wvQoPwvqxYUxKKjhWz8RpQdVPsgBn+tfKR3+9Cd7QaA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074767;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	b=g4issnMQv6PVEtEtHI3OifqJ4nQrAkmdkIjqCraI/eszPJLz1mQMHHrf5dIXMHFvy2QS
	 QztjtlshdTTQt0soBp6UiCzXU7uJy0cSO8Fvh7KV6z8VIzMEf0n93plEC3z0oDKOCPcgM
	 WSnjhKU+6FR8klRljCnHC15vRAmqImRSYCi1pslFeZsuL0PqVNrTnjrmKuVemtkglLj+g
	 1pXxWGG/JpF28tw63i6td34GMx8Ez3PabO4vjSBNrwouDmRm5gbQnNayau1aKPlLy0FUN
	 DVGR+lgJ8nCh+ESWgYYL7iBTdyAfR+AN0xfFSwq108JYOcND6GvbXt0L0gvYmoVlEag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 414631F01829;
	Tue, 27 Oct 2026 04:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074767;
	bh=LAR7UG07ENN+2lb2kJivg6c45tgcctR261e0OwsJsJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Nf9isnN6hEB+FEMvIyFRFG9WhlQc5dFZtZB2fQzsTewUumYwadQlaNBZsJQSspits
	 +tf3AKXj6LN21jaZv+/MksKxPtWxfne1PbHUmsWazpgIKIbC1YkSa8vRFw+8Id3YU9
	 StYsXsjuEOs7uPIhE5uI3mN26l0tu8gWv3+mopwfr5V69IASgxFV8A4iVnqvpFx0XY
	 pJqlmN/CFphsuKlkrLEGcnTGIzv/bWjlztzZUtEylzP9/Oz2qLDb6Y0HKDzXK9fHmc
	 ud2i8/cFMuJDabi+uT95QOZ0+EvEBHku0jzvHORmb3Z25diRrVLxSoVnAxj9c3hn5C
	 JSNiIOtH6P+QA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B84DA44F88;
	Tue, 27 Oct 2026 04:19:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:50 +0800
Subject: [PATCH v12 03/11] gpio: pl061: drop redundant pending check in the
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
Message-Id: <20261027-cv75-gpio-v12-3-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=1082;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3XWHZond2pOFeGIXcPtw+mHYxFL9WC432M4BN6DutlY=;
 b=rr6SN8wRUCbu9h/x6K2OTUkONIUV9G2yEgUzAnSNdUkcwAx8mO68n99DKbxvYdqz2LDUgA64T
 WjErd0vPSADBFs7sTsTYTXUUsEAd7hWi9QnRXD2CuUWfs77sd00xCJs
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


