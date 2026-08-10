Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6F23783C4
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344563; cv=pass; b=JIZSgkUBUtglJhpVWfknvM8p5/jFMP5ojwcQzr7K1pCgNu1Qmt2Tw3oEMnEXPfxCYlFTLFNpxgRPSfmDdMJWDjQdC9MPJ7HF7C4wHvhn9HmZ57ggKtyE3Ue5g1YXZFuxLRkCzZftMG2f8Yizy2m0GzhkcEwrjLH9opH8qh8noPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344563; c=relaxed/simple;
	bh=8lNt4bKatfD0Q7pdbALh51Gd5gGYBHZwkPn1qJQuaG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPsc7jLmcn/1nJMbQvAE80Ro1VcHf59JgnFFY1+/h7QwFocBYj55r8McEZMC0JVYOY5M4qHTEIzeTwdENfRCUF+DZHuil65u0KTZvhgsR9ZfXhpP1sC/vNQevjJsghNZWGmmYTQAQihaa/XtnWpXhKeTw9YQmz/I2xcj4/niF1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=razZYmau; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="razZYmau"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c197e7e4e94so235274066b.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 23:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786344561; cv=none;
        d=google.com; s=arc-20260327;
        b=QfU+vvQILIhQm4XAEaYQi/r9EryYov8OpWsWnIYRvRSCt1nWD4kblh/jfK7wJw/A8I
         IRiyy01Gwt+PqVn9OCBOOZT2Aa+IGRVRDGDMH2A/IXVG/7d8OJWOXptgn1vJMVtnLYEd
         YG5eiJhV37MBraUqISN3n31X3uKOXruJf86js53W23PR6Ha2Q7S0v2Dr6Fm9eeGFbc1E
         JauuMyLbLMWVdYbwBJMWacgSJ+MxYy4nPmDI1qBqWt7qEO/WI9cegw3ygAAla5vren8n
         k+gkja/wgwOjRHdsx54/uqxNxZepOBma3KlUgPjzfi87ogzYbF/EAfZD/pfWEo05Foz9
         wcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=;
        fh=CV+ScV8PbD/sDFLzy1p+r7MGrT2qVw/5s7Hd/FoVts4=;
        b=VLzFN6YeOZCxp1VQekvNoCW3VFtmEPh8bvKuaf+GVfwx1OcXYhg4ROmU8DqE3OxfEr
         okn2rCraxq4dqmCPp6U6sSqv0kLqg6Dg9F1uVotkbG8roxjwu+rC3ma4EzLZtftDxZGg
         vnbcDnIP4CH/caGHSoJLFWmXv36W8svDW2+lHeSdx2X8Nt8gv5c0YJ4UyL3r/rEbNaYI
         8lnMJZUYsdylcQLv3wYQ6R66Cl4SZ1mZmAsJALfqvSes3rfSCWY7Uek+2SzEevJStknZ
         gpl8xGymI/17qz4kMmcPGHm2VZJ0qvyrg4Di1KcUjVVc0LwgZJXkRKS8MJb0f6/ph/UV
         mTJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344561; x=1786949361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=;
        b=razZYmauRFNNW4CoJ8Hvu2Yrh9jZLYTEUiHuZZjVkSRAU5imrMGXNR6TWk2ps5vXZo
         wziEhkGr7C4nm9YsQuQ4pBkvNQ07/6zo1HHmTRgqDEI8RHbx0yz3CKXZQuHqUsJFo2YS
         didMtAonTIjEkbrDA9mml1/TUIQk5rJsSxhQWvngwo5ZYmuc8oZmYoYrfy6UBWI0RWNB
         WXIeTRYjv6JrikCJ9yuQVc9XexiHbOkPppkGSsEnVwQtEEBMV1f+PK5NqOuCNNFhJBtN
         OZ6BvMPg992J+kRHyMs7RaSyv4FGXfTkt+XJJCS+88Gv14/DgBKEI+0lb2vgT882DR7q
         x3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344561; x=1786949361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJqDg4ZzbSRGiuJ0YRjEt1ouOh80YyNLLBfkuJ2C66A=;
        b=N+4emVNgo+nBE/xt10vbTO+38djgGk0dsPnCX3GDZ2RrT0vY8lknf8/RMFPDAqVuTe
         nPF7a8LIuKY6KG+ube27iVDZFHlhvjluqStbd7y3gNnR4XlMvFIyrCVVbJhc00Vyor43
         DQsZhX6ZJisl1PwihhQ5izUnDtHgDGzyD25qNHVqK0YsCfZ4TZbdHcyD/Y9I+ZwZqqoB
         V3GMfk1Kp+Uv89XCKfrG1ElvF/TzsTmDGIdXrHvweqbwFWroFUGTrL7xf3aMpR+Z1P0j
         BMuzSmaD5JZo1EOjX7WPmgA/5RgcbVnj2OE1MtmEIjIOKy+Ua4VdZepUTwvROViCOYpF
         Btug==
