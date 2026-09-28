Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0611265621
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599692; cv=none; b=DRAc6zfugPQrpFd6CZL/5QqB18Gz3hGQCjYBFkS9/uVfNtJJRueao80JNWI9gRuDdd1Y5f/NMLzElnz0K3r7wemndU3Xt+gVwdhWoQuUpj/IXjzBc22Oi7tqlewo09ar+G3fqvaPr48xxgm0JOWmTxl9X201sg875LLAgvt55dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599692; c=relaxed/simple;
	bh=WRrHKN7WS6CU3szpAnwqN6arE25wCNm4qSpSXHirqF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UP5bNg4DPGkfC74Zti87gUDlRxlOrpvMgOuVrlneuq7KBIpXWeEoAStnjHmW24LzEV2E6CaTi8qkRP2QG/jvtLxp2IIvW4FbIQUCTd+U3cATxTcc1oodpgCc8UQBtItO5Br7Yk9jb/WTqrW2MX8O7l9RQPt3+3uSsXxBV2oNkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFU79ugF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFU79ugF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BDC1F0089C
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790599690;
	bh=xGy2+KwG2xa0Vm9wtyBTEIzklyb+frkgVaySwHrLSDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mFU79ugF+OnQi51o72qzbzQvi3tAB+900eE4h3aV+AESAfJaDiA001yb/s73fhV62
	 JkT+4fsNAjwb6jvIYzLvRP0XS9Rx3zmsG24XlbKhMSC6ujUmpIDIlivOZcFs9NNaja
	 gAjaG8hRqeRfrdAXi/zkqk0pEgK3HoQt7CWdKWxrb6VzybWew+x73eXYDB2aeoASfJ
	 afA8Im+puUlMUInyKUvuxc3Apu0WhaiDAGhc+4nKpkLl0lotWegF1Sgktr8lIXyelr
	 FhpbJMjizr7kztopaxGtHnsZ9k80W57CmRfOdkqkt185hj3kiQx+3IqOkvv1xs1xsX
	 LyMBxXtBhXn0Q==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso2327913e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 05:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNo5gqgrdWGqFBDLMuLAvLIR22NwhSl7Fok6XL26ZKqL9BjitUGft5LDd8gyQWfuSDKx/zXJZuHMhr@vger.kernel.org
X-Gm-Message-State: AFq9FYIZbU9MxDkUSAVunj8fZ5yZQlkSp7/1UfxZR/DHgOaH/FOXsV8a
	1NrFNQqgJA5pM0SyaOihwVQPY7kqBDLmVlCO1g5yrDEFV39j9LcSgWZsHMMc0suAqyWOYfYeE+I
	Egwc2e94yDZvqLqGx+wdawQ42BC5pQpU6WoY8wCBWjg==
X-Received: by 2002:ac2:4f11:0:b0:5b9:6603:d459 with SMTP id
 2adb3069b0e04-5b96603d5eamr771988e87.15.1790599689164; Mon, 28 Sep 2026
 05:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-upstream-tda54-gpio-v1-0-d1a0a199c836@ti.com> <20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com>
In-Reply-To: <20260923-upstream-tda54-gpio-v1-2-d1a0a199c836@ti.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 28 Sep 2026 14:47:56 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdJZgut-46b20n7o51_MKqLk4uHsyRzs+QYoj9++5ydoA@mail.gmail.com>
X-Gm-Features: AclHuK_maJeTNYzE5sPFRlRRgsB0tWXlBskNGsjfDNcIyFUCc5LRWDeNnbLPX6M
Message-ID: <CAMRc=MdJZgut-46b20n7o51_MKqLk4uHsyRzs+QYoj9++5ydoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: davinci: Add level support via extended registers
To: Aniket Limaye <a-limaye@ti.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, vigneshr@ti.com, 
	u-kumar1@ti.com, nm@ti.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:58=E2=80=AFPM Aniket Limaye <a-limaye@ti.com> wro=
te:
>
> Add support for level-triggered interrupts (IRQ_TYPE_LEVEL_HIGH and
> IRQ_TYPE_LEVEL_LOW) for TDA54 GPIO controller via extended register sets.
>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>  drivers/gpio/gpio-davinci.c | 103 ++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 97 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index cccbaea1dec2..e5a3abe6b9d3 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -39,12 +39,20 @@ struct davinci_gpio_regs {
>         u32     intstat;
>  };
>
> +struct davinci_gpio_regs_ext {
> +       u32     set_high;
> +       u32     clr_high;
> +       u32     set_low;
> +       u32     clr_low;
> +};
> +
>  typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
>
>  #define BINTEN 0x8 /* GPIO Interrupt Per-Bank Enable Register */
>
>  static void __iomem *gpio_base;
>  static unsigned int offset_array[5] =3D {0x10, 0x38, 0x60, 0x88, 0xb0};
> +static unsigned int offset_array_ext[5] =3D {0xd8, 0xe8, 0xf8, 0x108, 0x=
118};
>
>  struct davinci_gpio_irq_data {
>         void __iomem                    *regs;
> @@ -58,9 +66,11 @@ struct davinci_gpio_controller {
>         /* Serialize access to GPIO registers */
>         spinlock_t              lock;
>         void __iomem            *regs[MAX_REGS_BANKS];
> +       void __iomem            *regs_ext[MAX_REGS_BANKS];
>         int                     gpio_unbanked;
>         int                     irqs[MAX_INT_PER_BANK];
>         struct davinci_gpio_regs context[MAX_REGS_BANKS];
> +       struct davinci_gpio_regs_ext    context_ext[MAX_REGS_BANKS];
>         u32                     binten_context;
>  };
>
> @@ -168,6 +178,7 @@ static int davinci_gpio_probe(struct platform_device =
*pdev)
>         unsigned int ngpio, nbank, nirq, gpio_unbanked;
>         struct davinci_gpio_controller *chips;
>         struct device *dev =3D &pdev->dev;
> +       bool ext_reg =3D false;
>
>         /*
>          * The gpio banks conceptually expose a segmented bitmap,
> @@ -190,6 +201,9 @@ static int davinci_gpio_probe(struct platform_device =
*pdev)
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to get the unbanke=
d GPIOs property\n");
>
> +       if (device_is_compatible(dev, "ti,tda54-gpio"))
> +               ext_reg =3D true;
> +

Don't do it this way please. Instead: split this patch into three:

1. Add a new match data struct and move the get_irqchip() callback
into it instead of passing it directly via the of_device_id field.
2. Add support for level interrupts and extend the match data struct
with the ext_reg flag.
3. Add the new compatible with its dedicated match data entry.

Bart
