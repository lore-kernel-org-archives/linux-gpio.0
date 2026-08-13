Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A649F423E9E
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649840; cv=none; b=Z6E4Us9KE8er2a3YEFyAGjlJ1HOoUqGipClA33i2vE7R1wHTPhDr76NmXc+wGbO6/MdomFE2qx27B7TXpkZ9mR+xiFg/Z43xoL2XtMX7f7/TTcPCHAaZCrsJ5mr0mZw90/jIB18Rz67hj1deVMA0f3SZ1EUFz0mtoB/Xg/rgz1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649840; c=relaxed/simple;
	bh=M0G3UV1JbqiwQ650LFdITg4eH6f5K1JQWX3e8Dje1cE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7WTR8CHfl3cAcPNkxqcrm9bLlX2tgYJXFUQCfdl+XWQeL5t3UWbvu2tpr6zD0u0/A7PJhyO3EgvQxrLOdVYmP0KOqWHycjnd5jGMCB4EE6uZQJ0v7EzhJGhtlFsct3OVDwy4/c/dJpTwtd19CwwJfnY/GyxQyPEq0jR3/YN5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duPioNVi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duPioNVi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so170762f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649837; x=1787254637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFt1IecK8st5prTppevSftNtM7IlSZTpN3UQhYTd790=;
        b=duPioNVic68IjTR0fgW49SSKqpSiCzCpt1G4R8aCrhBsTHsGEl0ZGuqT7cVXOxtbX6
         httzLj4y3wL73fwtLvAqIYxghe0s1eRtALUKQEe/w5V0AmDj7gmuBS9OZ1TPaaQvSl4U
         faArLFAuXpC7v6+/iCqtZfkuerx1ubjZbZpFgAanBZ06Je0St+VU02Zdtg++hSaNK2B7
         +ZcbrCGWc8HJGjtTwiWtQRnYKFYqqzGNZ5kOpt1adwPFKUd3QE97a1bwjI0jGB1/I7aC
         ZrbyEtyG7FmePz5Xw6L9fPlAKhCAuUUrz9hK+3LsnhAzUPdSSgRyj+kOuPLFswYKZo67
         GTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649837; x=1787254637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFt1IecK8st5prTppevSftNtM7IlSZTpN3UQhYTd790=;
        b=P5OeJjZinfrvTQG40iuORpAAmLYHYd5/1sLMR3BMVlRpm7PcqtLWYe6qXMopNxJlD5
         ke07yf4a0MxiQEOcNKQTRsj4rlEhkkTYiiXQshXAq//Bg/Z02Zqv0I4OLAYxQEuKXisG
         nUjdy+CgrcJYFWNnzLuKYyKzE4OpZ/dVVhcCu4gXSulV3ngVHNF8Q3MVaTXaGATRw4UX
         Yzx0y0/NYVAlsH9Is3lrUyQZ7JIX8GAhhnT8qKIqQS0HFqJEGCvjNTP6LV3HIPK8pxiH
         UWxSrBJd1TOXpXubQsx6gNXDs5VT+NCxQLoNWaFNQADIxbulMhWFuKaBqb/pyRUc+OSM
         N+Gg==
X-Forwarded-Encrypted: i=1; AHgh+RpKKe/Ed/orJPucHXI01Bvz1mOcAV2fw0BtGXE1ekfejTxSQN0JzL534SUPPuXoHZ+RPXIL/9hoNtpq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XVnfMEphI91x8wi1tWpRYPNlilm7FcJq24Z0RHsqLgkfpPsq
	O6UFjcLKJeN9JC1GtfWJIkWnwBiDghV6qxNo7C1TEqKCoKIpsiD0gDyM
X-Gm-Gg: AR+sD10D8CT/lEndpPA1HVpBo0uh2WvcnZTN5XiLA9KL76W2Srv5Y056SjdQNm0BZmq
	MSIOL70mA2kEFGgzawKSoyR9FXWdf28vV/oIGvyGisJ50oLtgVzbNNj3aV5sD0zH3l8gf4ngFY5
	cfwJxhRUQuT3wNuo8LmZPZtxkD+4tjOTUXmxWq/tLr1qAb5J3ossEtg4kh88CN6PpTfatTt2bdN
	z4oWILFJcnmRiiYdqtlFf6f144p7SE6stIN9qAaA7H9DoqrDfNXE091wwKYRyhDRz8iKQv7W2kV
	wX71JimkYAmemiuW7cDUVzb/A4EESXsUaHjQaR4gsrxj3bdI92eTbCkrjpuiQQT3x4tPvid8+R4
	p3JtHdJt3sLLR1fKFCCNTGn2SkXgWZLqfEJJp1OdF3955RAtuSb8RsvOBqGdCbQqT76qTMzgMSz
	ZjH7iKZjM0CpBOTuuQmCGzUjk/NNwEwhHS+0+/QjzqcwuABgxnFQqjAMnR08l7TRMP0Q==
X-Received: by 2002:a05:6000:230f:b0:47f:f1ab:9075 with SMTP id ffacd0b85a97d-4816074ccd8mr713187f8f.20.1786649836773;
        Thu, 13 Aug 2026 12:37:16 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20059asm1530370f8f.5.2026.08.13.12.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:37:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH] gpiolib: return quietly from gpiod_get_direction() without .get_direction()
Date: Thu, 13 Aug 2026 21:37:15 +0200
Message-ID: <20260813193715.2346477-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Since commit 471e998c0e31 ("gpiolib: remove redundant callback check")
gpiod_get_direction() lets gpiochip_get_direction() WARN when the
controller does not implement .get_direction(). Callers of the public
API have no way to check for the callback themselves, so any of them
hitting such a controller now produces a backtrace.

One reachable case is the i2c generic GPIO bus recovery:
i2c_register_adapter() calls gpiod_get_direction() on the SDA line,
and on a Vybrid VF500 (gpio-vf610 has no .get_direction(), the pad
direction lives in the iomuxc, not in the GPIO block) every i2c
adapter probe logs

  WARNING: drivers/gpio/gpiolib.c:431 at gpiod_get_direction+0x16c/0x19c
  ...
  gpiod_get_direction from i2c_register_adapter+0x5bc/0x7f4
  i2c_register_adapter from i2c_imx_probe+0x3fc/0x6a0

Commit d761c7e38a00 ("gpiolib: Check gc->get_direction() before
calling gpiod_get_direction()") already shields the debugfs dump the
same way. Do it once inside gpiod_get_direction() instead, and return
-EOPNOTSUPP quietly, which restores the pre-471e998c0e31 behavior for
external callers.

Tested on a Colibri VF50: the boot log goes from 21 identical
backtraces to none, and the i2c recovery init degrades exactly as
before, by skipping set_sda.

Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/gpio/gpiolib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c433a095907f..ad9740a3b42d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -464,6 +464,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (!guard.gc)
 		return -ENODEV;
 
+	/*
+	 * Callers of the public API cannot know whether the controller
+	 * implements .get_direction(), so bail out quietly instead of
+	 * letting gpiochip_get_direction() WARN on them.
+	 */
+	if (!guard.gc->get_direction)
+		return -EOPNOTSUPP;
+
 	offset = gpiod_hwgpio(desc);
 	flags = READ_ONCE(desc->flags);
 
-- 
2.54.0

