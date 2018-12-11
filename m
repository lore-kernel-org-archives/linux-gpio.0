From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Wrap -Woverride-init with cc-option
Date: Tue, 11 Dec 2018 10:46:26 +1030
Message-ID: <CACPK8XfxQxMqLo10FSRPHdUVt4vr5K32xB2C_SXLAPEza--v0w@mail.gmail.com>
References: <20181211000506.7559-1-natechancellor@gmail.com> <1544487006.3301683.1605247720.567E9685@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544487006.3301683.1605247720.567E9685@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 11 Dec 2018 at 10:40, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 11 Dec 2018, at 10:35, Nathan Chancellor wrote:
> > Clang does not support this option:
> >
> > warning: unknown warning option '-Woverride-init'; did you mean
> > '-Woverride-module'? [-Wunknown-warning-option]
> > 1 warning generated.
> >
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Nathan.

Andrew explained to me that this warning helps find bugs when
developing the complicated (some would say crazy) set of macros that
this pinctrl driver uses. It would be good to have this warning
available in clang. Do we have a clang issue opened for that?

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
