Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878277;
	b=M2NXPLy1jvtjuNDuYOaDvdDDdSfiaBoeVrRH08urhuHXHEEeH57ZgLVnLu5XacZOVVn5
	 Kw8YljJPGgGGJMAY4tbUbjD9LbgwQ0AfBVuN7dM0fCpt7hVEqlzeaWaGlrbRw6nqtYdC0
	 BiW5oHHLqxL3jKchQdbEraBTeVDhIKfrOilP5tMGZbBcqDBg0xG1AFEcL1rRuotrih+oP
	 i90HcNh2cYK5JfLHTZYjrMFHtaWCv6I8x0QHoZhE8wz1VXJY/C/0XrwtRZroe+75D8iIC
	 36QahrgCS8sPwHsnrhLiO5OEi3AiQg2l+KCsF/g77WjYRRjNSxbQTEZ4fDZbixZMHQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
	b=3XEO/JzuSq0hns0uN5YsxMXjNptMdV2n8bD+momvRvI+zdCw61t2itlPcgHatu3Knm0F
	 +ZI+yZjY3tEa5LSUMBaCtGFAhB4mfnUKiQ+ttja41hK99+BVsJy94/VTDvqxlCWn7uD9P
	 DS/FQ1O4xrj/Hydx9lfYdcHl/iIL1L3jRwDQokiVTfGOsYcHm5SrnzKfGEFOq4d+FrseR
	 17xw1Nl5MCXVyq5tRD45+jd3x5+KQ9aWe1OKqC5/MHyom09m1zy/Wi/YMdJ8j/GVbftQs
	 oy87XMQ8x7NBhCR2KW8CMiH8Jfb+VhRoBcWNsdWtBdTsg76WuApcDZWKVcpOAcBg7hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4YS2TRG;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B509606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 01:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B509606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4YS2TRG
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38133db970bso607507eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 17:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878277; x=1795483077; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
        b=P4YS2TRGiYo+OE7Dv4hYMsPhD9R6X+IqEgqM1bI5izV7LBwohPF+81z9NiZdW67eJ1
         m7XeaVnppGN5G37RPH6T4BqsCep6GsYY0TuTU10oc53Hump2xMM+VTdc27Tb5RgdLCPV
         4+oL3WKazs1Amc+QYAp8rat3K7noIPd3NgTpasLSxWs7gpJofGMod6+CRuYQrn6DVHH2
         7vd8KdTZDK5fV3vLSUu9lYdH9ooZce6ooqD9KXYv4KUb/oPqMtZ7K6h2QG1pWwRkYu3w
         yku/uBmh7c6dXXJL6vgz+3VLjVaI/ShTyQT1+bs+4CNxmdDRq4Mc7GZ77BBRZ0dmRWKB
         +zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878277; x=1795483077;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
        b=F0GqM0mswq2do5MbGvfNkkWU73Mf327tP5NxgvrcoJV9UwqJ1Ph7BtvrZMtWSLudeP
         hRRAXrzMbiEtfDH0NsAylAmv0IM7YURkXOYLviEOtnB4l+u2jFZLzJf1e+3NFedoLZk5
         JHHySl9z4DER2lFTD9KRsICAR6LEHWXinHUFy/B0X31UhRL5K/6W3+ikzfU4JfqOI2we
         UhZRxAi8Zu197rTNjx2oBmAwvkN86RUgRKt7jxeLTykt2JLtuxIGtUUO14/BMQZk4gVS
         C85fwgrhB55NfuDFeUJr7slr208Ji04tEvUU/Kmg7iXEbcAEwCeNJQbQRkp/dWcMG523
         4Stg==
X-Forwarded-Encrypted: i=1; AL+hErH29LwDmnxeEs5uXpEfZ7jIp8HtQu7ZC2TkEnZ9K/pZ03M9qqvTAwqiTIY9F6vHMLN1x2up6J7bOmkr@vger.kernel.org
X-Gm-Message-State: APuU4Z9bvFa9h4+HOB91XmVKVhqzvGci/bBxHHupKkujbEc/lKp153DF
	B0Tjl+DgEzG8aV5HFZUNth+SfpWQ1773DapjJNmMF52y385ggTOgIWwb
