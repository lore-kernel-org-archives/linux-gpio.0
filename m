From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 -next 2/2] pinctrl: qcom: spmi-gpio: select
 IRQ_DOMAIN_HIERARCHY in Kconfig
Date: Mon, 4 Feb 2019 11:04:26 +0100
Message-ID: <CACRpkdapj4xo2JBBw=xo3gVAWOb1dMG8DUVvyW4qw5CAVupEfA@mail.gmail.com>
References: <20190204095853.12212-1-masneyb@onstation.org> <20190204095853.12212-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204095853.12212-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 4, 2019 at 10:58 AM Brian Masney <masneyb@onstation.org> wrote:

> Select IRQ_DOMAIN_HIERARCHY for spmi-gpio in Kconfig since this driver
> is now setup as a hierarchical IRQ chip.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v1:
> - None

Patch applied!

Yours,
Linus Walleij
