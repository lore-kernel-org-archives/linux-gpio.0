From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: add 'depends on HAS_IOMEM' to fix unmet dependency
Date: Fri, 23 Mar 2018 04:05:23 +0100
Message-ID: <CACRpkdYZCxX+=1-Ght1gJoyLFXk_W+3hpAn5XEWm13OnGQiCEA@mail.gmail.com>
References: <1520334956-9900-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520334956-9900-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ludovic Barre <ludovic.barre@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, Rob Herring <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 6, 2018 at 12:15 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> These configs select MFD_SYSCON, but do not depend on HAS_IOMEM.
>
> Compile testing on architecture without HAS_IOMEM causes "unmet
> direct dependencies" in Kconfig phase.
>
> Detected by "make ARCH=score allyesconfig".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
