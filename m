From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: Re: [PATCH 2/4] drivers/base: devres.c: Add block
 copy func. for managed devices
Date: Fri, 20 Jun 2014 23:31:55 +0100
Message-ID: <1403303515.589.361.camel@xylophone>
References: <1403192765-3258-1-git-send-email-rob.jones@codethink.co.uk>
	 <1403192765-3258-3-git-send-email-rob.jones@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403192765-3258-3-git-send-email-rob.jones@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Jones <rob.jones@codethink.co.uk>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, heiko@sntech.de, linux-kernel@codethink.co.uk, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2014-06-19 at 16:46 +0100, Rob Jones wrote:
[...]
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -793,7 +793,7 @@ EXPORT_SYMBOL_GPL(devm_kmalloc);
>  /**
>   * devm_kstrdup - Allocate resource managed space and
>   *                copy an existing string into that.
> - * @dev: Device to allocate memory for
> + * @dev:Device to allocate memory for

You shouldn't be changing this comment...

Ben.

>   * @s: the string to duplicate
>   * @gfp: the GFP mask used in the devm_kmalloc() call when
>   *       allocating memory
[...]
