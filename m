From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: fix pinconf bias disable
Date: Wed, 31 Oct 2018 10:45:44 +0100
Message-ID: <CACRpkdbXP2s7gEUUaJ8cUgS1V_8SejWUVTkjPdZDZ7W9Vw7tqQ@mail.gmail.com>
References: <20181023160319.27003-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023160319.27003-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 23, 2018 at 6:03 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> If a bias is enabled on a pin of an Amlogic SoC, calling .pin_config_set()
> with PIN_CONFIG_BIAS_DISABLE will not disable the bias. Instead it will
> force a pull-down bias on the pin.
>
> Instead of the pull type register bank, the driver should access the pull
> enable register bank.
>
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied for fixes with Neil's ACK.

Yours,
Linus Walleij
