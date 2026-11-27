Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810189;
	b=boz/jeHNoTVqozMBxnLjaWlvkWxUNG2JKhlRrx8ycfb9Eo81jspydazIfHDc6l69wiV5
	 cCOubdtswcNZeT4a6qTOdsnC7jhOpcGJr+cvHIMrRszX+aJdJouuK4XUE5HahBpTddIL+
	 m30PE1zK6Cjh67TPztkuzUuV1qg2VHAw8rb9ekuDfD/lfQtMGTPShzHaLbRP2xfxxLNaf
	 oXaH6/VzhK0MHGMkL+uui2W1gg5/T0siAQ7+buqY2+dNJ9c4DEBd47L0SFu7xR5xIp46f
	 kLzHUCuJBlJ3Labl2gY2elRWb+fQkipb98XgAmjaOh3THlCncuZAeS8DG9NzAkTvjxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kzzWI9nlajm9/4d7lGpIikgLMcmnAL+4uE2Ldwk7Ho0=;
	b=VPh7wduU8EQqecbAl5fgaJIbV0l77pnyfMkohMyjfkDqdoVD8xTG/d5aiUuCEvnapSYb
	 SofVwKDdkm6eQcbmixFUf88cTCr7iwlIrUwtKICkoQgdT49V9juCiyGYZBw6qIhmsddjk
	 qa/5UR2omi1WRgoDB0JgUMQeggGdrVQFRwkPDErO8jN9OcmzAUCMlUZInazRjWyVqmG/v
	 H9gZy/7FHIW5YW4/6whjmRtk4IYxZTHq+SCnTNeK8K8qxI4DXWgGDofetmo2UYUC69TD2
	 /3mcssjvgP1Qko1VR2dM8C6fiE+KfeFOX3OL1P6wwyTPZX2u3Iw08N7t7ZL+X8gfvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bav15pNP;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE232606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 20:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE232606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bav15pNP
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71ab5e64742so5154867eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 12:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810187; x=1796414987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzzWI9nlajm9/4d7lGpIikgLMcmnAL+4uE2Ldwk7Ho0=;
        b=bav15pNPTVvs4SPHiDibV7UqH7ca4sMJsZewlxgt+npTw6W9z5KKtI0KtJAlr1jCE1
         uIvR2eLkUxjE8p961znrW6v0vWIjNxc6sFXVucm7ze1Q4TSFkTnvzbHAwLDyFFJowCTw
         NbL9a2a+cgOWwXOPdsbE9Xx2fTThYC2iX0mviGY+4nhH5B1Mt9TSh2G3ifS1ZeDS9eTn
         f7ZZL3/5NHLOzuMStjvKVEosC759bdGVgeeH/pM+x3+qgzI9eQwnzuUBi/XlASiFNscJ
         C9g8YJ8HbRxJljeHWhca+K358bXTYjccQBmh5qEkm7BaZUvcFaxwcmI00pm1OYs8sEsr
         YGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810187; x=1796414987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzzWI9nlajm9/4d7lGpIikgLMcmnAL+4uE2Ldwk7Ho0=;
        b=PQz9vCAJdot8khlP+Q/bKQu2s1LpSWEO6fV1KxBg8+TJgFeWQZBnpyO1e7nfDpMwLT
         htSGuXa9gUNhfj8ypt9JkzPscBiT8RnLYC0izxrWrU2drHEG6Y8yPTRHpqspoeesase8
         TmumqFlwORbEG5DxApDN/C8NrJz72P5t5F3DOmWEBoIe5lG8EqmC2sheQKVW5WiEnMpw
         W6P9Rtluap+q/uuBJrhEb4vZkLzgF6AGMde5rzJ/amL6q4MqeSYoF5YxvSMBxJUyahZj
         Vun4UeFDND16Aig1Kc95LE0oFFafSKqFJhfQHMVpOZbIJZ1lvZJJ+WosoREV9pxG4Cw8
         mkxA==
X-Forwarded-Encrypted: i=1; AL+hErFPaGn/EyDGADKs8/mmRl8uqC9oZ133Y3tICC6YDUOtjQdSRLzck7gndwfY2LTRxmtPXnXQ6RwHaYZK@vger.kernel.org
X-Gm-Message-State: APuU4Z+JVXu+FWIhnrshNFkReHUUrSNQyP+x3EMmUs9zG9a99cmPWl51
	wOIbNo6cxIRRCeFefgyymCS2cjSMzUAeUd7Oy43JFWgwOCtc18DjzsTb
