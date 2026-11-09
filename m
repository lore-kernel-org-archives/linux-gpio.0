Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214908;
	b=kzNpBtBoDUOY1X+w7t4M4zG0QrH74UwY7+qCWLHOv9Zv8q8NwWxt3K3S47YSSakn96lZ
	 UE06I0SRmuJr1fZaDalHs50Uq2KJofOT0M4Z1u6RydfaSNor7f8UJM3C23WUm4XQg606t
	 8Qz1xYS/44wvOPSlI+4D7vVo2MQDabzie7GIzm0d123IDRoPWAUKBXYOtblqSJ7smcCUi
	 Gx1Fy48wekKAFSkysf3NQ1RdXop/ue35ufVLvUscs9HqMKmyewP64cpHf9o9Sf9gt/tJv
	 VQAB+FSAtFXXQANmFDTpIA+qzSjkosRRkPWubC7gI+ZwddBDxPw3Ag/Fptsk6infhGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214908;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0cjLroBDXbWM3pVQ18jT2Odho2PFBO0ZnT+TCbevu9E=;
	b=dTz/kbIrcAUUIyJ0VouGnRettrlPyUfZBOKvHEHD7jR+EuZpVMYadxU114TjKoqEmc8X
	 jESBB1+omFbTJO/0lBqZz3qkNppG7RGbyN6fyyuRk5T/ZpCWQiZC74WegTSRDeqbH4eeL
	 5EdwZtedBoBm3XvuPyRMZVtcjvpqGNeEza8rgsyaJsp3wHQy4a73eQfebJ78VwDQyZhTN
	 ppH/ukdlnqPlKy3ZACa5reg3Aa2aSiftzAM92kKPkqft7UQ8ZsXL9FP5cGhDESvVeqFqF
	 5qv9XKjqRvL/f1yZKBcC8P2mtzQeET82I8xBJbDhTAfZgQbyGwrtNFyGamkzx108tWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKNWLr50;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7E82A606A322;
	Mon,  9 Nov 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKNWLr50
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 823981F008A5;
	Mon,  9 Nov 2026 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794214908;
	bh=0cjLroBDXbWM3pVQ18jT2Odho2PFBO0ZnT+TCbevu9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKNWLr50ZQqQl1zu4yPTQkESKbMrESXTdBoZzgc6cZAakmYWcj6plaurRnzZe7oBl
	 jTWGqkdrewmuWpNky6ZRmLzHJS7WzsuhHfa9rmVP4VJptUnnTcrmeVX6xwpCgyLw1s
	 Ae38W6R1MkgaGB0PHr5s0fPjAGqXSC4Il2BQVtnPMuyauvVQkuRF9ReiNb3nEvKGG0
	 8h7rWoaLZQE81jG3xAiTo9/qk5275yYCBfawMvxVX6l32jThcfEsZTsnoYfILi1GFK
	 FzlDP80jJcK2rM46Kmwnaumc0MY3yxapjroZxJZraHI8YJFcsrwOVvQGUVn+cjnxy6
	 ZDWC78FceieJA==
Date: Mon, 9 Nov 2026 10:01:44 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
Message-ID: <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>
References: <20261104215959.24035-1-rosenp@gmail.com>
 <20261104215959.24035-6-rosenp@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104215959.24035-6-rosenp@gmail.com>

On Wed, Nov 04, 2026 at 01:59:59PM -0800, Rosen Penev wrote:
> Remove some unused includes that are not used directly.
> 
> While at it:
>  - use devm_kzalloc_obj() for the chip allocation
>  - rename the platform_device from ofdev to the conventional pdev
>  - compact the OF match table
>  - move module_platform_driver() next to the driver struct
> 
> No functional change.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-ppc44x.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
> index 8b9ea00f170c..04653e753d43 100644
> --- a/drivers/gpio/gpio-ppc44x.c
> +++ b/drivers/gpio/gpio-ppc44x.c
> @@ -10,13 +10,8 @@
>   */
>  
>  #include <linux/bits.h>
> -#include <linux/kernel.h>
> -#include <linux/init.h>
>  #include <linux/io.h>
> -#include <linux/of.h>
>  #include <linux/gpio/generic.h>
> -#include <linux/types.h>
> -#include <linux/slab.h>
>  #include <linux/platform_device.h>
>  
>  /* Pins are numbered from the MSB; the select registers use 2 bits per pin */
> @@ -139,20 +134,20 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  	return 0;
>  }
>  
> -static int ppc44x_gpio_probe(struct platform_device *ofdev)
> +static int ppc44x_gpio_probe(struct platform_device *pdev)
>  {
> -	struct device *dev = &ofdev->dev;
> +	struct device *dev = &pdev->dev;
>  	struct ppc44x_gpio __iomem *regs;
>  	struct ppc44x_gpio_chip *chip;
>  	struct gpio_generic_chip_config config;
>  	struct gpio_chip *gc;
>  	int ret;
>  
> -	regs = devm_platform_ioremap_resource(ofdev, 0);
> +	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  
> -	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	chip = devm_kzalloc_obj(dev, *chip);
>  	if (!chip)
>  		return -ENOMEM;
>  
> @@ -180,9 +175,7 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
>  }
>  
>  static const struct of_device_id ppc44x_gpio_match[] = {
> -	{
> -		.compatible = "ibm,ppc4xx-gpio",
> -	},
> +	{ .compatible = "ibm,ppc4xx-gpio" },
>  	{},

Uwe: is this in line with your recent cleanups?

Bart
