Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32675352009
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796556; cv=none; b=BMesmnO9GlNE7Ia3UQtLFEw7XuAJLmnb2FQumgSpgn+FOW0HrCEUzdghQ5QsjBQHEH27xLPvJjoY49Och7cwOB8rEhhEnzKwTDwOPVuvH19WLycc8XC2dY8HnWcojPyMS9eW+InfaFNwAM32nzz0ZIhpLW9TGZoC3YRhucqgWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796556; c=relaxed/simple;
	bh=2rJsu8vzK/fLIB+9E81Ec7nDWMQNN/NvO/jTUywhykQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1jhQMQMDVG5XSqu+1eKhiJravZZrKeG4vIWFmIl7WByvHIIQHAMlvgivzRZxkBJpckLY5arfSK5AtsBTWc0SESoP5tOeUN/MS6iVyM4iu64CsOeByN+cIhHDQ9AApLg0RTQYHCuDbUR4XVhLWtZUWyv01yAVRy0kKlskRNDIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM+r2tNw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM+r2tNw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848479c9bd5so3309577b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796554; x=1786401354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfXwqy1TgncBxC4BQibRgbXUjLq//9HNL0TAoHIeLvs=;
        b=dM+r2tNwhd0e2qF5BkT2RFprmsQ9Jze6/ReI234cQF9wRI89oqUE39100KIjAxtLhT
         ECusBejZ1Am66Jsz4aLb1OWdeJeqx7i+GUfg0ruPcAA8rE3ksvJXM3u5zPXO55IOganX
         mFes81PSBwBqWaMe7qG31IULg2d26n0LKxx/OihNvY6CltjwefNClK/g5SfYiwRIttnk
         lVFwgfKchAKaXcLDgokk09jw0F5Lrdcb7OvzYp0X6xjnbvEVkRL8/s5SpqvK80EDSc44
         EpXgn70LUOpgdLd1tVXbIFMysqkf/IxiEXXrwi28b6WV0wfTfn47LtNVrOq8LWP1ZRWA
         wJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796554; x=1786401354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfXwqy1TgncBxC4BQibRgbXUjLq//9HNL0TAoHIeLvs=;
        b=VM0393VdmRUl/FL2RYFstF6txea6GqMj3gRscRapm8SXqRqXqnNjM1VMddl/wJIoRd
         lZFckDoJAPL3WDs9Jsydjy5pXx9EROOEhOStx9LYdywf7tGWinaWbzhxQF3YLs5wayV2
         hirfizNYc2qeAUhVZ+UbyZ3MdBgI+/KW1Y0UiJK0u/0M03k3ZRYOL6qNfYOQec1ll98c
         4eTI6y9d+EcyP2Mgzx2r4ZhF0LtrZkp8gpzdCoNPsMu8Ayv16XfUscR+IOu9vkP2Yo2P
         BjZi2INVspojeFt4L+il968TDC/vE3PLJ4r8c2EbbNwUZNBR56JPrW/9ngqRkkMDei4r
         9azw==
X-Gm-Message-State: AOJu0YwrKNO6A5sXjFbZx+IuUPjiEfpP2CwAdj6Pq49wzY9s1sp0kQVO
	LKk9qeSoyh9Iap67Gp0MOEBdINYnibxyzqHTfqpOb5Jo6n3pfvPJCrfuCUbWgQ==
X-Gm-Gg: AR+sD12KiOWcYqOXCjneiTQ4D0q8BHgfXASRUXiVvUj9NNPUDg+TfklWUitLwFgJTwy
	rp8hDWP8ch/P0//ga8JUHtNdkYgbWVNJoNUL3CdxIdyC86c5Khjkqw/qY//pPrqPcl0vLV9y/Dj
	1UPXvjGnkRbw7NhGDS3o/7UIKCvVFuROgulzXaI1HozxA2ZWuP4izUsXctM2N6l595Z9k3VkxqJ
	VQH6/geSWD/kn05TPoQBRUHuSqRm8s1tBAAYRvpepIvIccBR0Amjuklih8pYFrWX5+vYK6HYUmZ
	n4HNzx1DUjlHqQylZJXRq6oejVX5ETLWPWOtWoccLepI/QqU+UOZk2yVJOu6s4iGrK6xpHcOfHI
	NCTxO/x+ezggWI5ZdxIgcSpfMdTrSIF/uZvX8Or/Hyjzz8A0Omy5ADmPhw6RL7gbHJE3g2/XO2n
	XwXsLTnkSA7grlL4HGRsDajmJGNUgOzK/L1dSH7vezKX6Ve8ptUsmVKiMXfPVnnKs27b1dFG6nC
	3KRV5rEw3y0E70ojzKgMUk505HtKOuFTeOkkqyASalhc5Gy3N1Klp1vBv+FB1AmnTDXo959KSlo
	YPJsOnjcfRNOscXiKgEwM1dVB03M2uBiG6s7lRT2QFC6ZczX
X-Received: by 2002:a05:6a00:1d87:b0:848:6537:580b with SMTP id d2e1a72fcca58-84ee48ef506mr9925893b3a.51.1785796554374;
        Mon, 03 Aug 2026 15:35:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:53 -0700 (PDT)
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
Subject: [PATCHv2 7/8] gpio: ppc44x: fix undefined behavior in GPIO_MASK2 macro
Date: Mon,  3 Aug 2026 15:35:38 -0700
Message-ID: <20260803223539.86303-8-rosenp@gmail.com>
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

Shifting a 32-bit unsigned integer by 32 or more places is undefined
behavior in C. GPIO_MASK2 computes its shift amount as (gpio) * 2, and
for pins 16-31 in the OSRH/TSRH bank this yields shifts of 32-62.
While this happens to work on PowerPC because slw masks the shift count
to the low 5 bits, compilers performing value-range propagation may
assume the else branch is unreachable and optimize it away, or may
evaluate the shift as zero on other architectures via COMPILE_TEST.

Mask gpio to the 16-pin bank index so the shift stays within [0, 30].
The registers are banked (OSRL/TSRL for gpio 0-15, OSRH/TSRH for
gpio 16-31) with an identical 2-bit-per-pin layout from MSB to LSB,
so masking to the within-bank index preserves the intended behavior.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index fd543fbb959a..9fdc84e922f4 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -19,7 +19,7 @@
 #include <linux/platform_device.h>
 
 #define GPIO_MASK(gpio)		(0x80000000 >> (gpio))
-#define GPIO_MASK2(gpio)	(0xc0000000 >> ((gpio) * 2))
+#define GPIO_MASK2(gpio)	(0xc0000000 >> (((gpio) % 16) * 2))
 
 /* Physical GPIO register layout */
 struct ppc44x_gpio {
-- 
2.55.0

