From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: palmas: convert PINCTRL_PALMAS from bool to tristate
Date: Wed, 22 Jun 2016 18:08:59 +0200
Message-ID: <CACRpkdYcEqNnU5on0xKWYPu5E55xHEz8NnYD1a4yQ3xefdN+BA@mail.gmail.com>
References: <20160613211022.32033-1-paul.gortmaker@windriver.com> <20160613211022.32033-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160613211022.32033-2-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2016 at 11:10 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> config PINCTRL_PALMAS
>         bool "Pinctrl driver for the PALMAS Series MFD devices"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> During an audit for non-modular drivers using modular infrastructure
> this driver showed up.
>
> But rather than demodularize it, Laxman indicated that it would be
> prefereable to instead convert the driver option to tristate.
>
> This does that, and confirms that it will compile and modpost as
> such.  However, since I do not have the hardware to confirm that
> no new runtime issues exist when modular, that remains untested.
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
