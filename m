From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: intel: Add support for variable size pad groups
Date: Mon, 5 Jun 2017 18:11:06 +0300
Message-ID: <CAHp75Vc_Qa8gs6V4ZxrrxYVM1iX8pO+xvED=C0ywen8hhFJTPw@mail.gmail.com>
References: <20170605125650.64188-1-mika.westerberg@linux.intel.com> <20170605125650.64188-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36510 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751169AbdFEPLS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2017 11:11:18 -0400
In-Reply-To: <20170605125650.64188-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 5, 2017 at 3:56 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> The Intel GPIO hardware has a concept of pad groups, which means 1 to 32
> pads occupying their own GPI_IS, GPI_IE, PAD_OWN and so on registers. The
> existing hardware has the same amount of pads in each pad group (except the
> last one) so it is possible to use community->gpp_size to calculate start
> offset of each register.
>
> With the next generation SoCs the pad group size is not always the same
> anymore which means we cannot use community->gpp_size for register offset
> calculations directly.
>
> To support variable size pad groups we introduce struct intel_padgroup that
> can be filled in by the client drivers according the hardware pad group
> layout. The core driver will always use these when it performs calculations
> for pad register offsets. The core driver will automatically populate pad
> groups based on community->gpp_size if the driver does not provide any.
> This makes sure the existing drivers still work as expected.

> +static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
> +                                      struct intel_community *community)
> +{
> +       struct intel_padgroup *gpps;
> +       unsigned npins = community->npins;
> +       unsigned padown_num = 0;
> +       size_t ngpps, i;
> +
> +       if (community->gpps)
> +               ngpps = community->ngpps;
> +       else
> +               ngpps = DIV_ROUND_UP(community->npins, community->gpp_size);
> +
> +       gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
> +       if (!gpps)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ngpps; i++) {
> +               if (community->gpps) {
> +                       gpps[i] = community->gpps[i];
> +               } else {
> +                       gpps[i].reg_num = i;
> +                       gpps[i].base = community->pin_base +
> +                                      i * community->gpp_size;
> +                       gpps[i].size = min(community->gpp_size, npins);
> +                       npins -= gpps[i].size;
> +               }
> +
> +               if (gpps[i].size > 32)
> +                       return -EINVAL;
> +
> +               gpps[i].padown_num = padown_num;
> +

> +               if (community->padown_fixed)
> +                       padown_num += ALIGN(DIV_ROUND_UP(gpps[i].size, 8), 4);
> +               else
> +                       padown_num += DIV_ROUND_UP(gpps[i].size, 8);
> +       }

It looks to me like you are trying to calculate 32-bit registers
needed for gpps of given size. Taking into account that each pad takes
4 bits you may rewrote entire conditional to be simple and clearer:

DIV_ROUND_UP(size, 32) * 4,

where 32 - is a _fixed_ length of the IO register and 4 is _fixed_
amount of bits per pad.

Please, check if it would work with all hardware we have.
Perhaps little comment also would be nice to have.

> +
> +       community->ngpps = ngpps;
> +       community->gpps = gpps;
> +
> +       return 0;
> +}



-- 
With Best Regards,
Andy Shevchenko
