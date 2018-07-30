From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mmio: add inverted direction get_set io support
Date: Mon, 30 Jul 2018 20:14:58 +0300
Message-ID: <CAHp75Vfr_XvDbCBgh0z6iHe8BH9t8ZN6QpP9t4HvXd10db-Hcw@mail.gmail.com>
References: <20180730093418.124648-1-tmaimon77@gmail.com> <20180730093418.124648-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730093418.124648-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 30, 2018 at 12:34 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Add get_set_inv_dir and get_set_multiple_inv_dir I/O functions
> to call the data register when the dirction is input and
> set register when the direction is output.
> the functions will linked to the I/O get functions if the user set
> BGPIOF_INVERTED_REG_DIR flag in the bgpio initialization.

> +       /* Make sure we first clear any bits that are zero when we read the register */
> +       *bits &= ~*mask;

Theoretically it's possible to get mask and bits longer than one long,
and bitmap API has to be used.
Though, it seems entire driver has been written in an assumption that
it's never happen.

> +                               gc->get_multiple =
> +                               bgpio_get_set_multiple_inv_dir;

I think you may keep it on one line.

-- 
With Best Regards,
Andy Shevchenko
