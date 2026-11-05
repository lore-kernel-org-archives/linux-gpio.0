Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869764;
	b=bUcUXbVvv7dgVdJcNLcln8KXh2PNfmfoyOLG9OklqS/F5GZQg3kaj9QC34Ol/xLH+ci+
	 WX2TW7TWcxePcbMtQdOA9/wy+yo3jEhCCaEOCTPIEJij8qUXZqoAxOu6oyN/IZ3SKH96h
	 pdvM4lSJSJkuMXMZaxVsi1JJvlYddyosEd69KExB7O4MFa8AVWt0kzepAsAifNbVL70DZ
	 jIlTnf1wG1S0cG2LBUV9AkVvog2zie0CY9lmsRYbbaVvyfg/bmjJLrFN20z+GscWvnZDb
	 9KnAPQbEa8HfikY9LblIS94+JNoCjXYHR+O0/NtmJjtzSldOWh+Xj4vFORaHeepaG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869764;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XPRzF8D20vLGlolnD97rznjy/PyLkjp3WUP5Ugc731I=;
	b=KQFbUKle0gZgkLdAvZhc/L80uFr0IOSeqeLriXREn5YiFWLNi95b5A1lg8jpdKeo/6J0
	 lZ5CEJoj6euvsjKI2svEyaIZmOpfYdJ/DTfdUeusPFhA0xWefGTEytiKrlfyf8PmLDNDH
	 rQuVViqH82PeZJpERtLyBzG9A/9NgzbF7HYjAFTieZnqBQeNSS7xxFVNvz9Nv5SSxRVqo
	 ZH9RmKJGybRi5Gd+ZitRTFW4Crnkm4RAlhWrmnUIa5Ro59gwj7g5qZYEKg6s4S1HKd2NH
	 dR2zI9BkR6bPyCoplPp5bWYLRKD5wINcPF1jxKjxHJrw+JTWqmUvpoUclzxu8FyZRKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0YBO9Tg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F329606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0YBO9Tg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF9C1F00A18
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869762;
	bh=XPRzF8D20vLGlolnD97rznjy/PyLkjp3WUP5Ugc731I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j0YBO9TgqzMAtvAuSX2lrPFPyFd3f4S5azEeXlG0JX/KfBjdZbp/ITajY4PVdkKaQ
	 bDXhtthgDlDLbQpxRUazncbOeJnay3/hs4HDv8HsEj0VpKSfGKd2uf3LkVxiyI7vN+
	 +hyI4ZLXG6a88naS6Wc7g2EPDDoSGU+Yy/bYpPYU3ILhrXiDmPNLf13spSi2BhQcCo
	 sUNw25Vsci/ODn8tA3mgkTanWMSmEfEwWjIHjNK5Gjt4PwKVU7TDXC4xWJ0Y2slK+W
	 vk2m202zueGQiShMxhHYerAVjgTIFXvrfilAugoxVofi3gmnqtFfXO5m4O9p1Kdadm
	 ANysnK53Iky8A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2051177e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwkddHc5lq2YrS89euI0AhHJfpXjIj4fKAyGucnPwr//dX51MRBTFkJbyc4EeTr/XfcULwxwmOZfxFG@vger.kernel.org
X-Gm-Message-State: APuU4Z/p6VDvukHAmEuw2k8ldbPykV6Uf0Yr666vco+kLDYVY2huOn6T
	0+DahvMcQ1bhoW89zKEPm9zdrrWVGgDln1OlkMu2lRo6zwnzmocBzi4pYpTKywirMDZSs+onHEz
	9fxzYT6AvsejNZ1Dr10gD2L6GRxJZeRo=
X-Received: by 2002:a05:6512:1188:b0:5bf:d238:6af6 with SMTP id
 2adb3069b0e04-5bfd95803fbmr6074827e87.45.1793869761546; Thu, 05 Nov 2026
 01:09:21 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:09:08 +0100
X-Gmail-Original-Message-ID: <CAD++jL=AX542N3nvuGO2g-_935i21oLKn5zgWPicZHONAQojbg@mail.gmail.com>
X-Gm-Features: AclHuK8WT5jEsKVLzn0_U4Qj8gkHXwp5ZvLQA1T9S3Oj-ES5esPBMeo2lsB5KPY
Message-ID: <CAD++jL=AX542N3nvuGO2g-_935i21oLKn5zgWPicZHONAQojbg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc: Markus.Elfring@web.de, brgl@kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Yd_Tseng@asmedia.com.tw, 
	Jesse1_Chang@asmedia.com.tw, Richard_Hsu@asmedia.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Szuying,

thanks for your patch!

On Wed, Oct 28, 2026 at 9:46=E2=80=AFAM Szuying Chen <Chloe_Chen@asmedia.co=
m.tw> wrote:

> The GPIO controller on AMD PT PCI platforms currently has no in-tree
> driver, so its pins cannot be used from Linux.
>
> The existing gpio-amdpt driver cannot be reused. Setting aside ACPI
> vs. PCI probing, the hardware differs significantly:
>
>  - Register semantics conflict: offset 0x0C controls the clock rate
>    in gpio-amdpt but enables interrupts in this controller.
>  - Interrupt controller: gpio-amdpt has no interrupt support, while
>    this controller has its own INT_LVL, INT_STAT and INT_MASK
>    registers that require a full irq_chip implementation.
>  - Wakeup: this controller can wake the system from GPIO interrupts,
>    which gpio-amdpt does not support.
>
> Only the basic data registers are common, and they are handled
> through gpio-generic, so little code is left to share.
>
> Add the gpio-amdptpci driver to support the GPIO functionality on
> AMD PT PCI platforms.
>
> Co-developed-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>

(...)

> +#include <linux/bits.h>
> +#include <linux/compiler.h>

Why this include?? Add a comment next to it why it is included
if this is really necessary.

> +#include <linux/kernel.h>

I think this generic include should not be used in new code, use
specific includes.

> +static int pt27_irq_reqres(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +       int ret;
> +
> +       ret =3D gpiochip_reqres_irq(gc, hwirq);
> +       return ret;
> +}
> +
> +static void pt27_irq_relres(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_relres_irq(gc, hwirq);
> +}

These are reimplementations of gpiochip_irq_reqres()
and gpiochip_irq_relres() so use these instead?

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This email and any attachments to it contain confidential information and=
 are intended solely for the use of the individual to whom it
> is addressed.If you are not the intended recipient or receive it accident=
ally, please immediately notify the sender by e-mail and delete
> the message and any attachments from your computer system, and destroy al=
l hard copies. If any, please be advised that any unauthorized
> disclosure, copying, distribution or any action taken or omitted in relia=
nce on this, is illegal and prohibited. Furthermore, any views
> or opinions expressed are solely those of the author and do not represent=
 those of ASMedia Technology Inc. Thank you for your cooperation.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Eh? Get rid of this horrid footer.

Yours,
Linus Walleij
