Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540258;
	b=aN/n8a+SHXWxUAU73AelXSzTrBfQQyN2QcqYrM7Tod4kAM/0QBLu3zVoxcxoiMmqKBBV
	 naGFSsF3I1WXuynvoMyO6QIIIfPa/oEp8QjABGXlyR94boK5+qCcv/Qm48523i5Iq9TY6
	 TEpkMJnKf58YnTho0+oaIYrj6mLv44HoTiTMzemnG2ytr2Cp/cSDdn+cKIcciZgxMzqMg
	 QJRDmpz0eoXym4hzSqSuICMq9Vc4fhOR5i4DEi3jbaUYU0u77gAyaGyluO3g6qX8A6WF1
	 2PhSDIFgeV+KRSQTFNy2h1y0PVsDR2eVb8JTapnglHm7v+3/rl7yZeDhJWk/hjjnxMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZpsnwIPSBX2ymIHUMpa9KT8hWPzkQMht9fFSCNLgavw=;
	b=n7jfAMwFjSQoBy8Nw0dd2Rsa/rXQXEUQh1ihlbqVCfEuAmbMMmQPBUnaGk4iZaX3+6M5
	 /enYgrCm+Eozy1XOyN+U5tmmD7V4iGeCYkriNXfO0rRPITtuczthqgUdOMNoFEibsyWib
	 2zENj9by1pz1BWQjMywUHN/eZYJ5CKt5zpjKyrFEBNRTpxG6KO/oCxJg63wOmt8TUpEFc
	 +7/ySM9tg3ojLriqw5hxsrF+09DO/ynik/StYZG29S4JLer/2MoWucPC6YAIieYmgSHVF
	 sQiUxodoC8iUHddBF5b71eLmxvFqSL0YjkwqLF8zYD4WTCTyWKQ5QrQMVqpxnHJKaIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDwXID9M;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672560A2617
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B672560A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDwXID9M
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8451a619da7so2803874a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540256; x=1796145056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpsnwIPSBX2ymIHUMpa9KT8hWPzkQMht9fFSCNLgavw=;
        b=bDwXID9MvbScZxb5MnX9Q7E7XYzfn4T/NPl8YsROpcIH+sYfuNSIt2epE40Ayy12Xr
         hGY2wF03pnjpS/Sehhz9FJGz7tDKOT7lpEN7gmIgBzkwXWpQlvzjthnCwZjtXX8q/dti
         REB5bm7kIKWSXyi9fkgaZi/CWPWtsIyZI8mktJfd7OcFK4Sc6MTgpbdMMB+9eO+PtN8c
         M1omD50VaIrwHYeJoo4wiZFPxoud+kb98ACPUDUnSprFNr2b/tb1xRCfkq8xZEACq1HN
         sWjQHVfTKF5pqCbfn1Vh5Qsfpc/lhA9KatP7Mr1hVvA7zORRoB4kmbUhnShVjXslIeO1
         Q5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540256; x=1796145056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpsnwIPSBX2ymIHUMpa9KT8hWPzkQMht9fFSCNLgavw=;
        b=nFOxBfO0bGWwU3UfxpjBUezSHNVCoEW3GKV6AYu8lx7pXX2FkufyNE5XEJov9ZhMVK
         kzut/+JIJ8zmj6niVs+y/fC7X7KslnecqPeeyU6QslDusG452CPMCLXho1MNmL+FUHfG
         bHmXhYYRBubGQI6OBvaxmfL/XUbPSK/V7wgIOm3uLSxwzuIseE922fzpoYto5XZyJN4s
         zvHGtGVBlKXdYw64iVFKsG6st6LipJ18zDkZH6eEM02bCxQ0h6ZBdWZNQ9yv4v4YFQtE
         lcxsj9SoWbulW/tqWcKf1mOm6oXtrBg0D5maDOUOIAsTDRenbZOLH6D1PhAqBbJNcx3O
         mvnw==
X-Forwarded-Encrypted: i=1; AL+hErGIFpQf0TlYJj/RWNCdEI123DYLgCa4b48L2IoE4qutbprLqcHnXv1lYxpX2EkZ8Q7dqdTtUxEHwegL@vger.kernel.org
X-Gm-Message-State: APuU4Z8/3Rvxjv3lbqQb08J5Lw5M9UQUCu9ETRR1S1AJmCUSdHJEvrwr
	uPEAUvjeLOWsbBLYD9vk7BfxGkRjGo2hdR2X/Bd+chQgBJB5k4lx1ytQ
X-Gm-Gg: AZFdTZdEYoSkufcMOnTKeNG0K2u770/HQTJRC/gZY50k8yjoWL6ehun5vckOz+yLHB/
	tehj+SLUHjaw+OKRim7JNwFDTECUBdKfW1j/BD4lEoPdZE0gLj5NEmqg+bLu/wUB4Hw5gnDrHoK
	lELajYV45J9WqMP3PPPKWHMwZ+FNUrNCUOacoU2h6YO1rlCEhxQ2lctDx5gKUi6vjtfpIc4n8qb
	msPGpURPJSlF2zEq/QQfznOH3+vuG0DieSNQIHb0we0UNET/kc34pFnp50c8I7wlW5gLYx8V1nX
	ajUOQZI0WdyYVezuJlwi9oY+BCf7t5YrKuJlIc6dG/yUFvSdd8B76uS6VkFRTeHMI32ctGBF5UO
	IDYqAxq16zdaUl7uKLCno1JInb9GzISmCaY59GLmaOFTlYhL/QoYHjgLJBRyLE/fHY8MAgUE/Z2
	1VITHQwk5+fq34kd2nUFsuLPrD4ZtGW6bcQxMdPLm4LdzyiifkiBM3Q8hFUNk6v+qZ+V5Z0cK7+
	7DNa4ygb67ltEQHFknhZOgVNL7mtxLPc6B9iW8ryJZAwSYDDp01Lfga92hdofErlP12MUjj4aqq
	hn3UdWrf86cCJj4=
X-Received: by 2002:a05:6830:2649:b0:862:b76e:3a73 with SMTP id 46e09a7af769-86315a6d398mr16010581a34.29.1795540256523;
        Tue, 24 Nov 2026 09:10:56 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6besm11131021a34.11.2026.11.24.09.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:10:56 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 01:10:35 +0800
Subject: [PATCH v2 1/5] pinctrl: tigerlake: add ish_uart groups and
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
Message-Id: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-1-c8079f8f569f@gmail.com>
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

Add ish_uart pin groups & functions in tgllp_soc_data for device id
INTC1055.
The pinctrl-upboard driver set the correct pin function corresponding
to these data.

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

