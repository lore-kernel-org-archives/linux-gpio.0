From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-dwapb: add optional reset
Date: Wed, 11 Oct 2017 10:31:06 +0200
Message-ID: <CACRpkdbS6b9GW8HXmthOfaRPFMARMpyNGaR8He5BJbtfOXLMVw@mail.gmail.com>
References: <20171010212617.3397-1-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171010212617.3397-1-atull@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hoan Tran <hotran@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 10, 2017 at 11:26 PM, Alan Tull <atull@kernel.org> wrote:

> Some platforms require reset to be released to allow register
> access.
>
> Signed-off-by: Alan Tull <atull@kernel.org>

Fair enough.

(...)
> +       rst = devm_reset_control_get_optional_exclusive(dev, NULL);
> +       if (IS_ERR(rst)) {
> +               if (PTR_ERR(rst) == -EPROBE_DEFER)
> +                       return PTR_ERR(rst);
> +       } else {
> +               reset_control_deassert(rst);
> +               gpio->rst = rst;
> +       }

I do not see why any error other than -EPROBE_DEFER
should be ignored?

I guess the _optional API returns NULL if there is no
reset line so it should be fine to just return the error on
any error.

> +       if (gpio->rst)
> +               reset_control_assert(gpio->rst);

Is this the right way to handle an optional reset line?

Yours,
Linus Walleij
