Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D643078B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371775; cv=none; b=dvHr1hSe3ttVhREYUhSsUNVqq05VXmpObBzZtuYT8Mii+c8ICYGnnZxi8hDvTTkJ7hjRvTjpsYm3ErBpM0fiYGdCevTs0CTDEausjkRLGQHR89o4+T+f5wns0TTXrTGAPrj8Dq5IH9Sl5lJ22+cb2BDGwnZl0jU6ti+x2nj/6vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371775; c=relaxed/simple;
	bh=ycp61Y4oBASqS0tqSZpl1K1bE71eE5BuLrGQ1oZgU6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFTeFXuVWQuYrkejzaPEFaw4xIpHTQWIyhMyYxbmew+qc7K0i6Hy3ENCFQQ6SXbPnVML3+omVBEN2UxbRFjeF5+w6bZ/jU1woSJs7GqI2iwNAUm0YrORR4F/ePx8/Ihmnh7M8cS2AeINlkFo+UysKBH//zFn+Gbp/PEbgYaB9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbsUGxkF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbsUGxkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C60E1F008A0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371754;
	bh=JgyuoOemLETsyqfE1CGSvFFY5KZN2ob6m4fytC2csN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DbsUGxkFXKcSFPdvldgaFm0mP0Hr6KvwFEdc5Ucmdcm0RyOx0IDWrZUCUD0IX6nGG
	 wsqb4qJz9WzcpHeONsMeuvzYp72JzGEl5s8CK0XlCa9bESe+ifnDz8R/UhBNxExhyD
	 Z17dDfgeRI1vyqr+iZk4MbBP2wuQaARqWBi0kneZQqiWhUzIOa8ahITjk8sYXscjPX
	 t4K8P9JMfHZe+bckRqy57zLs7d0dV4Ljk8XCl6glQyyljbjf1o+FQtUESGml3YUnzk
	 JQEB6rpVN9lpDjD9NfI86LsSGhBNAhDoFdlVzY0lA57KgP8Cs+s+ZIYAZb/Nku4unI
	 KSIVBLfXEgRgQ==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b1ba286f6bso1021617b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOmNMTHezP0HB/aoyP1dMwkDXCf4EEPDIWLC1aOrIml899SCietDCb2afB+p10u1A4dO4H//4eVAho@vger.kernel.org
X-Gm-Message-State: AFuF++nEc8PdUdMrUtMyMSmIkYWA35XW0j4U30h3P9Ss8U+yPKTcxTOU
	Edx0lPdO1H54DJwyL2SfSlEhCSKp07zrR16deZeg6ZZ7O5WAqTsVc9jdSaVjap2EtRF6/YetYBw
	xJ8pEUfdw6Tay+fPAic3OfYeN5xZBWEQ=
X-Received: by 2002:a05:6808:3021:b0:4b8:4703:db90 with SMTP id
 5614622812f47-4faae2ce6bbmr4903831b6e.25.1791371753764; Wed, 07 Oct 2026
 04:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005035410.18899-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20261005035410.18899-1-Chloe_Chen@asmedia.com.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:15:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+wwftv7qqfL5Mo4jHTjbtpEhV9QzM=JfCz4Vc8idiOw@mail.gmail.com>
X-Gm-Features: AclHuK9jcsaGrSYYB5Mw4Ll-uJTii0yThaHyuXj7xR1FwNRVdBoFcvipZdfSb9U
Message-ID: <CAD++jLm+wwftv7qqfL5Mo4jHTjbtpEhV9QzM=JfCz4Vc8idiOw@mail.gmail.com>
Subject: Re: [PATCH] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Yd_Tseng@asmedia.com.tw, Jesse1_Chang@asmedia.com.tw, 
	Richard_Hsu@asmedia.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Szuying,

thanks for your patch!

On Mon, Oct 5, 2026 at 5:54=E2=80=AFAM Szuying Chen <Chloe_Chen@asmedia.com=
.tw> wrote:

> This commit implements the new gpio-amdptpci driver to support the
> GPIO functionality on AMD PT PCI platforms.
>
> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
> Co-authored-by: YD Tseng <Yd_Tseng@asmedia.com.tw>

(...)
> +#define PT27_REG_DIR            0x0000
> +#define PT27_REG_IN             0x0004
> +#define PT27_REG_OUT            0x0008
> +#define PT27_REG_INT_EN         0x000C
> +#define PT27_REG_INT_LVL        0x0010
> +#define PT27_REG_INT_MODE0      0x0014
> +#define PT27_REG_INT_MODE1      0x0018
> +#define PT27_REG_INT_STAT       0x001C
> +#define PT27_REG_INT_MASK       0x0020
> +#define PT27_REG_INT_CTL        0x0024

Compare this to drivers/gpio/gpio-amdpt.c:

