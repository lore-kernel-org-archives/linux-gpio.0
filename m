Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829611;
	b=u5lgd5Z5Cvm3gJ9cfa+hB4h9+svsILQSCoWD1/xVJY4HMQqxbJ0BkT4UfQF+D6nd7Wd0
	 RdDFwGboRx/N6/NZZD6zrZzJyUh98ZGz/65JGdjilulXPfdTDTDKTg36dmSi7VjDW4N5H
	 BzmH2A+lto2iY0uuEhypjhA2l5X6LXNvwiJaZD4R8dZI6twPvnN6XEKfFHP8mkhRYt97L
	 KvoDnaupV35C1y2wCsyPWanH0hpv5Zgtj8pUuxNJveQezO0zlAZt4mDQr1OZSw004xVC5
	 AXz8bsCeJRgELlF5lZsLDbFTE7QUwTI8U2kvKbWid3M9v/pweDIZa19W7NSJz27Ts0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m3fDn0doC3oHHYkxsfDaIpaSQ1k6unq+IZwq3OGecvU=;
	b=jEmnjAH/1ExpWs8XathqeV727TIbCZsq6wQtx/hs8QlZRSW+Qsww9v1fjEEhXpPz6wav
	 KbWmR0YLNH45veO+mS24D6n0r3Y34Ykzjebzi8G0YUxFpuEJ7zpb0z1/NQDtKojUfTcuU
	 Hcabp5nqP4l+zOfPL+Xcswuv07BorypF6U+onZrqKu0+ZudFmT2G7r3PtAmIUA4AVCeqQ
	 FuLyLHuY8FiF28Poq3MBce4Q5zSsPi+MTsf3EE3xWH9/0nS4y4Fmtn6Jgfyq1vvIOlIyp
	 +usTOSCWCTT5X/vO2PiF6gBnPWsnrbnl2fsX068UqJ9DP6nBEXlNUyLsN8N7pVdX4vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeGScUN8;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C7608C98C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 22:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74C7608C98C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeGScUN8
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e940d5d2beso5145405ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829610; x=1794434410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3fDn0doC3oHHYkxsfDaIpaSQ1k6unq+IZwq3OGecvU=;
        b=ZeGScUN80PuxzKBUlr8/JsvzQ4C1zpUcqA3TujEeuGhilC7DZmkCGRhiIkwXlbjB0c
         4SLboKrFTnth7bDKO9THsZK+IvEwvdeWE1RB7hEy/t61k7Qi9xTeV8oKAzAP8TV7Kier
         xvZzBgjkUMb/BN96hJeGdi4HHlrJemiA1EL6kPUEf0MkAXOXWTHcWbN+M/NV/q7Lwewi
         7m51erbLtksTARPCtzVz8a1F8X5Xmon0r8J2azH3usspnLfxoU8DPf9FpoBiwZ1KNCjG
         rsJWljlilE5ArqV7+BO8OaVFAKqKG7UQQSAo0II3iFIXdqW51rWXFgCjF956ZL9RY6mq
         x23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829610; x=1794434410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3fDn0doC3oHHYkxsfDaIpaSQ1k6unq+IZwq3OGecvU=;
        b=XA272kh4w/XwSHkPP8NiKEffhnqxkXXnkXxuLBH5UJIgvnnN0ITERSYT78fAdjTGIz
         Zlx9+Zw/s1Og1QPf8MBoMWsziAzFoQ6MTCgqRXowN83OJ2YYarHyY6mfvJl9/iCsOFx1
         ddA+TQ1A9xQVXquxq2yNT5SwqP8jT2bJ02hiJXViQ9ytOdHE6Kd2TSx7IjMG8Dh/Hq8P
         Um+9OiymHaGoDTZsrjuBZ8TtaWtSWfqSuTFYWzL/+ykvrc5+S7kwTFUaDW8yD0WN9EXE
         Q5cERjb6aN8dj95CjYbCz23czAdUCL24L5iCWhgI4HzP6PqTHwRsXg+L2ymhSYcK0T4X
         xDbg==
X-Gm-Message-State: APuU4Z8qZghgMDz5NuAYfoIL89gWBFcYTmCGOysX0XfwVzSC0FLisvUF
	w46K+NDWP/0DfEzDTqypGBms9b3pRErN0DLcCJnEbEpf3nbkix+OrmrUkPuu6g==
X-Gm-Gg: AYBFou09jLrVveQ7r2o/md9dV8W+x+2OqRNb6MfdgnAGfriLIllqQDdDER73tix1ixP
	gp0famDJcK7rjs/mAap85hXDXu4ccKxpx3vDxl29TYJmalnWqYYmEt3tPxWwVGKF9dhvaZ2PCFM
	yppVLT98jGEIBad5buMaiYbo4AfL3kRS1sty29hYSjev+9HV1Bd8T3ga5CbtYSd4R+Qc/fE+4i7
	n7e1v+r273T8jGTq3BwgNVEIG7RFi+YYnn9wfsN0c7j9vENgwaCxkqy+Ma1T+LB8HmVdKby/kdZ
	V+xaxp/9CrUnOj6UlGHoBYvF7oB0T2V7igBUxtXsPaS7m31ATyXQQpURJMrXRXtV9eDPfuS5Rxy
	d6dVYzCFGws4rb96UN0HT2PpcSzhI/CbA+/Mso+UKD6y3zQmChxF6CUc5huVfp+nh9dWzNEoZvY
	UgVDO6oP6cIQmGw9WlNhvA3OhPvwr3zAQvfTj903fAWQ2Rzg2x6Ms36aE5D7kyApqJS3k/YuYfh
	Sm1vKdSxcTkitiO1Dk+BSPToEzcCMGXYJsdsEH2IIKLGS8XANOGFLz9arzMQNeLSJOa/oRDgu1x
	FMnNxp4n3NlmYqlmjBT2xtgckF4sXtzolr2N1Ap635bYOK0L4n+4zkokcnRXB06b3qOqE13iWKj
	tMGNgtHzwTElTT8mgIsfkdkZ129Mc+MScCWxAdjz/Y4SJoOazWzir4+N6fn3LT2yqMIdeQQwSjx
	grUA==
X-Received: by 2002:a17:902:d50e:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2eb36430011mr137628485ad.23.1793829610082;
        Wed, 04 Nov 2026 14:00:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:08 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] gpio: ppc44x: use BIT() and GENMASK() for the pin masks
Date: Wed,  4 Nov 2026 13:59:58 -0800
Message-ID: <20261104215959.24035-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
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

Express the per-pin masks with BIT() and GENMASK() rather than
open-coded shifts of 0x80000000 and 0xc0000000. The pins are numbered
from the MSB, matching the bit mapping gpio-mmio uses for
GPIO_GENERIC_BIG_ENDIAN.

No functional change; both forms yield the same mask for all 32 pins.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 20b3e9ce48e8..8b9ea00f170c 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -9,6 +9,7 @@
  * Author: Steve Falco <sfalco@harris.com>
  */
 
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -18,8 +19,9 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 
-#define GPIO_MASK(gpio)		(0x80000000 >> (gpio))
-#define GPIO_MASK2(gpio)	(0xc0000000 >> (((gpio) % 16) * 2))
+/* Pins are numbered from the MSB; the select registers use 2 bits per pin */
+#define GPIO_MASK(gpio)		BIT(31 - (gpio))
+#define GPIO_MASK2(gpio)	(GENMASK(1, 0) << (30 - ((gpio) % 16) * 2))
 
 /* Physical GPIO register layout */
 struct ppc44x_gpio {
-- 
2.56.0

