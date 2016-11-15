From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: wdt, gpio: move arch_initcall into subsys_initcall ?
Date: Tue, 15 Nov 2016 11:20:58 +0100
Message-ID: <582AE18A.2060405@denx.de>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "Jonas Mark (ST-FIR/ENG1)" <Mark.Jonas-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hello,

commit e188cbf7564f: "gpio: mxc: shift gpio_mxc_init() to subsys_initcall level"
moves the gpio initialization of the mxc gpio driver
from the arch_initcall level into subsys_initcall level.

This leads now on mxc boards, which use a gpio wdt driver
and the CONFIG_GPIO_WATCHDOG_ARCH_INITCALL option enabled,
to unwanted driver probe deferrals during kernel boot.

I see this currently on an imx6 based board (which has unfortunately
3 WDT: imx6 internal (disabled), gpio wdt and da9063 WDT ...).

Also a side effect from above commit is, that the da9063 WDT driver
is now probed before the gpio WDT driver ... so /dev/watchdog now
does not point to the gpio_wdt, instead it points to the da9063 WDT.

So there are 2 solutions possible:

- add a CONFIG_GPIO_MCX_ARCH_INITCALL option
   in drivers/gpio/gpio-mxc.c like for the gpio_wdt.c driver?

   But how can we guarantee, that first the gpio driver and then
   the gpio_wdt driver gets probed?

- move the arch_initcall in gpio_wdt.c into a subsys_initcall
   (Tested this, and the probe dereferral messages are gone ...)

   But this may results in problems on boards, which needs an early
   trigger on an gpio wdt ...

Other ideas?

Thanks for all suggestions!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
