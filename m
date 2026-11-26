Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705817;
	b=CtQwXT34I3rYLCmS7wOfkkxMCGNOXcXDFnh7LdVByvDmYkN0xwZtmOYSGwavKLxPmarC
	 jtRCxX6bUSufXQbOAJO17uJk7rhmXFg/NgllsZuc/pTFICiYDQ8pMSpvOWu2gGwMEn/WE
	 y/u3JGgRXJDXriHxHySptmjEV5IEhZn/F2RcIr67fkSZVun9A/UK0D3ymmzdvsRbmLULX
	 lDTFxkyAl9WamxYXvooJpFfdMkLYQ2Ndr42KI/AnM/anp02+rd4i17Wek7+9A+pkfrXm4
	 8xae3MvGiKv2bfXsse+OlKuAub79Cc8ej0/3/OU2VqAmL0173F0DOmyz3iWdDjB2NSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oD076z39b10S7Uv7+/KjmA9hdIdFEVHigchJTPIZoGY=;
	b=JDbGGSbCkqKCL7WJcJAU+xV6IQZ8+ffBiQEMB/8wlaT+alt5M0YblbKj1EgJY7BoTrzL
	 UCKtBr1xPDvVgaaVFVZ793RaPEk1FAaeT0uMYVb4V85ghG/z3DRAxL5ogPVnQBX3k3U2p
	 go3TtCl1Wfog61Hej/q/tjo88iGrAn/kdakSgYRoxfWlxOidNAfQ1b0OlQbWicju+fgTv
	 K4NXs7Fg78rbj8hbDCVClYapIyxcysjGpERi0JWie6MVi2kNrbs5NrYIZvLnS+8h0qpDz
	 riAgwKCXFjhbL5kYnstNpk2VhP25Xbt0JIJTAx1tFoUzTmXdlhdJgiTANCQDCeDifBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jlWEXt/I";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F23606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F23606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlWEXt/I
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3370012a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705817; x=1796310617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oD076z39b10S7Uv7+/KjmA9hdIdFEVHigchJTPIZoGY=;
        b=jlWEXt/IUDVBZgO45OcN1k0NnuIMWq95Ve2GFZKUCu+CtuGrwtSvsD4/fpLLzCViWD
         fY1KNoCpe1j7QP0XQ/JIRfFtCoreT0GjuVV+G7/1ksXVYciJH1rCfGoEyCGawENpWoDU
         /83+P3jy+dzAWKsPgsP/JrfGw3hezymNWGIjyjGF59efKVnDk69aLfKGwdzsvIr1vpNU
         P4Kuki6BspsLh1APzrfYlibnFypv33QkceJ/qsR00m8b9iZjLZDb3omxvgeRu2VWk5SH
         p3cY04G46E48Bry1fZbqnRfwXl2U9UP/9aoG0civQ4gVr2woGRfc1T1D/s9raVC+p+fy
         zLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705817; x=1796310617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oD076z39b10S7Uv7+/KjmA9hdIdFEVHigchJTPIZoGY=;
        b=hoGq51rvJu9AjTkm9nE+8F2eQxZB/6xQcSrr9quK92JEgsNPJYBCUbwnDatZi/6XBV
         4p94ASPOnZ3oehZ9WntVeYwDe8H1006T73khB0sAn5BCvf8RwgDoUu+hMgHxmzAUV05i
         dyE12kKowdkXpIvym7x40Dt+ohnOJliDXsJV2c6D0y4tNA0dcAtBNTe4wLdovkCGtyUu
         jEvAalz0Dmbf27LDx1On0BB84O9j4FJ0nXMS8Fk5RScoFZgVJpTgEf/QH4s/QfL76ZC1
         RaW+ipFHkvTPi8pdMpBWmSIcq8rbqPeVZP3YkK6wb44Bd7gjUNf3xcgYCU1C9QTna/Cd
         tKaQ==
X-Forwarded-Encrypted: i=1; AL+hErFN76UM36WNC681CUy0ASHg/XCW7stEOlBbuEHu2ucxnmUGNs8gCjbHev8YmG9c/ezCbkjxTE7aW2hb@vger.kernel.org
X-Gm-Message-State: APuU4Z9JCCJY639r+VnuKpygOLaK7JhIIrLVrxU8ORPkpbUL2tVcJwnV
	RbMJEN2qCfioJ37UBotV3gqoHebtLEKTVrtQwYP1GXHWoO+Le1638TwN
X-Gm-Gg: AZFdTZctCfisxKcxCUP1Hv2+igU29vGk2rsSDVID/SjifFSo/biGkQ0KnFXXqzrd1wI
	db8FJAu0wxpXquhO9YwjqD+nhfMx0ofPIdDsf8j0DBNbN0MXNkQ33q3oWhVDk3kkzIJSIvwpCn5
	nPAYHZQk3qjNrlxxehgMtBFaz0OraMMc8SOesHo7gOkSeF1toxhrAQkx+B4iC6gJPIIuOq+NhWh
	o3kcSUDHp8p72Ssls19F0g3p6NQm/Xt8oHzmgWPs+Hui8HFOVxqw/pdwYVDWt/1SOTXdpPmm61H
	TIeG7iKiSa2X1+4n4l3c/jlcGKP8MTfNEeAi4f2XKflhkJlR0ltVakRFWsxCvqnkXSESPELMrAV
	Sex1UwOucwqNQsCznKQ+K4vCUzHwlT7XdBw2C3qAfld/I06ge5KKkcHpTYr6lexl3ttDrpaMjhL
	Gf2B9Rxj/ham9h+0HwMZJJJ42wMrQIb0YN4A72AvNAPgyX4xFNRjkkIdRi/s19qoDK62dPothwU
	4el4+C8/CzSMRtettOupmh+tKU5c26CcQ+jlyHOlh/oIHYCHKChPL/zQczrFCh9GPdxPvVf0iaZ
	KMibu9uOPFjS2bP3oqfdJaOpUhxt
X-Received: by 2002:a17:90a:d2cf:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b41c7c22b4mr18642791a91.3.1795705816753;
        Thu, 26 Nov 2026 07:10:16 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:16 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:45 +0800
Subject: [PATCH v3 2/5] pinctrl: alderlake: add some groups and functions
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
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-2-81d35c9ba246@gmail.com>
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

Add ish_i2c0,ish_i2c1,i2c0,i2c1,pwm0,uart0,ish_spi pin groups & functions
in adln_soc_data for device id INTC1057. The pinctrl-upboard driver set
the correct pin function corresponding to these data.

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

