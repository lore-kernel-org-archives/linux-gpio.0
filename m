Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540265;
	b=LpAbOSbqbG5DK6U4qFesIIJlkeXtFRTwDVVP2DxE5g6wKfBQWoCGDriw4HYDPkUx+pdk
	 fmZh5Yal+dLT6BOJE+k45L4lg3dapDSC2dj3QVERb/v9cIRAP/kOLJh463eUzEZh1H7Vh
	 HxYHSHIwR9cPlCS5FLnOuvPAHTqkg67NKDrhUDZy5UXUEqITx4EIFVyJ4uGEgWk1l0Jlu
	 4Iih3k6ECSNUiTguXeyNuQQwWg7H9GLETLLX0xqypLysTkOxvvqLS4lO22iY3VGt6B3aa
	 Jo9HUYpI6l+VDGTOPggeJENrqbz7EmF1+fsAbAcIm/clC+bD5ncTCaKRVKXkMT9lUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Gh8q8mJVDQR+NyGikWkffprIeLzliNYmsHDBlbQMV2I=;
	b=FWKhOD6Hly3FayetNXSRxU20unwZLnAM9TonJVA7NNC1d/lRUI2KqGmaKHsDmDGXpLgE
	 N4CB9UxZWzMkgFeKuB93aOpTKWwgZjU1GZy1Uh8ULTXYLgoIsJR+7px2Ydpvz9qHbIITT
	 zoy/m7mRncOshrjMpZ56APjaPj13zGw7J9q8vz0q0/XiNrY9T2NOgm2MY0N4u3248TG5P
	 ojwpO8i6+OKL1K6ZZffYFpg8/jblCXNiD0/a4O8LiQx/qxLq1FAEvxc2mAqEl8hx1CsCd
	 8tERRqDxIcZ+eYINkBO+zW3iIamwFwKtpyih1184kWyPyIGQVexIczd+ATr3G5fUwCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5s8I2pT;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E598606A68E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E598606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5s8I2pT
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8631e07b756so2518363a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540264; x=1796145064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gh8q8mJVDQR+NyGikWkffprIeLzliNYmsHDBlbQMV2I=;
        b=c5s8I2pTtlki/5Mgeo9+maByeYBCj/Nris0A7XKIvhWnnJuV4ltJRCHcwOksUJA/49
         tuHThyzNyfs2ejOjbPw7ZeCn518qLC05KaCHw9SRsvcQpbS3R2zn5/vMoVLfhk0al9Ax
         AJT8s9QQl+pmlStwTDGNgYI4xlxlyTSPlBvvFFnDG2O1KgfBzIT3/wSWyIz2apoFYb5D
         RBuqsQmaS12Fv/ayvL8nRdwURBsRkBr/HhpojLx0DRbnm5T2cXgxrv1cOQ7IZMAj98Nm
         /yukBgS0PNXNfs8xRrY6Ts8/SkhmGmtVHbMNNWrIPKIgjSm1rcEAABP84v4wivEr1U/I
         gvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540264; x=1796145064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gh8q8mJVDQR+NyGikWkffprIeLzliNYmsHDBlbQMV2I=;
        b=i1XqG1rB8yv0fu7aO2nrxyFpsmKg7Ha616ilEr8Y2S+i6sMaTSqCE9HnRGztP5JNar
         bFR0Hmnui7RRc4cRZMxgXOevpzT71t9Yu19phwTNNDF51CUyWyVT8SGPKPz5IS8DhmTt
         AB2fNiCuDBDrJlUdXk9coi1IKGyyS/OVgcpXHvZZngb5FsGjECRe4mu9KnMMYMTT/MRF
         JCmvJx6Mdca5zf43BLyP9kfZZ/rnTlYeVrieL9PQ/Yhr+a+QW8lnUia7SP9sPYs7wucN
         qjnvHy09YVx9kMdhrBZOf16NeoeeVvkNhFfvwbfsFuPeMQm6dCWbuyGd3iDUCL9VVkmw
         ax0w==
X-Forwarded-Encrypted: i=1; AL+hErHr3jCrhiR0H+idfP3aJCMw7LQx95rZWXW7z/RxjkXqEjJIoQlo7VGXMBTSkc2NZqsLUuU5teUIERNk@vger.kernel.org
X-Gm-Message-State: APuU4Z9R3lJJx9rfvFA+ldajD5BCIkd2rMPuOL8WoWcBpXZ3I/lmavbc
	6C7+0bONQeA/caaK3zrSO5cxbdYrEqty8Z0UDYts6wL0sEC1ifIM7q2h
