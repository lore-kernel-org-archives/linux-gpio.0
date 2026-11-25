Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607831;
	b=wCuSOZt0lFVMHzex+Ui6CaOdxcwRXGXwPTxXkLYEsNn1URjk0/FPKwzMClpGLtFZErE8
	 M1Nw4KJUAjvZzHodpCEqcj3UcUqLQMR3oYpLnNQU5+PtyhtsPROUmjDhCh0g+gWr6OhG4
	 aaMspQPBtCuGnWC3VUMyOQj28IgGqgdzETh7Q67PQ0D3It9mLDXoR7eYvsM97mZRxkOdc
	 5cFrQgtDntP4Bfcr2FnEup7uixk2jwISosIOQd6gZW2Iw0BPIaFW2T9B3JYuHnbHFHXZN
	 gTf1dFNryOFnjYAE7P9cfjEj/BUouwKrS5sVNolHZ5h1Ei1CbL7wmNVLgzF/QuVilMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607831;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mOB01E0SaVOdsSYqJg6oH9KS7UWAxxETewjep/guEMc=;
	b=ZZJ6zrpYSvBXJe/55NijxP4gibFkIKUwNyQIsWx8fLi9MmOk90RI1nzz3yjNkknlNU9w
	 zGSBdkVA7GdOMBsDDGWNCTuhwZ9c4JcnYvVph9iBT4t/SQWMB3mzZkQ43TlbqdAB5FTrf
	 I0ZLzTwhnUWqvJy/ihyr+TcIsLBCwUYERvn8QsbDjRHaZy2O0Rp11Uqb5H5QU9Hy85NRZ
	 7griXB3yykFDxPn0rlzHJ3bJznjy+VFauIx4Oib+Gcjzll8fs50Z2uyVBNvmS5dQEFswk
	 s784ZAv7bPzFXTWqo6MNUp5yfr7p8OOGWiRN8s8xlVGKSc0buT3zKXPYgNF2xpbehEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=XDmHGAq3;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7076F606A327;
	Wed, 25 Nov 2026 11:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7076F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=XDmHGAq3
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 5CA6F4B6C9;
	Wed, 25 Nov 2026 22:57:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795607823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOB01E0SaVOdsSYqJg6oH9KS7UWAxxETewjep/guEMc=;
	b=XDmHGAq3c/vEOqeYVFnKVkLyTuUlKSVeGZPR9QDxZSRB69z8OYgGAM0PWDSiI4PiG+4ZG8
	+mmBJgfWq+Kw6Pgijw/E3YVc6wt4MxrbUuNa2eFxwJUYNUlz294QsgI02gm3q3nm5O1w+I
	R3Km77NTjzcy/4jrN5rqLh1sOt6xesLWzG0rhUherpPcLUKRhj8T+cYySjAEtBYCjBkN/s
	ZU7mWdDWVX+/j7j5WvCxj1cdYA/THeU+jlYCFcSXs2Q0BhtMcYUayCGYl/fhPRlckKFUiB
	ygk9PUm5HCLlia4qx6hW4Ba11o/uwJrz7ETBW5dxu8B/Yz59DkycZGomLfdyvQ==
X-GPT-Reason: This is a legitimate personal/technical communication
	regarding Linux kernel development. The content matches a technical
	discussion on hardware driver patches (pinctrl for Allwinner A733)
	which is highly relevant to the sender's domain (alastair@d-silva.org).
	There are no phishing red flags, no marketing elements, and the
	email contains specific, high-context technical data (register
	offsets, bit masks, and code snippets) consistent with professional
	engineering correspondence.
From: Alastair D'Silva <alastair@d-silva.org>
To: Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Wed, 25 Nov 2026 22:57:03 +1100
Message-ID: <20261125115703.3724690-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910133519.459011-8-andre.przywara@arm.com>
References: <20260910133519.459011-8-andre.przywara@arm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Two issues showed up while testing this A733 pinctrl series on the
OrangePi 4 Pro:

1. PIO_POW_MOD_SEL (0x0040) on A733 uses 2 bits per bank instead of
   1 bit. With BIAS_VOLTAGE_PIO_POW_MODE_SEL, banks are written at the
   wrong bit offset and left misconfigured (for example, bank H stays in
   1.8V mode when supplied at 3.3V, breaking RGMII Gigabit TX).
   Adding a 2-bit variant (writing 0b01 per bank with mask
   0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
   and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
   follow-up series).

2. PA has 0 pins on A733, so PB..PK are hardware banks 1..10 while
   irq_banks = 10 maps logical IRQ banks 0..9. Without .irq_bank_map
   and sunxi_irq_hw_bank_num() in sunxi_irq_base_reg(), logical IRQ
   bank 0 (PB) accesses PA's IRQ registers (0xc0) instead of PB's
   (0x140). Adding:
     static const unsigned int a733_irq_bank_map[] = {
             1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
     };
   and using sunxi_irq_hw_bank_num(pctl->desc, bank) inside
   sunxi_irq_base_reg() fixes the bank offset.

Also, in patch 4/7, sunxi_grp_config_reg() takes an unused
`const struct sunxi_pinctrl *pctl` parameter that can be dropped.

Tested on OrangePi 4 Pro (Allwinner A733).

Thanks,
Alastair
