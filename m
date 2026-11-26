Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705812;
	b=dKXYLeb7a32PdfX33zDKNzIi2abwKV0VCrGZFINlsBKroKqA6pgbVu0GXtAflT1aNQbe
	 jx5w0DJUrdW3SABAM8TvIxa+mY9McUEMLys77hv0Zounh1J/vRMWNInMIcxvuc2pnzAT4
	 +3xM56sqSiL3u4d+gKgjgJ2Btq4rnL49wgEqKf45rRyZtUHMqF7haPSiAlrwNuQQSgPtI
	 sVvI+X64mQpt4K7WJ3i6AsTL9yTt83zcRrozPAF2w+cucO05y1P+ain5l52xY2u5sHFA+
	 /MKJJqrEXe37VuF/sNK9D5y17GOprlYr7jibE3l/lDCPGZ++Ea9YzBIMFvGSAj4t/GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=j84OpHdYErswf16xxVe5gz1JpeWmt2xrc3NrDU8Ooqo=;
	b=YyB+Aq6ZomdhKsHCAk5jaPzM3ORmItgOnKzpAmobBGg7ZT5ZWKP6jho5iLQOzwdDTCJB
	 7rQ44hvjZgECmmVgOAnMt6IrTcI3lYzUAis39Xb5l/USxXLiP+vFndAKBFmi8Y8IqV8HF
	 47NAwcz+E4K/zx+vfTq7YHpGTcrnxJ6vYWVxisNUrCBvOwWJ8NDGXHhJr0AvswwI4yWuo
	 2OhC+aIm1sSq1MqQuSwYrjka9dtbhZHKshhcJdsuNTU+XnnCPrWMPj2IxHS3v5bgzQgAQ
	 WVooERry59Lqt6RS1nkwLMsbX+hApANYf19oDAkJJBDCCxNy7l03xx9EVxIZe3E1Vpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY1Ok4a+;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB43606A339
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB43606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY1Ok4a+
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so3292927a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705811; x=1796310611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j84OpHdYErswf16xxVe5gz1JpeWmt2xrc3NrDU8Ooqo=;
        b=WY1Ok4a+1/aOYT7pdc/gnmKXDex0LIrGg7z/7FJvMEd4uN8PPl/SlaSnJ47hCGoYDb
         9WsERnoOFjQNXgWyZko1Get0M1iNzz85OJE5btgmWN+etyLdNTgBwfja3RgTe2NA7XRI
         hYdpKr/4E7w7kjfLB8cGJpZGk/FdY5hyAwPvhwn0S7sKx46cetPYHW8Vg9pkjmyH0gwH
         sp4MNOyBcKtY4Br2D6oxgkPWUqL6Xen12n3tagLdOIZ/E6FKUaqY95VEVTd2N/hXh0dd
         vXYiQ4r29TeN5Xup8SDsCU+2Hs1CfJSPJyHu7ne9CwhMAqBG52rJFQZmsdvTtWrhlUP3
         XreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705811; x=1796310611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j84OpHdYErswf16xxVe5gz1JpeWmt2xrc3NrDU8Ooqo=;
        b=EDmmcMPxsI0rJdtdKhXBkhJrnsB3c4kmRgB9htC0VFuMxa6GxZ9gah+yrVhUWPpFf4
         rccuglDfNYSaIj0ck42F2yg00m8BAAX1gxIXfCJGSfjkRVZJcMWy1EHEuuFRjLLcbhoj
         lwgkL1xXytO6uYCksj68NNAns//9UmXTwwkollUlRLfU+/4/LZ8F77dxHUhl0oXOHf3t
         iW7ReQqdMBbTXqal7uuN6U4Z2vslCxe5ZitVdIMGSwTpqAf/rlGpkzqScF+hKpdSj/k3
         PaZ+0t07JZq7XqbxlAm6JTJyKyS7nvc+RkuRAhd5AQtIHdzd+hAD1Jj/c2TqT7fb6tXL
         nDvg==
