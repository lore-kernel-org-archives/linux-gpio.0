Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527420;
	b=VKyJIcWFqYWs04r8RcbhReUxE/Eu7FwRCiY3WEoOyxx7xJNnN/0+mBmkvfxZ1sPM4ccs
	 C/ujBpAqnFcyz5IauOuAouSdNfu3NSo9SgmHmaMY0GDX1eqxkc6eaOd02HLteLanyk68+
	 U5eOAENei7mWS+sbUjX2/kbLjNYmZnnfhcPDDFNYOKg37+Ub7r5D3fnxmx9FpEzVc7yqe
	 MvThx6CQULd5jtdASwJDl0QTNGE1eXbRwHYzAGugx22jrz4vwwoFZLlIzv2gVYH7xu5WB
	 KiInlCxCVEtED91oVaw51mnc8bm9GJR8xkvk2w6O+724LIbO8N994K3iBL+b/n6f2jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OMWPkn6WhxY4f7wdVsdoOSvoulFg7SWEyNDQ6uY2j0I=;
	b=Am+vDfNsf1MSaJJrYeZEf9flaDONfl7FaFM+W+9WVFFcehr5G1gjotZoWcr4F44GO9rk
	 GrKrNhe3y15BZjArA4DyRQMrWoypfj2PFc0SUUqyv9z8Uz5TtrL4enxeQLc9P5z74jZe4
	 kHJB7GyHwMR8FJbiC246p9Yy/OT1siZwbvljZuoQ7pBP9GtndOdfeORtdVfUuwIxalNMW
	 YfBq3n/JnzDR0m0p1GVr0eXrvO1JlsdSnY0G+hZ6rZTowFE/dgU50Fc9O5Vp2OFjwU7en
	 crXnkrcUa2NYCLKB/6er5JAHXws0K9DsCaeifS/LrCzPku0Tr6RKh9OckrschvpoSzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EFXNT3Iz;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7DE606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EFXNT3Iz
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d30c054dfso48471231cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527419; x=1796132219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMWPkn6WhxY4f7wdVsdoOSvoulFg7SWEyNDQ6uY2j0I=;
        b=EFXNT3IziQYc+oNGextAk24H0QfXC6KEihJLrB2JugUZbfrRIlrO+UNvE/6og/yDt0
         8ivVXx8/Qyyk/ma/4Lppgsu29Iqoe8t9hbNGpd++WhWiTl3+Ec9l7dhNI4FEJb5xYW+3
         4BO2UvKS5HkA5mVNnuZZCcUEdKEHBgar66WnpFbXUh44l6oVKN6WrYpij03jLwpckx94
         4nlhtsUOHdm0IUyNyDP/ms7sObQ+sAdideuK6Vx6wBsb7CTkTXnJJjDD6YW7rrk/CMwQ
         GliwBuniIyO5D+ciyFRCNSr0//87yMYH0sETOXbmEcQGoj3IUAegKrg9pdV/ss5bBCkI
         6BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527419; x=1796132219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMWPkn6WhxY4f7wdVsdoOSvoulFg7SWEyNDQ6uY2j0I=;
        b=HZ3gzb5CHr9paNaQuBBAtlkF7hWZfF8yvjWHyVfW93Y2Myh9ueDUO9/HxitDZSaEZG
         YMppmh3HMfD/QesLdlvAVUOBKTbX7Yg3HLiQEx46zRsWRgAbGLFWTKLeIpMlDe5tzYHj
         MfMI63DvAzWDdgRD9+7ERcRC/lHb1A6Klk0+Y2sBheYb45+gHwLKKJ8am0qCbqh2SpXK
         +jaCqXTSQcBqfpH5yVnRHTMG+5Tz1oX7P4EvwI5f4XLr+ygknZPn6raJpLj7CqjmCDgW
         EIjUhnMr9CRdNlaFeL35kT9BxYX5MhMcqImsAeAw8uQy2behkPlftDMv1Nf0axM0tD3Y
         ER/w==
X-Gm-Message-State: APuU4Z+wbHXL9b26umomPq8mWETknaEdyef0sTz4kS1JWdh79Gnui7as
	+G9nIbkcGuTT2aVrbT6vHLh834PtLUU02oB8YH8HXqOfeQDziQeP5gJE
