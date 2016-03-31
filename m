From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH v2] gpio: pca953x: Use correct u16 value for register word
 write
Date: Thu, 31 Mar 2016 11:28:57 +0800
Message-ID: <56FC9979.1070905@electromag.com.au>
References: <1459320554-2455-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:36531 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755313AbcCaD3G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2016 23:29:06 -0400
In-Reply-To: <1459320554-2455-1-git-send-email-sdliyong@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, alexander.stein@systec-electronic.com

On 30/03/2016 2:49 PM, Yong Li wrote:
> The current implementation only uses the first byte in val,
> the second byte is always 0. Change it to use cpu_to_le16
> to write the two bytes into the register
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>

Reviewed-by: Phil Reid <preid@electromag.com.au>
> ---
>   drivers/gpio/gpio-pca953x.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d0d3065..e66084c 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -18,6 +18,7 @@
>   #include <linux/i2c.h>
>   #include <linux/platform_data/pca953x.h>
>   #include <linux/slab.h>
> +#include <asm/unaligned.h>
>   #include <linux/of_platform.h>
>   #include <linux/acpi.h>
>
> @@ -159,7 +160,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
>   		switch (chip->chip_type) {
>   		case PCA953X_TYPE:
>   			ret = i2c_smbus_write_word_data(chip->client,
> -							reg << 1, (u16) *val);
> +			    reg << 1, cpu_to_le16(get_unaligned((u16 *)val)));
>   			break;
>   		case PCA957X_TYPE:
>   			ret = i2c_smbus_write_byte_data(chip->client, reg << 1,
>


-- 
Regards
Phil Reid

