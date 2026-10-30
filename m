Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390915;
	b=d+yzgPPFUBujc/SfYW+Pau8u8oIpqdDprEdSP/4vJV3NDncDkO6NnGtkehuRmRR7JYh5
	 BzZXJTBktE+MusA02ShD1PLI5rOSYA43G4eZ0SWSvQewxJhjgqj56YvApSS/8RfP/fS+t
	 zE93YpjwsEhbPn+DFSgOkJZiZrLn/6NwTHBQSM7DKXtpNz7IBj4aS7D3NkQleynuxw0Qw
	 EEP4YxQSsvjaiZhou7CjG/SFF4y6R+MeOdod5LeWGfwA7wfwf9IFcFSA3x/m7ZWzd3vwn
	 0TjSlyhx6cnBBpuEcB1UM6TAAowqciMoPx0Zs33DXRaPg/uAQAicXJJW67BYjrXrO0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GY1dOc+sIQV6eOH7fOm7uU7Ssi1Yk8CqdFR46ek8fNI=;
	b=pK94b+dl/0vgyEpvS0lZ5l89S/95JXfCaMTiDOFh9zobH7scBRRcJuzWuUxd6nVatQm1
	 d+CMaMbS2of0q/OM4xIz36feyxhE9uNXLVIHeUQKX3ArfIIA6l57tjRjANQS1tJErpf2G
	 fjXMIRPPgfS7j/BiK9xp1CISunqSAQagrA8RYduTVwOMZU6KuUo4G24hcLLeXappgqDWY
	 WUbrxnJGw3Pa/gF20KW7TAUFgSht+csr5oYh1ObEVi4e2e7OevTIp6wKMyniHMSUQhHhS
	 xZr7VXF7gUp4IwksVXfnYuOwohcm5WOpYRzSeA/7VFng7l1tIvclG1kkTRqMIGnfpxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7SAVhHO;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDC606A321
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 20:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BDC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7SAVhHO
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74ab99038afso741890137.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390913; x=1793995713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY1dOc+sIQV6eOH7fOm7uU7Ssi1Yk8CqdFR46ek8fNI=;
        b=D7SAVhHOi28Ioy3WF/EWn85cFtZrYbbr5DiJaoFuqe4GREHCscRY03cfrX1LIW/UER
         hR/6ySqB4OHXZV+Y1ORmuJHCmryZT4vL/3sRP91M4L9dxIfLShSH3pza0AamkpLW6+3f
         s6aQx9VSGBxsnWSpzLC/8cz9gBHZ/udO70BPefyeUy45U7m47rmAKP0IomK5pw/gH5H/
         8Jz2dDCER58szfVsyX+76O6b1yPbA5LBMVHltqeV24/U/zmtSS74xbdDFgvk02Rd5oS2
         bMmSTQTSvkBjMDeYUst94gM94vCLJ2NsOWUZ5dYR4P/0FadZPhdkgKrRcwNVtPhhDCgV
         T9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390913; x=1793995713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GY1dOc+sIQV6eOH7fOm7uU7Ssi1Yk8CqdFR46ek8fNI=;
        b=aW5Mx7x4bjPbATOe3GbTBj8F6MT+1bCx216maTlItxtWSFNFhUXBWFPdkmXurMkmtE
         G8tBB7r+BKaecudbSYw3XyJ0JsDWN7RBj3X+X4tBIkvfvH9mzPU6GosQ7gDYD35AdRTq
         A/a5ZiotYGf6vqfP9DmD9PXjQ8ItzlJu7Dz8XKJC6uI24S0vvn3MIGcEACnQmHA5Lx1J
         z9ubX7XVx+jdqOeshX0rQN7L9IYTha1ZH/INz2X1v2rnnUpHZ2euXDqHkO/L0gNMbsOe
         wgN49Fo5zTq750zbSJAszYO/xkeg7gM+zAi1jgeoWiLz1ubXQCML5LctY9E3rnduG45r
         f8pw==
X-Gm-Message-State: AFq9FYIHGGjaaxcloGs8p9REhly2SF0zL8F0Xsm4IZIFSzGEMi+INce6
	8kb7Ez6Z93Zoq4wgG3lPt9dXP9/E2Or8xjw6MTyZc9hw96PRy77uwqhI
X-Gm-Gg: AYBFou2PvQ+PviKJn2fWAIjIPFlzFIT3Cb1yrQChvtbDSeFlcE39hI+XZTm47TaVgqs
	o1Y9j/HlPe4JihOpw3RLurtcp9bVSakyZfZSIOMU/nG4W586XhfgiROWM+s6DqPF9Bd2opRUcGl
	J2pJoqVirCczJcK4jt64AqIIPkapWn64SZVenQvdZ9+nutz203J6XNeE/oIadJV4i0wBTVt4k69
	Vc18d6R8lbWj9hP9QHG3emxabM9fwbIMoaspQ0P4bec79iR1gx/BNehAnv0QvEDMCnyyCD9AJ9w
	mlzY4SBHJwuejICmCu3p0aFuIJNt3KSnkUTrBIesl6zQjQl7fFu0vbMGwQ+/ViMhe+Ob+H0Af9q
	Nbxpk+q0R17wMo9WD7URtt9UMoZlJUUE6vm0a9wRXB/rT0vrDRX+gMv5zHeVY+Hvu/C6LwpGANX
	2WcNMfJCGXYfKuWCVVrCKZgjI4yPxrECDM2M3MjOkpJZlehgPoheR4l5R3qKvmka9kmf1KQcI10
	O7Ijn1O9PTDTMJ0+Czge0cj8Dz3tGo8nWl7jlN7GsyH877OOJloNO+fdvocEh3rNcVu3r6sLy0K
	8WN/jX9Kl1RH+0o8adBzoNAX7AxLF/ABAOahzT8=
X-Received: by 2002:a05:6102:8086:b0:7cc:32ce:4c5e with SMTP id ada2fe7eead31-7d0726b4e19mr2004616137.16.1793390913530;
        Fri, 30 Oct 2026 13:08:33 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07768d366sm3315699137.10.2026.10.30.13.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:08:33 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Munique Feitoza <muniquefeitoz4@gmail.com>
Subject: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious GPIO IRQ
Date: Fri, 30 Oct 2026 17:08:27 -0300
Message-ID: <20261030200827.24648-1-muniquefeitoz4@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
keep asserting in WAKE_INT_STATUS_REG0/1.

Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
a spurious GPIO IRQ on both the main and RGPIO banks.

Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
Changes in v2:
- Drop the early return on !ret before writing EOI_MASK to
  WAKE_INT_MASTER_REG so that spurious GPIO interrupts disabled in the
  !gpiochip_line_is_irq() path still receive an EOI signal on the
  controller.

 drivers/pinctrl/pinctrl-amd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9fa752f55..92a08f240 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -671,7 +671,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
-				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				regval &= ~(BIT(INTERRUPT_MASK_OFF) |
+					    BIT(INTERRUPT_ENABLE_OFF));
 				dev_dbg(&gpio_dev->pdev->dev,
 					"Disabling spurious GPIO IRQ %d\n",
 					irqnr + i);
@@ -722,7 +723,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(amd_gpio_pin_reg(gpio_dev, pin));
 			if (!gpiochip_line_is_irq(gc, pin)) {
-				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				regval &= ~(BIT(INTERRUPT_MASK_OFF) |
+					    BIT(INTERRUPT_ENABLE_OFF));
 				dev_dbg(&gpio_dev->pdev->dev,
 					"Disabling spurious GPIO IRQ %d\n",
 					pin);
-- 
2.56.0

