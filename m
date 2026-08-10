Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA9E277CAD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 05:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339933; cv=none; b=X7tk+auxGJe8y2jTwOSQz04/ntdaqmU3OF3kZEZdL8039hJIZb32eLPa84vjuCFD7s6osXqfAWbWzXo+ulTPdW9DQPCBPIEcjmsQ6ihjIBUdz1er18iqAdnixvd88XhyIXlLM0kX1qezsOhMZIZ3fYrWrjRTy3Q7pf6uZ6NRtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339933; c=relaxed/simple;
	bh=IWV0ksknqDB9JMucjhQ5JR9r0kLIE3ZJMh2JYdCeROU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCxE4/P155h47zBW7P6K7jJSTwMvNJKJQfasMDUQcr19SW+TI288GudEe2VUG7DCKQoAyLAy9pl66nIB4XHgYeM4FdbIMaF41RvPWBxD1Jr7THEuSMWPPk8tZ2OBkPrx05WgmgBBnLYf+Ww2tSSxoo0rY9Zv2Oud6PNucYlEySQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/Qv8Hlz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/Qv8Hlz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso881909b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 22:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339932; x=1786944732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBdiIrYChp+orSW8T5PetaX1/aYuZKLZbUVGp074V6E=;
        b=I/Qv8HlzQv9ag+S6oECKQVXeoEU/FDJx467TjPjWLARzFILNcV/aVPhL9IQhbSXJ1U
         zlBaA1em/6uMXwBaDHV6o2AR0gwOgmtgTg8ROLsFep5fIX2nlV3P7wEN5NfevoUs3fyn
         hCbAN1CTOSInYN1BUAnIspmFA0wtd83tGSjv2FdFF9Zf3BZMFFYnOvWkolKNMqg19ub5
         l3CgasHfpuc4TW9V3Uj9bVdh3CCwjxlZBJsW5CwJPv0/gp5ey7HMMOR0iFgnHMSgff9h
         QpwBeEEY7f3qTfPlfoyLXPSzaQXYEIffxS2aYCFdkanj2TbwB/FWcCUzp61h/40qC3t9
         6DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339932; x=1786944732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBdiIrYChp+orSW8T5PetaX1/aYuZKLZbUVGp074V6E=;
        b=EqA/jC39iMdWikjLVwuIzUEHVJa/6A2CGBEFbz08a+3PcAKQZfd4PuEXa1+LyH+YRb
         bp1CrvwJE/v1Md4Ch8EUsiYJAl6uicpS7wED8ahEXSE8GB22p6x5DL4wKvFKu33AhaVP
         IHn73jSkbRdEkrZwI0Wa43QRxiw8IaIxOXZpn7W/NrL1o+u8ka47izEY0gjgoSLBLzGH
         t86MJD3ijQaxgXzBMIL+9jJ/j4YHeypx4N6JW89wTODvfnwaSyXDE+7kqFR+FB2QUEjC
         /7mfNzAWP11Iv5YUi2HuXgK8ACRXHJHoLchn8pxI0KZbdjmcXWXul9DWWsU/7lHCGKSs
         2V8w==
X-Forwarded-Encrypted: i=1; AHgh+RqtbAOzSWQXS5BP58BhzFtn8rzWNaH6AlTdswypdECMxx6usCgay0YMAJL/mkFm8Lgb50dQ79qHsek/@vger.kernel.org
X-Gm-Message-State: AOJu0YxLru+LpX4QFhct5wgdN7ekPIuU3Hxl56pDVIS9IUYB4zSZ0Ct6
	17wm97p+TEhPl8mkqKkQlbgk7gSD367NAsSXavoZWY+jDXp87qTcSg22
X-Gm-Gg: AR+sD12GddMre/qumVXubdSXAF3kvt0iXmgEFVDGA6W1iwqWl5rIiekmB7Z6noSU1uA
	GcgfT8m6scopeb4GBLP4IrgCeD/0MwyVN1X9nPKvlI1s983TgsDWYyNPEe3+CQL/XgE99lOtj+q
	O5hkrPg1JnTab26YpcZwmFpWmAVO12e6n8zjFrbt4CCy920MiT8JH3W/XYjhbBYaoYY7qc5e1Ki
	rm77/O8Cbiu7VQwvxkloFnKFL9tkH2Y4HIW/K7enQQ6gcsRz+TdP5d0t33OSvDS3I/FKuhFVHd7
	BqPiv/wlygGUYlxenYE6i6wEOMUlxqx7MUCxC1j2RPgZhG3uJRvsf/sMEHhYGvv1yBfwhYj8qgM
	pzTAw6lE6x/zb0pe6t6hZnvL0YDbMPSeXPj6tuoyg14qvQBPZ6ZY//Tim3h8ulyfYvF9NiBlUAl
	VLBK/5XL93oAgP3A7KTlvFAm+UT5Y5sslkm/COP3FLYXiJFnKcAm6WPWrn+sQsrldu5TK94bqzZ
	8VzJVPeTknDkAZT1jtchDgu7Z93QmdvhLz/ncfhYCLE5kwkVyYdnujMkVIV7/czPNOj07f4lCd9
	NtQg
X-Received: by 2002:a05:6a00:8d1:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-84f4fd9f82amr27371562b3a.5.1786339932030;
        Sun, 09 Aug 2026 22:32:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:11 -0700 (PDT)
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
Subject: [PATCH 3/5] pinctrl: lynxpoint: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:40 +0700
Message-ID: <20260810053142.27938-3-phucduc.bui@gmail.com>
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
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 299ee4f22bdc..29df00c86250 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -777,6 +777,8 @@ static int lp_gpio_probe(struct platform_device *pdev)
 
 	/* set up interrupts  */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-- 
2.43.0

