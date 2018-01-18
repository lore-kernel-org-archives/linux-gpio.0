From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: Documentation update
Date: Thu, 18 Jan 2018 11:35:44 +0100
Message-ID: <19698840.Y5vd8iLXf1@ws-stein>
References: <20180118094457.15304-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:34209 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755015AbeARKnQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jan 2018 05:43:16 -0500
In-Reply-To: <20180118094457.15304-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Am Donnerstag, 18. Januar 2018, 10:44:57 CET schrieb Linus Walleij:
> Update a slew of documentation files with the latest changes in the
> API/ABI. Again stress that sysfs is deprecated. Add all new flags and
> clean up and move some text.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/gpio/board.txt    |  14 ++++--
>  Documentation/gpio/consumer.txt | 105 ++++++++++++++++++++++++----------------
>  Documentation/gpio/driver.txt   |   4 ++
>  Documentation/gpio/sysfs.txt    |  11 +++++
>  4 files changed, 88 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
> index a0f61898d493..b1d106167baa 100644
> --- a/Documentation/gpio/board.txt
> +++ b/Documentation/gpio/board.txt
> @@ -2,6 +2,7 @@ GPIO Mappings
>  =============
>  
>  This document explains how GPIOs can be assigned to given devices and functions.
> +
>  Note that it only applies to the new descriptor-based interface. For a
>  description of the deprecated integer-based GPIO interface please refer to
>  gpio-legacy.txt (actually, there is no real mapping possible with the old
> @@ -49,7 +50,7 @@ This property will make GPIOs 15, 16 and 17 available to the driver under the
>  
>  	power = gpiod_get(dev, "power", GPIOD_OUT_HIGH);
>  
> -The led GPIOs will be active-high, while the power GPIO will be active-low (i.e.
> +The led GPIOs will be active high, while the power GPIO will be active low (i.e.
>  gpiod_is_active_low(power) will be true).
>  
>  The second parameter of the gpiod_get() functions, the con_id string, has to be
> @@ -122,9 +123,14 @@ where
>  	can be NULL, in which case it will match any function.
>    - idx is the index of the GPIO within the function.
>    - flags is defined to specify the following properties:
> -	* GPIOF_ACTIVE_LOW	- to configure the GPIO as active-low
> -	* GPIOF_OPEN_DRAIN	- GPIO pin is open drain type.
> -	* GPIOF_OPEN_SOURCE	- GPIO pin is open source type.
> +	* GPIO_ACTIVE_HIGH	- GPIO line is active high
> +	* GPIO_ACTIVE_LOW	- GPIO line is active low
> +	* GPIO_OPEN_DRAIN	- GPIO line ise set up as open drain

typo here: s/ise/is/

Best regards,
Alexander

