Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434155;
	b=PsgbKyKSSMW9eoY5wEXaSN0fMKfptzzJ0HsqEOLmYstINpoUM/kyQqs8/EyobuYXfhY1
	 Zgc0GvefkavO2s7wTEgYJN+W5dYH7VYx8sOSYCMWsvgCCFPaB3vKytw1KhE67QqvrGO0T
	 eoKSmCJ7Zq+Et6p0L7jHntdvRdH7xwywJCsc1esJ98eoVaC8csSpTKCiSkdDazU9e9pWJ
	 hphXeHBKQ+1KlkUJn4yz1xvLR0rU6iDd4dkdYOHNfxtcSef01LH1Hr4tenVAgQJOu9PeX
	 9TYEl1yU6ug22xYA0cf4/R2XvtKLaJVNulJH5JjSrFSdek07wraLGSLsyAAPtimmm6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
	b=1HRmOo8OGpmOmpsrBciHWg/eDUPfxtv771aK483/0MCb/u9vCpTeAavb32DqyW+lstiV
	 LUhlnszLKlVIuJa7nAlXZh55u9pwjZ+7bGchk1P/21GFPAljVJ8SutbxI+WtBntA0X1g4
	 i/TCed2eEBiQ3gdWrU9Gdovhx2YHdgzzzZ63831e3HnibtK6l8YVr2MoyKNVGtzEmICEd
	 WSwh9OEAar+itRshOd0c/1MiJCsBtrZ+V+NKaLh57DoolUC7s3KeMaZCeJpgsFLouln3P
	 eMw80iIte/pjCo7X8JMCKssoznBBtvtpoe34QwCEpuNIF1AzziC/SNShMz96khQ2DDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="waG4/sVP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE4C606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waG4/sVP
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8633b750a19so580088a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 03:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434154; cv=none;
        d=google.com; s=arc-20260327;
        b=JNIbM692YJDhRpCpJwrogiA3VHJnG2s2xgqgzYeImNyMgmgIXG5OriKu6JRkFCSoPE
         n3AgyuOPVREzfliVCAZkGcKylPOHidJuHxJ0rGViwEDulOfdKyb0MZm67BxrFEAmMqQf
         dmkQswjPwmZ2u1GiwNwmrmFFiHsqNA2tz1JIMpIoMtnJcLcDajhOUFfwAPLvLMq3hKmh
         zwDKX/Oy1Kjmy90g1LunQcM7r9xc8odBNTwvrUhisuQ30IY5rZ4GevirdwG6ZXZ1XT+M
         J6pRpjGXBzKMb1gdv1zRHduigYBS6jAA5fsnsOmxR1r8+exBTzf/d47R1eiu7gRfVPFQ
         QxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
        fh=YtEF6B1i1P4TrBQHOPpiMPtnfQ+DIbatSEsVMwghCTo=;
        b=bGYRGkvBinhIV2NcoeM+culKx4vzXRYw4e1BUNh6EaEvxIItAc0owdTZ/Sto0abgY3
         B/54PAtLco9QQ/GSOqRjYvlY9oo3ZnJmowScMmkaJjCgn+0CtYoLmwMifCsUKljp024Q
         AP/uhHufszPVPY0Bfu29e9Y/jd+qnIE8ZlvxW44+T3Gss83vARyR4u2WpyrkXyCHIdew
         IPtOpGr7RQo/rspoqcJD98N7stfwN1Jl8x1NDjovROsQfZB/SvdJcYwho76Pdje6YQuU
         u2TvXiA0sWhT77po8qwM2U6/cHYE6pD/RaaZyeEc5Ue/wxyu1Rme2VM/xmPe5IHe2whh
         AfHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434154; x=1796038954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
        b=waG4/sVPeZingUiVUORMLtng9Mbq/PKGmshRRhVj3jNPTuxRjIY8mZH6h37zpR4yvL
         67pn+EBZw7qYlVRXJSY3kymoYqtK5ndAqUgf8WBAa80q7ULF3DwZeO8HKPUg641jBGlO
         06o/y/nMOBlc9XjLN1HjtH8F/4VjFpP9C8wWSnGFXHPDiwNRBe2Nc8o7xvNCNxVkEVIh
         dlbKfPr8nWa2XwPTinmrZNQZP20gOQeFzN9zEDLaIjwk3f6rLv2XAulIKDNaM4ahWP2E
         Oft2NKK5Nfem8BGFabWyPKJ7DaGwnI4KRR+oki8vzhf9cET/5uJGp81G0Nrmfpsr3hL4
         r1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434154; x=1796038954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
        b=eGzNomsrmaVWzRaER+pXYayrQEGZGo/BCtXw/xq6woNnz+/I/K2MrvttNraqhhw17x
         FZXyv9eUOAD++XiUcGDRAMtSFkoL7vEQmZ7HnEFgXr8kg4Ccy7Rj1YptZrRZDg5NDLlR
         p6rCjwRmI9Hzw3NtayXSb/JWCgKSUKPRFWQ6XH/OmFApy/V7lu+vqrzzQjVSHPrqPDZo
         YCXwEuMvOkz4YRdYExo+b7q97og2LbkvHTdOp5grL+PGPdSDRzXTr9BpSRVpF5yPLqxb
         jB754OiAlafIDtF5UHmQ866ttcO75f1t11lKmjQRu8Wwb0JlGShIoCffwlrsU8EMeq/q
         VyFg==
