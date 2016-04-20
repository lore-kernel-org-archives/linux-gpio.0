From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/8] gpio: stmpe: Add STMPE1600 support
Date: Wed, 20 Apr 2016 16:53:45 +0200
Message-ID: <CACRpkdaLhgR8PcKuR1svU=iAEUq=-USN1zktvdor128kEO=G9A@mail.gmail.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
	<1461068317-28016-8-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34303 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754618AbcDTOxr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 10:53:47 -0400
Received: by mail-ob0-f182.google.com with SMTP id bg3so33155912obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 07:53:47 -0700 (PDT)
In-Reply-To: <1461068317-28016-8-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>

On Tue, Apr 19, 2016 at 2:18 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> The particularities of this variant are:
> - GPIO_XXX_LSB and GPIO_XXX_MSB memory locations are inverted compared
>   to other variants.
> - There is no Edge detection, Rising Edge and Falling Edge registers.
> - IRQ flags are cleared when read, no need to write in Status register.
>
> Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

> -       u8 reg = stmpe->regs[STMPE_IDX_GPMR_LSB] - (offset / 8);
> +       u8 reg;
>         u8 mask = 1 << (offset % 8);
>         int ret;
>
> +       if (stmpe->partnum == STMPE1600)
> +               reg = stmpe->regs[STMPE_IDX_GPMR_LSB] + (offset / 8);
> +       else
> +               reg = stmpe->regs[STMPE_IDX_GPMR_LSB] - (offset / 8);

This construct is a bit hard to grasp.

Can we think of something more intuitive? Maybe using more
code lines but easier to understand.

Subtracting the offset is just totally unintuitive in the first place,
the STMPE1600 arrangement is much more intuitive.

I would prefer if we address the LSB+MSB register explicitly
instead of adding or subtracting 1 to the LSB register to get
to the MSB register.

> +       if (stmpe->partnum == STMPE1600)
> +               reg = stmpe->regs[which] + (offset / 8);
> +       else
> +               reg = stmpe->regs[which] - (offset / 8);

Same.

> +       if (stmpe->partnum == STMPE1600)
> +               reg = stmpe->regs[STMPE_IDX_GPDR_LSB] + (offset / 8);
> +       else
> +               reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);

Same.

> +       if (stmpe->partnum == STMPE1600)
> +               reg = stmpe->regs[STMPE_IDX_GPDR_LSB] + (offset / 8);
> +       else
> +               reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);

Same.

> +                               stmpe_reg_write(stmpe,
> +                                               stmpe->regs[regmap[i]] + j,
> +                                               new);
> +                       else
> +                               stmpe_reg_write(stmpe,
> +                                               stmpe->regs[regmap[i]] - j,
> +                                               new);

This is also unintuitively backwards.

> +       if (stmpe->partnum == STMPE1600)
> +               dir_reg = stmpe->regs[STMPE_IDX_GPDR_LSB] + (offset / 8);
> +       else
> +               dir_reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);

Same.

> +       if (stmpe->partnum == STMPE1600)
> +               statmsbreg = stmpe->regs[STMPE_IDX_ISGPIOR_LSB];
> +       else
> +               statmsbreg = stmpe->regs[STMPE_IDX_ISGPIOR_MSB];

And this kind of points at the problem.

Can we write this in some way that make it super-clear which register
we're using and why?

Yours,
Linus Walleij
