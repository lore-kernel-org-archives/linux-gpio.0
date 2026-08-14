Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993D3515D6
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681854; cv=none; b=YrDIgKItW7EWMfeWSHHjILKx0q+u5cX+dUbEWWxsKMhVAhupSeAXBaNz8E41ik4zcawYs9jNU+gnaD844ecnkV+5Ruvbg7gguLo3T/gcDH5imcqKJhzdc+VuyuaR8Zoh9WxRqsTE7fHWNQvZUrG/nl+D13LZlGmXwVCk14RM5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681854; c=relaxed/simple;
	bh=3H0DiH+1w2yjZwPv+cTMWtHXjSul8vZp7UBKHSL04kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNFz2XvqLqm8nOxzLIVPO7cMn10NnZWHFwWWW6K/RQM9F6yitnxi8YicIseX+rORlRrlj5opXhwzGbM4hu+00dtZbrpIAV2WNVNJ64LvUenniaZu8VkQUFyfoLIM0oKA4bKNsCT9KmIN8yg67fJ5hs3E2bFxmGXX4Dn9t7ppsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL+6AZDy; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL+6AZDy"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so676726a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 21:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786681853; x=1787286653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeW91IoLeNjppEOgb48XlhzM6kDzLBHPCSIRbD7w4Vg=;
        b=fL+6AZDyksLo9GxhMUUGRH1cpZjgmX6ntNVpB4XzMCmRD97MdQ/KWqrwMB7kemFDDL
         MJ8Xi5PYPutKlMSAeEDxjBURRuSia6I0E5gIwESsSd6ZXqvzuf+3i4MabVl+Nznstfxq
         YrHyAX+khvE0jfO0qLuKSsAJSZf/X110++hZOof0NhdArvsHS339/IXNIOUE5jdGJcps
         NqI87dTw+TUzz3xM73Q7BfgwEkUIX13P9GyQb745E/fFyhBaqzIfW+VILGjqoXQqBK4k
         bP/HNzcInpo1i/2/4Za+fgXhxnACpqxJQceEWZYu1vyAGPcAQ7cqcFPqhMUvogzdyx8j
         jwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786681853; x=1787286653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeW91IoLeNjppEOgb48XlhzM6kDzLBHPCSIRbD7w4Vg=;
        b=tUAFanUcZ/jZY2xlB9sN41SpK9Suip2Qa/8IeclWRS5DA7MyepQXW55G0C/ov6UAve
         hhaVq+Y8p5bB0sTuX0V42mqqu/CwSCijDu3vCdLAy0SMcg8ecTC0/2MqaPIUwzEwKgb0
         5ZsDzPgb4EtEM3gOo7FywCntBso5im0C1251bdvFBbdbO5Zntk1/7+wTNUZo4pWGgP5j
         ume0MGfJHElKGc+iuCihz7v/dKw4bslnFuxt2EkhlWS15HvIshH2HebwQcrn4MbDG84z
         cm13Nd1SwOcPJJM1MQDfi6spmPKQH3EM+i3dbTdfv/rG/3vzTmGleFI7ZPt3FTn0QfXk
         obwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2EpForPUpv2N29Q2a7ZwZw6hYLKw2tRhp+FpN4+BckMICFjhl8URFonhXy+Cws2Z7SWgLlEmuY04Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzptq2wiErPXFuBiCWxYfGCe+Cl/jN2fu6d6ce9Tb4qS7oF5Y2N
	qRHB/Lwsjffy1siJpCOAdizsLI1nFtQXMornhvWO2hA2hY4zm6OKsEp9
X-Gm-Gg: AR+sD13j77SQgrDko88gWAvmBXqCkpbjXEtNVc+H/cKXzGVhXskBD9WotlB32vg2fvQ
	dj7pJuyugr+VRn17OBzfO5bsa+SI8EJMK9wDQXEiRaGBdmVgaoE+Xf+M17x/fTiP77Mw0xtamMo
	IStQ1SIGdiQqpTPPqyJyLQtzjUlgmLjw8tTPx/C9FBW3Rj8FUzb404Oed1YpEOUqGbQz5jNXfik
	df1u1Ot71x11+jB0P2CTluDEy3QAFs+BVwYpJcAsFPCzcLcU3z7hvVviHK1cWtGYcCvJV6EleGU
	jPxN9VuTPIkrz7ZjFGfMbcCJsRCb89ZIYrWthMfalP17GbPscKbPzYtZ32LVcOlF8ik9Nkq1cRk
	4ycxSyyPZrhcMnIifnxp15m8YAP8/bv4IU74cOEkqZ7kSgr/CFcMhcqQwCZhoyOKy4fC58PrCPe
	r5B8FqaJQt3ey3OB5HMBLQbkZ2GZGYmKYOje9zYJmoKvHQOrDhVLm8Ognm3CHlTSIBxsNSyFK3Z
	NfYtMm2qvMDBBqwWnj5MeE1zQC9GC+vxXuOZRS7R5eWLVhLBSr7U3Fovigq9RAAHcEyMrR0sijM
	IDW5QFSvFQTWxI4=
X-Received: by 2002:a05:6a20:6f8a:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3cc71e5512bmr3757703637.31.1786681852738;
        Thu, 13 Aug 2026 21:30:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef6a5aaf4sm1823555a12.13.2026.08.13.21.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 21:30:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] gpio: mlxbf3: Handle errors from optional IRQ lookup
Date: Fri, 14 Aug 2026 11:30:26 +0700
Message-ID: <20260814043028.12548-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814043028.12548-1-phucduc.bui@gmail.com>
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
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
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpio-mlxbf3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 566326644a2c..929f64c5140a 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -231,7 +231,9 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gc->add_pin_ranges = mlxbf3_gpio_add_pin_ranges;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq > 0) {
 		girq = &gs->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
 		girq->default_type = IRQ_TYPE_NONE;
-- 
2.43.0