X-Gm-Message-State: APuU4Z/FKtiiVLDK1LcsMAeKLROdh5EGxtxMaCjGJ/Dl02tz3koRWBfv
	XWzEHrBURamYhS+zOutRivgKqL8j0ovyUNimeY+6v/RsKpr9JhascAZs81FSeZDnMsVH00JpZAo
	gbauW5CioEAsNSDsJ6+Oczt9Ea9N4YM9yzruvTis=
X-Gm-Gg: AZFdTZckG7nbjhxiI8x4s/X9r+1R0fWzGDieFr7nwRgrGoacKvaTadNAlncdq1orcap
	nLVWpmhOhZFodCB7Ka12GEpHJZ3x2P0hwZQ18ZNqIfaDsSE6Y+wqCuwEyGtKRbCBqED3OoqMh3e
	o5ak1YyH1ckQvpoWH+azvQ9hvdFxQnCGkhb8GYGo34N7LWpcJuTjEDusExBNEQRlcSwewVz3Ubo
	F5OA2T3IvvR/6UOk4TuAXQDNfYizKx0qYV08jKFsu1jcMVOiA9c0ZuHpylNL+HDBh/0jDlO7iqK
	hSbCOITO6N5lERY6LADssSqF/Mj/F7GrvDly/QZnPxaHX4CbSsuQoAiXYHxFUt5fALZmACwrXOn
	IlB1guFB7J7iqcKzjSPpFKMKTgFJQZQOzQBfiyA==
X-Received: by 2002:a05:6808:1484:b0:4e4:627a:e0a5 with SMTP id
 5614622812f47-57a0bb6bc73mr12310235b6e.40.1795434153972; Mon, 23 Nov 2026
 03:42:33 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
In-Reply-To: <20261123113234.197852-1-mariagarcia7293@gmail.com>
From: =?UTF-8?B?TWFyw61hIEdhcmPDrWEgRmVybsOhbmRleg==?= <mariagarcia7293@gmail.com>
Date: Mon, 23 Nov 2026 12:42:21 +0100
X-Gm-Features: Aa3M54qEgTnUApaug_umccwNyfXYHicYOq5jO2DBK4wHU_AjN4m9rB3P8QZtQ_E
Message-ID: <CAFOBSkS92tdv9xkwYk2MAyYk4J5YL1b5rqgfbT4_A2prCJRupg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: pca953x: Fix TCA6418 multi-bank I/O, caching,
 and IRQs
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Guy Morand <guy.morand@bytesatwork.ch>, 
	=?UTF-8?B?VGhlbyBMw6licnVu?= <theo.lebrun@bootlin.com>, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 23 nov 2026 a las 12:33, Maria Garcia
(<mariagarcia7293@gmail.com>) escribi=C3=B3:
>
> This series fixes multi-bank register access, input register caching, and
> interrupt handling for the TI TCA6418E GPIO expander in gpio-pca953x:
>
>   1. Disable REG_ADDR_AI (0x80) for TCA6418_TYPE so multi-byte reads and
>      writes advance sequentially across all three banks, reverse Bank 0
>      bit order (bitrev8) in bulk read/write paths to match the datasheet'=
s
>      MSB-first layout, and mark the input status registers (0x14..0x16) a=
s
>      volatile so reads do not return stale cached values.
>
>   2. Support TCA6418 interrupt setup, edge configuration (GPIO_INT_LVL),
>      masking (GPIO_INT_EN), status decoding (GPIO_INT_STAT), and W1C
>      acknowledgment (INT_STAT) by reusing the existing pca953x paths,
>      while rejecting unsupported IRQ_TYPE_EDGE_BOTH triggers.
>
> Tested on TI TCA6418E hardware across all three banks (single-pin and
> multi-pin reads/writes, input volatility, interrupts). Also, independentl=
y
> tested by Guy Morand on his hardware.
>
> Maria Garcia (2):
>   gpio: pca953x: Fix TCA6418 bulk transfers and input caching
>   gpio: pca953x: Fix TCA6418 interrupt handling
>
>  drivers/gpio/gpio-pca953x.c | 120 ++++++++++++++++++++++++++++++------
>  1 file changed, 101 insertions(+), 19 deletions(-)
>
> --
> 2.52.0
>
