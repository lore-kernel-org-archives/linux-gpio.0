Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447007;
	b=osg4uIQkduBAzl9NdoNGmqLGRlI3b3792UO6Sqk4UD/RP2uv4xpY2kr/l+iNvijtfvQd
	 lUfuUFCLpd3ZQuNrAjU8EDGttU4YQ6Koc4PF5zq7AowCxyGiO+BzozxXR+Oixqg6qmC3U
	 7fG27t+ylOFLmAnk+ZYRLmw/UW2DDtC1NAIGm5IEhCvDgM73/hk02ztIvjxCqqU+xwikg
	 lv3yiaRoCTzhVRqUnZSd5SGwD2z6/a8tfkTPr+R999LCWjhhqFsWswU3uKaWlcKD2g7g3
	 Xy16jlHp8HGx3QBiEA9TaMDhOUAVy8eXXSKFgXybM6b+DDSgiDZLlP4nQAoXGLP8fkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nZgDCsa4GBv2NQ/Sjp/KZF8j/qjapWqRV5JMgky7ckk=;
	b=XFg5OMjTqTCYA5nd4hnaDXbwV0wSAhjO2E0YtbnwgZl+I8bEVythfZwh9RAVYI3/8KoI
	 j1mIwXpaAxjGO4D5/EVzvNrQ9iFeqeLBt5LdmTky9i2xv7BW6GMlW1i4xxljKpYq/4l4e
	 RAixF7pTdO2Wf0fRg2ASug1jW2oXt4ISXKJgXtsR/O9tNWgEmIYnjqu2IKHK81on+lpmN
	 ilc0+bU2D4Gr+gptw9bilMhO/FGjvStGy9QT6kenYoZa3sAyqiLm9AQWBKRruycfD+hcx
	 Uqx5aSMW1sh4uEZTJtKMrJk5gTgtI7XpFZ+KhoTaIHd5OKKmyxS8Ac+9Va5H5nGhWBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSDHBWQV;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D0606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSDHBWQV
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1899484a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447006; x=1796051806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZgDCsa4GBv2NQ/Sjp/KZF8j/qjapWqRV5JMgky7ckk=;
        b=JSDHBWQVjkNX1bhtW4U8i0N9Uu8vQ/w3sw8wSYYQ6ZbWkZ5Yymc5XIzcEL5wZtRFTD
         QWRbEE5NxnomBN5MhbS0GRd1TQ9Erl+VObUCBOo1nyMpkoeQ+qwlb4jPT4JRnv1aVQ58
         WEtJsGbqX2j4Idxf2vC+ZUvu/dDDlgPOVaGGaMLp+1KKa3nITUMnMb2Yg4W71cgVF1xv
         VFBd9Dv5nmPV75B4WzzZAoL/NWJYhFE9kvmmXTUJYCvBcm0B/MY9dJv1RD/d4Nh9+SWF
         /X4jTUS0joTqpaepz3UwDmSCWnFVHkfs0Sj27sGCADRNefCpICyJq5UHzgUCmdja0GoG
         60dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447006; x=1796051806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZgDCsa4GBv2NQ/Sjp/KZF8j/qjapWqRV5JMgky7ckk=;
        b=qWFZd2ZhMrs1+80hjhOSKrEYlh/n5LO4jR2Bvtly8FAtt98coYWf01wg8VOPP7/fR8
         GiSyWPk9dMqZKT0Jt3K2bE/PWLETSko2Ee+7NRwmjPLMZZXNdgrsKdjzTzl9wTbDTLkn
         R6yKYVHzMJnD80oE1wFYslY2iHlhbrxsIReFom42AtgB/ar6IEM/vEUdomEc+RZ6VqCI
         iWEh5pr5jNBz6uV1/Fv+Din3e2avt+gZwJ41XUMJan6wWKMwKuYj1POqt4CGBDuLRu6o
         ubWjvIzUavjdBLpP/li3vMx1TSo1NXFncgUDEdPTflMvMZUb1ylxmIofPUWLhry6O5X/
         zFfQ==
X-Forwarded-Encrypted: i=1; AL+hErG1w1S4LcWchvN7eBFnZKGMwMz7LawLOPnd59AmWsKkVOh6Rhd8/8sjI7FGBTpNeV//J1UlYJQSJoX6@vger.kernel.org
X-Gm-Message-State: APuU4Z/vmQgQs/NVHfEnW/rbvzESeBmJfR21YZ+zspo7f1q6d2LKOeXr
	EvU66iV1phZjpEiMG1tZxOYeNePTTe6RuPvpzyWVQlKTfgao0kgUla2Y
X-Gm-Gg: AZFdTZctlS1f7xufUDg3wk4PgnDJzjssU5jqr7XceMHrGk7awFphRyMduf885Q+qFxD
	btOaLnqs9HrPtR6QTzq6C/hK/tQB0e4owjih0Em9aRI5pxImN1mTc3jmIIkc8rG7f/eKE3FQqU1
	dgQ6AXs1OBXfIaLrTY3DJJ6WI6ZLqgVa7MbRF9bbtmg5bZDhI9Zf3Cp+78KhgaoMvsAPQ7Fkpyy
	5EbAjxkILf3K44HQGgIoElMpQQ2wQeIaXwjKKCCnbClfr1AOCtCV3EuCWN5Cexfr3/O+RyZ7wq8
	XVFnJjtsjZazYmgTVhNAhr9fVWYrXqCpSQD9HQ/1FXTUQXtdaNFScNcTghB0kKGBYZ7ZZR2xd9v
	0LLlzDZR3xKEoWSY9/XcOuWJVu8I13HEFs+duK+83nWj14OCZ5/3WIy0a+SczNv78n9bnIcWDrd
	pi94d2Fy3hwUnQ4Fdg3d/+y85m87/oT/laHKxkBcG9ahRFrxcL/nH8td5ghNwDYEXlv/oErct8/
	TIN/+3vbg+NqqPBkfG7owz9GNIi4zt2F182/kYdwnP1QKp/GvKSleUYZQqDe/OKcU8pu0Pu+5jR
	8Dp1kboOJWucmDQdIMntahNWzoPI6A==
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr11885132a91.8.1795447005768;
        Mon, 23 Nov 2026 07:16:45 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:45 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:15 +0800
Subject: [PATCH 2/5] pinctrl: alderlake: add some groups and functions for
 INTC1057
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-2-f2322a91686d@gmail.com>
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

Add ish_i2c0,ish_i2c1,i2c0,i2c1,pwm0,uart0,ish_spi pin groups & functions
in adln_soc_data for device id INTC1057.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.
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

