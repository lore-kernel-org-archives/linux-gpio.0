From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 4/8] gpio: omap: drop 'gpio' param from omap_gpio_init_irq()
Date: Fri, 20 Mar 2015 19:46:25 +0100
Message-ID: <CABxcv=neUJKwqGeEzqgeO0AjK6X5cA9rhFMMRW=M=GGcpdWChQ@mail.gmail.com>
References: <1426785944-17255-1-git-send-email-grygorii.strashko@linaro.org>
	<1426785944-17255-5-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1426785944-17255-5-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
To: grygorii.strashko@linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 19, 2015 at 6:25 PM,  <grygorii.strashko@linaro.org> wrote:
> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> The 'gpio' parameter isn't needed any more as it
> duplicates 'offset' parameter, so drop it.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>