/* PCI-E MMIO register offsets */
#define PT_DIRECTION_REG   0x00
#define PT_INPUTDATA_REG   0x04
#define PT_OUTPUTDATA_REG  0x08
#define PT_CLOCKRATE_REG   0x0C
#define PT_SYNC_REG        0x28

So this hardware appears to be related?

I can see that there is a lot of modifications to it though, and that it
may warrant a new driver. But this needs to be motivated in the
commit message.

The fact that one is an ACPI-probed MMIO driver and the other is
a PCI driver doesn't really matter for code sharing though, I need
a better motivation if the drivers should not share code.

> +static inline u32  pt27_rd32(struct pt27_gpio *c, u32 off)
> +{
> +       return ioread32(c->base + off);
> +}
> +
> +static inline void pt27_wr32(struct pt27_gpio *c, u32 off, u32 v)
> +{
> +       iowrite32(v, c->base + off);
> +}
> +
> +static inline u16  pt27_rd16(struct pt27_gpio *c, u32 off)
> +{
> +       return ioread16(c->base + off);
> +}
> +
> +static inline void pt27_wr16(struct pt27_gpio *c, u32 off, u16 v)
> +{
> +       iowrite16(v, c->base + off);
> +}
> +
> +static inline u8   pt27_rd8(struct pt27_gpio *c, u32 off)
> +{
> +       return ioread8(c->base + off);
> +}
> +
> +static inline void pt27_wr8(struct pt27_gpio *c, u32 off, u8 v)
> +{
> +       iowrite8(v, c->base + off);
> +}

What is the point of all this indirection? Just use the ioread/write
accessors directly in the code.

> +static void pt27_runtime_put_autosuspend(struct pt27_gpio *chip)
> +{
> +       pm_runtime_mark_last_busy(chip->dev);
> +       pm_runtime_put_autosuspend(chip->dev);
> +
> +}

Runtime PM already has a helper function like this, use it.

> +static void pt27_save_regs(struct pt27_gpio *chip)
> +{
> +       chip->saved.dir       =3D pt27_rd32(chip, PT27_REG_DIR);
> +       chip->saved.out       =3D pt27_rd32(chip, PT27_REG_OUT);
> +       chip->saved.int_en    =3D pt27_rd32(chip, PT27_REG_INT_EN);
> +       chip->saved.int_lvl   =3D pt27_rd32(chip, PT27_REG_INT_LVL);
> +       chip->saved.int_mode0 =3D pt27_rd32(chip, PT27_REG_INT_MODE0);
> +       chip->saved.int_mode1 =3D pt27_rd16(chip, PT27_REG_INT_MODE1);
> +       chip->saved.int_mask  =3D pt27_rd32(chip, PT27_REG_INT_MASK);
> +       chip->saved.int_ctl   =3D pt27_rd8(chip, PT27_REG_INT_CTL);
> +       chip->saved.vendor0   =3D pt27_rd32(chip, PT27_REG_VENDOR0);
> +       chip->saved.vendor1   =3D pt27_rd32(chip, PT27_REG_VENDOR1);
> +       chip->saved.wake_en   =3D pt27_rd16(chip, PT27_REG_WAKE_EN);
> +       chip->saved.wake_lvl  =3D pt27_rd16(chip, PT27_REG_WAKE_LVL);
> +       chip->saved.wake_mode =3D pt27_rd16(chip, PT27_REG_WAKE_MODE);
> +       chip->saved_valid =3D true;
> +
> +}
> +
> +static void pt27_restore_regs(struct pt27_gpio *chip)
> +{
> +       pt27_wr32(chip, PT27_REG_INT_EN, 0);
> +       pt27_wr32(chip, PT27_REG_INT_MASK, PT27_GPIO_MASK);
> +
> +       pt27_wr32(chip, PT27_REG_DIR,       chip->saved.dir);
> +       pt27_wr32(chip, PT27_REG_OUT,       chip->saved.out);
> +       pt27_wr32(chip, PT27_REG_INT_LVL,   chip->saved.int_lvl);
> +       pt27_wr32(chip, PT27_REG_INT_MODE0, chip->saved.int_mode0);
> +       pt27_wr16(chip, PT27_REG_INT_MODE1, chip->saved.int_mode1);
> +       pt27_wr8(chip, PT27_REG_INT_CTL,    chip->saved.int_ctl);
> +       pt27_wr32(chip, PT27_REG_VENDOR0,   chip->saved.vendor0);
> +       pt27_wr32(chip, PT27_REG_VENDOR1,   chip->saved.vendor1);
> +
> +       pt27_wr16(chip, PT27_REG_WAKE_LVL,  chip->saved.wake_lvl);
> +       pt27_wr16(chip, PT27_REG_WAKE_MODE, chip->saved.wake_mode);
> +       pt27_wr16(chip, PT27_REG_WAKE_EN,   chip->saved.wake_en);
> +
> +       pt27_wr32(chip, PT27_REG_INT_STAT,  PT27_GPIO_MASK);
> +       pt27_wr16(chip, PT27_REG_WAKE_STAT, PT27_WAKE_MASK);
> +
> +       pt27_wr32(chip, PT27_REG_INT_EN,   chip->saved.int_en);
> +       pt27_wr32(chip, PT27_REG_INT_MASK, chip->saved.int_mask);
> +
> +}

