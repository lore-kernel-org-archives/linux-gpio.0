From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: rework UniPhier pinctrl entries in Kconfig
Date: Tue, 1 Dec 2015 10:36:49 +0100
Message-ID: <CACRpkdaeGjidAQNKWN6MOLUE=EO4WJ6VGQo7SrkZtcoNeDaFiw@mail.gmail.com>
References: <1448344846-28726-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448344846-28726-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2015 at 7:00 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> There is a plan to support more pinctrl drivers for this SoC family.
> Move the driver entries into a sub menu by using "menuconfig".
> Also, add the missing dependency "depends on OF && MFD_SYSCON".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
