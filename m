Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389831;
	b=Ve/aZGb//au6YMywgleuJLYLcfSOjKdAfgfk5Oz4xi/ptrC9DKa8ie5OaOVERHJV19HB
	 NPZdFDsMzX9vtjOOI9eWiTq3sWT80bOI5s4tc5Ldl244UOhMjrw+ZhsE6kTvUNZ6tFQqv
	 CY+P+gOg97KXHfI2rYXnGFJTyJk2FiMpuWLvmjwSxUkn82/jasshAYgKGBhFUmHyAIT+K
	 lGGU+bwFcIHr83S0sdtsTtN+t8qgbXe+zi7lDfi3IRrUQ3yecCBd6fc+8gB6lGc38MPKJ
	 Bkef1ORRsH2wRDxhew4wYAaWIGSGckNCeXHO8uMKg1kjYT/9zLI06tClG4+NwNSsw3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6snMzTb+JvWCKUInfh9pIostURAAoVzKiUmt0eO+WnI=;
	b=rbFULroCWBrZtoF6dAfdOjDQpsfOpOllXd+AKnZxQJd5tvrbAR+NPejGxX/sNWdEkf5p
	 MWiUOd6w9vGxSpk4ikTSf4bMM2dODKiod7TJ30JoRHOJENClVW3IJylYqNzhn9GF/i8iE
	 rS9OP3UL0Iu4pxhvKOyO/qMlnuEaeFwc7bPykgiovK4Rm9zSWzAAFAphU+nGnGRs8Xyqi
	 7Mvxaw3tZnFTjR1kTD4eTNtCDUtA1xTyikJVIDh7nGBFhw0S0Ae3HpWwk4IeXFG9H4KO1
	 dXFCEn5kobAg1J2aYy8enaCP7Taj5d6CTOCVtlvZBKvkts7w+2JcLUAlT0hBc+4zT5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOoEOD4G;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFF6606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 19:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFF6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOoEOD4G
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso644084137.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389830; x=1793994630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6snMzTb+JvWCKUInfh9pIostURAAoVzKiUmt0eO+WnI=;
        b=hOoEOD4GrD1rj+/jlK6vAJLtx725KtQwcw9r+UgKd+FL3cuoo47HpArBVTUWw7qe74
         f6T10mO1UB1TecbX9S0EDjoGA9rzyprG6/CARGgK2NejFu9Yrm6RKrVCV4nuZcjAtK+q
         lET2fd4OQlYBpfaidjPz/DO7f8YxOfhEg4VCAKQmsiOLaCP5ByruTh8t4G6L+2Jn8f6Y
         iGI7ugOroZHo6Wn+MiZ1EX6eL9vMIhLXs2mdhSl3AXN4BRX+75Cd7Owy025cI80uHkKb
         jzv6DXEVgLHzIVAO7NjJInmdwNNsdRjvhfvXBfR6mzzT0/ssHXpLSAJYH38JOlHOAw2/
         PMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389830; x=1793994630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6snMzTb+JvWCKUInfh9pIostURAAoVzKiUmt0eO+WnI=;
        b=d/dSpJbEVhARwQsugl5PsAwoJ9XgWdNYh/4zPWDe3baU26UL5HJOsqc8WOpxBdjIfn
         FStH4AWDtAGuIwp0QvLzPR5rm2ueDxWyupo/dCKmAbWopHD3EgcEaBLcPURc/d7BXRR+
         Y8kfyrBDWwkaKEgtP37w2KAuQ89zSBbgYTCBsj6oOxMy5xHe/deYj2jKnXgtBC6pFYtI
         0AOcUW6cAJsZ2qM6vY7oFX9D4CWtSwAz3trULpSzFEhFYkxqc63jdIoFg/x6qm1WYBRQ
         KvE8VMETUmHMiaBGkA07W3N1n05vUqwPDCvrCSTi4H+VEwoW9smU4w3N50UI6J8kKjOI
         TSQQ==
X-Gm-Message-State: AFq9FYJ89fd7jNZeI2sMxY3dm0aaZBuMx4nRdpFthhu4/EXERZtznkgA
	kmW8KFnXK+BuOks+dSQG07gcEjxQRPrFkoQ8A2oItVT3KBSMfTtjAuks
X-Gm-Gg: AYBFou0GXr//v4lKhEwTRsHuj+1u3O+ra6NRYbdEFecQaoV3qmb6G4OGPArBX5sy6v0
	oDsrfAcgfAnMncIaKrFRnzS0uSoSvAjh3I7DHMDGuNFuwpGKuKFnbp5wJIyW92RgBJDKx2OeRUG
	H24JiaYwYUnOYEZbiwbUnjMuu1BmNLJ0HUfrjuaaIQkEI4P1jWQ0Ozdsm1ErE2qyme9y+C0WH34
	fyhODD7rmiz9PeCdHya5LRzqqfipUXbHczucd6OKPC2cGx72hQZvVp7xUItBDa11B0p51QcWG0J
	6hnibOi7bYaXG3v0hCLv/txHG9B57+4bcOba4cPJ3WG+/O3Qt7R79eb2ywmaLyPSagcJxx8IhY0
	d7RvQAH2Vc9TIkNHjJx6x+4cQ1SXAbYmkkUa/7bipiiHNvSGE2fJgFDxX2F902ZYSt2vfWyMOPR
	VgQJimYKO7+2y7PqFveKkO+UxTybkopzUf5uWZ5UZVkpMYK01lPa/tSruLye4r1bn/KNN6+60NR
	E23d680HrEGrWnJcpegeWf46ZvAG1670W5OWq82vogIdD5FeAOzImilgWNKPiOWvFKXYMsVXyBS
	vkaeME5G9q8FVqNcHmit3yMURDz4ZTMfzlsVGwI=
X-Received: by 2002:a05:6102:8086:b0:7cc:32ce:4c5e with SMTP id ada2fe7eead31-7d0726b4e19mr1974710137.16.1793389830084;
        Fri, 30 Oct 2026 12:50:30 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf34c0sm3449419e0c.8.2026.10.30.12.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:50:29 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Munique Feitoza <muniquefeitoz4@gmail.com>
Subject: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and skip unhandled EOI
Date: Fri, 30 Oct 2026 16:50:25 -0300
Message-ID: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
X-Mailer: git-send-email 2.56.0
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
INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
main and RGPIO banks.

Additionally, if no GPIO interrupt was handled (ret == false), return
early before acquiring gpio_dev->lock and writing EOI_MASK to
WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
contention when the IRQ line is shared or asserted by an unhandled
spurious interrupt storm.

Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9fa752f55..428440949 100644
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
@@ -735,7 +737,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 	}
 
 	/* did not cause wake on resume context for shared IRQ */
-	if (irq < 0)
+	if (irq < 0 || !ret)
 		return false;
 
 	/* Signal EOI to the GPIO unit */
-- 
2.56.0

