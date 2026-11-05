Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890166;
	b=EZXCsX0H7qkaYZi2UmfXI34OJPQ72+g5ngMIO0G2HsLLJjCOAqf4L7dYoQ16YLZQH5R6
	 KvQdXznVq9sgLfy2IhHebaLUNIaJpgqI00ra6Saetb73K5qUJA6Rwad9fho86zymxQPRN
	 gD5Lp5NXmht5dvMNtySLEpsbjHvWHZczz19hpqqWvkk2RcYLrt83ITti7PdW7d9qXZUSv
	 LeYOv8wkDfkbjrJFUjTwwLrBRvCAMP9bOk31t7INQH9rlGSVUR8EEZP/6Jx8sOqvvRA3U
	 pFXNEL4h33COqAy3/TUpfrM++WnLv2OE/5QybjVUAijPAwkOww0tSwD5wZMMitaox+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
	b=Z/f9hPSgOfNJh6S3KFpeAN0CI/V7QmXWjhUFwNtNx8VjhAFbaLHWKSMhumVhQO9R/rrw
	 3Sx7ND6Ck8+A2anYyEbX6duRhxh7KvAp+sRWqHiDTNqMuiktJ6dYsofWSMwwFLtnqmhQa
	 ntpR0snsSVh6saigZYiUIjaxdRSH+AtSEWBS+D8AqvlcDZynvaEAWEdALuxbSPsSA+Qto
	 AqG0sRIn3xQfNBMDwtbgq89uFz3LpgI42zfeBJIG1LgaBsb0EhaB/j53AYGLjniQ9N10w
	 QO9CtWstVadLrm1b1DP4r0hTBvas3HS9yZTStsQB2xKJKqhiJUjpPivRsCADUtohWqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToF8LLeI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354F606A329
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 14:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5354F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToF8LLeI
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso567240a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 06:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890166; cv=none;
        d=google.com; s=arc-20260327;
        b=Q3xh+3uGukuqE4nuDPKFD982xPaWeU0rlbovOyKKePhWjtmwO4nPxKkguc9Zqiy3nM
         phR9O4CdQYMcKXZIZrCA2NLPc7iyoUNFoJs1rbCq1m4Ru2+kyOwzNNyA/ABRSC5e8vp3
         YERwTvyLuw3enbVWCH2J186C4egzpGweAJ5YMFZBTyjaFw1zK1gknajEoSeBSmR4nWo3
         8D3WG+U+0xQ14smhsAUHJlQ1RIMpexJI7LPrTH04xp+Cfv8a5FNq/+5G2yWm5CcXC1at
         hvVmav52Kp8IJn+9EUEZxi8NmO5+4o7gFNvKg0jO0in1KwcwrC9vUCUXXmsjGd434YzA
         xAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
        fh=EpnVGEGpSAW4psgcnXLqJpU8B0X6zNoyqop302v7nk0=;
        b=d1sgm32tm16n0b2gvzXN+2bEd4v4QkGSyGa6wl3UQ466hHCVIeVRDIKIbKYKdsLUX6
         dHZnqYOr1SBkcz4DD7XbZVJkL01ETqUWrnQpgQuucySTRDuRQ6eyt89dosKI3/lrKNFu
         7uKF/kaIFvk4a6PaIVOgrtKqhldk7oSuvn+1YzhVB6DFgM4Y13OaA/vR+oFjAX1xf8zV
         rlHe5nKdEFTH6zDa6CSnjGFyQVcHUfY7agrjW8tdxdiCwclOeGWyyB/Nqm3gp3qk9kpQ
         JOCw0Fm25aI4UEJRhhnShtxPwXE09E7B6ew6yoYzGbPPdFm0Lm2DAJMW9IENIoNFISX0
         jfBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890166; x=1794494966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
        b=ToF8LLeIaaP+GNEDDk68dv8hZyCHB1Ns6HmE9NgF9lc5WRDrzd0wGnIHuzkT9rviv6
         49lyBZqPiUa8udzzL/OMdqkG3ZwrK9E3yDjhSPEER6+foNDJy+MPwmb+n3+zI5c2rclt
         +cWa3sc0OlEA46tOguSeyt55hxMxicHp8V41KpLKIjKUEWTk888wr9cOs9pwZQ2GzbSz
         yfyi3v1I0bcLpvBqDcfMXAa268n1nSAvzPdfqrt2nOrBteP+Hw79eSiyWwx5QOfy7lJF
         nVYKaqVlBCZ9Fcatk6FBcyoNIhtZEdyMKWYWQy3DsTx1+d+fpVEehMb2wP6zJAT9+t76
         rBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890166; x=1794494966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNSQ2u2fdcn6xU89GMiVA2i17h7TVWSzkOj+YndWHWI=;
        b=HkAZ/MeQffEZCOUNMULgCToFGeKd59w0AMk4PfuH2+wgtTJxQh9GWyzInUSCxOZclE
         UwjcFv5rAsTSzFPsmbQXaxxPd3ZxPmFBN8vQseemkvZ8fQ7XEibtNVLusRcTaC2vKDzd
         noSF/QYAKZ5BJjKhb4t9bzwO15byni2PwPssmDiwDhWGyD+vJFDfPLsZsTN5vYCDIp8Q
         Ae7vvXE9T6jf2Fm22cRoNe+5NysAKYoTaO9okFcxDcb+2qXXabnvrkIQBy/zB26lN5Oq
         DvcSPFZdFCY0GwiL0Hd2EGI3nL2aIrQcj+tn7/Zh67ZPrR3UxkHAmS14dT6SkiibE7TB
         VRJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkuSA5yj8bPcalrqbyQx1ZiBnpQ5ck+HZU8QldL6cPZjvXzIrwc9q0vLxD7bUAlBEKZ8U0j6RtHuKe@vger.kernel.org
