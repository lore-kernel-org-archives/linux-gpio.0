From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio: pca953x: Use correct u16 value for register word
 write
Date: Tue, 29 Mar 2016 20:06:14 +0800
Message-ID: <56FA6FB6.4040003@electromag.com.au>
References: <1459232852-15697-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:33440 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757171AbcC2MGV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2016 08:06:21 -0400
In-Reply-To: <1459232852-15697-1-git-send-email-sdliyong@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

G'day Yong,

One comment below.

On 29/03/2016 2:27 PM, Yong Li wrote:
> The current implementation only uses the first byte in *val,
> the second data is always 0. Change it to *(u16 *)val
> to write the two bytes into the register
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>
> ---
>   drivers/gpio/gpio-pca953x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d0d3065..cf3d410 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -159,7 +159,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
>   		switch (chip->chip_type) {
>   		case PCA953X_TYPE:
>   			ret = i2c_smbus_write_word_data(chip->client,
> -							reg << 1, (u16) *val);
> +							reg << 1, *(u16 *)val);
I don't think this is safe for systems that don't support unaligned memory access.


>   			break;
>   		case PCA957X_TYPE:
>   			ret = i2c_smbus_write_byte_data(chip->client, reg << 1,
>


-- 
Regards
Phil Reid

