Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A992F352000
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796555; cv=none; b=UI7VaNab0c2nOrbbXR79r75vVuyChIGhhZ9XONFoDiZKfooi6DMu59a+lgbChklAJpv8Xx1IWb0oU/LC/Gf3ejSBc9mmiCqrnWWuHNUAccN/wJQTxSVf5x1AK5gKI6IsvMvWhydquVp56t0w2i4xhsA5ma43iQdl4rD1N8QiBi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796555; c=relaxed/simple;
	bh=Jr7Gbn6vOS1cJ7DxSRcOtUQqruCo9sSIZaEP4vIRNKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlHAS+osd4p7YpcEWERrwqnviP09RiLcXayWkLykbTQGqYMMoAfUDDXOcKDAMf3RDRBDKsrjeQm/gGNZ4IhbvhVFrH32eB9WCtSVr9icxIf5jgc55PqBr+Tngc7r1Bag4pEDesQxSsAixLs42bLR6H9o69AwXV9t/FrWsd0ziUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW3GOv6+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW3GOv6+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso2321290a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796553; x=1786401353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbBGsHmjF0IK9Yh+6sVuwiAAB5BmdDbimGNjiC3VIVI=;
        b=FW3GOv6+PS6ERVGJbnWPa9wx77DGpwgc8uXENoeE7W+Lj2AkT72SMcVRa7iYtt6+x1
         FoOv8oYwGREP1gPqb/OjIt7bjti6dLcWz40NBiCvQuhswcU4MbiUlVP5GYT9bRUKzgIC
         xN6sgKNlpQaSIkQX33/5qKlb3tEe9gN7WOt+sO3IoT3onpwVvhv7uwha31sEIxgfw2KL
         p00/l89FPUkcLDX6F2aQtGsuGEN+3H/cgjm3zcv7t3lHcjp+c/NrIYHBrogPT3IMk8e+
         3xqN3ZcQFkdIf1y7se1kbwdrw8B2AEbW2Hg5wMNvl0kZIC/xNYVNmRoFFMFioeRD/heQ
         rtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796553; x=1786401353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbBGsHmjF0IK9Yh+6sVuwiAAB5BmdDbimGNjiC3VIVI=;
        b=pMQgZeSDMukBgyREyVn3BTdxA5BYLlFB1MgAzCmo5yNsMkZHqntEso5zlEU80dgpRL
         PB+Cm57kZ2q8fhkxhjyXZFCqTthP+yESBEumopBPPp4LzdEHErJVscjOwuri9qA5Y0YM
         10LpQZFOb3xwc8OU/CI/Cy0LSyx4KOjjJTCPtM6muPzWqQZM5LaS2OO3IQAelnFLZb7Y
         sw8NqXG/oaAx2TPoin1qSTlUtX6EpuuDI8mJA5GvmUwLYoF6AxVHRDMBo7KSQy7LsP0s
         D0mh2bCw6C2IWR23/zqnY3qET84MwC/6fjlJqhhlv0ZSFPv3n2Xmf+4eVIk23QYygppF
         WKWw==
X-Gm-Message-State: AOJu0YyWH/Q3nnjktY1+bVt8SwXGE06c1hHwBl20ynmqNpNVKk0vwsax
	kLBDm9m/ZwRkrZtsUfEQ6rhoEUg5sbJBZNV1CRqJEFKmuxplkKJwIiIpduA7rw==
X-Gm-Gg: AR+sD134e1ST67885dQUK6EdxikZp14negcDgFU3TM/vSJotgum5LM7GABBBRASTeKd
	w1xSXBevWnWPIN569vxkfpxU7iwrFxjMdXVwJK4it1Bt/SdPFShz2o4tfDyasunFP559q6tsyc3
	+fM9ptQso3CIhT5CNZRdaEKzVlxI7sUxqzYclUjPX4y2Hvy/k1DAKWHjCBuYVgM5VNEWINK9omN
	wRsoAoEdksUE73C7YMLQMjtx1HgUQpd7R5F0A48SkSNrnRIdEL0nn9hYbgvX+IGevf3dqdjrA2p
	q0dAgGrrGyNh1dT9ZlAqrkPg/G/ZehKCXp0Rv9vtGDzPKjjAG7zrri89XY6VJluve+if0F4inFf
	T1LQprOknBwkyLKLF9EQEMCpYn2XIWycQkD3eT3GU8kcS6uRCY1P5/db6MiVYu+DJ65UAbthqT/
	hbACL6+qjNZ68VWNVo6UaI/QWXs47EEC3HjB4UDrkqqW74AfgxlH9ptDiZZ28qguNp9qEyVMBrP
	X5ExAqELO5ulb+z5VtBiF4zHPtu3rrVAG1C0HjUdfdG7luB0jI7TipZ3sc9FeOVDPuXscav9Idj
	djreNeoxn5G+WpeYO+Hfw1xuxljmRhGP8W9jtg==
X-Received: by 2002:a05:6a00:2e2a:b0:848:75b5:1dd4 with SMTP id d2e1a72fcca58-84ee498e2aemr10577218b3a.59.1785796552950;
        Mon, 03 Aug 2026 15:35:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 6/8] gpio: ppc44x: drop PPC-specific IO helpers
Date: Mon,  3 Aug 2026 15:35:37 -0700
Message-ID: <20260803223539.86303-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PPC-specific clrbits32()/setbits32() with local helpers using
ioread32be()/iowrite32be() which are equivalent on PPC since commit
894fa235eb4c ("powerpc: inline iomap accessors").

Add COMPILE_TEST as a result to increase compile coverage.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig       |  2 +-
 drivers/gpio/gpio-ppc44x.c | 40 ++++++++++++++++++++++++++------------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 15fd5874f4ea..0e021af4e81e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -595,7 +595,7 @@ config GPIO_POLARFIRE_SOC
 
 config GPIO_PPC44X
 	tristate "PPC44x GPIO support"
-	depends on 44x
+	depends on 44x || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Enable gpiolib support for ppc440 based boards.
diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index d9048452162a..fd543fbb959a 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -48,6 +48,22 @@ struct ppc44x_gpio_chip {
 	void __iomem *regs;
 };
 
+static inline void ppc44x_clrbits32(void __iomem *addr, u32 mask)
+{
+	u32 val = ioread32be(addr);
+
+	val &= ~mask;
+	iowrite32be(val, addr);
+}
+
+static inline void ppc44x_setbits32(void __iomem *addr, u32 mask)
+{
+	u32 val = ioread32be(addr);
+
+	val |= mask;
+	iowrite32be(val, addr);
+}
+
 /*
  * GPIO LIB API implementation for GPIOs
  *
@@ -77,19 +93,19 @@ static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	/* Disable open-drain function */
-	clrbits32(&regs->odr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
 
 	/* Float the pin */
-	clrbits32(&regs->tcr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir &= ~GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
 	if (gpio < 16) {
-		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
 	} else {
-		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
 	return 0;
@@ -108,19 +124,19 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	__ppc44x_gpio_set(gc, gpio, val);
 
 	/* Disable open-drain function */
-	clrbits32(&regs->odr, GPIO_MASK(gpio));
+	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
 
 	/* Drive the pin */
-	setbits32(&regs->tcr, GPIO_MASK(gpio));
+	ppc44x_setbits32(&regs->tcr, GPIO_MASK(gpio));
 	gen_gc->sdir |= GPIO_MASK(gpio);
 
 	/* Bits 0-15 use TSRL, bits 16-31 use TSRH */
 	if (gpio < 16) {
-		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
 	} else {
-		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
-		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
+		ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
 	}
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
-- 
2.55.0

