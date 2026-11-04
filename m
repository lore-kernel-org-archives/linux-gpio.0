Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829606;
	b=qgiI3z07N20VZmdgCvT7g3HugDtB72Nl5u7x+FA3iTdXFM0ii4fmlcpUC95Qykohomz1
	 bMOb1Te9B7/ZwnkYx3ht6vDYOxw0GEtBLF45VblZgbhylQJHV+3m9iSMLxC+G1hlPl/Zg
	 uKGyqEPuMtTkT4Y92u2kJX42OhXGUCSkTGOiv42cdW8lT8pPMzzNOuOIPF3o4T4gcbktR
	 mmAwjh8CKbpWeyyd0l0F62YisIjB2N65AjCLhsfZ7NatEDl+AU7RsooIFv3gqFMKHBbwQ
	 NATEvfMUiATiPkKu6pT2qD2GsvpOB+zjSmVDUOeDPIGCMa7uVIg7rAUKVQWi+kM08Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D8uOIe+FcAUCfZ5V25RZN5bEMu9AQWJY+NmWCOwJoNU=;
	b=wN8OULTx8vkDh0AbPcw7hbudEPDuMo/Tr34kPNfbmMcOzemuFnn2ngdJb6VDElFT1zmG
	 vNrCUhIrFBDc48fOSw55pXmr8KViDP4vXzkA81d9Hv64fqYGA5Yxj38L7ieh1MJlb6M0x
	 kJL5E4FBkNx2QZ9XqIYGlaucbgFAvdK3hAOhJq3/RvJil4Z7Rq+OouOUzh8vIjTSrS1ky
	 gRa3SeQr3kAi50dDesq05s+3Yy/9ju4kMFpzbbHaqpnEHxFkfecbEctFygHo2CLdMwPcD
	 Lw062svvuNt646wKLcDoxxQggvWwwuMgjloLnDRtb2jDTjO6RurCNzgQByPZYTe8izw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hI/jm29P";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677CF60877E9
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 22:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 677CF60877E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hI/jm29P
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed1414df17so4060025ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829606; x=1794434406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8uOIe+FcAUCfZ5V25RZN5bEMu9AQWJY+NmWCOwJoNU=;
        b=hI/jm29Pj73dP2mz5KWwQn235C6siES9SaTvH3RCF8P3aV0smcWFS8EsyPBhuRKx5Y
         BctVBcBSxc6d22l3ZKGrQg9iLk5euXqDSX+GUuIbVLYgnGdV8Qb/wp0U2Iih3ZDzdHVg
         a7nHXuUEVmGlLdoSEXiylsyt8I9wAKS6cuhTOnPMCRcY4kc1uJE0AACCWkl9ZQChBzXf
         qzMWpDcbz/9BxNX/eMY9oYkkbaGdbpXUxiQkzk0tBxn6U6Pmd3IQc/6VKQnxSvPEoEmz
         keGphixBrQCVOg7/Vx08C/XC+H9K4KCCmgyXAZUSudX9YlGLMZ17+f9InS7j1/XyWjHN
         WGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829606; x=1794434406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8uOIe+FcAUCfZ5V25RZN5bEMu9AQWJY+NmWCOwJoNU=;
        b=okbf1yQ9OqCbv8herP6jASe0xhqXs4JQDh0jq5ljGYauDLFznWswyedkQ1nzwY2jdG
         ulElY8S3lRGCEeosXRXi8NJ57hB94aeJi3DZqOqlZv1SKzlcxERXqXJPgytZx2Q5T9my
         GR3BSRCISUlQqBZ2YT/+rEsVuZBK9XrXthjqyWDbhAeWx7xIXExl7G6dp+nJN3Js0Dva
         XKQiV6txUco9sExrkAyGUJTTaYEJFKshYC3yTeGjJVkqofexeZBgTSV54sOGziCho+dC
         Bi1Q/tg0jCJa0U2AEpFwqSPAoqQUf2cvg9t9YFzKNFCUxfr1guf3uZb7wycTgnjGfUIJ
         bq/Q==
X-Gm-Message-State: APuU4Z8XQmORXKjEALglCL+WdkOaNuTdBaaw6zQBB2TTaTyfuwTMeATL
	WykE6zZpukIl25eO9S2gmpoKq0Yw3wekO6ITze6e8e10ki3i0eIFNNzaxbwfVA==
