Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC01C34AB00
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783237687; cv=none; b=bZrKb3ldSfKECGPx8r8Jx8gQhwjYY8xogoPAnHusy6oLZiTtMmedysJ9KFmcS5QT+iIcA8e2zZoPJtRfd2av2qNuNWVZknwUDiS+Y2r+5J1ucJaFHGOhD6QdxASum5GR3UwLnnlTIhrkNQ1SqGuVi5mjFAqFyEg9H0YQ84LtAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783237687; c=relaxed/simple;
	bh=Dbilg9/n2unXm7B+wlncUdwupZtYPq3wzAaKZ1VRYoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFlMHgVRQnHTvZ3iT3vwo0ylSyADz0yYfP4B6HuYUhbiMYCWvUfizftY8ZkC8owOmuv6T/ld7QwQM+eHHdmZ+9GbXEL2usXxjuhUOFrdGttCUa+JDpoN+nKVoEpD55CP2jhcM7T+vHz3ztIhzHTIAwYBiLdSFC6eNv2LQaavSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUyxLTsF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUyxLTsF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc8bc9d222so1533165ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783237685; x=1783842485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7rYvqmtxh7QVbsMGEyyEdKfUiA/iq7LRZnhoQl1CVw=;
        b=MUyxLTsFPC5js0suuJXRHaatqV3Y2YNTQTlNXiCc+unIP7DqQeIT4xPs2NS2E856Ih
         S/29s2FM8/XyPZruYAmhKICUpkG1Aiv2UDXMYyH/W7PszjWYnBgP14+AoVQNMnMtsbnX
         +ZX7GbCsqSGGL/WZTtYqHGcU1DsuDNgdtdPq5Jl4LyeFgJ60L4qfHku7aYMC0x5Sm4JP
         hOL3HkmQBMBZfcugfbwCOk/b/ngP90RTs3+RkElVrOoi7SHEzB7gM0FAcdlV722valOY
         il5SqR+hT3yPaq65qgsBKwB/5+hTWNo+nOGUxbhDzhKXWemnm33fqMwO1h9x7R1ydR0A
         yihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783237685; x=1783842485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7rYvqmtxh7QVbsMGEyyEdKfUiA/iq7LRZnhoQl1CVw=;
        b=N3IJ49yWRAe3R7JzLsLmivzxfxjrRW4c3Ib3rZMvAlMJEGJ7pKFEBihK+IArFdqaxO
         JXgl5kEqOdOS1xPf1LXcCdWKQcVv+JwisiRsmTCBU/qHt5AREAXyzLB8LLWuPYrzC3Ek
         WKOByjIvV0RktR8tn0MiZVluuAwjfF5QjgQT3+fVkh7ZmBSVg8GcyIbXsuEIPTLS01kl
         61G8eQXWnTOPjvVhlXLELjQXOGMuhkOvNCtid9tFQFx1mFNSur01urpj5YYPG4ygcA2W
         wpwzfrhPC53jsZGob7iwTwIk0LMZvftTO+zn+Ocj2DXQKLRDbnXO062bI9WW+OSofWZd
         lWOg==
X-Forwarded-Encrypted: i=1; AHgh+RqDkRqw459Vtl0XmlTjorNhFZ7WbHxg+LlbfIEIOGcVLMTxAaoEZDUCDikGyg5xx27k5RoGYW3VIcNK@vger.kernel.org
X-Gm-Message-State: AOJu0YxG94KDSJslmuOPj497auB7DFOqIDnIv8Pj8yXBkgAh4tPwVwA4
	3YDiUf3V4cJAw9RwYTCOBQm1QONRTED38BKkUrziu9vCbUNxMAB0BZFk
X-Gm-Gg: AfdE7cn0bxzLR2buHygvyEKJrY0tXxBgvaVHf5kvtWkrNLi3tvmM3I6Fo2tIQvnq0Z2
	0O0FEqMrgnr2iJBVSmJzdutbsWBG9W31chlwijZM/wERrIj+r9sw4FG9/I+ihhCC8ZJ0eLxYYjR
	FtqT7UqA41h2/ezTRIKCf5YAjn9LpvrWpGse2U2DUux1q2v/+g/v6a1qeOLjvn4xre1oN6ARoIr
	79n2hXuNS2Po/oP/0jf0HiHbg5l8DY7f7o8laef6Y8m2nFFlLxTO2yMO/yVgsG6RE5qsYMoeDh1
	ZoCwkHecpQZRlKApj0r6Oa+BXG7VNNKCZbx2oBlh6NGZ7b+0ybfxDtJ0PHFRs4c6jl+NNLPb0VS
	MtFLkUgvit03j59g3sXtwgH7JOMMSGaAjyBRq6VyaMxP0ldqik/vT0t7l14GAqwNwS932J2WtGM
	j4vVIZCK19/GfJ7TdENeLYJOpK
X-Received: by 2002:a17:903:ac6:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2cb97d1228dmr51504625ad.0.1783237684522;
        Sun, 05 Jul 2026 00:48:04 -0700 (PDT)
Received: from localhost ([112.65.12.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7893a8dsm30766295ad.73.2026.07.05.00.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:48:04 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: tglx@kernel.org
Cc: brgl@kernel.org,
	haohlliang@gmail.com,
	hoan@os.amperecomputing.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] gpio: dwapb: Mask interrupts at hardware initialization
Date: Sun,  5 Jul 2026 15:47:59 +0800
Message-ID: <20260705074759.47863-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <875x2vlpjx.ffs@fw13>
References: <875x2vlpjx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO interrupts may retain stale state across warm reboots when
peripherals remain powered. If a GPIO line is not explicitly
configured for interrupts, this can result in interrupt storms
due to missing handlers.

Fix this by ensuring all interrupts are masked and disabled at
hardware initialization time via the init_hw() callback. Pending
interrupts are also cleared to start from a known-safe state.

Interrupts will be unmasked only when explicitly configured by
userspace or kernel drivers.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v3 -> v4:
- Instead of handling errors in the interrupt handler, properly
  initialize hardware interrupt state at probe time via init_hw()
- This addresses the root cause identified by tglx rather than
  papering over the symptom

v2 -> v3:
- Remove duplicate comment

v1 -> v2:
- Add spinlock protection for register access in error path
- Protect against race with irq_chip callbacks accessing shared registers
---
 drivers/gpio/gpio-dwapb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7b92b233fafe..3189a0269efc 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -199,6 +199,22 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 	dwapb_write(gpio, GPIO_INT_POLARITY, pol);
 }
 
+static int dwapb_irq_init_hw(struct gpio_chip *gc)
+{
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+
+	/*
+	 * GPIO interrupts may retain stale state across warm reboots when
+	 * peripherals stay powered. Force a known-safe state before the GPIO
+	 * irqchip and irq domain are set up.
+	 */
+	dwapb_write(gpio, GPIO_INTEN, 0);
+	dwapb_write(gpio, GPIO_INTMASK, 0xffffffff);
+	dwapb_write(gpio, GPIO_PORTA_EOI, 0xffffffff);
+
+	return 0;
+}
+
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
 	struct gpio_generic_chip *gen_gc = &gpio->ports[0].chip;
@@ -457,6 +473,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	girq = &gc->irq;
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
+	girq->init_hw = dwapb_irq_init_hw;
 
 	port->pirq = pirq;
 
-- 
2.50.1 (Apple Git-155)

