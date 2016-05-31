From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: of: add missing of_node_put() to of_gpiochip_add_pin_range()
Date: Tue, 31 May 2016 10:05:25 +0200
Message-ID: <CACRpkdaX=N2Hv1rVw7jmVYcvma5CaKAiOmMsQAu=vKW_gYg=jg@mail.gmail.com>
References: <1463968329-9530-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463968329-9530-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 23, 2016 at 3:52 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> As the comment block of of_parse_phandle_with_fixed_args() says,
> the caller is responsible to call of_node_put() on the returned
> node when done.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
