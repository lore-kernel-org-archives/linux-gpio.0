Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394704;
	b=1QPtvQBdFK6Sx74fk/3x2t4/hA4zDQy6pC5SPcU84f/y0THZPllWJXzF+7oLRfCsWDAZ
	 UYMLVlZsWCWfdAY+AwgvgS0f4jBQeL8XlXhpDCURmMASu7VYcCjrIhXSlIMB7DuSvJyvj
	 TPwbtmROHFNl3KRSbHjm4VNnI/Orjo9CgbXWJ1hZW0s5G5S/785/WkQ/zOgIcb8zUBM64
	 dDC72YwOzxS70zA+KLFHvbCDOJXcX9XLqqTmF6uT3vBMVv+4qbatU7Xgd8toiXgezN+W7
	 v/H7AyiqXgTXaukg3kqVkMznj1BSGhWJMf1HQt5vpwZTP8JriiHwaV7PZImnaW0PdKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394704;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bCfu2lZVHf7kdyIOA/5IJZu+49l7M5uoqz1j5RxgMvo=;
	b=t5o/ZB9joEnxRDWC2KKnCs+KqNdFMh+F9+0aaZiBr45ZvSnj/W0lK+gO8OKsGULbTMDH
	 +6MKo0CmgxasphEmoFRq4qvLjytZNXjeH2KQ0zejX4x6M9hKj9ulBA9SR+MZU3ziIF/BR
	 md0KH0rSw1H/nKG72yl65eYBKFqm1m5C3NsibCD3CCiYhn348d0D5SvuU0JqwQRptRpbI
	 reBmDAyhzuVeeyGaH0okKtREbb2ibiFr53ui9zb5uNaqJA6qM7HQKN8v45JOa/Z09UxWm
	 LnNo9mXFdH+nZvTNxbaF2NbAmz2k3wrwqUHf5CRov2D1n01eXX3+IqL4t8NjkCeuIJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="O9Q4Wa/L";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FE606A31D;
	Mon, 23 Nov 2026 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O9Q4Wa/L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bCfu2lZVHf7kdyIOA/5IJZu+49l7M5uoqz1j5RxgMvo=; b=O9Q4Wa/LraQfOeo0d6RccO4XHA
	n93dguhrbLuaymgCcj4Y+rc1f+5Qdjat5UGpm54pMy59zv51Dx1bbzISC0Roo12+G76m25PTUN5fx
	l5DiYbuyAf5PgZlZcr7o8Mwb8PPYTxPkjocdepsC3lOBqsMfvCYC6ZMx7PF1Occz3ew3jw7bER/vo
	9T6RdDBafhqkAb/i0KK5UuwJm6xKdPh7vPSwzc3hKx8JRdzotwc+x/yUJs+7cEznu/QMMjJ3neq1f
	e8HhKUF5eqTFC5BoSkyzz18XYKPRfrq/9XLAOvGeKZuV9btCqoY8YvhdzGIp0sqrwMzB9RK7U4QRP
	Ku7VcrpA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIB4-000000020H1-442b;
	Mon, 23 Nov 2026 00:45:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v2] chardev: GPIO common access methods: repair non-kernel-doc comment
Date: Sun, 22 Nov 2026 16:45:01 -0800
Message-ID: <20261123004501.1771603-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
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

Change a "/**" non-kernel-doc comment to a plain C comment "/*"
to avoid 21 warnings like these:

Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
   nsc_gpio.c
Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
   National Semiconductor GPIO common access methods.
Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
   struct nsc_gpio_ops abstracts the low-level access

Fixes: fe3a168a2ce1 ("[PATCH] chardev: GPIO for SCx200 & PC-8736x: add gpio-ops vtable")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Jim Cromie <jim.cromie@gmail.com>
---
v2: rebase & resend;
    add Ack from Jim Cromie;
    add Linus and Bartosz

Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>

 include/linux/nsc_gpio.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20261120.orig/include/linux/nsc_gpio.h
+++ linux-next-20261120/include/linux/nsc_gpio.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
    nsc_gpio.c
 
    National Semiconductor GPIO common access methods.
