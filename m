From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sprd: Remove unused irq trigger setting
Date: Mon, 21 Jan 2019 13:47:32 +0100
Message-ID: <CACRpkdZwFX4_LQoyVp8OxNXaz3CN9fJHHAcyeT5FzUrY0DMytg@mail.gmail.com>
References: <972fd6c1a222b35159671ca82fb63db1632c3ba3.1548046988.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <972fd6c1a222b35159671ca82fb63db1632c3ba3.1548046988.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, neo.hou@unisoc.com, Mark Brown <broonie@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 21, 2019 at 6:06 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> The Spreadtrum PMIC interrupt controller has no registers to set irq
> trigger type, since it is always high level trigger. That means the
> PMIC EIC controller as a child device of PMIC INTC does not need to
> set the trigger type, so remove it.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Yours,
Linus Walleij
