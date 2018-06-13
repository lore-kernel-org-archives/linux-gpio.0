From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v4 2/2] gpio: davinci: Do not assume continuous IRQ
 numbering
Date: Wed, 13 Jun 2018 12:25:04 -0500
Message-ID: <37cadc4b-7fc6-5909-b499-7e747a7ee1cd@ti.com>
References: <1528861237-24254-1-git-send-email-j-keerthy@ti.com>
 <1528861237-24254-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528861237-24254-2-git-send-email-j-keerthy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org



On 06/12/2018 10:40 PM, Keerthy wrote:
> Currently the driver assumes that the interrupts are continuous
> and does platform_get_irq only once and assumes the rest are continuous,
> instead call platform_get_irq for all the interrupts and store them
> in an array for later use.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
> Tested for GPIO Interrupts on da850-lcdk board.
> 
> Changes in v4:
> 
>    * Corrected the gpio offset calculation from irq number
>      using the lookup.
> 
> Changes in v3:
> 
>    * Changed irqs type from unsigned to int
> 
> Changes in v2:
> 
>    * Extended the logic of using saved IRQs to unbanked IRQs
>      as per Grygorii's suggestion.
> 
>   drivers/gpio/gpio-davinci.c                | 63 ++++++++++++++++++++----------
>   include/linux/platform_data/gpio-davinci.h |  3 +-
>   2 files changed, 44 insertions(+), 22 deletions(-)
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
regards,
-grygorii
