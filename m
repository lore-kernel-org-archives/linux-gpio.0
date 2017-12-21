From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] gpio: reduce descriptor validation code size
Date: Thu, 21 Dec 2017 14:55:06 +0200
Message-ID: <15498c25-56c6-c914-4cf6-574a45ed696e@mleia.com>
References: <20171221002704.20824-1-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171221002704.20824-1-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello Rasmus,

On 12/21/2017 02:27 AM, Rasmus Villemoes wrote:
> While we do need macros to be able to return from the "calling"
> function, we can still factor the checks done by the VALIDATE_DESC*
> macros into a real helper function. This reduces the backslashtitis,
> avoids duplicating the logic in the two macros and saves about 1K of
> generated code:
> 
> $ scripts/bloat-o-meter drivers/gpio/gpiolib.o.{0,1}
> add/remove: 1/0 grow/shrink: 0/15 up/down: 104/-1281 (-1177)
> Function                                     old     new   delta
> validate_desc                                  -     104    +104
> gpiod_set_value                              192     135     -57
> gpiod_set_raw_value                          125      67     -58
> gpiod_direction_output                       412     351     -61
> gpiod_set_value_cansleep                     150      70     -80
> gpiod_set_raw_value_cansleep                 132      52     -80
> gpiod_get_raw_value                          139      54     -85
> gpiod_set_debounce                           226     140     -86
> gpiod_direction_output_raw                   124      38     -86
> gpiod_get_value                              161      74     -87
> gpiod_cansleep                               126      39     -87
> gpiod_get_raw_value_cansleep                 130      39     -91
> gpiod_get_value_cansleep                     152      59     -93
> gpiod_is_active_low                          128      33     -95
> gpiod_request                                299     184    -115
> gpiod_direction_input                        386     266    -120
> Total: Before=25460, After=24283, chg -4.62%
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

The change looks good from my point of view, thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