X-Gm-Gg: AZFdTZctSCQ00Vz4FYfuzuG6mkAHIXUP0rw7hGejanRYUaR1j4gRfGw9M0BfHgVM821
	P27/XSmPCAI4ep+smSpYqmnBQjYOp7ElIIQl9yXtrteoI6oovqhPuleBbPCOcOJRSjUzdiPRcyS
	gI2Uvo8b2F0DMCfs/e59AZtpuSU+rANKZ4qf2qr+sGYhDMdcKJucTuuXB6iHNr7LG6yo+HQFVnu
	Quyg4cl4qx5iq2TLlspAzz69M11j+jAQK6vkxsoTTI+nMNpdJsTDJweUPWfqFCQn+zm6ZZ7+VsN
	KpEVSpTFPfbnwgKAL4I3GZN9kRNRPYiSObeDAnikpcLK6rM8poz+ylWKSPsep6dUPshyL15xFPR
	c8Mjv4MQtLP5ie/XIOjQOujqaeirAH0Cw9P/uVf/1Icmw9DHnpXJKMxYHKVjWgjnfXTYtzBJCM4
	MVXg4DFGMD+nlXySGgDbXLBZfHuq8uGgMHeCWvNDFd4MoDVnHgEiRZbp9K7j4GxoMZ8qXP02W3J
	ywVha7n34p/zk6KnJmvONJUdMly6GxyqFD96VjJLsjMP0HdzTp0ateNR+QdemslPog9OY8P7YAT
	lzrrgO2kUhWon3HwrK9Z8uM5FYHucR9Erii3RxnF0M4HpEAI5hYhWoSNHZ/hSlq8SyHfF29TDUX
	bJiOo
X-Received: by 2002:a05:7300:540f:b0:380:c3d7:c263 with SMTP id 5a478bee46e88-380c3d7c590mr2579893eec.5.1794878276258;
        Mon, 16 Nov 2026 17:17:56 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm36639201eec.22.2026.11.16.17.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:17:55 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add X2600 pin groups and functions
In-Reply-To:
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
Date: Mon, 16 Nov 2026 18:17:55 -0700
Message-ID: <179487827555.2153459.1199232821591145638@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

On Fri, Nov 13, 2026 at 09:14:58AM +0100, H. Nikolaus Schaller wrote:
> +	INGENIC_PIN_GROUP("uart1-data-c", x2600_uart1_data_c, 1),
> +	INGENIC_PIN_GROUP("uart2-data", x2600_uart2_data, 1),
> +	INGENIC_PIN_GROUP("uart4-data-b", x2600_uart4_data_b, 2),
> +	INGENIC_PIN_GROUP("uart5-data-b", x2600_uart5_data_b, 2),

Per the X2600 PM, shouldn't these be 2, 0, 1 and 1?

> +static int x2600_slcd_ctrl_pins[] = {
> +	0x34, 0x3c, 0x3d, 0x3e, 0x3f,
> +};

PB20 (0x34) has no function 1. Did this come from the X2000 table?
Should 0x34 be dropped?

> +	INGENIC_PIN_GROUP("pcm", x2600_pcm, 3),
[...]
> +	INGENIC_PIN_GROUP("pwm11", x2600_pwm11, 0),
> +	INGENIC_PIN_GROUP("pwm12", x2600_pwm12, 0),
> +	INGENIC_PIN_GROUP("pwm13", x2600_pwm13, 0),
> +	INGENIC_PIN_GROUP("pwm14", x2600_pwm14, 0),
> +	INGENIC_PIN_GROUP("pwm15", x2600_pwm15, 0),
> +	INGENIC_PIN_GROUP("pwm-trig-c", x2600_pwm_trig_c, 1),
> +	INGENIC_PIN_GROUP("pwm-trig-d", x2600_pwm_trig_d, 1),
[...]
> +	INGENIC_PIN_GROUP("wait", x2600_wait, 3),

These groups aren't in any function.

> +	0x000007ff, 0xffffffff, 0x7ffbfff, 0x0000ffff, 0x000ffffe,
[...]
> +	0x000007ff, 0xffffffff, 0x01ffff1, 0x0001e000, 0x000fffff,

Port C is missing a digit?

On port E, 0x80 is pull enable and 0x90 selects up/down (PEPE/PEPS).
Doesn't that make the X2000 pull code wrong there?

Hunter
