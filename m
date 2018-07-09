From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: add gen_clk pins
Date: Mon, 9 Jul 2018 15:37:24 +0200
Message-ID: <CACRpkdYKOmbBOyqrEhXi+f_KVDZ8gFqFjn6yQ8Oux8GTpkB9Bg@mail.gmail.com>
References: <20180704165724.3387-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704165724.3387-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 4, 2018 at 6:57 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add the pinctrl configuration for gen_clk on gxbb and axg.
> gen_clk allows to output and devide several internal clocks of SoC,
> including most of the plls.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