X-Gm-Gg: AZFdTZfeIxixXWy74GqGWEWnNkC+Pm+JUwo6i38YbXbVbNq88MVjdDIvshXghGei9Gn
	IuBZ4x6nNusB/HTuQFgLbJ4rZVGLx64Mm5+c7Yjg1kOKDy8MwHJDYMbKEOBE0bh+F/5qwTJf1wk
	ZdzWL5AXCu5rHmkEvNmKtQK6/IlJr1aglKqlnecGbM4WU3c7MNHF1bEn/arzz01KsrFt67N/Xej
	mprq1mCwQ+wTD+5fZja8SHB2XIrmwr/w2Mn/h9T9uhPAO06KP5v30Q/JCzlRBoA+GDKuHV8QykM
	6tIn5z6YzgZJ3EL9lK1KTxt0VkHWpEczMMb8Bk19fLgK/HGEdIsG3e943tJP8czF5zVX8E40wnH
	853lhPyY2n4IjtnbU40zjwPC4+CnJL/GZb6p8CGE1R7NWiKaGgtmpYKFhF3MUz0lXVacgrQiApl
	7TGwhSAuTWLYZvgfCG2waJSPYmeNyFTbXn63rrSAJvPp5hpRccA/x79+fVJGPoS8UFczGo1M6at
	WtbEnH9wRY3J6Vkl7vTcQfuhrLN5VN0oDMHjAbIjxbg+XODS+OLVhWsy+nzolG1cdgwlM6W2s4b
	ZGXSE+nEOy0JGfgIrhVWwEEZhOmxs8Ff8sLs7eQL52HQ9TVyqqo5VIfuumBrcOfn
X-Received: by 2002:a05:622a:a05:b0:555:50da:f038 with SMTP id d75a77b69052e-55d768a3faemr271137861cf.1.1795527418853;
        Tue, 24 Nov 2026 05:36:58 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm133834536d6.22.2026.11.24.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:36:58 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com
Subject: [PATCH v2 0/2] gpio: davinci: fix probe-time IRQ setup
Date: Tue, 24 Nov 2026 19:06:52 +0530
Message-ID: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes two independent probe-time bugs in the DaVinci GPIO
driver:

1. A file-global MMIO base can be overwritten by overlapping controller
   probes, causing BINTEN setup to target the wrong controller.
2. Per-bank IRQ data is allocated as chained handlers are installed. A
   later allocation failure can leave handlers pointing to devm-managed
   data freed during probe unwind.

The first patch derives BINTEN from the current controller's mapped bank.
The second allocates all IRQ data before installing any handlers.

---
Changes in v2:
- Rebase on current GPIO gpio/for-next, incorporating the upstream
  devm_kzalloc_obj() conversion as requested by Bartosz.
- Use devm_kzalloc_objs() for the upfront bank-data array in patch 2.
- Add Linus Walleij's Reviewed-by to both patches.
- Keep the pre-existing GPIO-count bounds issue reported by Sashiko
  separate, as requested by Linus.
- Repeat baseline/fixed fault regressions and parent-handler dispatch
  coverage on AM642.

Previous version:
https://lore.kernel.org/all/20261109194910.2282454-1-sahaj123.sc@gmail.com/

Testing:
- ARM64 W=1 driver builds passed for each fix and the series.
- A local ASan/UBSan harness ran the extracted probe and IRQ setup
  functions with mocked allocation, IRQ registration and 32-bit MMIO.
  Nested probes of 87/88-GPIO controllers and bank-allocation failures
  reproduced wrong targets and stale handlers; each fix passed
  independently.
- On AM642, instrumented baseline/fixed kernels reproduced wrong BINTEN
  targets and a stale chained handler under forced probe interleaving and
  allocation failure; the fixes passed. A private module also exercised
  the real parent handler on 12 banks via GIC pending-state injection.
  No electrical GPIO edges or child IRQ delivery were tested.

The AM642 tests used kernels with extra debug code to force these
failures; that code is not part of this series. On those 7.4 test
kernels, with and without the fixes, the mmio-mux driver at a40000
failed to probe with -22 using the vendor device tree. The board's
6.12 vendor kernel does not show this error. I have not found the
cause, so these runs were not a full-board check.

GitHub Copilot CLI was used during bug investigation, review, patch
preparation and testing, and to draft the emails and commit messages.

Sahaj Chaudhari (2):
  gpio: davinci: use controller-specific MMIO for BINTEN
  gpio: davinci: allocate bank IRQ data before installing handlers

 drivers/gpio/gpio-davinci.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)


base-commit: 0e1941b7d0b0a0405b16567678a9bc3b20be6340
-- 
2.43.0

