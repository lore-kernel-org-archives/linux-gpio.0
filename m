Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795094649;
	b=G/lXQqiiUlWwjImZCeWP1lO5cY1PGewrwurW11pIWhzNxpSRmSNZ19gKlxiqqYETvsiF
	 qm+1O90nMfv4WrmKXqA5mSM9LXpcf3o0OB+Acgc1HgxN+KEXzRQQkPoJ2vovhtLUtaCky
	 h4Hwk9bs5fjQHniqY5DDtQDVB3zD0mioAypg+YYPq6tHSxIGwjlwG0lFz4oowdo6ykrRa
	 oVnmOtX6etmegNxlgZqW6J24t2tQ4usFWJLyeLyDdTxR+wWoHrcyefVU5miLvK7bZRFNB
	 PMeYBziztGcuhnw7ZqF5yWxVJWKqp1qIIDMnJ3AiEAb913JZPG/eWPSxhuQT7s3SSWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
	b=HHwv8xkyJbv9Q4BHdbktwt43ByVtCa9BW/Sch/mzKwWwq2DE5JtUKlnBsGdMUc2VP0hN
	 fp4WbgYLxNY5sF5utKrIbrO+wBVx5nYT3WeEtx7BWl7Ii8vTWoJKWp2asUw38DaerX6Te
	 QwySteqU/uV28FuEfJ9a6tzaTiM/NozAMSbrFb9T3HqJ4Xc+L7ax9YjP4P/50XO4YMDuD
	 k3b20wye80tpWfgQoexsFfnDetmf9eAxPRd2miPAG9j08stzAFkyei6BqFkxGj0yIhUn2
	 N0SpXDO+ly9CMZoDMGdiwN88Ylo+t0ZkQzNlVvwcP65AC7phyC1HiEYbWfIXAk4Watw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohQxkIHb;
	arc=fail smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05433606A332
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 13:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05433606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohQxkIHb
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40312e2so6072527eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 05:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795094648; cv=none;
        d=google.com; s=arc-20260327;
        b=ivKyf1Bn8FTsJyxv+ElkWTps9ntbtX2cEMYkHNbCaB49IVkK+iRBAkM8xACteEaqpZ
         UP823/tDpdwlnDBcXNeGOub7odfZc439OqJcTNcW1j/c2+6T69MtsOX0NrVNaM2EDh4B
         6jZxVT450Xk0YUdVYiVhWWCt8UwSSkcUefnm9ruX5ZxkNik8dugG4gwbx9uQdEnqb74O
         UlrD+G20h+fWmnrLXUFekeUcM+aXClfbDJPPf3Mrxs6prpgSlpbK9jU3vhwZOJWlWyZl
         LPvgdp4JkxpxTinSLi1+Cad3ECjH95WlidFrDWUPXAAos1BbfeYEpHDCysR2p9X2q+aB
         wwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
        fh=lnJkY5smdGkCnWpUEUA1jimPrU4+jE9DGbengz1WiHk=;
        b=jMrID93QdJjIbZMn+0zowLQGFz5gflrQL5R6KTGHa9JEOHjoWAcSUTX1HzaKL4fzEn
         +9u+GTayBGYGBJ7pIDHNTOy+hZlt+MOw7mDHZ6vZ0rJVsAVdzpeI3RXsrdLfIIqJqaMc
         DYOYBqOhdWFItlfrOWDSQr+kTHXL6L6Iylan1gfVfTy8sNve5mW6aBgYs+e7U7a9bgcV
         5/xdw/82yzAs2RtdLMCccVzrlmDl9IUGJ3Ix5Eg0+KhsPKj/joDXfP8vT73WpUlOl5PC
         2NzCaglmHNxuIdtu+Ff7xh9yVcD5FdHL4oAr+8vVuC+pxwQstxWSlOah1Gzvx/6p/QUv
         2rvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094648; x=1795699448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
        b=ohQxkIHbfFyDyIxYW9q4LWS0JyCaGn48AkjZiAt6P4hauUtnBG8ITWl5sa7P7Qq6Yz
         l1YxudrCQY3gubPaig74j0rOJlJLwwUI1okCzHdn73HvDUcw8Qi5xOSKahFvrY4FbUbP
         9ir8bMZDfjIb2T035cHrr3koqY3lXIeJc1x3YrIQG5j/FEdZeCHBOIQKXDPTKJfmOej1
         L13m+Mc9umgXPOCZQ8MXgX+nXtL/1Cic6UcstYnKaiJuEk/MIpoutNARisjpADJOIzSg
         qAZ2/Uh+z8QdVDYD7Lkf/3AYVHruZ3u9m4i2rq0XRqtU0kTkSZhZIrdQtJl2uEmujd/K
         h/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094648; x=1795699448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc3A7vlsW7JssIN0XeC96WxSi0wSNBfvSMrsmA7bSqs=;
        b=wjYQkHIw+uVqjKMdaIrQLyusZmYE4IUWebqj7DGr/M/qzxpP1Yf3e9OWiu0GV0EiBh
         OUYvYXz6BWBKc7olVUrRGu4g4cDYpiOQet8yANtSH3GM+dq6Pm0qKHBsQAOOgOrsHiLz
         8YCCKHAliaqaF6HgZeKCLHjXquXydfpaK64U5aEfFHR/PDQhvapJ+nh6Vb9TZjNfKaFS
         RJMPY02HoIQ5wVG9gfqkODzgVEJD0/W1FNxBtWILxlhcQHHBar70l7pvmrljIpVXN21E
         B0dFgJEZkGvVooYvyNbxtpgi51f1oNKQNL258Pxju7eVTY3zaITj43cjIzh8BbdInUG0
         30ow==
