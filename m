Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447001;
	b=gztEMCCczGF6vdk+ZcZk0C/Tua+xVnjJae48jEyhOIe4FBs1YMtcDQDvViaM9oBPhU5+
	 w/Lz4Qa7js9DCxqMVpmWMdaYeF4DpFdzn1pA6eeoNkO4U8Oqd51HOAFl2l6/ytpJ6fnWz
	 rX1rKYwY1qcgeY6NlKCpA+p+1NPFQ1nnyixkatUWXN34fOk0MjrCQTVrwUbpg9CDPikh3
	 BIhl+493p97ifitgQK1wZ+gQuOo9mwled0MfZT+AM5yrEy/j15nxjqrlZjaUE1qRFQxoz
	 7VQoqOmAYrYCKsgyTpe9iLmqsajNPsXGX/7sHbQhXBVZOviNefCr2XDsMa/XNlHxCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gt9sS5b3wSu8cyzhasBzSCBoh7vpVmGfpzabjBQAwec=;
	b=iRQodpFU0qxzglm5dz87AV20WBeoVEpXXcAsemPPGCrwsQR37QKQ6zfMi65ZpvesPN63
	 TmItglCdvV778jZFlfgINOzOCr+sOtoG1Eof8PORKQNSy8jTx+WOGV7vfwgPRgV5OSeSl
	 lMUEm1agVYA0UGSQA/lkjpcRd86i8+RzZIQ2UeD3NrrrUAdDtw9qmIdxVtEkkNvCRyN/K
	 7ilq7/e7QoAGhecIDEj+ledIqKE/aIkTNWYzmHf3tGzRromAtaQQR1JQ4VeyD0cRmgdqv
	 4YXJhCKTM8ctHuEQdAtVW53RDMXeXDT88IoN9ElNZSSUlcePX20eYKMBGZykqEHR7Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8ejuoNL;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FE606A31F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28FE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8ejuoNL
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so682145a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447000; x=1796051800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gt9sS5b3wSu8cyzhasBzSCBoh7vpVmGfpzabjBQAwec=;
        b=J8ejuoNLfUDyPFb/pd/nAD0g42VEZ8fMNWARYRf1CGyd1u5DTGi7y6aMHvqEyfVRuD
         B9zJ9yAQEoUEKQ+veMlZldMynWGxc3C/X6nXDMThKA5tlg1Y29IuRSx+6W2LygOsAZ6z
         aczeSaBOTXHWhOq8AYb4CL4iBhrOrf6Ci+J8dVPt5PbX/gKhxtzXY0DcMyOl0ohA/Q8n
         fQSl2rQ/fwoySCfzuYcmyr69fFhwz7XB6Z1phWaoy+zuODEsC3h2LhybS+MUdh/Z81cG
         kp9hBlHZCuKRkBHLjnOsqUTnTUO3Ggs5TZrWsCgchowxW7U9irXWPTdd5QvZsTpTgZRw
         Z3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447000; x=1796051800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt9sS5b3wSu8cyzhasBzSCBoh7vpVmGfpzabjBQAwec=;
        b=1U/LgbMWdn3kSqdxJEZsw3VtQxBIR7VTq7MuH8MpJID4kRMhNFQ1cCBAV7KL4omsOg
         dtJ9tBRmUBrg4Fc/9ledyuUvb3dVNsICTvWiHeN4/b69uGqZHHNJN4YLxReNOBdEcPtC
         XXjCrGkJXrdgyiPfeKIxvYF4SDvPXIu5teZIou84OHa9bhi5MCrRKDMUhFrFKbFmbVDN
         B7uux0SWEo4nIO1ctLKdpKcKADo0CPfQaWfuiie94mK9wxG5iiZaQCMNl98w9GWXWVZ0
         R1X+naw/NJ+T/sWAbFtCdudBfVrCnzyC7msnIg7Qr4JeCvBdSIuM97wpSvTZMDAQCVqu
         iWDw==
X-Forwarded-Encrypted: i=1; AL+hErHRE3gAPgVic/1QFuFm4WSMcc+b6U8E9SDNlaKYUj5R5uDFPGKVqvPnIfLdSk/euNNABEN1sqwIjee5@vger.kernel.org
X-Gm-Message-State: APuU4Z8SQTAI6jGJdsjrhBxacBbz8tEjuiOdcyLJmnD8Wvlnx5Rn1/pF
	MgCdvEQZXl9bvZswDnH0WGTg1tB8AMjSD8QwrQx0JMkbLYeevzCa0B4r
X-Gm-Gg: AZFdTZdkNP1lJEw8txPjvBcmL5+g35o17wnpPbV2Cra8XhVzxlgpZL0DdUdmasXX7oO
	ynIuMFZ1ZU8iAwTJOKUbzi02nqn9eJhdzXUabcWhxXs6qqqpJOGwEyp2I3xBUv0MMS7A+Qckmd0
	mEczBC1EO3kAfZChWv+X0DLDn7jY8tQp13rpeMZquivGemiU+nNBybjL8epMRBgpIRbJsu51zpO
	876aroXvdCWNyyoD8NWNNjvSzpYn3MhrxDNXN8L9MsZn4KPAihN7+qTTrFNtlGEFJK1nOqgCe//
	b1BsSkvj7kW2h+4HBhJv8sGmGkN5Wx/XH5jAFc5YIqCzJdeKvR/YbrbPEenqgKy8K9tOSrHTt8v
	OGLwi5pwTSy4p0yb96INrGUzmR8TLd+SCslf+kGPPZ9JVCLPMtmvSALnuxIuA2bjhuF5HVIdlkC
	fUS1bnqxwSsd3E5TzTW0AHffN0BOZY/fMf/Juj64n4TuS2gI3Rxj5/EuUlhJUDbchverqeqcZtd
	g1CRrW4T2UvqFjoGJQ+f8y8tfj0ctpRtd3kvT5pr2bL76aZhCmtIk5pNLaa7v4qQm6SJykuzwy2
	KozEfVc0ZUwTWd8STePdWTPjuFGZ0/YAFU9FxdjG9DhyBfutNuc=
X-Received: by 2002:a17:90b:442d:b0:3b3:fc9e:561f with SMTP id 98e67ed59e1d1-3b41c852ce6mr11297493a91.8.1795447000231;
        Mon, 23 Nov 2026 07:16:40 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:39 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:14 +0800
Subject: [PATCH 1/5] pinctrl: tigerlake: add ish_uart groups and functions
 for INTC1055
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-1-f2322a91686d@gmail.com>
References: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
In-Reply-To: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add ish_uart pin groups & functions in tgllp_soc_data for device id
INTC1055.
The pinctrl-upboard driver set the correct pin function corresponding
to these data.
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

