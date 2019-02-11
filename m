From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 12/15] pinctrl: milbeaut: Add Milbeaut M10V pinctrl
Date: Mon, 11 Feb 2019 23:09:39 +0900
Message-ID: <CAK7LNAQx1Ee7a5CAhbaxKv8wiiuX_aP4ie7+_BqBSGh-dmchPQ@mail.gmail.com>
References: <1549628897-32345-1-git-send-email-sugaya.taichi@socionext.com> <CACRpkdZCpyJDL+zy-NftXJNah2u6t75cVCDmh_L0+ZyXv7J2LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZCpyJDL+zy-NftXJNah2u6t75cVCDmh_L0+ZyXv7J2LA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sugaya Taichi <sugaya.taichi@socionext.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Brian Masney <masneyb@onstation.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Feb 8, 2019 at 10:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Sugaya,
>
> thank you for the patch!
>
> Since Masahiro has previously added the Uniphier pin control driver
> I would like him to provide a review of this patch, if possible. I also
> want to make sure that the hardware is different enough from the
> existing Uniphier pin control so that it really needs a new
> driver, else I suppose it should be refactored to be part of
> the pinctrl/uniphier drivers (we can of course rename it
> pinctrl/socionext if only naming is an issue).


Milbeaut and UniPhier are totally different platforms,
so no code is shareable.

At most, they could share the directory,
drivers/pinctrl/socionext/, if you like.

I know you prefer grouping by SoC-family
instead of by vendor-name as you stated in the
"Moving ARM dts files" discussion.



-- 
Best Regards
Masahiro Yamada