X-Gm-Gg: AZFdTZeH5vrMfEgA7PWGwqSJrSkiYrLX70h+FQ2fhvLguzreYii0TVzVO75otCnvZFg
	CVN1Aa32RiiyN7U0xR/kzP+HCwBFP9EWhCCQU68WzSlKMF4c1FzfaPK5EtgfvtAmzIrQNhWaNth
	urZQkjf4b8MOJDUz2BItJfRtNSTHy30YD4l0GvShIRQz5sjevhDdX0Pnp0fPIkqwY948RwSDkd0
	NNTcmgSR5/gHFeL2C+XqqEi6N9lWnKWOEbEpAc1ZYlnNM2P4x3o7ucqLXxhNrgYUQTAMU7B0xqh
	G7Fia5zdw+GLbmuvgIt3+KqVAWIMgHt6g+Cjoi6IrXenPJ5eUwCFNxTY6BPwoICy8buh7ndTrlO
	aEmaCczYYxfPp/zpmput8UXEOD2gCgf8b6Lu5+f7vXg7u4vag0yLW5lA90Nh4xj+cqSCIA6Obvm
	jQOv22fthsUi0bNnAnjMr4G8CmP5Sk//xx6FXJSsZseENT0OgfS2h5idDWjGg7yMRkBfJBkyXng
	/GEkErd7ptG5DMJbvjrzvsIQJnB2sM/oQYbwo5RmgtwYnxslqW2Q9pmOUG5Q12wh5fou23rnYwZ
	yA16Hp38lxD95zRxsG619wTFQva3/w==
X-Received: by 2002:a05:6820:a508:20b0:713:da3b:8b2d with SMTP id 006d021491bc7-71b39521f03mr14151731eaf.29.1795810187567;
        Fri, 27 Nov 2026 12:09:47 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8590ba0fsm4834662eaf.2.2026.11.27.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:09:46 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Sat, 28 Nov 2026 04:08:32 +0800
Subject: [PATCH v4 3/5] pinctrl: meteorlake: add some groups and functions
 for INTC105E
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
Message-Id: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-3-029071f417d5@gmail.com>
References: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
In-Reply-To: <20261128-upboard-pinctrl-add-intc1057-intc105e-support-v4-0-029071f417d5@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add i2c0,i2c1,pwm0,uart0,spi0 pin groups & functions in mtlp_soc_data for
device id INTC105E. The pinctrl-upboard driver set the correct pin
function corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index 6fefee7827ed..870658eac91d 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -339,6 +339,34 @@ static const struct pinctrl_pin_desc mtlp_pins[] = {
 	PINCTRL_PIN(288, "vI2S2_RXD_2"),
 };
 
+static const unsigned int mtlp_i2c0_pins[] = { 122, 123 };
+static const unsigned int mtlp_i2c1_pins[] = { 124, 125 };
+static const unsigned int mtlp_pwm0_pins[] = { 208 };
+static const unsigned int mtlp_uart0_pins[] = { 111, 112, 113, 114 };
+static const unsigned int mtlp_spi0_pins[] = { 88, 89, 90, 91 };
+
+static const struct intel_pingroup mtlp_groups[] = {
+	PIN_GROUP("i2c0_grp", mtlp_i2c0_pins, 1),
+	PIN_GROUP("i2c1_grp", mtlp_i2c1_pins, 1),
+	PIN_GROUP("pwm0_grp", mtlp_pwm0_pins, 2),
+	PIN_GROUP("uart0_grp", mtlp_uart0_pins, 1),
+	PIN_GROUP("spi0_grp", mtlp_spi0_pins, 5),
+};
+
+static const char * const mtlp_i2c0_groups[] = { "i2c0_grp" };
+static const char * const mtlp_i2c1_groups[] = { "i2c1_grp" };
+static const char * const mtlp_pwm0_groups[] = { "pwm0_grp" };
+static const char * const mtlp_uart0_groups[] = { "uart0_grp" };
+static const char * const mtlp_spi0_groups[] = { "spi0_grp" };
+
+static const struct intel_function mtlp_functions[] = {
+	FUNCTION("i2c0", mtlp_i2c0_groups),
+	FUNCTION("i2c1", mtlp_i2c1_groups),
+	FUNCTION("pwm0", mtlp_pwm0_groups),
+	FUNCTION("uart0", mtlp_uart0_groups),
+	FUNCTION("spi0", mtlp_spi0_groups),
+};
+
 static const struct intel_padgroup mtlp_community0_gpps[] = {
 	INTEL_GPP(0, 0, 4, 0),		/* CPU */
 	INTEL_GPP(1, 5, 28, 32),	/* GPP_V */
@@ -380,6 +408,10 @@ static const struct intel_community mtlp_communities[] = {
 static const struct intel_pinctrl_soc_data mtlp_soc_data = {
 	.pins = mtlp_pins,
 	.npins = ARRAY_SIZE(mtlp_pins),
+	.groups = mtlp_groups,
+	.ngroups = ARRAY_SIZE(mtlp_groups),
+	.functions = mtlp_functions,
+	.nfunctions = ARRAY_SIZE(mtlp_functions),
 	.communities = mtlp_communities,
 	.ncommunities = ARRAY_SIZE(mtlp_communities),
 };

-- 
2.43.0

