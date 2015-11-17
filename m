From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove redundant if conditional from Kconfig
Date: Tue, 17 Nov 2015 11:48:24 +0100
Message-ID: <CACRpkdZJBv0D2TcH1=i0XJUeWy+OmDRh2Wt+KgphTpzJVEc4Zg@mail.gmail.com>
References: <1446705963-7174-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446705963-7174-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2015 at 7:46 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The whole menu is guarded by
>
>   menu "Pin controllers"
>           depends on PINCTRL
>       ...
>   endmenu
>
> The if conditional outside of it is redundant.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
