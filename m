From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max730x: eliminate double free
Date: Fri, 2 Oct 2015 14:48:49 -0700
Message-ID: <CACRpkda+YTx2pD7cXeYen+jXPxAYQWM0PNqOeJxJGfxLFG3mLA@mail.gmail.com>
References: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 26, 2015 at 1:18 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> The function __max730x_remove is called from the remove functions of
> drivers/gpio/gpio-max7300.c and drivers/gpio/gpio-max7301.c.  In both
> cases, the probe function allocates ts using devm_kzalloc.  Explicitly
> freeing such a value with kfree will cause a double free.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied with Alex' review-tag.

Yours,
Linus Walleij
