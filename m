From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 3/4] drivers/base: devres.c: use devm_kmemdup() from
 with devm_kstrdup()
Date: Thu, 19 Jun 2014 08:59:27 -0700
Message-ID: <1403193567.7875.4.camel@joe-AO725>
References: <1403192765-3258-1-git-send-email-rob.jones@codethink.co.uk>
	 <1403192765-3258-4-git-send-email-rob.jones@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403192765-3258-4-git-send-email-rob.jones@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Jones <rob.jones@codethink.co.uk>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@codethink.co.uk, ian.molton@codethink.co.uk, ben.dooks@codethink.co.uk, heiko@sntech.de
List-Id: linux-gpio@vger.kernel.org

On Thu, 2014-06-19 at 16:46 +0100, Rob Jones wrote:
> Avoid code duplication by using devm_kmemdup() to copy data instead
> of having a separate loop within devm_kstrdup().
> 
> Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>
> Signed-off-by: Rob Jones <rob.jones@codethink.co.uk>
[]
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
[]
> @@ -802,17 +802,10 @@ EXPORT_SYMBOL_GPL(devm_kmalloc);
>   */
>  char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp)
>  {
[]
> +	return devm_kmemdup(dev, s, (strlen(s) + 1), gfp);
>  }
>  EXPORT_SYMBOL_GPL(devm_kstrdup);

Making this static inline in the header and dropping
EXPORT_SYMBOL_GPL might be smaller code.

static inline
char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp)
{
	return devm_kmemdup(dev, s, strlen(s) + 1, gfp);
}
