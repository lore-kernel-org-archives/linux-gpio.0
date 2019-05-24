From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: stm32: add suspend/resume management
Date: Fri, 24 May 2019 13:24:37 +0200
Message-ID: <CACRpkdYgTbTa6RmM3y-myk31ZxLGZ+8KvLof1XHkockrX4tofA@mail.gmail.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 9:42 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> During power sequence, GPIO hardware registers could be lost if the power
> supply is switched off. Each device using pinctrl API is in charge of
> managing pins during suspend/resume sequences. But for pins used as gpio or
> irq stm32 pinctrl driver has to save the hardware configuration.
> Each register will be saved at runtime and restored during resume sequence.

Both patches applied.

On the same pinctrl devel branch is also Benjamin's patches to support
the "link_consumers" property on the pin controller descriptor to
enable links from pin control consumers back to their pin controller
suppliers, especially important for STMFX.

Would you please check if it work fine if you turn on this feature
for the SoC STM32 pin controller?

I am working a bit on refining the patches, so I want to enable testing
with some SoC pin controllers as well and possibly make the
behavior default.

Yours,
Linus Walleij
