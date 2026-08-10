Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C7E1A275
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339923; cv=none; b=GRiMcd9zHTxRT08VJVK1kZkgyqGpKM04m6J3YixI3r4uQqiZhLMQzjvudXXNLU8X0FByDldcNeqOZF8atgHYuCndEfou8AEiD3igWo3Hu8BGc5I73rEOkOGlaAsSfhOAGIkadt79n/4bY7nxI1+nq3DTsouQj+J2Su/WYTD6xRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339923; c=relaxed/simple;
	bh=RcbuHFP0ADuG/oWI4S+o0KsCUQpwaqj9BF4tTJMHIsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOFTPo0QnCvqoQQh9k2frPfpoUSfaJ70MpfAGx7EYTH515EfSnrPSG7e+Pp1+P+06OPk6jqvDTbg34l1THF1JWUDPOvWpxazbaF+NlqaLdGXZjvX2jv2z9YUK+eCtDmoY9vMrbTk4/8m/tRTPrMDKhFYu6+xUcwQgaR7HUIEm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhX0q13S; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhX0q13S"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1333940b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339922; x=1786944722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Kli8pbDASdp0VjuYAnhnppe070gvFnPXsKo7o33PTM=;
        b=DhX0q13Sdd22i9JiqKcHSKprw5QZ6rhkjnkE4d1mZ5CMfz0GT+sm2bO8Ed/UenPKMg
         qboNeD7BuLu9LgEnkCnR9FZROET93g3ESY+uYm1GyiWHHAy5D2jOh2ofN6vPqbrjccfa
         k2FHT/m9fKUtSf8brHdSPuq+W8NlAPcbVwsKfcdbAnon4nHAc9bnHeLeLTf1yWoyj6fi
         PT/2v3KknXJSYN/eFsZcceXhy/j67PKkrraivwfrf422+m/qCKeBN5WZPmMsPNEaqrVG
         ec3P7bzASazTEbceJ7Ocif1u7w6pKwe0yhNASihOSiJclKkhrrRGNQApVFIL1xj11rfr
         2Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339922; x=1786944722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Kli8pbDASdp0VjuYAnhnppe070gvFnPXsKo7o33PTM=;
        b=PfAwW29DfeH+kRNu+aDknFzWqfDP+eK7UZFrJtIJxR/qfDDix648hRW9wj+uLQFi6B
         zjvglB3c4uTuYrLdu34BxTH/isT0ul1/FaNCOsR9toi6+yDgCC8plN5Jn7yrDTJPxUas
         S1j2DxuGquv0oM0VlGYr+ETKfTmwx1iyhmFdfZgRsw5QW0BjtdmFEG4hDmmAIXtbqHhS
         CPRhJU8anfo9hjKBzKQqIL+K0a6LM+Asq0/Emdtf+6k1pJCyxRg5wgS2AD+e1NPITXT1
         7KN6l66pOoP4bUXSUFlX1x8HfuJYWmbz/uby0lN9+bSWuKU/FRu7XtegaNNxIxXNp3cl
         q1yw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+c9eOBM2+68NSAma+ZyWPjm0cXMa0R+5ijCPYmR3iT+FxdWuHTcIiFQZ24GaDz9Fq1j5hO3mmOBlX@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBc+/9GhEN2DMcm8uueet+KhSo0Eo+mpCeP4a/6PU6NngBrmH
	L6jwwjBfGnOiIdLP6zOSjMFPXLOzgqR+r61Es8GIj8yWXO8b33ADgTdZ
X-Gm-Gg: AR+sD12cAyNmT3hF/DAooeaetHbbaaGzQPSE0VglKJ6TWQYyQ0voLtI+bZdObajkz5q
	GyJ9PnkkiCVlJcnDDGczaPbBkSFlxtt/d0n5dn+z/GnsEuopZr2OCdgurNYQTUevKOZOC6qsHPD
	U3M7WYBcd+QQhiYxI5xP/orAPinrtS57tD7DrEKdrCtjzwBaoEiKgWVuNPsnKT+9LNrGK7fAQ4q
	QrXbqLjbkezj4TV3QAQBbQGn7hkv0o61bEwInUnAwthhdC87CJ3HiJbmyRuoD4jXIjSMi/qXiKP
	FTV1wbKse60SVvEoDNHiUMnndLSku64x6zV7T74nhoN9NnJHLr2mMpWFjLvxZAzP0QC6STVseuh
	00XyytueT8MghhUjyqc59V6Jr94hWco3CaVFTwGtw53bgKvXToHkdgwi685S0VILoewozuN7TLG
	mx38+4LE7sxFuq8/scNrv7dfmmCAEmhAf5lLkFOc8VeRmZ52iDMYX7r8xgCqjFQK7IG1L0Hio01
	z/RHSQjtP5HabKSWGe3iK3hn3tfWsFGK7dGelBGqKtPhGzdOwB6YL3ZjvuUxthLrJsmI6cMLCZX
	LI5D
X-Received: by 2002:a05:6a00:2d0c:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-84f2dfc8ed4mr42587816b3a.4.1786339922023;
        Sun, 09 Aug 2026 22:32:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:01 -0700 (PDT)
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
Subject: [PATCH 1/5] pinctrl: ocelot: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:38 +0700
Message-ID: <20260810053142.27938-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/pinctrl/pinctrl-ocelot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0fe0527863b8..02824da6bcdf 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2369,6 +2369,8 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->label = "ocelot-gpio";
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		girq = &gc->irq;
 		gpio_irq_chip_set_chip(girq, &ocelot_irqchip);
-- 
2.43.0