If you're gonna do this what about using regmap which already has
an internal register cache, knows how to restore them and can deal
with the different word sizes and all?

> +static int pt27_gpio_direction_input(struct gpio_chip *gc, unsigned int =
offset)
> +{
(...)
> +       val &=3D ~BIT(offset);   /* 0 =3D input */
(...)
> +static int pt27_gpio_direction_output(struct gpio_chip *gc, unsigned int=
 offset,
> +                                     int value)
> +{
> +       if (value)
> +               val |=3D BIT(offset);
> +       else
> +               val &=3D ~BIT(offset);
(...)
> +static int pt27_gpio_get_direction(struct gpio_chip *gc, unsigned int of=
fset)
(...)
> +       return (val & BIT(offset)) ? GPIO_LINE_DIRECTION_OUT
> +                                  : GPIO_LINE_DIRECTION_IN;
(...)
> +static int pt27_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       dir =3D pt27_rd32(chip, PT27_REG_DIR);
> +       val =3D pt27_rd32(chip, (dir & BIT(offset)) ? PT27_REG_OUT : PT27=
_REG_IN);
(...)
> +static int pt27_gpio_set(struct gpio_chip *gc, unsigned int offset, int =
value)
> +       val =3D pt27_rd32(chip, PT27_REG_OUT);
> +       if (value)
> +               val |=3D BIT(offset);
> +       else
> +               val &=3D ~BIT(offset);
(...)

Just use select GPIO_GENERIC and follow the pattern of the
other drivers using this. Something like:

struct gpio_generic_chip_config config;

config =3D (struct gpio_generic_chip_config) {
    .dev =3D dev,
    .sz =3D 4,
    .dat =3D g->base + PT27_REG_IN,
    .set =3D g->base + PT27_REG_OUT,
    .dirout =3D g->base + PT27_REG_DIR,
    .flags =3D GPIO_GENERIC_READ_OUTPUT_REG_SET,
};

If you *absolutely* need this runtime PM around all accessors, then
implement generic runtime PM handling to the gpio-mmio.c library and
add a new GPIO_GENERIC_RUNTIME_PM flag to
<linux/gpio/generic.h> as a separate patch.

> +static bool pt27_irq_regs_accessible(struct pt27_gpio *chip)
> +{
> +
> +       return READ_ONCE(chip->irq_bus_active) ||
> +              READ_ONCE(chip->irq_pm_held);
> +}

Looks like second-guessing the state of runtime PM?
This can't be right. Make sure the code only access
registers when runtime PM is resumed.

For example whenever the irqchip .enable() callback
is called, get runtime PM, put it on .disable().

> +static void pt27_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       struct pt27_gpio *chip =3D gpiochip_get_data(gc);
> +       irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +       unsigned long flags;
> +       u32 val;
> +
> +       if (!pt27_irq_regs_accessible(chip)) {
> +               dev_err_ratelimited(chip->dev,
> +                                   "%s: cannot unmask GPIO%lu; PT27 is n=
ot in D0\n",
> +                                    __func__, hwirq);
> +               return;
> +       }

This looks wrong as per above reasoning.

> +       chip->enabled_irq_mask |=3D BIT(hwirq);

I don't see why you would track this.

> +static void pt27_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       struct pt27_gpio *chip =3D gpiochip_get_data(gc);
> +       int ret;
> +
> +       mutex_lock(&chip->irq_bus_lock);
> +
> +       ret =3D pm_runtime_resume_and_get(chip->dev);
> +       if (ret < 0) {
> +               WRITE_ONCE(chip->irq_bus_active, false);
> +               dev_err_ratelimited(chip->dev,
> +                                   "%s: cannot resume for IRQ configurat=
ion: %d\n",
> +                                    __func__, ret);
> +               return;
> +       }
> +
> +       WRITE_ONCE(chip->irq_bus_active, true);

Why is this tracked locally in the driver? Surely the
frameworks (runtime PM or irqchip) track this.

> +}

Isn't this solving the issue I pointed out above? If yes,
why is the workaround still there?

I will probably find more on further reviews but these things
are a good starting point for reworking the driver.

Yours,
Linus Walleij
