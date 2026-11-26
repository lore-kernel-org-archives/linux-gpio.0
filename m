Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705824;
	b=RxsQIwV+6sO4hpUbKaOjaAamDF69jHjt2PU3JVKt6TBhkHMJSOkeMdhJnaE2uziRTaSS
	 9YxBwU++DmsSepbRetDNc3NYMDw0RUP1PL5qsKImmGMDhyE068m/U59oEpLlhw4G//FAD
	 LEz9SAjGiXlOAxm4XlN/sB03I6G7sYqdg2+Bia56zb88SBIMquwkqKvwo8Flvz5zNzUmg
	 mox1hxHS0gZsQeNLL+1kBnZ4QuK6bsw2IQC5osLRpjIsLjeVeZ9izC3ziyvseSy2jcVtD
	 axHelSdcPH7ctwrsZLn4Q/Ce8+tfzpUZfeO99Q/EsUoAgPGljVebfE87kANePWX0WZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kzzWI9nlajm9/4d7lGpIikgLMcmnAL+4uE2Ldwk7Ho0=;
	b=n5+zJKYQsK67cAXdKo7cch/SIWVbtQ1fcPnsSKlnDJc+W6t8bwgy0ORehj1a2ahgVXuT
	 eZR2WSzc0cQFMyxI7KQ/5dT5ow5K0fhjQxyEeyAU1sfngekTir6gWK9BjHfM+9LqeyunU
	 SKu/MY82RC0IjxTIZpCjb3apwirRx3RRIHLPW/FB8k6t07p3BjwGYc3BnEi96L8fDv9gS
	 4OsA+8NmaGQefxW/R4XMuVHfzE7JPg+p8dgFp4gUIOtAPiv0GIVwPZu83BXUGMxrMD7LE
	 tw/SptdvSSL0VwU9gJMo1LuHnbBA4KHy6BKv27SuTTNs93pUabkHseMo4+0G+/+PuJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WaB1OCYL;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC6606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WaB1OCYL
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so3677232a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705823; x=1796310623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzzWI9nlajm9/4d7lGpIikgLMcmnAL+4uE2Ldwk7Ho0=;
        b=WaB1OCYL0yCg98miZPqbnBbOKvlz8GYmPs7HAgijEIkJP9925uc/xktqf5SikZkdVd
         RY5K2ptso3PzOeL4U1iLRxW2Gf+SVFEGeFDeRk2kzt+qjawcGnTeF6uTtOTQmR/Xo2rF
         nfDSfBss2Jwvz268ZPrIbtWZMXLVBkXnGMjKKd5guM5euh9W3QCEmU790rrG6EADuAug
         PiyNvTu4QEA2CClttgUQ+J4wsj7GKFi/eVHFbbTTrCHCHR+AN9u7XpYX43BD144qz6OV
         j8cZTugCAD6JEF1DH1KBNfWHL4Fu4Btgznef5gYFjI7nG59YKUEAvnhETj93Kfj1AoWo
         VGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705823; x=1796310623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzzWI9nlajm9/4d7lGpIikgLMcmnAL+4uE2Ldwk7Ho0=;
        b=EGHy4pG7q/ZZ1TgqtvkOsIvBT6gg4rP6+8xL+xZ+fl1rzL195Quz2LK8OvX+cUKboM
         GstuzUm5u5z3hVoCiHgoIGkpNqwTHycHpPmpm7+T7UV8oilCepDvV0EyiWK7fGIEE0zV
         sVE+uC19nMoGKLRomeeIQIWemCXnvwxhtxjUr3GDRqn8b2N++HMPZ3muVEGjM6dnxGK6
         nZwqfXZPRQnhsRcBC4JOI+Zm9gbu7AnlvtRSYO3EM9EUHPvBIFXesGYEVbt/ut16NsXe
         KZs2HCtW/IqieDQUPIaDYXVOIMMdmAFRS1STBJV2k+HqZ1kgO9VndoexI+7Y3HeI4mPh
         bZIA==
X-Forwarded-Encrypted: i=1; AL+hErG6juwFUXKUZU8FdTrFPxjTII88/SJ6ICCGM2oTfShnONyLEK3Pa7PyP1eynCPUOq0/G5uiC/JzGvw2@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZsWzRWsytS3JF2Sa8dL9bSH0ene0lzuNI3eu65rp3bVAoNcau
	YxajEBVgl6Lc9O8FTQD1RBjG0Hw9rsImswQZjyNakOyVKoN0TLP8RUU0
X-Gm-Gg: AZFdTZeGhKUUHO5Ia4xbRBOAFNu9qTbeqodqlmlSB4xcuFP9j4KDHj5ZdHFxN8gDsEs
	lJbn0RbyEfhcAS5hv6I7l6L4YAGdMdcXQVOYSbqNtjK8IN73mAruJy6l5t5jiyBDdImNaSQf18v
	kpFCMyJZ3YpQ7wgjNc3Dh34ilYB8du/c2gEDukHqD/7DdETf7lMHGN3BHrENEkHBR0TV1X9Cy1/
	RvcQpRwvSIqief55qhEH+44TUSVRaZ2OnRZM3JUUB6dONz4d1pj0yEAB+sTnTA6+tLohBxo3JEV
	BsSgSdEoxAkP3DZe9jMlRTPeKxQx0MAdySnfIjXhQuHDCzOZM8ZWa+xgo6uonX2iGbY2/qq+ejd
	DTIcNuaDu0PwweKfx4txafWHQUd49lN+BsCYE4MoQr4+KelhEkG2HootRRKXgb9YyBKufw4Hwcd
	pu6XJ40OATEdGmvspM6dyjsxse9qMYFUJy/D8CzPKUe3cJCtdLXXSfz5Np69qEilr6yDYT0NU+t
	ITvO0Trf/nIZrlmXXdAGzJRWETbEmhUXw2yujelbrgsmoTJ4PPd1r8Z6NVBC2/eugYB8+/Kef4o
	p2guoJ3eIWliP9hF/vJfaHTEv6eN
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr20980311a91.23.1795705823094;
        Thu, 26 Nov 2026 07:10:23 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm11099923a12.8.2026.11.26.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:10:22 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:09:46 +0800
Subject: [PATCH v3 3/5] pinctrl: meteorlake: add some groups and functions
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
Message-Id: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-3-81d35c9ba246@gmail.com>
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