X-Forwarded-Encrypted: i=1; AHgh+Rq9PSW0GB4GfqHJUFwWSlKJ2ohKKq1vqsg4JeqtGvBi7Inj52NFWo4y30usbvQ+CSILncZaxDI9dkwB@vger.kernel.org
X-Gm-Message-State: AOJu0YzrdpAcIxr0Kv34k/igWtEbTtE13FUyVpfO2XeO7huue32497/x
	0rEij/ruk1vkMqG9X3wTvvXKBPf9p7I1TL5xuRz0t6v1iuwvBdIO2b/kJ7l4T5VKydDWNhUjNKG
	M6cj5WgboQEsFeT65l0XhGY36u1W7PiY=
X-Gm-Gg: AR+sD133iwpEEOFZKlL8XOHXm7nLNWmzS2dxnBzuay8ND0eEKuKlC89ouOlMioA/ORQ
	j8PBaRa0LM8fEPnnQo4mxlhVLYHJ1CqALBLH1SfaNXyrDqxnbiLX4n30Hb+izFKrx7Vc1yQ2oZK
	7xVZYYcfiiP4Lo8IdywWqKNtqO5TLl/I7r/MytTy5gQT0wJBT1aDSjSg6KW4e/Z10BFYTzfmsbq
	jLMGZYnbsnWBXG1F9h9hTGtfkc/iY61bQJVy5tELZ/0h2rb50jkoDVDoAw/Iwiln6K+5z3eeAjH
	uy7LYxIPf6NDObEfth5fJJQ5iSPmYLjP3Bv8GbAyWkWZweKCXuD+gxETOQ3hO5Lu2LZTItZMue2
	E55gE5/cPXZEop0XGatbbNqP8pX2NuIMjXWDLnqLbQ0ROQeLREnTMKCAIBWlertc7AFOvrahVYu
	mjLgkTWwS3ClYaJ/ol+719jfyIweFkEtaOAr1pMCpHCxk=
X-Received: by 2002:a17:906:5a99:b0:c1f:c7f0:b433 with SMTP id
 a640c23a62f3a-c208729e00cmr656355666b.9.1786344560617; Sun, 09 Aug 2026
 23:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-5-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-5-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:48:43 +0300
X-Gm-Features: AUfX_myvkt26qnEuHXO5Xk6ubitJ7QWhE9cAvuIMlCWxlqjxJGXs1q6Q8rN1zc4
Message-ID: <CAHp75VcGqgtUxYcrT+JdqFYX-4oKSfGQKRHd9DoaMW3f1FaR1A@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: bcm: iproc-gpio: Propagate errors from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

...

>         /* optional GPIO interrupt support */
>         irq =3D platform_get_irq_optional(pdev, 0);
> +       if (irq < 0 && irq !=3D -ENXIO)
> +               return irq;

Here and everywhere else in the similar contributions you made all
over the kernel:

>         if (irq > 0) {
>                 struct gpio_irq_chip *girq;

Use the 'else' branch instead of the above.

} else if (irq !=3D -ENXIO) {
  return irq;

But before doing that, check carefully if this is really what we want
to have and how it will affect the driver behaviour in such a case.

--=20
With Best Regards,
Andy Shevchenko
