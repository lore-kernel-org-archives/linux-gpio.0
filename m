From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 -next 1/2] genirq: export irq_chip_set_wake_parent symbol
Date: Mon, 4 Feb 2019 11:03:35 +0100
Message-ID: <CACRpkdaLx7BtkaYAD+d+hRNhnpu2ByeC1KqGA9yYjJjGdyMcDQ@mail.gmail.com>
References: <20190204095853.12212-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204095853.12212-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 4, 2019 at 10:58 AM Brian Masney <masneyb@onstation.org> wrote:

> Export the irq_chip_set_wake_parent symbol so that drivers with
> hierarchical IRQ chips can be built as a module.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reported-by: Mark Brown <broonie@kernel.org>
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> This fixes a build failure in linux-next's spmi-gpio when using
> allmodconfig. See https://www.spinics.net/lists/linux-next/msg46362.html
> for Mark's message.
>
> Changes since v1:
> - Moved message about build failure out of the commit message and into
>   the notes field.

Patch applied to the GPIO tree. Thanks for the quick fixes!

Yours,
Linus Walleij
