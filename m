From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/8] gpio: omap: simplify omap_set_gpio_dataout_x()
Date: Fri, 27 Mar 2015 11:04:19 +0100
Message-ID: <CACRpkdbQ+SuPeodW+poD+CmbqVXsLWnYhzafWd+VcZKENqWoxQ@mail.gmail.com>
References: <1427113110-20813-1-git-send-email-grygorii.strashko@linaro.org>
	<1427113110-20813-3-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1427113110-20813-3-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2015 at 1:18 PM,  <grygorii.strashko@linaro.org> wrote:

> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> Both functions omap_set_gpio_dataout_reg() and
> omap_set_gpio_dataout_mask() accept GPIO offset
> as 'gpio' input parameter, so rename it to 'offset' and
> drop usage of GPIO_BIT() macro.
>
> Tested-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
> Acked-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

Patch applied.

Yours,
Linus Walleij