X-Gm-Message-State: APuU4Z/jUBOf4NZ6vYZVGRlp9UjR2EYh09Z/S8k4wUL59Y8EVir38GWd
	qReK9N6EPm3e/3Fk/Q3J9evLVbCxKDw7r0KUnpN8b/KSaRqEm3zi+GQR9rpGzj1JHHTr0qYHwME
	WCLV8Fof6+NXEGgkRpFGURgt0975jeFJ7KwPoCfrKCQ==
X-Gm-Gg: AYBFou2XSUAzvRYAHzOEhFlmnv4ZS1TqPlRPPGqwkJf4sITTasvX/UoE5WEBgrQclbr
	v1i5zaRcC6v1aJllKakbUkA8baIRMqqbvcmG5gUWFpZOXY+/zFLTPJ8flnHsQIYPfwZo4k1CO4d
	8tBbSpLfaqKnmgVARJpphbnDiKyNkwc6Xv+jsXzIDlaXjzHx/Y0rg8Q4gQsc1FjPNJnYAV0ssYy
	AYq5jwN1F2DUexo7nF9xLNMRIaAD5zgheboJYfBdtTgQ1gvm65pvzcsVXlYOJ4kINtZZm+CkKdT
	1dtVqAzvGRIDRhZ3iKsgpynxvRYGEO+c70JhjVzOqyr4YftUBjDeB5NvyvURZPyTa2XtAsPJan+
	/EOciRYjRO9AjjA8zJeXLqcITdYvl62jhIImL0BQYx+bmbQWOXACXETdYFG7c+6ahdIxNxMU=
X-Received: by 2002:a17:90b:3ccd:b0:3ae:6e7d:7fa4 with SMTP id
 98e67ed59e1d1-3b0afe69796mr2135935a91.50.1793890165432; Thu, 05 Nov 2026
 06:49:25 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
 <20261030200827.24648-1-muniquefeitoz4@gmail.com> <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
In-Reply-To: <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
From: Munique Feitoza <muniquefeitoz4@gmail.com>
Date: Thu, 5 Nov 2026 11:49:14 -0300
X-Gm-Features: AclHuK8yQLLiHYDlQTq1hRvCOMFp64maFXpGwrEHIdQgobRQ7mPOh-zouQTHhKM
Message-ID: <CANA1Dbk=Xw==LBpLSsYAxBDQMzxpcvkWajwzuZUZRC5-w4oT9A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious
 GPIO IRQ
To: Linus Walleij <linusw@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus, Mario,

Adding Mario to CC as requested for v2.

Mario, could you please take a look at the v2 patch?

Best regards,
Munique


On Thu, Nov 5, 2026 at 5:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Fri, Oct 30, 2026 at 9:08=E2=80=AFPM Munique Feitoza
> <muniquefeitoz4@gmail.com> wrote:
>
> > When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> > that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> > currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> > BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> > INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
> > keep asserting in WAKE_INT_STATUS_REG0/1.
> >
> > Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
> > a spurious GPIO IRQ on both the main and RGPIO banks.
> >
> > Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> > ---
> > Changes in v2:
> > - Drop the early return on !ret before writing EOI_MASK to
> >   WAKE_INT_MASTER_REG so that spurious GPIO interrupts disabled in the
> >   !gpiochip_line_is_irq() path still receive an EOI signal on the
> >   controller.
>
> Loop in Mario on v2
>
> Yours,
> Linus Walleij
