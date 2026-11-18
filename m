Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035421;
	b=I9BfC1aXfgjnBTvfbIhxwjzUYg7MyiBEib8a1SCuGGLUPXTy3qNpcuvI5aAW4baIdont
	 fUceZHidv0RoOy9H7rEZmjzvwDiaGZ1R3yOp0umhLx5/09oJAAIShqbxCr+QzXhHrjNhF
	 eOB3UcAlBB4f/mguN/eMBfNB3qp8XieqywL9iHmAUbksQVegSsdOTnVKmYQzxOttoRHt0
	 FtSS9wJITjerfn+uVKZnedqRM5/KShdKl5ll2KqG0U7wwECwcsUMswh85E0E1bipgRzHd
	 +W1ln3L26owbVddfd2jqoSS3f3lR4E/7ooVhh36pucdsq0ee9z+zA01j81IX7CMylLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f3GNnuqRISLu8fzYE97bR6SxD+k6/PUka28NAKwn36Y=;
	b=wmBFFEq7lgra2oXw5NFJcYMDuI5+xyhaArVH9pEJkrythbBfSEgIs/RqttgpPy0SU9zj
	 nVk0+MAq6rYmmE0XmGJ7LClXUJo6uyLSgaoVfW8ekzlG7FmmsjgGupoHS/ZKvbf00CPL6
	 fhe03mYD54hRz3S0ZGsjEKUs/O4lhdtC1UH0xGEgboKEuk6XfpO7ybPZywQCzL6FwyYMj
	 RRJkQxRWtOI0R1iZcOaY+BgmeSRlVYL7xwvqrCdCMTSp809BYqggGUdxTUhdhvYkFuEbF
	 tiP9pH5UOyVqCtUvaYOpixWsxSH8wtU3YNcTEDXbFnz0iucpR6xOmSs9tgrsC2Xh19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypaA5fWt;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB4606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 20:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAB4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypaA5fWt
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15865805e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035420; x=1795640220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3GNnuqRISLu8fzYE97bR6SxD+k6/PUka28NAKwn36Y=;
        b=ypaA5fWtJcjY8vKmt6s6c+LO679nTEiOgmTbOKI92SmEDCzccPSsdZDznc3SYcjYul
         Lp315c8Z/0aLU5uH17V2gXGOOXzy7jch4VgWkJEixjuwdTQOFqRodGMjoY9mv+Ce5ogJ
         mjHjbB99afM1lD98oH1XKLpl/S3Kn7Yp1C7trsB9OQ/tMvx4fFKS80EA91HbXrUwNvAr
         e0cTIap6+2qoJQy5PN4ZOsF2Tw0l/bfKj7HmKbOLj1jNtceUZZuk/Jl3jeIMQBNJpvCY
         gpFpQerh68pep3rHkhXphr1VoYjesezupb/J2+5MARrk+nPqFnx8Skae4DXtpeBNHJHM
         1S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035420; x=1795640220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3GNnuqRISLu8fzYE97bR6SxD+k6/PUka28NAKwn36Y=;
        b=ILFAuSiruaEwJZY+3gkh5w0HxPGABNAviRDkYpA2kZ3bwLSHcshXZVbrs6PQbmT2N3
         PYnHWupKq1Y4AUB6Ds260wKBcNlv+uu2xrav9+5ttbY9AzMeOFMoxios4NyWB4uspaz1
         xbxuAe/FtjYBnVYEfJYjIGb3EHltKCAIrHFWaTFiqFBusXuRLbkndUifj4Xa2Mr+9IC5
         f5ZMsKH6klyJVUB1dgyG1LKsm9UgOVz/tANTEaCk/rfFrTlKDM6oemkpb046CIIMSWos
         N7OdfsJw8n2N/PKsiHSWBsDZWuVQycDLkTdIXB/nfeUad6kBuEcc+gXJyGN9vfflEABn
         1KGw==
X-Forwarded-Encrypted: i=1; AL+hErGTzsVCDGmLdj3NdADKW8xQGzsVOoQJPRS2NsrMJFMfsLdLceGqT4+/w6SDeIQMWjRwJsAArmmQxTqT@vger.kernel.org
X-Gm-Message-State: APuU4Z/vdZsR3Ul2pcO09q4EINAobbr4gOfNql2oybicMQNl4eIQodZg
	CI7qMCvrsvQrHsuBoam48qHPrcjCVS6/y86kKOISldupMvEKPcVYmFD3
X-Gm-Gg: AYBFou18188dwOo61wl4kW4r//VqJVo6dKX+1efwWcYDM91spi5lNaE1RYIVXG3z3/X
	gSLZBPuMuyVLMZVejNCj2Mq2Z75/IdZCBMLPYwX5KhAsY2XTmENcTbDXdY14n00JznReTfK69AF
	0XFtp47pV2jxGit7kDuUtkfbIXyYVTI75WIXZT1Rz5+5egUTqcgk1/aevPj8YpF1sdBrhXKqPQf
	LxPHezs4ZF1rUZAJoRk+cf/FcPpY8BjPpOoW6npBAUqevsk+VQTAjNbdNQrS15go9RK63iFAVbZ
	wztWW5u9JyVRieP1elIrUuRMOuzebrChKgNXk4bnV0E36EhPZ8/sB9adIm61XSw+3mFOgp5syw3
	fDpE99LVQZKLeCA3FbbA/poJgXLsCIimg8JI8Deu2gwLgQv4R4dVZ8eP4p/BZLKfYwgwVgah3/j
	zpbobOfJItNlTbEf3fkUS0nYEEyVancQi5oXCMLJA1K1172+FRolKhA9k12YW/+STd4TXJK30Ft
	z//8VafU75aB1jrLFlAz/j18rWT/UDY9UU2l7yGpxnxLhf6ZXAEq8BFZH0NpmPWiOMe6Ugx7pgH
	chS8D8fo3vH0jgwqEA1J1bAiyRDr
X-Received: by 2002:a05:600c:1d2a:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb7da34cc8mr92969645e9.23.1795035419433;
        Wed, 18 Nov 2026 12:56:59 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb832625b5sm18265795e9.11.2026.11.18.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:56:58 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 03/16] HID: ft260: add GPIO support
Date: Wed, 18 Nov 2026 22:56:48 +0200
Message-ID: <20261118205650.49046-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-219595@kernel.org>
References: <sashiko-outbox-219595@kernel.org>
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

On Tue, Nov 17, 2026 at 08:23:52PM +0000, sashiko-bot@kernel.org wrote:
> Is dev->gpio (along with this FT260_GPIO feature report read in
> ft260_gpio_init()) still needed now that ft260_gpio_set() and
> ft260_gpio_direction_set() read FT260_GPIO from the chip before modifying a
> pin?

No. v5 removes dev->gpio and the FT260_GPIO read in ft260_gpio_init(),
which only fills it.

> Also, FT260_GPIOCHIP and FT260_GPIO_WAKEUP are unused because
> ft260_gpio_init() formats dev->gc.label with devm_kasprintf() and checks
> enable_wakeup_int with FT260_GPIO_3 directly.

Right. v5 removes both macros.
