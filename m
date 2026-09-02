Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B519A288
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331945; cv=none; b=MCmho6j/biJwkWoQMxePbfK/AGbWrxFh7DFUSJ53A0WTNvt74opU/ceWm+O41NmxVTDvyKzlslvdco0ShThgDN6R0N0MG6abN3gS9iYcnwyTXPKRXztdtHNsFsLuIJ2wpPhQmLLe6WW5ePn2R2RQvVCVTcT/TiDRR4J8YMIM+Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331945; c=relaxed/simple;
	bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIn3HQmD2y079xD2Wz1P6hgljPoh/lO7HbvNcXaTfHUfFxVRn87ENRdI6dtWdsjoYtZgblHK6QG42Fb4xMGcqlGWHtmuKtQqiWGi3XJc9LTcvLjHR9LFH2tvtX6pj4qj02xgjs5rDYeEFhbUQLqNuSLzeZsOZvFAvWpddkxWeDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV1AcgQ3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV1AcgQ3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso4736575e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331922; x=1788936722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=cV1AcgQ3KKgFFxP6oEB99W4bpfGZ/11jPEQuwK/SIwFutunZDAdR1MXod/yd7tePSE
         /4aTArgSQaXaD27GpTEB27KPke2NUJLY8KvAX16BdnTR5n00kXTGU6+w0NkqyADIR8gd
         bwtGyit/8jHoI5jjycoX7Wilh8Jr6+hZ9iJEWe5rd+L+QKbodCynA61LMftCmoorsqLl
         f5OEp4IoirZODndw5kjpK7pTZaWQgX+7xHKciTqOlxS4diUAznmQe0ZGbjXHbUE+cHjm
         k27i+xpTxn9Mb4n42YU/wpZNmxJKLb++OeyqW3wbfhB6q1PiLZjsYNJGPes3DjqmAKrE
         eyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331922; x=1788936722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=ssxttT9QTzigOUC93rwTWz59CbB1FOg5b/El5cVXLzYobDWZ249Q8H5YM//5D1V7b8
         tw+AnCZgWgJrB/1kyYvL+LxOn0Ygr7WEI43PX+hEnNEZ7R5icJA4cN/aOjHGxvELoFQ/
         c5Yc1pf0Mds4uJEAiDYlzKWv5DA1gzRtiYsJnKInT2Me7ya+VStT/yw+cJUJXzlRPhbZ
         ZHszf4LI7bIxZswqE1BZC2J8TmF5Kzb8UOjFSKSQIzYuomh1VMOxz/ecx/xAEke6VDtM
         cQRJZtANvtiFLoYPukO9b6ryLOiZbxNWPcpv5mhbvwvh9dhbcMvOJsi/LZ8jb6XpAQOt
         2Htw==
X-Forwarded-Encrypted: i=1; AHgh+RqZrmSpZtCruM8qNOvEP9As6V8eGx5ep6PzcagZZz8lBKv+keL0mCgzCb3CK21BLK6MO7F8jMmUoqkp@vger.kernel.org
X-Gm-Message-State: AFuF++lVQdPF/DJemrWGDHF4SmE4c96kYP4mGMu819hyVYhsdUeb3DlO
	WoabFy/qHY2d9uwOXRiZsc+ME8OG99beeeOHeiBH6dGhnqmjPKNxsdpW
X-Gm-Gg: AR+sD11zw3ScwGU/M7cRn3Rb+rKh12GAV+SU7pG+wsqJPtm8LjVDKhZWL4EwntH7DwU
	cd9BRuxf/ecIkUHbJ+d8n75PkyFxdTgRRDC34uyY/eM9RRbZ7qp4ApBqpCn6ci5vsZm3Brspu4M
	juQGdRaYJe5SlbwCRCqyCwxkwCxaRTyqMRA1sxOrRW3W9vUJed+EX1c4n5BMRmbsq4IKvtLkKdZ
	UuPjSdBemaNdkDuOqb+HIekb2RuFplsRFHD9/fH4csRnX9grqcAH97kMzVNh1MZSuBhkeOKV8jp
	XvEkqsMhvgZ8tN+q/dgYFAZN4HVpbCvitIaRjdmKmRbvJ4OJWvg3cIzTH4eylb2tcD68yvH7Js3
	/ZtKvHGcMU31OV9+jBt2bbEIvefAjQYDL/Ehh1PICNHTmzUEIV0x2xO6ktwvq7mfrekI+WK8xg4
	TyvXkmc5sLG4nzh8QF2fYCTY/eqdctlhRD8muUXKatiXLIaY6qt2tZQA75a5iMqa9ELg==
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr39966725e9.16.1788331921667;
        Tue, 01 Sep 2026 23:52:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:51:58 +0200
Message-ID: <20260902065158.3617522-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902064045.60F621F000E9@smtp.kernel.org>
References: <20260902064045.60F621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> Can assigning this callback cause a scheduling-while-atomic bug?
>
> Generic MMIO GPIO chips are initialized with gc->can_sleep set to false.
>
> When an interrupt is activated, gpiochip_lock_as_irq() executes with the
> IRQ descriptor's raw spinlock held. Since it sees the chip is non-sleeping,
> it invokes this new get_direction callback directly in atomic context:

This one is real and the most important of the three: irq_activate()
runs inside the desc->lock region of __setup_irq(), reaches
gpiochip_lock_as_irq() through gpiochip_irq_domain_activate(), and for a
!can_sleep chip that calls get_direction(), so the pinctrl mutex would be
taken with interrupts off. My test kernel had DEBUG_ATOMIC_SLEEP off, the
uncontended mutex fastpath hid it.

So the callback cannot ask pinctrl. v2 changes the approach: the chip
keeps the direction in its existing shadow (sdir, under the chip's raw
spinlock), the direction setters update it, and get_direction() only
reads the shadow. The pad is asked once, in process context, from the
request() callback: gpiolib calls request() right before it calls
get_direction() for a newly requested line, so the shadow is seeded from
PIN_CONFIG_OUTPUT_ENABLE there and the line reports what the pad says.

> [Severity: High]
> Does returning these pinctrl errors break interrupt setup for valid GPIOs?

With the shadow, get_direction() never fails: a line pinctrl cannot
answer for keeps the input default, which is exactly what gpiolib
assumed before this patch, so gpiochip_lock_as_irq() behaves as it did.

> [Severity: Medium]
> Will this early exit prevent the patch from determining the initial line state?

Yes, the initial scan in gpiochip_add_data_with_key() runs before the
pin ranges exist, so nothing can be read from pinctrl at that point.
The v2 commit message will drop that claim; what the series fixes is the
WARN and the direction reported for requested lines.

Thanks,
Mehmet
