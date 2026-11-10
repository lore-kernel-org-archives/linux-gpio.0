Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315744;
	b=s7bP5dO1xgdu2VnyG/kMCKHaF7AnOWY4v4LPsTeYj9rxzHIvE1RZ6j5d+MCJEef8pz3J
	 topg+c2/KnwfRR+tQQDW0ueRrYJzkxrRkWvx2e3jGcAqTXzgyVKnJ/FVvCI0En/yLt6j0
	 g93pc9T2StVfOKWriSK587t9r4h/jdxPam2KzyYYuTWKuRJno7YHUR5FlK6z0T5jUn+y7
	 O2IHZqRBuIWsOyu4itPMx0oCBzi0FND9xHujkc1mZyr+ZGZqnbYNuwHJkjHsojoM7sF3W
	 OhDdFjR59dDpH8ieiKfunP48ptz+lNFwv7k5W+MIkdM+4/FpfyAzR/jzSfzQDW5dLTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
	b=flUvRJF4epc2NU+cdWFULUTAb1Ftrp/PBwryldNGJELh74VRBB3nw37yWFRwIClqgPui
	 j6akRvJLjuXtNQOMnhi5Nf2QLCkzaIQY4+NP0ujy6SMXycgHgW8xJIDXCJytXiqmgzH6f
	 Nssywih9OjCXbSyJBD63fSzOQF3XKyF3tUuTeG2KHAXEYwMsyOa031LJlJDKjupjE7NVI
	 zmK2b1K+4gT0HqzhE6HpXbY9od+LFNlD1p3Qr3F0AapVIpLgDZ3thY2etKo5OBNR23KbV
	 K1Of4vYkY4098lXPzjEwOTelvqpzPIC4VSm6TUoJPCsG0Twhn1Y1t8gLRVDV4qHuHgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elVHPU9I;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2F606BFC5
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF2F606BFC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elVHPU9I
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eae1276409so777938e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315742; x=1794920542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=elVHPU9Io++NPcOBFloFPWdH0CUhI+gqD+0MkGOfK4iZ79H5g3ImG4HwEZpdo+6mkK
         eeVdpjNPCukdYOBcSOILVco2mQdWO1QbROKVK0/vC+tO0tJxnlWy+9YZAk6KsYZHaiL8
         UEsRECCSPgdzBSlm0TvJVeBiz3KMR0pAk2kWNp2OuN7wgMBMH5txfnzZATcC4bVelvKX
         LyO6/VwGGD8Nw+nXCuU+8ro4SxS6C9XBM6BAgkNCBnQwGcXsc599faxqKvh1wtJ/s1ll
         hY/xcct+27ogIh0UZkkeZ0MZywicNmIgda/vdCREzvQXD/oZ/XK8b+J+SowXzy2XVl5R
         EoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315742; x=1794920542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=hPHvig/0r4hZBREdt4eXbyENW64/0+fDA6DjXj4oHKLveSgOquVYCJcjF0ljI1X/GX
         lnI6P0tROmPZMCcYEIdbdXCihJLkihWWCbrUBfHK/LBbhZyih3mckafUwPJuX2mcSClY
         hw7yscTd6bUOOTHX3JmTL7qSuRpW76WI5hIWRzidqXyr9hlUIPCmSmpP11GpArhJIS5g
         KmDs2TMLVWVQ+WV4LXvHkUUXlWHVWZeuMmg2zKcWIWWqBSnEJyusMUiQB4gZ5UJUyWu9
         3mGlF+Dn7oRNbyatWR+sRNd9blSb7mwEDNv05GB5J/hheiIKYM9ym5BEj8ckIIIXA9+a
         UmVg==
X-Forwarded-Encrypted: i=1; AL+hErEncUu72ats/BHNO6nznN3cqLL1TJxcAf4xYS8iEBvKYEZC9cANafBlVj8+HBSIybuwfzQoq4doCFl6@vger.kernel.org
X-Gm-Message-State: APuU4Z9FIEvzyYEKs81Eo6mSYdHFgq6Nlf3qsfm91KUIZp95pmPLbGPp
	S9OawbxQJBcFR0HCorkHrwkRzgpcm7J7KVM3Pv/wPewsdKMXXg+CkbIa
X-Gm-Gg: AYBFou3V0zT9OYlec82Cl/I++MaMa0QijJA4ZXPg28bEI/vOYD9WFzmEMRss7yK6bPs
	YRGTnU1Liz3aHuinWzNBaE22QIkHLVp8mOUJ2hf2AnFIr1yaYPfkFkZnMjEkCF2IiQ/afMS45nm
	+1wk2VwaJlGriOHNGxihtgQlOHNU2qrnG73szTdobYFx/L3V2jMfTDKLzp7xjH9w9pnOcuxI7+K
	HEF1Dw8UIsTc0GymNRiWND70AUHEO9fRpe8ra9Rb3sZ9jH+1gsB/6i6PT0eg1MzOMEIhHyUDbdn
	7BUum/rF1JOYStNO+Jxw+okzK8Jj4cMzs0CqHCKcVLd5u7X5QVQBDrGCz95XQWT5r5ysnCodarx
	oYZWmnkCK1yPMIY4S9EFp0mGeWR4672/q2iKYuTMNAsmdPzr0AWDbcOB0d14GyiLwwc6NGywdkc
	KXGlwBOpBMao1Zlfu46+H4LHC57Va4CYGHEHEa9IZWKui9i2DbTAnpCXGFwaH8W/+Sw+ZOKQ4wB
	oSTu8FwqIsVfFaBW1sXAUbIOkJInLekBZNmITIsS08feU0RpTTrQFal5PAZFBGMlnUXcOBqGQEH
	MtCnUgMF8QwNC68TloNbVD8kszYhR5fqiYg43vxJXmYvcqeAvGAbP0lm337RwVVE2YSQ5qlZvom
	lmmHlm75IvHagK9iZhdOI0cMTGK2RhrLrFXpHveIbLK3fa2hvOxfR6JeirQ5rtOQ8mf4EbB4w9Z
	Y=
X-Received: by 2002:a05:6122:1d01:b0:5ec:c3ed:7d99 with SMTP id 71dfb90a1353d-5ee0d0a5264mr742890e0c.6.1794315734491;
        Tue, 10 Nov 2026 05:02:14 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5fd00esm1573509e0c.16.2026.11.10.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:02:12 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
Date: Tue, 10 Nov 2026 10:01:57 -0300
Message-ID: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 description sets irq_read_needs_mux. When a GPIO used as an
interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
interrupt function is 14, so after the first read the pin is left on
function 6 and its interrupt no longer fires.

On my board this breaks microSD card detection: the PF6
card-detect line is read at probe, and after that neither removal nor
insertion of the card is noticed.

The A733 data register reports the pin level while the pin is muxed
to the interrupt function, so the switch is not needed. The A523 and
D1 descriptions do not set this flag either. Drop it.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Tested on a Cubie A7Z with the pending A733 clock, PMIC and DT series
applied: before this change PF6 read back function 6 and card removal
and insertion were not seen; with it PF6 stays on function 14 and one
removal/insertion cycle was detected.

 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..456d9170c2a2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0

