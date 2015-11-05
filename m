From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 4/7] pinctrl: sunxi: remove redundant "depends on RESET_CONTROLLER"
Date: Thu, 5 Nov 2015 14:40:07 +0100
Message-ID: <CACRpkdYmdyxi+6fZNGffE6-JBZGkyq3F__Ywc4rCYYEsQeimMQ@mail.gmail.com>
References: <1446722128-11961-1-git-send-email-yamada.masahiro@socionext.com>
	<1446722128-11961-5-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446722128-11961-5-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2015 at 12:15 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> ARCH_SUNXI selects RESET_CONTROLLER.
> The dependency "depends on RESET_CONTROLLER" is already met.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

NACK, this pin controller needs that as dependency, I don't worry
that it's overspecified.

They both do this:
#include <linux/reset.h>

And the object should specify its dependencies, not rely on them
being implicitly available.

The dep is there for human readers too, not just machines. And to
them, this is helpful information.

Yours,
Linus Walleij