X-Forwarded-Encrypted: i=1; AL+hErGEfWd2VQdB4Nb5OED26tt2yQVxy6+J7VPuq7s4voEHugudz+C9tZrirpgfym8ZcMwx0mAywCy+SJJ4@vger.kernel.org
X-Gm-Message-State: APuU4Z//oXBlgEYp8TQjBTw7s6IRK6m8v9nqvAEdz539Zul9ft3hwWax
	m4xOcQ2uq6ddzDDh6YNukuKlo0hipGLQA2kWK/Ba8Nawek07s3sCFEJU0aBq+NLFxyvhaBFrhzi
	RKRGvJSCrnxMZuxvLe5B2s/dSUU9mlj4=
X-Gm-Gg: AZFdTZdtGHFLRoBfycXbZybcwixByNZoTVa1dshGqMXm8KjTclP1ntDX2+MEDYVFqZd
	hoFaS8CQMp/MK4rcl+6F3a+8DM4Hqm9zvCjczFfj+AjmiEfngsg09o0pQ4Se0JXt1m/jJ0j32Wa
	kpMP93hnHtLAkK0I05W26okT5hcj3cuey6zQP8GOpYpT9EdLOU25kTof7jT5gVB/aKx8x3c0sJu
	W7NP3cPfvam/bhNRFWBmFdLp0p+rJQfjtW0wHBLF7z0AHmCz0QMMUSkr+XcdaMNUxCrp57TSLof
	YC5GgeNe5XBVwfKQKUtkYso2DCXDjWsEMUK8S0q4fq/YdSNQh9zXXqAncCBnX62fJHssKoEH548
	Xk1hpLMOdqN/PJQGLRro+M09PQiitI47y+O9iw1G9zM1mESaEu5jxcQpqwjqX9hOL+9q/
X-Received: by 2002:a05:693c:894c:20b0:381:2f5d:a696 with SMTP id
 5a478bee46e88-382815231femr5552211eec.34.1795094647673; Thu, 19 Nov 2026
 05:24:07 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117104110.240112-1-hj351016@gmail.com> <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
In-Reply-To: <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
From: khj <hj351016@gmail.com>
Date: Thu, 19 Nov 2026 22:23:52 +0900
X-Gm-Features: Aa3M54pq8_LNh7uQ__eLE8hy46Sn_JzIFh689mI7Grw_bv_tYKUKVMqusZDjKC4
Message-ID: <CAGr5VtPJq10ZZoF71+714xrkC_-3g5JAEKfXXXx+6MEY3PN6bw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mary Strodl <mstrodl@csh.rit.edu>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, sorry for the noise..!

buffer[2] is only read when there's no interrupt-in endpoint, so
rejecting every short transfer would break the devices that get the
status byte from the notification instead. Dropping the patch, I don't
have the hardware to test a narrower fix..

Hyunjung

2026=EB=85=84 11=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 7:33, =
Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
>
> On Tue, 17 Nov 2026 19:41:10 +0900, Hyunjung Ko wrote:
> > mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
> > len_actual - 2 bytes to the caller. A device that declares a bulk-in
> > endpoint with wMaxPacketSize 1 completes the read with len_actual 1, so
> > the copy length becomes -1 and memcpy() runs far past the one byte
> > buffer on the caller's stack and past bulk_in_buf:
> >
> >   memcpy: detected buffer overflow: 18446744073709551615 byte write of =
buffer size 1
> >   WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
> >   Call Trace:
> >    __fortify_panic+0xd/0x10
> >    gpio_mpsse_get_multiple+0x767/0x780
> >    gpio_mpsse_gpio_get+0xa2/0xf0
> >    gpiod_get_raw_value_commit+0xf8/0x1f0
> >    gpiod_get_value_cansleep+0x1e/0xa0
> >    value_show+0x42/0x90
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
>       https://git.kernel.org/brgl/c/f94f85f82e042c89a1e64ed3ff1d591a2bccf=
a7b
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
