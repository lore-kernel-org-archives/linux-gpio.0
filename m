From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of
 depends on
Date: Tue, 12 Sep 2017 11:24:08 +0200
Message-ID: <CACRpkdbt-g5L76UEBK64GmdfRrjaS=MK5x8CE==9XKR0m1uNjw@mail.gmail.com>
References: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Daney <david.daney@cavium.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 6, 2017 at 3:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> IRQ_DOMAIN_HIERARCHY is not user-configurable, but supposed to be
> selected by drivers that need IRQ domain hierarchy support.
>
> GPIO_THUNDERX is the only user of "depends on IRQ_DOMAIN_HIERARCHY".
> This means, we can not enable GPIO_THUNDERX unless other drivers
> select IRQ_DOMAIN_HIERARCHY elsewhere.  This is odd.  Flip the logic.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with David's ACK.

Yours,
Linus Walleij
