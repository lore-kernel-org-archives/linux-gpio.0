From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: mmio: add inverted direction get_set io support
Date: Fri, 3 Aug 2018 01:34:31 +0200
Message-ID: <CACRpkdYOiJhqXyYpRDSD5is=A7-7LEyUwJp2HtpYqbYGR9d5UQ@mail.gmail.com>
References: <20180730093418.124648-1-tmaimon77@gmail.com> <20180730093418.124648-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730093418.124648-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tmaimon77@gmail.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 30, 2018 at 11:34 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Add get_set_inv_dir and get_set_multiple_inv_dir I/O functions
> to call the data register when the dirction is input and
> set register when the direction is output.
> the functions will linked to the I/O get functions if the user set
> BGPIOF_INVERTED_REG_DIR flag in the bgpio initialization.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I think you uncovered a bug. This is however not the best fix IMO.

Sorry for not understanding the issue at first, I am sometimes
pretty slow in the head. :(

I'm sending a patch that I hope fixes the real problem in an
elegant way, and makes it possible to just define dirin and
BGPIOF_READ_OUTPUT_REG_SET.

Yours,
Linus Walleij
