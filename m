From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: spear: guard sub-directory with CONFIG_PINCTRL_SPEAR
Date: Tue, 1 Dec 2015 10:42:25 +0100
Message-ID: <CACRpkdbxuRMFwps0Z-K4e=a9KCAxxqtPLXTZ7xKWTQNz--K1ig@mail.gmail.com>
References: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
	<1448365524-12605-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448365524-12605-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, spear-devel <spear-devel@list.st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Viresh Kumar <vireshk@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2015 at 12:45 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_SPEAR is more suitable than CONFIG_PLAT_SPEAR
> to guard the drivers/pinctrl/spear/ directory.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
