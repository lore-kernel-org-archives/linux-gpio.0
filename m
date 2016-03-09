From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/14] pinctrl: at91: use __maybe_unused to hide pm functions
Date: Wed, 9 Mar 2016 11:09:25 +0700
Message-ID: <CACRpkdaDy3jmVqm_LfJ3ExaA-RMwfajw-bn+6MStwL0sODTr2A@mail.gmail.com>
References: <1456934350-1389172-1-git-send-email-arnd@arndb.de>
	<1456934350-1389172-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456934350-1389172-2-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 2, 2016 at 10:58 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The at91-pio4 pinctrl driver uses SET_SYSTEM_SLEEP_PM_OPS() to
> conditionally set the correct suspend/resume options, but they
> become unused when CONFIG_PM is disabled:
>
> drivers/pinctrl/pinctrl-at91-pio4.c:827:12: error: 'atmel_pctrl_suspend' defined but not used [-Werror=unused-function]
> drivers/pinctrl/pinctrl-at91-pio4.c:847:12: error: 'atmel_pctrl_resume' defined but not used [-Werror=unused-function]
>
> This adds __maybe_unused annotations so the compiler knows
> it can silently drop them instead of warning.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied with the maintainer ACKs.

Yours,
Linus Walleij
