From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: check irq controller availability at probe
Date: Wed, 24 Apr 2019 12:48:12 +0200
Message-ID: <CACRpkdZcp5CPL_wX0o0Dreu23Ky11XxbEpkAgU9fRYSeEHO6-w@mail.gmail.com>
References: <1556093324-1008-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556093324-1008-1-git-send-email-fabien.dessenne@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 24, 2019 at 10:09 AM Fabien Dessenne <fabien.dessenne@st.com> wrote:

> It is not guaranteed that the IRQ controller driver is probed before
> the pin controller driver gets probed.
> Considering this, check for the irq domain availability during probe
> and return EPROBE_DEFER if needed.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Patch applied with Alexandre's ACK!

Yours,
Linus Walleij