X-Gm-Gg: AZFdTZcJMZwKBtbtitnqSVwALOHrBmGfDrHNGsBbGbM61IaLi7Rs1I5VcCqgSL3cD3I
	79BnzBRT9367PAxopDwT6TEmPk3ujNhTdkCinDpdxQSJGrgXAkjg/FLpRBo3Aq19MZRRv6AoXqK
	4qR3Bb+t2qGDLkR846+wy5LJ571K3TGpteRbpG62ujbLQ8zKuro/RztgfAqHpElOGZ7kKye5Eof
	fMhJazPl/9Ti4ortJO5alXv7wzRUxh1HfJfR/K9uSL6iRPKrR5px/KJ39OlB4JfXjhl+mDIWoAF
	jBpl77jzQD3hPXA8SluQAINMeieWf9f9NlqHA3RoeoDSnCI3Ht8QildQREFURRyvVqHn7oRTIFd
	t+ERZYqsMYJjjQPZjnSj9ByMc1uszJxJ66TOcPiq/q8hNpYH22FiySiwGbf57DJsarta91jJRgq
	QOhChvcmmz2rwRYrtFbVNRFI2fCxLQqPMJkdy0p4At+ybUX6mg0Cnyi26MAxYEUuJyB/PCEkfdS
	WLHsPGYBrk456flRO3bD4ZqeGx8PR3RvHGeeLD3POyDzvcOraX4AQVHIlcKRdOpxi1YWDhpuWur
	MdZTGJkq9d2nXs9DJy/iU8p/2wBeXQ==
X-Received: by 2002:a05:6830:2306:b0:862:c685:849a with SMTP id 46e09a7af769-8631507f9a4mr18481473a34.0.1795540264410;
        Tue, 24 Nov 2026 09:11:04 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:11:04 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:36 +0800
Subject: [PATCH v2 2/5] pinctrl: alderlake: add some groups and functions
 for INTC1057
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-2-c8079f8f569f@gmail.com>
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

Add ish_i2c0,ish_i2c1,i2c0,i2c1,pwm0,uart0,ish_spi pin groups & functions
in adln_soc_data for device id INTC1057.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 415bc0a16957..d3bdd727ced2 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -306,6 +306,42 @@ static const struct pinctrl_pin_desc adln_pins[] = {
 	PINCTRL_PIN(256, "GPP_R_7"),
 };
 
+static const unsigned int adln_ish_i2c0_pins[] = { 5, 6 };
+static const unsigned int adln_ish_i2c1_pins[] = { 7, 8 };
+static const unsigned int adln_i2c0_pins[] = { 99, 100 };
+static const unsigned int adln_i2c1_pins[] = { 101, 102 };
+static const unsigned int adln_pwm0_pins[] = { 119 };
+static const unsigned int adln_uart0_pins[] = { 105, 106, 107, 108 };
+static const unsigned int adln_ish_spi_pins[] = { 128, 129, 130, 131 };
+
+static const struct intel_pingroup adln_groups[] = {
+	PIN_GROUP("ish_i2c0_grp", adln_ish_i2c0_pins, 2),
+	PIN_GROUP("ish_i2c1_grp", adln_ish_i2c1_pins, 2),
+	PIN_GROUP("i2c0_grp", adln_i2c0_pins, 1),
+	PIN_GROUP("i2c1_grp", adln_i2c1_pins, 1),
+	PIN_GROUP("pwm0_grp", adln_pwm0_pins, 2),
+	PIN_GROUP("uart0_grp", adln_uart0_pins, 2),
+	PIN_GROUP("ish_spi_grp", adln_ish_spi_pins, 7),
+};
+
+static const char * const adln_ish_i2c0_groups[] = { "ish_i2c0_grp" };
+static const char * const adln_ish_i2c1_groups[] = { "ish_i2c1_grp" };
+static const char * const adln_i2c0_groups[] = { "i2c0_grp" };
+static const char * const adln_i2c1_groups[] = { "i2c1_grp" };
+static const char * const adln_pwm0_groups[] = { "pwm0_grp" };
+static const char * const adln_uart0_groups[] = { "uart0_grp" };
+static const char * const adln_ish_spi_groups[] = { "ish_spi_grp" };
+
+static const struct intel_function adln_functions[] = {
+	FUNCTION("ish_i2c0", adln_ish_i2c0_groups),
+	FUNCTION("ish_i2c1", adln_ish_i2c1_groups),
+	FUNCTION("i2c0", adln_i2c0_groups),
+	FUNCTION("i2c1", adln_i2c1_groups),
+	FUNCTION("pwm0", adln_pwm0_groups),
+	FUNCTION("uart0", adln_uart0_groups),
+	FUNCTION("ish_spi", adln_ish_spi_groups),
+};
+
 static const struct intel_padgroup adln_community0_gpps[] = {
 	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
 	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
@@ -341,6 +377,10 @@ static const struct intel_community adln_communities[] = {
 static const struct intel_pinctrl_soc_data adln_soc_data = {
 	.pins = adln_pins,
 	.npins = ARRAY_SIZE(adln_pins),
+	.groups = adln_groups,
+	.ngroups = ARRAY_SIZE(adln_groups),
+	.functions = adln_functions,
+	.nfunctions = ARRAY_SIZE(adln_functions),
 	.communities = adln_communities,
 	.ncommunities = ARRAY_SIZE(adln_communities),
 };

-- 
2.43.0

