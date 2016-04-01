From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: handle probe deferrals better
Date: Fri, 1 Apr 2016 15:03:40 +0200
Message-ID: <CACRpkdaynNEFGhCSkd7qAgxtNoRT=pRWbB0dJmjM89UM4NG_xQ@mail.gmail.com>
References: <1459511048-24084-1-git-send-email-linus.walleij@linaro.org>
	<1766024.riJEdmHPZI@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1766024.riJEdmHPZI@ws-stein>
Sender: linux-input-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux Input <linux-input@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 2:16 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> I noticed you fiddle with late_initcall_sync. Sorry, I did not mention it:
> gpio_mcp23s08 as well as gpio_keys are loaded as modules, so late_initcall_*
> should not affect it.

I don't get this. I think probe deferral is only used to defer
initcalls used for built-in drivers.

If there are dependencies among things compiled as modules,
doesn't depmod/modprobe make sure that they are probed in
the right order? Could it be that some module alias thingofabob
is missing?

Or is modprobe failing because it (correctly) see that there is
no symbol dependencies between the gpio_mcp23s08 and
gpio-keys modules? (Not that I know how depmod works...)

If nothing else works, I guess marking mcp23s08 as bool
and building it into the kernel will work, right?

Yours,
Linus Walleij
