From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] gpio: pl061: print resource_size_t as %pa
Date: Tue, 26 Nov 2013 11:14:02 -0800
Message-ID: <1385493242.20100.71.camel@joe-AO722>
References: <1385492161-27624-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385492161-27624-1-git-send-email-olof@lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, 2013-11-26 at 10:56 -0800, Olof Johansson wrote:
> commit 73675c8aa07 ('gpio: pl061: proper error messages') added a printout
> of a resource_size_t using %x, which produces an error for builds with
> 64-bit resources:

What tree is this?

> drivers/gpio/gpio-pl061.c:345:3: warning: format '%x' expects argument of
>     type 'unsigned int', but argument 3 has type 'resource_size_t'
> 
> Switch to %pa (and pass in a pointer to the resource instead).
> 
> Fixes: 73675c8aa07 ('gpio: pl061: proper error messages')
[]
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
[]
> @@ -341,8 +341,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  	}
>  
>  	amba_set_drvdata(adev, chip);
> -	dev_err(&adev->dev, "PL061 GPIO chip @%08x registered\n",
> -		adev->res.start);
> +	dev_err(&adev->dev, "PL061 GPIO chip @%pa registered\n",
> +		&adev->res.start);

This looks as if this should not use dev_err, but maybe dev_info
and maybe it should use %pR, &adev->res
