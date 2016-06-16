From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: make library immune to error pointers
Date: Thu, 16 Jun 2016 16:05:47 +0300
Message-ID: <5762A42B.6000502@ti.com>
References: <1466076157-9805-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1466076157-9805-1-git-send-email-linus.walleij@linaro.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 06/16/2016 02:22 PM, Linus Walleij wrote:
> Most functions that take a GPIO descriptor in need to check the
> descriptor for IS_ERR(). We do this mostly in the VALIDATE_DESC()
> macro except for the gpiod_to_irq() function which needs special
> handling.
>
> Cc: stable@vger.kernel.org
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Complain when descriptors contain error values so the offending
>    code can be fixed.
> ---

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>



-- 
regards,
-grygorii
