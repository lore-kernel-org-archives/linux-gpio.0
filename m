Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317763;
	b=gnaT3EqLpcyprKmqfba51p3Y5WGkgJMpg/0z46uzMGDFsd7ZPIDK6ajk1HGrkZzGoAH9
	 0vHcJHuSHYRZlUIOhiyHLoqGSZbzOIqbES0YQe3XQRffmaE50YuerpBPmZWAHaD0B35Si
	 Bz6ZmdtjJza/VxHok8LMPoBTgateZ2N6WS++1/IGNK9qHE4cPhOe/UuUX348hG0Qq9++s
	 x278RGzj+ZnGLLeUHSz25Zlm3WKZCYUXFPJ6l7i5VWzz7WW0CdACS9Ik05szAHmKvhfe9
	 Zz8E5eG7pCo93qHpH5DNkSXRT9faiPDanv8dZyoCyfNR6GsUOCsSln0aoxES2yjTqVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317763;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BePlmUzazBil0jZOyafds1nHUSQqBT9o0NsepsGpMCY=;
	b=OyLcA0hp0ioVxEqyqcsM1W0PbzFyWClscqHvXLU30loVwIkZzaItfC5f+WNeU+a6j+sf
	 aRu6IUYOvJAMaBXZMyjbR5LRbnb2s9XLdKsToGjMmHxEpVuU0AR3Y7YgrGjYdXiAxO1iu
	 VKVJyWboWNyUS3CrQXtbNqKAeMUK77GCE2RxTX/cFYVbDtBRrtLZGP2aUVuKylSUl9E0K
	 +VAj7htNVzfnJPG71YRCc9LB8sOj921HxM+TSTS0tYxIIIk8IQHKaVQM9Q3LEykVGhJR6
	 srjGlVUUYuY5nBVLPcs6bIM7bbA4Z0hsftzStZbDTdT2hm8UcO23xFYP9fXswHXZahA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28A606A746
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA28A606A746
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so2670104a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317761; x=1794922561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BePlmUzazBil0jZOyafds1nHUSQqBT9o0NsepsGpMCY=;
        b=Iua3fg680JrlxpFIahT2ph72GQ7uuyziltAZSwjR/X37hPgnb3dKXNyKKXbR+B/LDv
         G9HAgEKkKQZwQqnBtCcswNhsJpNXzBfY1mvqkTEurgJ9fy3GDISqk+k0kquVPysNI8ji
         5OtJl28lzp0dim0RJqiSgSSByJuA9Z+EJ2aenaCU0kw6f+6DvI4WeExRUuKTh2HZjjQu
         JMwsy9syj//uPDTiYFxWjmBjaf9/qYGBywEfHVizdu9LPyWUorLubb8geVzZAkp3dtC4
         7kIFmX8Zxlz+IgoigybhA9k/1Mo3+KbXIAOHFZQOnXvS6QO6ZtjHynJwSXwWSPC13qZy
         Cvmg==
X-Forwarded-Encrypted: i=1; AL+hErGPPMep789ENOWQfV3tPilA96XsM0aUQ7j7y9EsrVTRMPlrnSEGorntM7Slgh1m05CH6iqBmjKJu614@vger.kernel.org
X-Gm-Message-State: APuU4Z9P/Tt9dUZ+6764M+dzLuTmfNDfWaS2ZwCmjFhdXBLqfnfJ/aHC
	OfoFNd230rxeDG8DVP5OEIOwDBfick/BBCK8RmDPL4AHZoIYMyxTTovlcGamix8I3XU=
X-Gm-Gg: AYBFou2jKcmoRKoddFfUYSfFkhe+M7GhBRvWJLt3yMToTZYY/sHeynpkka5RVukTOpd
	GbhyP8tKwxO+AAVqTVoeLZ3boSkwEMRVN3wFVmAKDhiyjb/4leuZosebB3fHBXRQoz9Hs457ahU
	VfDh1EnFMK1y6LwgOnpxsRwVYSZioTa29FyxfrtLugnroq5u7rsnAvJxWv6upLqQWR5TxqekMlN
	QpEPc26kfnZYqrbd7kqAoVbDkIj9wue9Gc2VyE878mEJtU2QyMAF+6IQSre/SpTEaOt1jqE+PqM
	ujauHeHPw0NY/DwYTexCzhGQRuj6d5UBlSAwV4Y9WLvfRoD+iQgnD8+vmumiAGawybqJUHhaUC2
	pPszpgXV4wkhTOc6EFTurDTDrA26oafl7VHzDBUoShukRZmSqvoukrtXyAsaq5L4Kv2v8n1v1F/
	v95chsbS8HDdSXVV92N+Ws4uqojZHOWtVDoIyuFchl8tYledGFSOg+NAk+RMSlU1T+kq16D6hQM
	VWSBDJvqkZ/j/9aCnBLPczbVOUdQJuGkX0JQSpMxRmo63RH7O5D3C2YxeZe9N/dKzhtUSxr85ow
	zFqGV3fTMiV4oT9zzvXAzcUVxsukkVNuIz1qUHjRpX8T69Y/y0/YHfX1sJ5PCvDAU0k=
X-Received: by 2002:a17:907:d311:b0:c50:5e0a:fbad with SMTP id a640c23a62f3a-c505e0b1e81mr54835966b.39.1794317760899;
        Tue, 10 Nov 2026 05:36:00 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a69ce38sm106753766b.84.2026.11.10.05.35.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:35:59 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so2670020a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFRJnCGqFLshsMz8jK2iGzpbo5faX9HueN4lTBV0/D0cusA/LjEQ8EYiLdUojNLME2C5BL6lUEKfXtY@vger.kernel.org
X-Received: by 2002:aa7:d853:0:b0:6b6:4dcd:968c with SMTP id
 4fb4d7f45d1cf-6b756add2aamr1624928a12.16.1794317758591; Tue, 10 Nov 2026
 05:35:58 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
In-Reply-To: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:35:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHw5mbe8LY_t9zWW2VK9TuDDJYTQE_Y5GmjNpLzOB-zA@mail.gmail.com>
X-Gm-Features: AclHuK-0srTXKsnuWni1-CcV0btL_Vd3sgu665FN-7w6sZ24vTtXz1uHDKMnXqg
Message-ID: <CAMuHMdWHw5mbe8LY_t9zWW2VK9TuDDJYTQE_Y5GmjNpLzOB-zA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 11:01, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> In gpiochip_add_hog(), parsing a device tree with an excessively large
> "#gpio-cells" property causes a stack out-of-bounds write when populating
> the GPIO specification.
>
> The value read from #gpio-cells is used to copy the values into right
> places in struct fwnode_reference_args but that struct's args field is
> an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
> make the loop write past the end of that array.
>
> If #gpio-cells is 0, we can trigger a divide-by-zero later when
> calculating the actual number of hogs.
>
> If #gpio-cells is 1, we can also perform an out-of-bounds read of
> the "gpios" array.
>
> Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS, lower than 1
> and make sure #gpio-cells is larger than 1 before checking the
> active-low flag.
>
> Cc: stable@vger.kernel.org
> Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
> Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951374
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix a potential divide-by-zero bug too (sashiko)
> - Fix an off-by-one bug for #gpio-cells == 1
> - Link to v1: https://patch.msgid.link/20261105-gpiolib-hog-stack-corruption-v1-1-a47af9c51965@oss.qualcomm.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
