From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: provide lockdep keys for nested/unnested
 irqchips
Date: Wed, 11 Jan 2017 11:59:47 -0600
Message-ID: <b63d16dc-d226-36a7-70db-ab78172a999d@ti.com>
References: <20170111154311.11260-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:13008 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935474AbdAKR7y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 12:59:54 -0500
In-Reply-To: <20170111154311.11260-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Clemens Gruber <clemens.gruber@pqgruber.com>, Roger Quadros <rogerq@ti.com>



On 01/11/2017 09:43 AM, Linus Walleij wrote:
> The helper function for adding a GPIO chip compiles in a lockdep
> key for debugging, the same key is needed for nested chips as
> well.
>
> The macro construction is unreadable, replace this with two
> static inlines instead.
>
> The _gpiochip_irqchip_add prefixed function is not helpful,
> rename it with gpiochip_irqchip_add_key() that tell us what the
> function is actually doing.
>
> Fixes: d245b3f9bd36 ("gpio: simplify adding threaded interrupts")
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Clemens Gruber <clemens.gruber@pqgruber.com>
> Cc: Roger Quadros <rogerq@ti.com>
> Reported-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> Reported-by: Roger Quadros <rogerq@ti.com>
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Write code that actually compiles on LOCKDEP too, now I've
>   had it with confusing _underscores.
> ---
>  drivers/gpio/gpiolib.c      | 18 ++++++------
>  include/linux/gpio/driver.h | 70 ++++++++++++++++++++++++++++++++-------------
>  2 files changed, 59 insertions(+), 29 deletions(-)
>

Tested-by: Grygorii Strashko <grygorii.strashko@ti.com>

regards,
-grygorii
