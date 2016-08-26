From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/5] gpio: pca954x: fix undefined error code from remove
Date: Fri, 26 Aug 2016 23:47:10 +0800
Message-ID: <56953594-6173-9dcc-535d-7fd9cbfa512c@electromag.com.au>
References: <20160826152546.604384-1-arnd@arndb.de>
 <20160826152546.604384-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160826152546.604384-2-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 26/08/2016 23:25, Arnd Bergmann wrote:
> The recent addition of the regulator support has led to the pca953x_remove
> function returning uninitialized data when no platform data pointer is
> provided, as gcc warns when using -Wmaybe-uninitialized:
>
> drivers/gpio/gpio-pca953x.c: In function 'pca953x_remove':
> drivers/gpio/gpio-pca953x.c:860:9: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> This restores the previous behavior, returning 0 on success.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: e23efa311110 ("gpio: pca954x: Add vcc regulator and enable it")
> Cc: Phil Reid <preid@electromag.com.au>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
>
>  drivers/gpio/gpio-pca953x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index cbe2824461eb..b9d31d737dbf 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -853,6 +853,8 @@ static int pca953x_remove(struct i2c_client *client)
>  		if (ret < 0)
>  			dev_err(&client->dev, "%s failed, %d\n",
>  					"teardown", ret);
> +	} else {
> +		ret = 0;
>  	}
>
>  	regulator_disable(chip->regulator);
>
Ahh, commit 8c7a92dad1621f38d1ff4fe9eaac898d6f33a0a3 gpio: pca953x: remove redundant assignments
removed the 'redundant' initialisation of ret in this function.
Looks like I did not have this commit in my tree when I submitted did the regulator patch.
Sorry about that. Alternative to the 'else' is to add init at definition.

Acked-by: Phil Reid <preid@electromag.com.au>


-- 
Regards
Phil Reid
