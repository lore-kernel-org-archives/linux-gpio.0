Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554D552952
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111839; cv=none; b=WQlUbEN/Qcc5NgrC8D2I6iCP3CRO6RmfoddN9mKaH55VzNOLc9JmAmN0WuXu1KiSUNlzJHEleMw9k1xzRgLOQtEq2CsZHbQwixVTayQxZGu/MDmR1bhTR2qr/EI3GqROVB0DqckOjRz1EqPtCFZVwNrPzxnznkkXzz02NGvP1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111839; c=relaxed/simple;
	bh=eqQky4L6vFtBRd5JuCtAYhYItfEVb6bBoMxiAflUToY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdrapWC0Id8GJjGUxUKPj5e442pu14VgnMKHGUD1XXWOjShIv40nluhcJ2bdIvfaSuSvdwM12Yn0Xx+tK6INchRaU86C/274QZNtswdAw9y9q35/p3zDsRnCMjT1spMsb7EEE7+0OkvAYHTWkUUHWDuUoX8TVBuT/NH1F87ZECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB5/g00o; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB5/g00o"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so181326a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 14:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111834; x=1790716634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBiLSQPmd8h7HPBJ0oHvFXtAParwes62y7xIdG7uRP8=;
        b=PB5/g00ovBKpheSksDTf+D2zSdyEaCb4ZGl9D1+0QJg9j+57VCJjtNEgOaqWu6lIK3
         GDKuoIlHz2KN6DusGQAT48Ucit3RphTDZuUiTgeB8Ulrs/LJejq0V9jB0ewtd+TH3bRf
         UKm0B8GWMAhx0ks0+0C9za5+VRy0YMTiwOfI9rI5RyZSVs5fuc7lBJS6M6/oFI9OghBc
         Ecf2rV8wDbL6OPU4txjp2B7JOvjMZaK08ZhArUl8QiV9LQKR9V+uVWXZSPTJ1ML0hKnl
         iAYkD2hcIuO7ZA6Y5SaMF2EumFbrX4Gwjhgd67GGEhD4w9TkBVqLr3UgBGsWwvEn/5Ne
         pXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111834; x=1790716634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBiLSQPmd8h7HPBJ0oHvFXtAParwes62y7xIdG7uRP8=;
        b=s9k/eXGa3N+aU0dZTDib/NgQrvfibLDu9JzgVhYcamIqCXY4JsLP0PDaRG2zjXrN57
         oXx4sX3zhMXMLJS4qLO0g9SJchQ/CwY2HVcp0hz/WgzhAozFYEeuuNW0WjUUJkjlTUZl
         /3hYM26vvfZEApTxC+im2FB49GYDgreS7U+xd/fdapYOSKJyCeh9D1PlsHOHSDmhyWof
         ZnXj0XUMVf6+1eZWa4X8jHjLhG3Y4ZqYdli8hIKELbmff7XTwPgXb+EgKTXGE4pGb9F/
         OvlnPxoYDygeIMOyEWQbqbax6LNu200ONdwoNe22YpT+YFEfHean32oa7kXD1J8lbEq7
         pEeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw44o+6o2+OuWINc56VLmVOr3V3kI+wkJnkf9301bLSoN779k42DhijY47sRfkA9oLjtHZjAnlusi6O@vger.kernel.org
X-Gm-Message-State: AFuF++lUXgDMJUtcTZiTcIHady/QWbrD5h2oD6QuXPtdP/XFsHJyaVzk
	nt6eUXkH3Ki1vlbtohsoXLnVPky6/DEDFacktHuFBCBonk2IjTcBPB0S
X-Gm-Gg: AYBFou2T1ZvlqTLoEZEhPcLSViwshctACFOi9VVTPC2OOJScnf6Y8FTNyh0B9hP+gfo
	I7cQzb/0az2FFVDGUZGAN3aYNAbC1MQ9IcosiHv4PVxZihN/+0Z1S1r5ixB9foVGZi69b36knSd
	HNwRSSCjpUK4PZjiKj4mlhDJPq67sNZF5+cIDcoI0YFqdXEOjoedT5g6ceW/glRNXbh/tjABaSt
	XwHH2ltDv2GT43QHXQAMO+bAOfj5FLszT1/iKdSGYz+mYTialh5OdyA03tD9MGGdGt3y5FdZbLe
	mBZ6A22vn5YKxMniLhvLHMFd/XPyWY42nlZNJhr0xr94l7b8IOcNuWOiP4VDU3iCP4fGZl5PoRv
	2CFcGMSLGoczOVAx09VaGSPRLfSBpzTDCPy9TufPgDPFtRxcT0q+1sUNvHD8cEEpLRU3eJgxIdE
	a7SmzrTST/0vYgTODwLulSEsPffujscX4h15kW6zghEsAVV+q6Io5Vu6hXweIKKnTMJYMHi8QUl
	V9x2SLwzMO/Lf2YhcQ=
X-Received: by 2002:a05:6a00:288b:b0:878:3705:5720 with SMTP id d2e1a72fcca58-87c857f2d1dmr1780277b3a.44.1790111833487;
        Tue, 22 Sep 2026 14:17:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb8e37sm320280b3a.5.2026.09.22.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:17:13 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] gpio: siox: normalize return value of gpio_get
Date: Tue, 22 Sep 2026 21:16:58 +0000
Message-ID: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio_siox_get() returns the masked bit from the cached input or output
byte, so for most lines a high level reads back as a value between 2
and 128 instead of 1. The GPIO get callback is expected to return 0 or
1 (or a negative error code).

Since commit 86ef402d805d ("gpiolib: sanitize the return value of
gpio_chip::get()"), gpiolib rejected such values with -EBADE and reads
of a high line failed. Commit ec2cceadfae7 ("gpiolib: normalize the
return value of gc->get() on behalf of buggy drivers") made gpiolib
clamp the value instead, but it now warns on every such read.

Normalize the value returned by gpio_siox_get() to the [0, 1] range.

Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_SIOX=m on next-20260922. Not tested on hardware.

 drivers/gpio/gpio-siox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 958034b9f3f3..d60680ace144 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -148,11 +148,11 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= 12) {
 		unsigned int bitpos = 19 - offset;
 
-		ret = ddata->setdata[0] & (1 << bitpos);
+		ret = !!(ddata->setdata[0] & (1 << bitpos));
 	} else {
 		unsigned int bitpos = 11 - offset;
 
-		ret = ddata->getdata[bitpos / 8] & (1 << (bitpos % 8));
+		ret = !!(ddata->getdata[bitpos / 8] & (1 << (bitpos % 8)));
 	}
 
 	mutex_unlock(&ddata->lock);
-- 
2.47.3

