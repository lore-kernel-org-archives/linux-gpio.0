From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: make library immune to error pointers
Date: Thu, 16 Jun 2016 13:19:17 +0300
Message-ID: <57627D25.9060702@ti.com>
References: <1466071160-16722-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1466071160-16722-1-git-send-email-linus.walleij@linaro.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 06/16/2016 12:59 PM, Linus Walleij wrote:
> Most functions that take a GPIO descriptor in need to check the
> descriptor for IS_ERR(). We do this mostly in the VALIDATE_DESC()
> macro except for the gpiod_to_irq() function which needs special
> handling.
>
> Cc: stable@vger.kernel.org
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpiolib.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f39bf05993e7..1a8dbc791892 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1371,7 +1371,7 @@ done:
>    * optional GPIO and calls should just bail out.
>    */
>   #define VALIDATE_DESC(desc) do { \
> -	if (!desc) \
> +	if (!desc || IS_ERR(desc)) \
>   		return 0; \

i do not think this right thing to return 0 here :(
if IS_ERR(desc) this is bug and drivers must handle this properly.

For example, -EPROBE_DEFER

>   	if (!desc->gdev) { \
>   		pr_warn("%s: invalid GPIO\n", __func__); \
> @@ -1384,7 +1384,7 @@ done:
>   	} } while (0)
>
>   #define VALIDATE_DESC_VOID(desc) do { \
> -	if (!desc) \
> +	if (!desc || IS_ERR(desc)) \
>   		return; \
>   	if (!desc->gdev) { \
>   		pr_warn("%s: invalid GPIO\n", __func__); \
> @@ -2061,7 +2061,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
>   	 * requires this function to not return zero on an invalid descriptor
>   	 * but rather a negative error number.
>   	 */
> -	if (!desc || !desc->gdev || !desc->gdev->chip)
> +	if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
>   		return -EINVAL;
>
>   	chip = desc->gdev->chip;
>


-- 
regards,
-grygorii
