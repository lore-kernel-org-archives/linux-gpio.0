From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/3] irqdomain: export of_phandle_args_to_fwspec
Date: Thu, 21 Sep 2017 13:34:53 +0200
Message-ID: <CACRpkdb_4xMvN=5TH=UNiHhKC7X-C4g+t2JoiR992Y12Q-818w@mail.gmail.com>
References: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com> <1505292990-22957-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505292990-22957-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 13, 2017 at 10:56 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This helper will be useful for irqchip drivers that need to convert
> DT binding into IRQ fwspec.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I'm waiting for the irqchip maintainers to have a look at this.

I can carry it in the GPIO tree, but Thomas often prefers to handle
me an immutable git branch for infrastructure.

Yours,
Linus Walleij
