From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/17] pinctrl: uniphier: allocate struct pinctrl_desc in
 probe function
Date: Tue, 31 May 2016 12:41:22 +0200
Message-ID: <CACRpkdbGiH1+ShZ53CMJkuR7n0MANcdKhgAEYFua_TUbmS-_Yw@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-7-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464681923-7469-7-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, every SoC driver defines struct pinctrl_desc statically,
> i.e. it consumes memory footprint even if it is not probed.
>
> In multi-platform, many pinctrl drivers are linked (generally as
> built-in objects), although only one of them is actually used.
> So, it is reasonable to allocate memory dynamically where possible.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
