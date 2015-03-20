From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH 0/8] gpio: omap: cleanup: get rid of system GPIO <-> GPIO
 offset converseations
Date: Fri, 20 Mar 2015 17:11:23 +0200
Message-ID: <550C389B.2020506@linaro.org>
References: <1426785944-17255-1-git-send-email-grygorii.strashko@linaro.org> <20150319230025.GO31346@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20150319230025.GO31346@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ssantosh@kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: linux-gpio@vger.kernel.org

On 03/20/2015 01:00 AM, Tony Lindgren wrote:
> * grygorii.strashko@linaro.org <grygorii.strashko@linaro.org> [150319 10:26]:
>> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>>
>> Now in TI OMAP GPIO driver there are a lot of places where
>> System GPIO number calculated and then converted to GPIO offset.
>> What is worse is that in many place such conversation performed twice
>> or even three times. But actually, we don't need to do that at all, because
>> - gpiolib always passes GPIO offset to GPIO controller
>> - OMAP GPIO driver converted to use IRQ domain, so
>>    struct irq_data->hwirq contains GPIO offset
>>
>> Hence, it is safe to convert all GPIO OMAP functions to use GPIO
>> offset instead of system GPIO numbers. Also, this allows to remove
>> unneeded conversations routines
>>   #define GPIO_INDEX(bank, gpio)
>>   #define GPIO_BIT(bank, gpio)
>>   int omap_irq_to_gpio()
> 
> Right on! This is excellent news. I've tested this set on top of -rc4
> plus the patch mentioned below, and I'm not seeing regressions on
> the platforms I tested with. Wake up to smsc911x ping with off-idle
> still works on omap3.
> 
> I only briefly tested on omap1 (osk5912), so I'like to wait for
> Aaro's ack before this gets merged.
> 
> I found one build error, other than that, for the whole series
> please feel free to add:
> 
> Tested-by: Tony Lindgren <tony@atomide.com>

Thanks Tony. 
Yep. I'll wait for news from Aaro then will re-send if ok.

-- 
regards,
-grygorii