X-Forwarded-Encrypted: i=1; AL+hErE1cn1uHq2Lkfr4/LMo+9lAVoT/9eFT5zfhXAB/gKmXUrVnLb/cvDT7NliJRmM0Pr5dDW5xDQwBxQUy@vger.kernel.org
X-Gm-Message-State: APuU4Z89fKm4Wu60Uh1TqZuZlAPP0HIAeBQh6snbhMRrw3M9NaWlB5v+
	dvj+RvKXnI/5hB/J7vxuzV7a1aLOVU6TopDSdOTkAZHEg3h4/IxoU9cb
X-Gm-Gg: AZFdTZe/DRA16OEvqxwelNzIc1MHeshIuL7zGhjy7wFzvFBP3Mkskk2qsOjs5kEeLiT
	ygVExFj0okZfyKo8GkjaxioBGr/wVE6x5AED9FJv+IjFy9Huwaq+CCw2Fkwb8vfzxIFrnbkUNvy
	tAlsKEEj6rvLcLiw7jlqg5FM059kxNxmTUgISdZlDMjCAwPEUjeuh6z83Im55k1767okmYieGNY
	GMBbp0pHEzv9uubPpfgsAWCcUmHHhFMxlcPPQBUuqmQLVHLyLxCCtmhWRJOMiZn+Ci2PTHjzfyJ
	Mfazek97CyYxi6pYWCEUslbO3jTiHxUTrlpP6OpgnR6s3ovIUMZsh48f1tU78aUwmZuqhWgRRki
	xPkFVz1dC8GeoKuDsDBqOGiiQbnXy6U78ijAHOYAeVp673iMM8JFkGHpaM4jrWZBWytJZDK7StC
	mG4lipalCuoGvXlZS+iR8WDEa5peEr/+7RqIJ5SyTN3ZLyCRGcR+c+JOTCxs4VJcab4XSPq8QPU
	91XktDfFidVu3mDfj4CkuzGMlZJoZQDiQ0OIAHYjdLLiKGzCcQg6Fc/eFBxQRPviNNC9mZt0m3X
	SYvMfC65WjLLdpb06ZryTcgWr6tWBweETqLBxgjYxpmlXOcnvg==
X-Received: by 2002:a05:6372:a748:b0:3d2:df:1854 with SMTP id adf61e73a8af0-4014a27e7eamr17658944637.6.1795705811195;
        Thu, 26 Nov 2026 07:10:11 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:10 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:44 +0800
Subject: [PATCH v3 1/5] pinctrl: tigerlake: add ish_uart groups and
 functions for INTC1055
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-1-81d35c9ba246@gmail.com>
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
In-Reply-To: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add ish_uart pin groups & functions in tgllp_soc_data for device id
INTC1055. The pinctrl-upboard driver set the correct pin function
corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 93234f4a9bd0..80c847875faf 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -333,6 +333,7 @@ static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
 static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
 static const unsigned int tgllp_pwm0_pins[] = { 99 };
 static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
+static const unsigned int tgllp_ish_uart_pins[] = { 112, 113, 114, 115 };
 static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
 
 static const struct intel_pingroup tgllp_groups[] = {
@@ -340,6 +341,7 @@ static const struct intel_pingroup tgllp_groups[] = {
 	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
 	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 2),
 	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 2),
+	PIN_GROUP("ish_uart_grp", tgllp_ish_uart_pins, 2),
 	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
 };
 
@@ -347,6 +349,7 @@ static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
 static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
 static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
 static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
+static const char * const tgllp_ish_uart_groups[] = { "ish_uart_grp" };
 static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
 
 static const struct intel_function tgllp_functions[] = {
@@ -354,6 +357,7 @@ static const struct intel_function tgllp_functions[] = {
 	FUNCTION("i2c1", tgllp_i2c1_groups),
 	FUNCTION("pwm0", tgllp_pwm0_groups),
 	FUNCTION("uart1", tgllp_uart1_groups),
+	FUNCTION("ish_uart", tgllp_ish_uart_groups),
 	FUNCTION("ssp2", tgllp_ssp2_groups),
 };
 

-- 
2.43.0

