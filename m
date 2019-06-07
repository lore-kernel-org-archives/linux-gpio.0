From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: tb10x: Use flexible-array member and
 struct_size() helper
Date: Sat, 8 Jun 2019 01:24:47 +0200
Message-ID: <CACRpkdYXxHZ2KmU5Fz1eDXN=Z9i=uqwAtOWmpHam6F0U-eYySA@mail.gmail.com>
References: <20190606231144.GA1402@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606231144.GA1402@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 7, 2019 at 1:11 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> Update the code to use a flexible array member instead of a pointer in
> structure tb10x_pinctrl and use the struct_size() helper:
>
> struct tb10x_pinctrl {
>         ...
>         struct tb10x_of_pinfunc pinfuncs[];
> };
>
> Also, make use of the struct_size() helper instead of an open-coded
> version in order to avoid any potential type mistakes.
>
> So, replace the following form:
>
> sizeof(struct tb10x_pinctrl) + of_get_child_count(of_node) * sizeof(struct tb10x_of_pinfunc)
>
> with:
>
> struct_size(state, pinfuncs, of_get_child_count(of_node))
>
> This code was detected with the help of Coccinelle.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
> Changes in v2:
>  - Update changelog text.
>  - Add Kees' Reviewed-by tag.

Patch applied.

Yours,
Linus Walleij
