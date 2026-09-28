Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ADA3ACF1F
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577510; cv=none; b=Sk1Ks/PazHPfrH2waoINhaTNDLkHRlq21Nj+RJTFwoAbr+SB+82QamK/NTwmNOVqStOvg1c4UXiIQXTuTWgKb4zFAN4TnCrudDsgFNIcGrAfqzHq5Gp7gADRAdIi2vgBszEaM+mYAdkit/TbNdiDjlxarCRREP5VIsKuPkW6Q+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577510; c=relaxed/simple;
	bh=5akO349ziHHQzeFqJy7Iek+neIXejMZDqEsEI4U1ydw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ELBxDukRa7FYBvh/R+yAgCjh5XECTqfpDambEC8ZYNIm0Hp64/swMnqO60sFFBDpsFDaB4NF0itHFMVr1AGDZv7qb8EiQQzMm8wG0xu6aTJzMv42v+1bbkHeLsWtn4uaD72kv1UNbe18eNzL+wBtyzexJHFrnf1EZqKwLFQaO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwB23JKN; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwB23JKN"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso2536048a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 23:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790577508; x=1791182308; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EJUAZOGIk1GIP9JvusI2ZWKGypYDZJOnDVNHDexwyc=;
        b=nwB23JKNa3LXNkka0N86Hbv9um1DzzBs36tH1eY/jEzsXIF+EDL3OnOgeAz0q33fHP
         oQN30V0igkAQLKhuUlw/p/GlUVV+ApACW9o2rf9ZO8uZ1HKNCtwfpMa/BQnE8lzQrfA8
         YfpSi3tq/SVL5koZIKqh/02KaCHbemoLfBnRUXHyFqngomFm1Ac4q0285zkEAAvXM0QS
         waSi+1rEn7ux3iBkO8qcODBjIFriqG2xm0Yni6tqStXSPetKcePo/wEw502nyAMoZ/4Y
         fMKm1HBP0QAGRnvsRSwXABiWUUIhorpBECVRc7MaoVpetoLyFR6LZh3RTXeqaif485qV
         4x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577508; x=1791182308;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EJUAZOGIk1GIP9JvusI2ZWKGypYDZJOnDVNHDexwyc=;
        b=yPibbvreMHSMoNoCk/uhlMfYmOdsF/XnehExU8wmkdu9MH5j9XC+1AYzJdRqjdH3BB
         hGGqjnqSK3meQpTZcisJVfqTgEoKrAot+BeWCoc1hLeY9tFAe36pcnL1FcL9UHswTsvr
         mmyjr5NvWmI3h3delaP15iRw/uUXiXInobNjgpy8uKfPRIHaUEiisZIKyJh5UUlWOIHJ
         W+OjKK5sXBgpBz2ulMANkvUbK2C5paDwKCcNoxRo4miulPWOx9ZFlEWuSU9lZifwgo79
         yYQvrq6+kNtS2hi2TOJr81YIr1jLBaov7QeDNySFhGCXdU/eN0ZEjiDXtxk/SxRcqOqV
         xVJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWq1vz4P2PrJix9CPTnfiFcDDaXQ0XuOdq3qW8W8hTH12Wg4u4AZizuzffhdLEqdnC5Tl08YNfUYJF@vger.kernel.org
X-Gm-Message-State: AFuF++n/0z3ZT2Y+TFljnohqxXZL/CdFz7JQzI6jy/qGwejQFKc1UClt
	NNhxvtc7DOYUtmc5GHsqsZ1VYk14daP5hyMbcCLFVTBRupWJBfC2aUuUtt487Ne4cCt8rLD59qs
	k
X-Received: from pfbdk6.prod.google.com ([2002:a05:6a00:4886:b0:884:61ff:9f80])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:68c3:20b0:3de:140a:3e31
 with SMTP id adf61e73a8af0-3de140a43aemr6197451637.49.1790577507755; Sun, 27
 Sep 2026 23:38:27 -0700 (PDT)
Date: Mon, 28 Sep 2026 06:38:24 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928063824.1386524-1-morbo@google.com>
Subject: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
with the 'size' field, which represents the number of elements of
type 'struct acpi_gpio_params' allocated for 'data'.

To improve bounds checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
attribute.

Analysis of allocation, assignment, and access points shows that the
pointer is never accessed before the count is set, which guarantees that
this annotation is safe and will not cause runtime panics or
false-positive bounds checks.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/gpio/consumer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fceeefd5f893..2b80cf7aa7e7 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -667,7 +667,7 @@ struct acpi_gpio_params {
 
 struct acpi_gpio_mapping {
 	const char *name;
-	const struct acpi_gpio_params *data;
+	const struct acpi_gpio_params *data __counted_by_ptr(size);
 	unsigned int size;
 
 /* Ignore IoRestriction field */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

