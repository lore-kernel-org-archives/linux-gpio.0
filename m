Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9373E5EEB
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 13:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086542; cv=none; b=COdc8nqRzn41LN9vrApIyr+TZzrI2fYT2OyFnI83tq6gt49n83xb4P9RRAAwv+2E5yi7RASIowbiT8GTSiLfKI1hMIonekmu1n9vmCw1c5LEvCkgJO0ULDwNqHkbiV/78DtCeQoOBkD3Trt2NXQ2ATdHppNPUr/wZLXV9/ortxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086542; c=relaxed/simple;
	bh=8nfEgkSEDOOx7LCl18zFqRBJrxILJG4GC6C+e98aV0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ENT/c1Y6JOOnM2r42iQ2AdWqvQmq6AbDIHwAEGm/IRGMaeaABOSg8NB40q0w/f8czGCuendlOdFk5cKOi7xe+goHIHsN48CFDWo5ptVe29848m97foBtATu4NJU7BXRvaMUk7kbnOZZywjFuA4Vbw5wEIboqicPoTD06cNGAqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJXagwe4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJXagwe4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caed617615so2106035ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086540; x=1783691340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOYAmzy2QJ6938uaT+sAj/jru3XG3w5p/LQAZKOhZqU=;
        b=FJXagwe4lSvnVfTYnw4I1OFcOTNvovfnUeOYWeUiHRZqwONIbKTf1BaNlb/0PilGYv
         B/Ki+MYeN1LagiZYj4rDISbpcLQfkuHDC0QeVFVjC2oZXcUVIzTGzx9/BpCllp3A2f7i
         b4vdqlR5DYqxtookx42EcKKdvsDbwuR8jeznEOteEuGcSqdflP2S4vsVYgy92MrSPyz/
         HpWeojSuDhsA8YVtTswVZrvPZvAK7+5k7aOe6vhR1S9rbH8kDB6fue0MeDsNslxsBvol
         q42lPcGsYjgFxF0ccrLxSZldy4c/PPkro22cnsMuP60pbDza7pOxltL3XRMTwAplLgky
         fuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086540; x=1783691340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOYAmzy2QJ6938uaT+sAj/jru3XG3w5p/LQAZKOhZqU=;
        b=Vd8uNKWigwSWlZvyXutlYzfoh0VoCD0NGEjm8Xwl0jIETOCjs2xsbpU2MSbU9ElMRw
         Ed/ASGA+SCGxXwf9mAk9oXGFaFEu9hQp4W8jlF3FkGErt/TScnIucs+u7nIF9fQCN7Qm
         lxMmK12MUO8P7YcXmaca/Q8dzmnqjn2Vc+WZiqTZZSJB3YNf3XjQG3R2vG5PugQ7Vb4Z
         9CUXKNUgJhfJmReNJA6ZIBVp1xtjHpVLQnRyOlPyQ8FffEwLlPSRMF8wTy26n9JKzzL5
         AK3aHukqzgzU4ogQX3ujOs6u3oysNSLkcsiTaDKWj8pmGZWyU73BxSkYrBVrNym5NjjQ
         JM7A==
X-Gm-Message-State: AOJu0Yxpz8EHZggR4piDhMD7a8hfYjrZEbPCJLNRrArhUhDjJouK2qLK
	zMYR69daezFrcaneEQnUPp3U0btb5TqLIH33E/9v3SeQsh3KeorGRl1B
X-Gm-Gg: AfdE7cmtTQ4fgYlDuQ2O+tQdxr1N3Vwcr0w3L6mj5YLuSmjeHo2bsJsdEBrVmLXLuY/
	LXLL8h2oxZWY0brmPqONr7JtyC52Ci533iRDnYtp6AuGmvTY7D9bWO3ghn2dLsUk249r75YIe8s
	qnRRAdODkRDIK7swPYmQlIU2HvuR+UwSY9nIMcIRPh759BuzrSMtj/nov6koDKr1ShEpvxO80OC
	38WPbxd46C7tRpUZQEKhvROUWFbaLcOBq/7uV9cFKdU6maS4DYqcYIshxsYSf+GICOp2nt7HUp3
	V+m+gFoxK1vX6IiTKHDij+JzWkHGSarnAzVm2CTiRbPcB58bMCu7F4CzvHRf8Aax50J8KsvWG8Y
	ZF2XrXbKxGJ7t1UIspX+9/hJ6GqEg6JXy2uTbcl9KML1P1zeulq/D++c4hh3iwGbYUlkD4VUQgu
	iLiuI9/NT2gVeU/FBc9YAgILJu
X-Received: by 2002:a17:902:d490:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2ca7e92a25emr102079865ad.42.1783086540037;
        Fri, 03 Jul 2026 06:49:00 -0700 (PDT)
Received: from localhost ([112.65.12.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765950sm10095955ad.44.2026.07.03.06.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:48:58 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: hoan@os.amperecomputing.com,
	linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH] gpio: dwapb: Add robust error handling in interrupt handler
Date: Fri,  3 Jul 2026 21:48:33 +0800
Message-ID: <20260703134833.21110-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current interrupt handler silently continues if an interrupt
handling fails, which may lead to interrupt storms. Add proper
error handling to gracefully recover from failed interrupt
handling.

When generic_handle_irq() fails, the following recovery actions are
taken:
  - Write EOI to clear the pending interrupt
  - Mask the interrupt to prevent immediate re-triggering
  - Disable the interrupt to stop further interrupts on this line

These measures prevent the system from being overwhelmed by repeated
unhandled interrupts while logging a rate-limited warning for
debugging purposes.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7b92b233fafe..dec700e3cfb0 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -209,8 +209,20 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
 		int gpio_irq = irq_find_mapping(gen_gc->gc.irq.domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
-
-		generic_handle_irq(gpio_irq);
+		int ret;
+		u32 val_intmask, val_inten;
+
+		ret = generic_handle_irq(gpio_irq);
+		if (ret) {
+			dev_warn_ratelimited(gpio->dev, "Failed to handle irq %d\n", gpio_irq);
+			/* Clear the interrupt */
+			dwapb_write(gpio, GPIO_PORTA_EOI, BIT(hwirq));
+			val_intmask = dwapb_read(gpio, GPIO_INTMASK);
+			dwapb_write(gpio, GPIO_INTMASK, val_intmask | BIT(hwirq));
+			val_inten = dwapb_read(gpio, GPIO_INTEN);
+			dwapb_write(gpio, GPIO_INTEN, val_inten & ~BIT(hwirq));
+			continue;
+		}
 
 		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
 			dwapb_toggle_trigger(gpio, hwirq);
-- 
2.50.1 (Apple Git-155)

