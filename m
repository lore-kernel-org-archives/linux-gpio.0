From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH 2/2] Documentation: gpio: board: describe the con_id parameter
Date: Thu, 20 Aug 2015 19:28:51 +0200
Message-ID: <55D60E53.60607@gmail.com>
References: <1437808318-4453-1-git-send-email-dirk.behme@gmail.com> <1437808318-4453-2-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:38386 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbbHTR26 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 13:28:58 -0400
Received: by wicja10 with SMTP id ja10so41975663wic.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 10:28:57 -0700 (PDT)
In-Reply-To: <1437808318-4453-2-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On 25.07.2015 09:11, Dirk Behme wrote:
> The con_id parameter has to match the GPIO description and is automatically
> extended by the GPIO suffix if not NULL. I had to look into the code to
> understand this and properly find the GPIO I've been looking for, so document
> this.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
>   Documentation/gpio/board.txt    | 36 ++++++++++++++++++++++++++++++++++++
>   Documentation/gpio/consumer.txt |  3 +++
>   2 files changed, 39 insertions(+)
>
> diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
> index 7605773..eac78fc 100644
> --- a/Documentation/gpio/board.txt
> +++ b/Documentation/gpio/board.txt
> @@ -48,6 +48,42 @@ This property will make GPIOs 15, 16 and 17 available to the driver under the
>   The led GPIOs will be active-high, while the power GPIO will be active-low (i.e.
>   gpiod_is_active_low(power) will be true).
>
> +If in the consumer device's node the property doesn't have a <function>- prefix,
> +the second parameter (con_id) of the gpiod_get*() functions has to be NULL:
> +
> +E.g. if in the above device tree example the GPIO array is just called 'gpios'
> +
> +	foo_device {
> +		compatible = "acme,foo";
> +		...
> +		gpios = <&gpio 15 GPIO_ACTIVE_HIGH>, /* red */
> +			<&gpio 16 GPIO_ACTIVE_HIGH>, /* green */
> +			<&gpio 17 GPIO_ACTIVE_HIGH>; /* blue */
> +	};
> +
> +the gpiod_get*() calls will be:
> +
> +	struct gpio_desc *red, *green, *blue, *power;
> +
> +	red = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_HIGH);
> +	green = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_HIGH);
> +	blue = gpiod_get_index(dev, NULL, 2, GPIOD_OUT_HIGH);
> +
> +To summarize:
> +
> +The con_id string parameter has to be either NULL or the <function>-prefix
> +of the GPIO suffixes ("gpios" or "gpio", automatically looked up by the
> +gpiod functions internally):
> +
> +* If the GPIO description is just named with one of the GPIO suffixes
> +  ("gpios" or "gpio"), use NULL.
> +* If the GPIO description is prefixed with anything, e.g. "led-gpios", use the
> +  prefix without the "-" as con_id parameter (in this example "led").
> +
> +In case con_id is not NULL, the GPIO subsystem prefixes the GPIO suffix
> +("gpios" or "gpio") with the string passed in con_id to get the resulting string
> +(snprintf(... "%s-%s", con_id, gpio_suffixes[]).
> +
>   ACPI
>   ----
>   ACPI also supports function names for GPIOs in a similar fashion to DT.
> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
> index 75542b9..47ce4fd 100644
> --- a/Documentation/gpio/consumer.txt
> +++ b/Documentation/gpio/consumer.txt
> @@ -39,6 +39,9 @@ device that displays digits), an additional index argument can be specified:
>   					  const char *con_id, unsigned int idx,
>   					  enum gpiod_flags flags)
>
> +For a more detailed description of the con_id parameter in the DeviceTree case
> +see Documentation/gpio/board.txt
> +
>   The flags parameter is used to optionally specify a direction and initial value
>   for the GPIO. Values can be:


Any further comments on this? Or could this be applied?

Best regards

Dirk
