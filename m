Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447012;
	b=qSOFtiJhKfGwV5/+Ihud3FO3fomfdCMvy5KIWUkutBm+DrQOO/gpFiJ6+b6KFdSNVCcU
	 OBgqqipgW6JFcZQeJWIMDt6/2bsVYYMiz5UoFg/KK+TT0j5q3GMkesuzjlLhPsrMiJkL3
	 r9ZlisM9VuCB0HHpWdey4Jk/QCO9j+FEoe8+Ta4oEIgBbN1UvlWqoa5kDNQPtEc+xP15U
	 owfVTLIGfRH8yEHbtKR4eSr1ul35Qzgpymux+mNhQNhdQrTJWont/SESTXsEII0PobPLC
	 5WbByRX2X3k+Bqd+lim+4yR1Px1rtS8W0ux77wBecDO9bbaeczas/lnJ3w5aslfVnHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=x8zS9sQC2qzaVvAkqUIvrNo7w3mYFINi27bRT22YfmY=;
	b=OMmoZVKCWIQ/7yMgLXxIxzJokq3N7XPqfx6KFBFEXYqAygdF6IRcSKVP5rrFULAQw2Cd
	 4SVkbsFhhTdk+I5Xhy7B6jmrJDv19qoisavegye+eTwhVrQwymbDhxyCnlQfCwKKaZtJv
	 TiEm/SmJ3waTk64RqrzMf93o3d16q7aN4iRBz/Kcu1mwN35sHKXJPiU6p+rVHIXZzOBXv
	 YepKEPbe2ln3nQ+qxBNuQV6KkKyd0qpLKTswdlJhM4XUZ3236WlcnYeyKjZZQhr0xGgv8
	 O8EMtkH98nUzYU3twHro9/6YHV3IWcjIuPv9eFjMxlqyTIDi/GMJhC8g+alNmKaUHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z/wAoo5j";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A4606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z/wAoo5j
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1367350a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447011; x=1796051811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8zS9sQC2qzaVvAkqUIvrNo7w3mYFINi27bRT22YfmY=;
        b=z/wAoo5jJ2dIbSsXMVGPhztklwvw84alpTp+itq8cC286M3ZLZSUQltm3KI/aO1h+g
         ABWHUvju7TeFH+SR2iF2K/Qr6fE0p7kx1+5/h+xvZNBOcz+Fem0h/Rr7kKc6h/KyTbT2
         6If0cs01fxe4K5Uakk/ar8JL47uIxaJjUYejzpGRR8o/L525LDfXJfQHbI6jIDtn4UsC
         +1vrl5dUl3cvr5MIQqgzE7FaQ+gKdIPtG/CodYUjO1aOwjyMp/qtWO+31jKbOwpgyALv
         l11yD06hHftkIpoC4Rhsqvo0FCYrReYewAQQmBgSJG4WgTNccxblM1vFy2owqr0eBBog
         qzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447011; x=1796051811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8zS9sQC2qzaVvAkqUIvrNo7w3mYFINi27bRT22YfmY=;
        b=NLYgIft84rUwcjSL2k3XnXTJp2s4pnsPSqZLdUMkjrvma69GgIAmdgcpUjz40fKooB
         vWce3fIFWVdX6onwIZ5pBh0lq4N7EmYAp7PBR0wKprRyUf0AMsNIcUN2ZByL0EJirr2J
         7jxgCE5k7PxE/zzfmZpsmQkaSQTp+VuCAewUpRGZ5Ep6kbQNXrJASgJmcogyGDJ2jSmC
         viE74lSzewq8FHY5onHAgBpARVTJ41NoK/I0zZaB3TlX5zPWPtuhrrrels2/gbLpHysZ
         0WaHsYgbryO2AJo85+6YAsqrwJQq1Q8LA6aFhxL2u4w9KXSsrUEYHhMYBwZ0AqHE8NtK
         NRuw==
X-Forwarded-Encrypted: i=1; AL+hErEm3now8bqgv/PAxsWVeQPF74FgcpBSVHzJtk05RtYyZEL00h6eEg8gki+LvF56af3R8DQ92vDrMPQC@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oqx5DJIDAKA+Q2d6mhfkzPRFnFJJxdlTSEj5ouFMeR8a99GzH
	3NokWPsTGJZ6zykMWsa0CsfHGsWC9BAz88vTORZaPihLmJlomY1LEHG5
X-Gm-Gg: AZFdTZf38knml7vVYWawAE1epXRnLKEgH8WZpgopMBRLoOxY5VtNHZdDhojqNWA1BM1
	FkjcqSfR3RFWJ4iB6m+kHPYMN16nSxkSaYy6zcfSFior1gXmtw6eyK6lLANWFdkkLQaLJFK9sJg
	WlmcGHnwyC6dEE0DoS+dasU1B4FVJYFvO9FXENPt2AY8yoZDLGcq5y2atMlcAYE2+jdbGT1TWBM
	iix6pTbOzuqTnrGrMbCMDJ9/OwwWnW1FF+dv3MGexSRs9Icsl4Sf+ybq/VRGZ/vQy7hxC0S98uh
	1EGE0txo7G/hOi39ih7Id3iB0arXIkhcp4LpzL2Po6U3LO+2vnRmgH/2CPxNxcQbirdNanU+qFU
	gehCVEC1mPqM4CwG8loGkcWcxZ17VpAJu20vs1tEjqWGAuo0PSGnpN0UTBftqCws2blYuA2jOJh
	2Yr3HrjmvGq8N45hFQqyBI93lwMcJBiq+KQ2p3mPGj593ZVXbaIA9SC1HGcxhYxqADQhbyqGtyM
	C+6iaCkYvQ7x6i4PfZNHEelGeivli0QCejF3Cx+1bfMtOayxzabvS+HO0OwZSo8Lix4gHg++9CX
	sqhoggViVs4Zd+k59+AIU8HjTcnq3a4=
X-Received: by 2002:a17:90b:3d4d:b0:3b4:7cf:5e5b with SMTP id 98e67ed59e1d1-3b41c93e808mr9457751a91.31.1795447011273;
        Mon, 23 Nov 2026 07:16:51 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:50 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 23 Nov 2026 23:16:16 +0800
Subject: [PATCH 3/5] pinctrl: meteorlake: add some groups and functions for
 INTC105E
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
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-3-f2322a91686d@gmail.com>
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

Add i2c0,i2c1,pwm0,uart0,spi0 pin groups & functions in mtlp_soc_data for
device id INTC105E.
The pinctrl-upboard driver set the correct pin function corresponding to
these data.
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

