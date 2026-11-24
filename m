Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540275;
	b=R6+YRo6J9kp40RHI+iLWryygUsNnCLqjIjm1t2YyagRwf74RvtrxcFWD+5rRV60y3iNs
	 Io6khjtEptBVuB550tfTM3BJjzeS5BYyrBKueyTN2Or0DmZyRE517UN8KH8KVIS9mNohw
	 wxPMJ8hfr/A62qlKQexVhs2sTQAQweZw9BZwTG+VTVpJyWzi1B2p7Ax1PgIfBlJdLk/gp
	 n+WDVTcEBJsTXU4Dn0G7PoCgoofAW0W1wO+kfUwbnOV1BlEJenYz6GABKQFMR9bWBDEjh
	 K0iJnqzAKiRAfNDbQKTia4eQJRV0k6wMhbaK+zqGG7t35nU92i7fyzY69IfpOS+vPXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FkKsNl+hXnNpxWzyhVxfdlcQJzmEYt/skJae2DKrtv0=;
	b=o1q5jMyrZVcM95MTHqYrdEp5cxA1Xz6Aft+Fb5b3NmPP103o02TOzv+esNeiz328UynD
	 cv3ud/tyXP5tdYQGD//2FTxIcsTz8xC1kWPgb4zRWA2T+qErcDkk9gsLuzNlCJkARz+rW
	 BdOwd7SRSu1h4+tvD35uPUr/oxlAd4JMX70AYtSpXFZNvfRfd0e/ssLkzWtAj2msxsngo
	 1jLvpyveS83V3Vr+M49LJw5LFZgZoWOOi0+UFNSI+VIjpsKI4dULqHc+W8atPDjUL1KKK
	 pX+qKMI22EtiCp8un4j/gdnt/yQw15AwJZYXyG6NxUHhm1WAxO3fK8tPJ/CCe5zmBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R+hD/fEU";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB4606A339
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FB4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+hD/fEU
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843b6f8e2c7so5291949a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540273; x=1796145073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkKsNl+hXnNpxWzyhVxfdlcQJzmEYt/skJae2DKrtv0=;
        b=R+hD/fEU7z+WkLI8rht+BbJc71Xpsy8I86Z9luAWsPbmifhbx25fkoWVTFfr6JvL8j
         S3TFkVWxBviKkjuBy3Kh46192AcmsZnSSXuEfkxRN8Q8m7frRwiIw1qzhKsJpvuoODZ3
         ZSYJfH45T4+SRVRLmB2cS43RrR2CYlZSt07g6lnkgczeu4zjsDYcwBPdFgX1TPECdcvT
         I3EYlo7J0sYf9ZU1WLic4dMlyaHTvGDxFkHMZfnwlLQELiN7P7UdGleaDZfFUCZ1Ae22
         yTwRqjxfoBYilBwnqJxwFvwQUL9wschT6W4xzxDtvBUsKFzbbfxIgjXaJ95P1l4Rbo5g
         DWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540273; x=1796145073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkKsNl+hXnNpxWzyhVxfdlcQJzmEYt/skJae2DKrtv0=;
        b=q1+p/5IigxAmu2lY5KlFwa47q0gLd5uKKwHHICY5zLgbgOHgAAqRfNBF7FMhcg2/bI
         5G3jS4mABkPfQkZLRwny0c77Cn0+uCs2Q0v5A61DbK4rCQ4m2Z/LF+rqX9+ZcrR33XlS
         Ytocw8kmWYeKr4QQiU3Ua33oFKcjhmaztpk118M94p9MMly1DXzYwLXeMN3RgYg8HbiK
         UmLQT39w4ApOWp2/B0PcwA9EKlpWYESFGPpE3RtiOz+rQrf3phzd4C53omH8SnN69rP2
         xTCKRIZ23PVl2PimGvNZyU9WUpxC41F5YcX/JVMlXCLFWd0m+jar3qjmvzB7F5+4jz4n
         sUqg==
X-Forwarded-Encrypted: i=1; AL+hErHBG4AI30zTFMTZ3cEVQJRjjZX0NpEFSNgfiCpx/nA+iFMTdvfWnuAedKnkICSC/TTTZtqdcm4JcpCa@vger.kernel.org
X-Gm-Message-State: APuU4Z/fxsU/dCce3C4+e1UBF9daUY6K7Fj7KOSm9AbR8uJ345h8xROD
	j1ydmiOu1mMzxDysXXiknRTsGUbsYkdGcfM0P8lODNt3RptmW8RvMPuG
X-Gm-Gg: AZFdTZe8ZqVmk656e4XZjuHZgkIx7CJlOXdM3ej0Y33M8zfBIirnH/qhTpf/80vDtwe
	B/w3yLchnT+aIBQbk85ZWXKw0DLW3Y4tAnWlPoteQIEcMnOTBN8azHliG4AeLKumxlolGPXNmtK
	QxwPnqeQ4e+eZWZN9MsrWmhAQbYnNw24S8bSXSRe1M86zR3ZXRViPHZOb1LAhge5NLjyHXad+B5
	bqhN9p8nFcAif0O4+5IjtPSiYNynp9vb/AhCn4NE/LsyUf0GjdBO/cGN2OnGV59lrUu/DGqYVWX
	GhYRTA2kqGxK59sIeXw7m+OHAn9aLlyrkoHs/ovgDDMrqKqNpzcQj4GtvT2U+wl2Wx4GcaMvIFx
	Uj41k8Agm/r63t+mQybqME4bX7QaSPdUd9KLMPW9DLVpw4SRtML1kC+x4m+6PSX3Xg+Ulo9Mtyf
	1JCaRev9y7q0cl7dmNRJrG0Ws9IADJiBaY4ZYW0qlOnT/Cv4uY+S9mxq3IJ2W2DLoDNyaunYPwB
	NAQItvKGawjacbHS4UYEOBdKuoiEoNUMn9OkgY99mhMaIVVMTFpdK5doS6RWmtJwR9T73pHtEiw
	ZHK3WjPWlLOWOPKFLl7C1JhITCypRQ==
X-Received: by 2002:a05:6830:680f:b0:806:d79a:c932 with SMTP id 46e09a7af769-863159f2a98mr15625777a34.20.1795540273303;
        Tue, 24 Nov 2026 09:11:13 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:12 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:37 +0800
Subject: [PATCH v2 3/5] pinctrl: meteorlake: add some groups and functions
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-3-c8079f8f569f@gmail.com>
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
In-Reply-To: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0

Add i2c0,i2c1,pwm0,uart0,spi0 pin groups & functions in mtlp_soc_data for
device id INTC105E.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.

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

