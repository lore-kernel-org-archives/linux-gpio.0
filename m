Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AE28506F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339938; cv=none; b=H4TvhRmufOXuCOcCLxUeGfHANXvS3mfb3cOMz1kbwWRloIglGmwyDAZ3N1K49PZnyAYwdSlTB/V2xOa32UqPa2GxM5rWuBQkSTg+hHdtygwQImeAcKZBh3650JZds1s4t8U49EQIE+KcBQpdTyPyGAsX21SnYFTIxXVQ7V+hgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339938; c=relaxed/simple;
	bh=s77a61BbsknAakN258S6NSFapTQvojXVtuhgWrPYnII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOmp2LsVxqdt7fA6o0ghN6F39T78Vo4E5iCmcyCv2Xyg/t0IOblTV8GnaXWFDr2/zVztcKxYLOQ5uXWEAEnv3JGz77IRLib3IRtu6EfKHMQ7RgMLXhnJG9NQQNdwCCNJXBWzaYzh47jNaAhylmkSltd+Wyq4m6gGDmVU1weSciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+2LdqgL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+2LdqgL"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a2c90e383so2874704b3a.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339936; x=1786944736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nbcA9WfihtzxcJZe+GIGSV+aV8ohwK7+rsbkazv3zo=;
        b=P+2LdqgLgdOio66vwAtN/FWmNdnSY2PQWW1jfTvgr5tlMYSYUFbufCan9C6L+T5++9
         R+ZZU+cAajpKZ7dQ/0ZHdSgZAXopnVtyn8oK1lOGlocGgw1ZoLfcbqnzL97wzhYxPF2d
         Rjhi2Q1rlA80TFFA2Nj31j+q1SHOdmbezpOcG/EfYGDrDCmaNbKf1uCqm7r6wRIlvfnW
         jCzmsrEhn0TH+SsK10mI8kpXsekB88HvOrdL6Tao6AuzZWE8mHjcu9zn0G8nzWh9V0lL
         Dpg8iUUoKXVa1HvSe7InRe65o3lOEaVhyb+dZ44gOn3tsFpCJnI1+bF2lztg8C1rv6cj
         ca3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339936; x=1786944736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nbcA9WfihtzxcJZe+GIGSV+aV8ohwK7+rsbkazv3zo=;
        b=Di2ty54ir8ATm3m1E0KdSYlKd3v8Y7P5TAvxaEpFd2k8/CairtsjqtsGd2gI003JD1
         OGs/9gfXXkUicemsxJUZogUnHL1EGloUVDQNDeFOhB2bZj2jiSHza8zdoh5nd4gW0Ohu
         oAdpC/cSTXgk5KPVg4f9YQSG4sDV8t0lgEfhH/31rd005a9CvvyaFhFewWyEyhfhwCAO
         As8CLJdFKcDVKtQfvsEE6OheXFd19gZaXOFcuUpaSGECoHWEgGln1i01RDWZhgOFLazD
         vLzwNTk0txilnTqvfKn+5dF4d9QxIkGL8bk/siSnxQbIbJsx15syixl7+Oor0enMK0yq
         hxyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBWeNiG3U7vCDwomhn+zPBYA8YsF7CnutgyOMfnIdhEzOibTPxtdZOjubw+f1edcpiZ9kKNn1CpbwH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6XDDaGHyjUXhBIaopL9c2aGh2wt8wOdRxUdgNEM2QKKhAeyI
	d1U6f7hn1an90C0Hcpi4/jOROf+YfoHaeQVpTtQc/6Yyh6GQ/lMri9xE
X-Gm-Gg: AR+sD13saemgSbdjH4YdoLDsUwAQbgiDO+ixW4lWkOcOxfnP/BpFYgwIqdzBxf55q/F
	EE+ysyoEQS5jRRjAIK5tq3eCSgraj2i00PjWvvgLuBUhTkgxW8RKSerhQW9S9I5qVDlvpItDrtg
	R7B+fH2QvHZQJMZau/jlrzc5XJqWRXFsV9XXQcodULNZPqG98ls+4aD50jjbOeqeZDGF6HTmXf+
	XeDAdnG2wJW4FC9fTfPFKj5Wkcx0NqWkZ1r/W+mmBig5Sule9g9OCeJW7vjKYotTEdsXOX2gSYs
	oghgBx/SaB+x+OQe2/ZsObuDxqBJwo02hrPUzzzp7IWxTdOyv3vR2AuLp3yQrDntkfk1wP1KKRT
	wVCA9nWDw1huTKNBrSAIuChc56M041OWrdt7e68NyBbgK2H8IW27VtBgDObUJ24bKoNJGslLiAo
	eDG1I327ihKSI5dF6vdt3Rr61c0yh/ibvjIDIseOjPJdu6nGix9KozaQHBWVk0aYxjNTw2iVCAn
	MLMcXfDJK+GaTVJsu/zRnvBmsvXG3n4zyDyQ2cisX3wBVEM4wWvio69iGRh0BXr+Fpd5l0uuGGs
	deKq
X-Received: by 2002:a05:6a00:3d0a:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84f6b78b1bamr13366983b3a.12.1786339936184;
        Sun, 09 Aug 2026 22:32:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:15 -0700 (PDT)
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
Subject: [PATCH 4/5] pinctrl: baytrail: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:41 +0700
Message-ID: <20260810053142.27938-4-phucduc.bui@gmail.com>
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
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b733ec31ad9d..bcc77bf6e811 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1533,6 +1533,8 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 
 	/* set up interrupts  */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-- 
2.43.0

