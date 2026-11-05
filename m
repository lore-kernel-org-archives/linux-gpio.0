Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866755;
	b=5qSO9AC3qjzeUp/XcYIs5r7ee8unZhaNBk3DFwcxfUmDqLgTuwe4FP/XLOhHjg+PkPug
	 fRS4rvEKn6QLAkb3iPWhjVkzivG5XF1PmJNCriKAFqK3dt3PHxqQFfT3c5BkfOAe1GOxu
	 /ybVLbiuHXtYJG5PWdIubWevUb/+KyfT+wRfU8gGiFQOBXPDOYzwnSGf/hHvAM6tuvw1s
	 173tBaoYhfqxPVUV2FXBaazvooB0VL9QaFKKkjmoaWQpFCXcK8KjFzo6C4AAdNzJGkEUu
	 5lfkmptbqWkF1NECq9jbscNfDeygYYYRn569w0T9UAUishtDJzdTa+yFGQcr5B2ORRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866755;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ib4GITzjYi7Kk431BobfzMOoYY06Hiby9a689p2pAyw=;
	b=l43ZJdX1nlx1/al9g5wVObZjEVuSMpBVtGvcGW9EXlbzoWmvQDDAfZpZRo5uqI6psqwe
	 dw7LLKtSVBQvNIY95kCPFGmn2yDAqBMjG9ke7Zepog7RUTsIEoO9T5qSmQ02Z0bpBimsy
	 tVT5wPjxQNiKBpiAkUIfuW/GVYnaDPCYgiv9jdyNYW5zS6BgyaKZiMNouaPlwrYnpOlbA
	 54C+N3Ev1tgDnm3qVV3UgQmrDOeN89qCDhmQaUWrtm1kY9QFiN+eaNBbHpSI4Qu2OTgl9
	 GVLFZFnx+NV0/yWXQFpe9Js3PDNKisukm9SumnblXvM6knh4roAeTBn6e00zhYeC4Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X92nUbgA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BEE606A32C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X92nUbgA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FF71F00A02
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866754;
	bh=ib4GITzjYi7Kk431BobfzMOoYY06Hiby9a689p2pAyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X92nUbgAyE6EP3txRRGVfK5+KP0HXjJeJSylgu24H9x8r1P0iVkXPSvvTehI8JimP
	 rgIy+ci7KRBOKMkeFdW5Zgs0/cJHbOtk2GMVDA9R/+vWFpgw+748hc7iEkq+gkttVK
	 3uuHbO+bH879PRREvI2H/tEMoZuA1SkKfrv9X9at0Hye/FeQJ7Rgy/dNu9GE45wiyp
	 vuwGYvArItK/m5WCtI/j4AdYWxpth+2Hoj6q+tUiYxlMJYLHficvSCNZywXBVhAkYz
	 3lvFU6xo0oJCLcyYWd60V4HljZfnInY9tHnjwv69VdC2IwsPRNt8DR0kxxRDXFFWEu
	 lDqvUiJeXPk/A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3dd9681fso16062691fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:19:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxd/DYD0MSLSXxTDl4zW+Bjk9bYG1RcrpueoUYO1+uyuSwi5NOd4SW2pRhQLUGLkmTiWK3bKTnp5xYP@vger.kernel.org
X-Gm-Message-State: APuU4Z/KdEGbwurVgP2Munt89SX1/a5Lr1e1fZv5OrFmDkc63rj4lMyD
	/rsWwmZoBFuy7hBdUFidcS/AW7rbi47aHJW29E51oPTR/vdxkxTVoNE0oj6/CnjLyCkIrYmqd2l
	NJK6CEDFTdtuw7Rlit/kvskr4HIgw7Zg=
X-Received: by 2002:ac2:4e0f:0:b0:5bf:ce85:4d55 with SMTP id
 2adb3069b0e04-5bfd956bbc7mr5837021e87.33.1793866753657; Thu, 05 Nov 2026
 00:19:13 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com> <20261030200827.24648-1-muniquefeitoz4@gmail.com>
In-Reply-To: <20261030200827.24648-1-muniquefeitoz4@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:19:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
X-Gm-Features: AclHuK_Ml_OL847AN20qFhPaU3w6DGrMl3QakVm76l9q0Nj3vlc94VmLs_pDZp0
Message-ID: <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious
 GPIO IRQ
To: Munique Feitoza <muniquefeitoz4@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:08=E2=80=AFPM Munique Feitoza
<muniquefeitoz4@gmail.com> wrote:

> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
> keep asserting in WAKE_INT_STATUS_REG0/1.
>
> Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
> a spurious GPIO IRQ on both the main and RGPIO banks.
>
> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> ---
> Changes in v2:
> - Drop the early return on !ret before writing EOI_MASK to
>   WAKE_INT_MASTER_REG so that spurious GPIO interrupts disabled in the
>   !gpiochip_line_is_irq() path still receive an EOI signal on the
>   controller.

Loop in Mario on v2

Yours,
Linus Walleij
