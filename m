Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E839CCEB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048686; cv=none; b=ow62nIFh22nyOEyccnjZReJpyyTb2bkKY5VL0wfIIZa/Yp8F+2ie7Q9iHtAVROGF5KR2L7usosA5L1C3ojqum8T0GeaP4dd84tyOfLdI4zK4NL9nVwOirOkCBLOJR9VpDHCxI8O/u1ykpk6h8hMJ+aDzHCSh6qWwJ0UfkiZ4rLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048686; c=relaxed/simple;
	bh=AefdgQSpXV3ssbjNUmYM0AzKNLGHbhpbCMLs3U8ZwXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Avzq5QSP4GilsK9nfS4CKpZgnhCpYt1E9WKx0r1KunWS54KfjBfO4r0uVMGEIbOxGXiKIyKvNbBTwvva+gKxAi567W3t+Fsg7eKKiMKymFOwYKYQ+d6JPn+Pk1xmbHG+i4EkegRe8I0gyf1eRqkMMpSTUWTWSHEnSSZ1SXjgW5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOo7+4Xh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOo7+4Xh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b27c7451so14525535e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784048684; x=1784653484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxmDEh/NMeO7bStSuaxaeVMeCVKpnJ6+/yPoC+CqNQ=;
        b=MOo7+4Xh73HIvSEkRIbmQzunOulrLASHmhd1HrTG5itb0EgbgHYCMA5Owdgmh0DVFc
         P0lLAVAl9dMxDVvAyEfT1iqJGrZJ+Hq1TSnti10oKTyzsjS9GjcYq6qnCX5J6urS9DBC
         SAUCC/vdKZ0+bmyyzYpi581mRTeXgIPGKrDh2qWFdTSEFGWJ0H5hHP5DLFh1NCTb2kus
         Etk3Lf6osezLIBZMENqCT2KNmN6D0HfeMfE6ATQEBh8DxSv5+ktCzgjkv+rwbZXSAuxL
         TFckmK8I1vNvlfY21HPKLIA+mPkGq5OR7O/oHetHp4Zi+RYN4NQgdSIkhqxWCp1hwJQE
         94bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048684; x=1784653484;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uxmDEh/NMeO7bStSuaxaeVMeCVKpnJ6+/yPoC+CqNQ=;
        b=RJMEF4jVm2M7ys1GSr4kBv+p9sioCXDv39XULqnw16ARDuGFwyuBU77hMMhmRUsDpz
         OLkCItfcMWDihn+7pCYp3qb8XltqYrF0xXRTOemD9BLU1q5wD56KKOi2CGrxB6mhhPXy
         TsY7cQbmWQk7KfVEJwbFcW7R1YbYmO8Cs5Z11tb28KC6wI39jileEdX7TP1jMLeboAQa
         EL2Ni29FnygoH/zfBZ0FcoIPrgevCcT+OZ+Tpyv6BeMW1UXJMTmSS5RrWIDosWzVpH9V
         VADiCBiX2VCEm7LR8+dqtZjGRNnMeElpHLrYY2jGUF940N0iKVvCaNaHjr5QqwlMiqB/
         nemQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdHzcGWGCF09BX2MDyXlZxu+UbX4LLKo1cMGjLtjT+btVGaTGsSJMtY7H9gnwnKTnpH4LzTRP+gWny@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNhiCP347hOV2jhzqwgMWWPQTHqZWH9XvWnXoEJi6ltR3Wsed
	Eu3sqnJ8hlA6VGQbLUBGLla+UJujkJDepkjNqZjHhYaqiFW8umneeP5D
X-Gm-Gg: AfdE7cnu9Xq8AcgsYjnIu+w3a5YWFluPIuiE/XngXtoV0kEoh2f5264rmeVnazkNgxR
	J9FMRQt1TbsE6CpRXjGJF3/Jn4AoKt5k7FlS28uk7XPTBz5qVD+NvnOc94vr/Mzz+TwGTtlHsZc
	ywyTQ3oBygZCtE2Zwyk85Mgoj1+yRsShMNSzNenmZQnr8cXbpHgXKiuf6FQMDqXkf1bB7BO3238
	9SyjsGkLlzqUGvLcOapjU+l8hY1jbFdJSjwP2e6IhAEazYUqI1RL9BFgAN4PTSyZEYFgscnB9fS
	n4O0aVPPTxKrsVFlJO1BYDFyUshCXTckDL1yPA0n5kshtwOFhni9KV5Dcqdo1OSo0h03du1j4Tg
	dq4Dy5EkYOjVwPqltE7fpwzEsblIpcYSt9wJVtFcdXMS8vxqchvEIgF2XEm80/VgdfDKVUPuUMW
	HYXL56c9TAGLk=
X-Received: by 2002:a05:600c:8b53:b0:493:f13c:9c03 with SMTP id 5b1f17b1804b1-493f88dc201mr134008955e9.19.1784048683759;
        Tue, 14 Jul 2026 10:04:43 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953b8d4352sm1710775e9.0.2026.07.14.10.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:04:43 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] gpio: bd72720: make read-only const arrays regs static
Date: Tue, 14 Jul 2026 18:02:58 +0100
Message-ID: <20260714170258.186766-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const arrays regs on the stack at run
time, instead make them static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpio/gpio-bd72720.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd72720.c b/drivers/gpio/gpio-bd72720.c
index 306e23411209..c124d964e4cf 100644
--- a/drivers/gpio/gpio-bd72720.c
+++ b/drivers/gpio/gpio-bd72720.c
@@ -85,9 +85,11 @@ static int bd72720gpi_get(struct bd72720_gpio *bdgpio, unsigned int reg_offset)
 static int bd72720gpo_get(struct bd72720_gpio *bdgpio,
 			  unsigned int offset)
 {
-	const int regs[] = { BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
-			     BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
-			     BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL };
+	static const int regs[] = {
+		BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
+		BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
+		BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL
+	};
 	int ret, val;
 
 	ret = regmap_read(bdgpio->regmap, regs[offset], &val);
@@ -111,9 +113,11 @@ static int bd72720gpo_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
 	struct bd72720_gpio *bdgpio = gpiochip_get_data(chip);
-	const int regs[] = { BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
-			     BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
-			     BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL };
+	static const int regs[] = {
+		BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
+		BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
+		BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL
+	};
 
 	if (BIT(offset) & bdgpio->gpio_is_input) {
 		dev_dbg(bdgpio->dev, "pin %d not output.\n", offset);
@@ -132,9 +136,11 @@ static int bd72720_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				   unsigned long config)
 {
 	struct bd72720_gpio *bdgpio = gpiochip_get_data(chip);
-	const int regs[] = { BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
-			     BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
-			     BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL };
+	static const int regs[] = {
+		BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
+		BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
+		BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL
+	};
 
 	/*
 	 * We can only set the output mode, which makes sense only when output
-- 
2.53.0

