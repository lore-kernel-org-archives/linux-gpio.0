From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
Date: Fri, 24 May 2019 13:26:14 +0200
Message-ID: <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com>
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 9:43 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> GPIOs are split between several banks (A, B, ...) and each bank can have
> up to 16 lines. Those GPIOs could be used as interrupt lines thanks to
> exti lines. As there are only 16 exti lines, a mux is used to select which
> gpio line is connected to which exti line. Mapping is done as follow:
>
> -A0, B0, C0.. -->exti_line_0 (X0 selected by mux_0)
> -A1, B1, C1.. -->exti_line_1 (X1 selected by mux_1)
> ...
>
> This patch adds a protection to avoid overriding on mux_n for exti_line_n.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied, can't say I fully understand it but you know what
you're doing!

Yours,
Linus Walleij
