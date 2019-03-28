From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] gpio: mockup: use simple_read_from_buffer() in debugfs
 read callback
Date: Thu, 28 Mar 2019 18:41:50 +0530
Message-ID: <c3ecb2d9-55eb-fc74-a08a-bbd5c5018cb8@codeaurora.org>
References: <20190328110043.13391-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328110043.13391-1-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org


On 3/28/2019 4:30 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Calling read() for a single byte read will return 2 currently. Use
> simple_read_from_buffer() which correctly handles all sizes.
>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   drivers/gpio/gpio-mockup.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 74ba8b1d71d8..859585dce5c9 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -219,12 +219,7 @@ static ssize_t gpio_mockup_debugfs_read(struct file *file,
>   	val = gpio_mockup_get(gc, priv->offset);
>   	cnt = snprintf(buf, sizeof(buf), "%d\n", val);


why \n is inserted in the buf..

rv variable is unused now.

>   
> -	rv = copy_to_user(usr_buf, buf, cnt);
> -	if (rv)
> -		return rv;
> -
> -	*ppos += cnt;
> -	return cnt;
> +	return simple_read_from_buffer(usr_buf, size, ppos, buf, cnt);



Looks good to me.
Remove the unused variable.

Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

>   }
>   
>   static ssize_t gpio_mockup_debugfs_write(struct file *file,