X-Gm-Gg: AYBFou0AthK8YbRLixfrxGZTxdRiLM17ABXC4hJlwmtZQbg22O3fagm54NnHeWqm4fF
	FAvQcZdx0ydareUTbV9etUmRDp7ytyrhQbUT34pmz1xjzJlhklN7/K0hwbu7jqLdS4l+6Kycw+r
	UPphCxvqtKcDunL3r6h3lzQh/A311mOaNOmVhm3ubH6BTgbdvXibuAm0qVaKWUYeUQPGTHwyURo
	emL1V56rQYHChDwcREpe1I6txnwTp2A2dywlwqGnySceguEbAtKsApbDSAEL/BuiKnxS7i0IZ3w
	KFHWjW8SJsKufrwSvVuSAcxvguUZrpCipdBnZjUdDkV0Bo1onWA05Jp3L819AdaDBsiyP3EDxMb
	ocF18nLWWoXsDKj6uv3GsW6rjI/9k1wUe2aCSlJUhHDcNtD7RNBi6eaa+CIVdmvj8DIG9L53dA5
	ANUIOxbcsX+kBwdP7AFcZiROs7UjlDR+T2gxZSm1A/2kRaxeNzLV8qIUM8ElgA3xCXLErgbg3wk
	oT9wEh08unxPjiFykfLzjvdzmkwGJxJDphSJ2C1sDb7fWYWjGB94O3pCGTkM75FTz8wOUjvuuvy
	gb9Dil7VGaASn8zYoSy2ntZYQnshjix2cel8MS1tTl1CvE4uZOkUdal/ogWcdFi1Ux8QzaJVkW4
	umdPtjH5zaThCRkMmUWxuVuaZQY+oGCKjuuVsDfzaGUBa82Joy7U1XkWg2CcV19TCydgGrB2Jcg
	l3GhqMqOHSxSex3M+S9XkgFF4=
X-Received: by 2002:a17:903:32c7:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2eb364898b9mr163809995ad.11.1793829605575;
        Wed, 04 Nov 2026 14:00:05 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] gpio: ppc44x: factor out the OSR/TSR source selection
Date: Wed,  4 Nov 2026 13:59:56 -0800
Message-ID: <20261104215959.24035-3-rosenp@gmail.com>
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

Both direction callbacks clear the pin's 2-bit field in the output
source and three-state source registers, picking the low or high
register by bank. Move that into a helper instead of duplicating the
if/else in each callback.

No functional change; the registers are written in the same order.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 01dd5e7cc311..b3cbc832cf24 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -64,6 +64,21 @@ static inline void ppc44x_setbits32(void __iomem *addr, u32 mask)
 	iowrite32be(val, addr);
 }
 
+/*
+ * Route the pin's output and three-state control to the GPIO controller
+ * rather than an alternate function. Bits 0-15 use OSRL/TSRL, bits 16-31
+ * use OSRH/TSRH.
+ */
+static void ppc44x_gpio_select_gpio(struct ppc44x_gpio __iomem *regs,
+				    unsigned int gpio)
+{
+	__be32 __iomem *osr = gpio < 16 ? &regs->osrl : &regs->osrh;
+	__be32 __iomem *tsr = gpio < 16 ? &regs->tsrl : &regs->tsrh;
+
+	ppc44x_clrbits32(osr, GPIO_MASK2(gpio));
+	ppc44x_clrbits32(tsr, GPIO_MASK2(gpio));
+}
+
 /*
  * GPIO LIB API implementation for GPIOs
  *
@@ -99,14 +114,7 @@ static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	ppc44x_clrbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir &= ~GPIO_MASK(gpio);
 
-	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
-	if (gpio < 16) {
-		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
-	} else {
-		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
-	}
+	ppc44x_gpio_select_gpio(regs, gpio);
 
 	return 0;
 }
@@ -130,14 +138,7 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	ppc44x_setbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir |= GPIO_MASK(gpio);
 
-	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
-	if (gpio < 16) {
-		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
-	} else {
-		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
-	}
+	ppc44x_gpio_select_gpio(regs, gpio);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
 
-- 
2.56.0

