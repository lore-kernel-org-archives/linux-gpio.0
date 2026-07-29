Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73AA4432E3;
	Wed, 29 Jul 2026 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319042; cv=none; b=AaCFKK54dP6e54CtYzyQyAF2vgRMEEf+ixShCSZMkq+AFP4R6vdhFmhrPpyir3kotuV0jfevlTgm6TV0zx86LW0aQ37lYY4tdSDcBBtBC4nAG9w905XZlHwadBbVKxTaJHw7SSldyRXX7OEHIO2v7YyOQST4h5NAi9duF5eKCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319042; c=relaxed/simple;
	bh=2xxfhtweuFRgyASHDi1y+3GCLGKO3sXEa1JdDURDEqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fB5daenFPCWlWwznC3Vx4reXAs59kKNZmbLMTa5v5QhalzaFJC6EYeTls1slXPaWjIzFopbKfIM/i3DsdUa74dfQXVIrk5pKfhEBPgpXvbnfhUb7uDPsuUPb8hMGTLc1LeD+5d2yrCZr6UI6zBfN/BI4M065T4w2F+v8EozY9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/+i7juE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/+i7juE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC9C1F000E9;
	Wed, 29 Jul 2026 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319040;
	bh=HanI/DWtQpNgLfV8hByH/e7wrqTodTjtljygv7QRK7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P/+i7juESYpRQLRufFWbqDLy8QWOSFmrYw3JIy+sKoo322P2huyXUafB9WbcKl1Dq
	 9DMWQ8K82tO0+EyXf9rNEOIPVTRcZ3n32C3VoVBdWOoLfZaExTf2LGXXRUi8kShQoj
	 72Z1hI7Q6Y8VIjIvbgufYgTt4fDXs6qdUdWkrElx9DOiJx2jReXP14CcPsS4//3PMe
	 zn5xk5zseoWpHhlyJqEWf4QANClKLtIH1weDhF5KusJo2zTMzz+AuqK/rO3c1qRwgP
	 M3iApD2LCpI07YVwKSBm+hGjz7F0rqt0PHMzfb3wSPKJx2w6h13fD4ZZ5GIFxzm7g3
	 TXvDpKHnwJ+hA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] powerpc: implement get_direction() in cpm2
Date: Wed, 29 Jul 2026 11:56:48 +0200
Message-ID: <c6eb70aa0e1ba6e15f947c827006aa79edace05c.1785318836.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2565e33e629d16d9e33086570834146bb1c962db.1785318831.git.chleroy@kernel.org>
References: <2565e33e629d16d9e33086570834146bb1c962db.1785318831.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=chleroy@kernel.org; h=from:subject:message-id; bh=2xxfhtweuFRgyASHDi1y+3GCLGKO3sXEa1JdDURDEqM=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlnity+b1Eb9l3kZZTR4567XXaLvXK9twfz2v20U7e0 emW2xNlO0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEbNsY/ruH3NH1vBLF7vba 1d/djDnsqe/T4jC+62cZ/YIUz6+Z+Yrhf2HaVc9jfz6ETroiorBbj0Gqb708v/Ht20xHNOtPMxz M5wAA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit

The lack of get_direction() callback in this driver causes GPIOLIB to
emit a warning. Implement it.

Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/sysdev/cpm_common.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 07ea605ab0e6..b5d200e3ad68 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -181,6 +181,18 @@ static int cpm2_gpio32_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	return 0;
 }
 
+static int cpm2_gpio32_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
+	struct cpm2_ioports __iomem *iop = cpm2_gc->regs;
+	u32 pin_mask = 1 << (31 - gpio);
+
+	if (in_be32(&iop->dir) & pin_mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
 int cpm2_gpiochip_add32(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
@@ -199,6 +211,7 @@ int cpm2_gpiochip_add32(struct device *dev)
 	gc->ngpio = 32;
 	gc->direction_input = cpm2_gpio32_dir_in;
 	gc->direction_output = cpm2_gpio32_dir_out;
+	gc->get_direction = cpm2_gpio32_get_direction;
 	gc->get = cpm2_gpio32_get;
 	gc->set = cpm2_gpio32_set;
 	gc->parent = dev;
-- 
2.54.0

