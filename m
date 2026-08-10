Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC754286A4
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339929; cv=none; b=mVJUsDy20ht2AfRmZXnm0LU+xc0RSCf9WXLR6oq5fTU/uEAFg0UmP4f72ee+A7qRyUFVm84FHEesXYUkOBEBBtEEz4hxk4QlV0MKGcfIFK/9RAxjjx/2pCYImMDshTbZUJQJbS20zzpS75U5oUX2uH75qLgZJNGegexILeLKF/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339929; c=relaxed/simple;
	bh=cYNDaL/C+EAkq8Hq2RbVzEoT0INE6EYN3aK2pcX1vYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDYiI8A8d4f8yQwINaUfzLx7yhvD2mdCtXbFLrmF9+HF5dDE3JyhD/NXWujliBmPERt0OdQW8lKvh3V9IljnKRy5pk3NiiF1jnv/51DGAOJgpdygPbVTlMBjGWOMlq8dnArBavB5nrU/qQV3o0FvEx3w1zdc6B84FYeEwchusjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxjkP67N; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxjkP67N"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso881874b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339928; x=1786944728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j0GcJH+Tj+QIWl1wxKim6ikbz1e2bMUtiA5t3w5TnM=;
        b=GxjkP67Nc3v7ARGR9AEBjtTwkqC/vVbG2qBCQACvsegWoBTYX30N3fbb21tnQVrsyN
         W+Yumv8pfc616RqFggVM6eZXwyW1GTpI8dLRHKHdOS7nC19XTkgOcbTEIcWvQNohJ9wL
         XjQ9nZyxfteawwH4okCEISvvIhteDg5EP6Ho3coLuVORd8v7mIg+Vl/EoZ+KNTldSpYt
         3GLinJBEIaB/rbI6r8jU91xJ0+U4paYDfkaRkfK3/f5k9nPd5uqjTKzsHtw0PtHG0hm7
         sok2Wec+J3qKpnsXk0L3jOMUO5YRT8mGicxQIMQxOdD2290bWcz2m0H/QYkTYK8BpbgR
         7K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339928; x=1786944728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7j0GcJH+Tj+QIWl1wxKim6ikbz1e2bMUtiA5t3w5TnM=;
        b=n1fHwCjm/utOqFEq0GecuujdNK7IuVO99zOg7JOwteC36HS0kwjf/J39MGkrK2OEbC
         JIUyHqF9zZsAwS26nk1HuddLJFogi+w6hFZ13HWfoXqluKUlsbdvJOloOgTEXyEsW8ip
         k0JK/TtdohES93aqoH66yxAzcRMjfIOVObgHn1pr7VUd9zoDgUASX3GXHpB6q0okABUA
         acX2+n1yXCft4cAly5/3F02HzLNiGQVqbNyslvsq+jv1ACxiA8Sv3molxMLb5K6Aw8JJ
         DtUKE0He1ZcuTERX96jOQKS9hfiJDgozvyuBIoTaMgRbhWgKwBHGjxa3SudXb3UxOeF6
         WVvg==
X-Forwarded-Encrypted: i=1; AHgh+RoOOt98h96IClOIgnw8JtySAdHjs6zhfkK2A5UzibjcNw1gIbcafQQr5mgmXOEBpxsvn/VH+7jD7+EV@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCwJbYfn4Rs7Mh6o7S1XmtePzW/HpVXbmxU0viYplMxqeO7K7
	OlrBqKths8xxJJiYpTQtStDSXqrNct/ww7ZZq+gFFdM/bU50QIvEwPvr
X-Gm-Gg: AR+sD13qI6STFf2dmIUHUCr6YvYu9K22SYgESeNjDWJqZ5IKRy/RxZRfefFmNz9Ecu3
	zLoT4ba5m+dMs69s/+WmNfok/Dy6qPLavOXYcewe22as4TG2YeTBr0y7wnnm7jZWOK3VFyHyevc
	vY0FCyqUkoYSX9IpOJLYkBX9wfJ3SJwV26P7PA7jsCUnO/vKKl+Z0hB7HdRtNDKdaopm4OFA29e
	95ITjZIpcJ76l7myF5jPANDIGyXNtEHGEmOLhCrWqK7ptS2/FqUulGXLwxUKcA9EJJsW62s2iRo
	7lt58wb4JNjPEujThH3r/XU8BXgQutOArdj8LI7ncY1SSiOrfAmxMmyubWOn5JfZfI96EEYv9xC
	MZDwZbGCXPqJQH2qBKCwsJGTJRg8/1U7TuEq+eJnD9SvghFMWs5IHYqizJ+tR7hMfWIsL3u+TVL
	8pnZl3TagTZpgow+v6EI9te+eX3XNartCFOO3OVVwgIscZVd8ZVhJnRbJFnP0hxCN3JXlpG/sdJ
	DZvAjMji9c2cCeFlkOFWOBsUSzlamA3zH2Hwctlxkh6Swlv0kAerDXPZYmvzifpGC7oBS6iUzTZ
	UKmC
X-Received: by 2002:a05:6a00:997:b0:847:926a:7ae3 with SMTP id d2e1a72fcca58-84f4fe9f25cmr28746085b3a.20.1786339927978;
        Sun, 09 Aug 2026 22:32:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	robh@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:39 +0700
Message-ID: <20260810053142.27938-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pinctrl/pinctrl-keembay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 3241d3ae6219..0b65b186e3c1 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1497,8 +1497,10 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 		int irq;
 
 		irq = platform_get_irq_optional(pdev, i);
-		if (irq <= 0)
+		if (irq == -ENXIO)
 			continue;
+		if (irq < 0)
+			return irq;
 
 		girq->parents[i]	= irq;
 		kmb_irq->line	= girq->parents[i];
-- 
2.43.0

