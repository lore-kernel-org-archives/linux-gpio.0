Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF2499F06;
	Tue, 13 Oct 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885886; cv=none; b=HtIbVxhvwgQZaAaJM0dFJSNgdEHuZIBuNesJ7ikBu9um2k6Gu6lLncM2mRuso2lDcdgyNhL+im+ExyxchyHOpmjv+w2eX8dVxk+EKHvv6YlNW1Vn39WTMbdm70AfHoibb0fTw3ng3RSChi4ZES2Ocy/9vzFXFVCUWUSrWbU6/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885886; c=relaxed/simple;
	bh=5JcdeAiKTWy0dD+QP6OXsvdJrgJIDd1DQZJHKJFTdx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRGCjUzkEeSjKQoPJBBQSs1ez4MzG9jG0oRa/pD2Ezt39GRb9CPMLxMLCusKH+bNKxxO6Nw6P+Cuf+N9uKvLt8h5D1JLtAIb3joDPPsxtujWXnfdlPS7HQliQzuHGvmvUwVOh0ZIXMGiKomIeGv7ODqX6Lq0sHyTpxXr9UBsiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1KEXPaa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1KEXPaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90B11F000FF;
	Tue, 13 Oct 2026 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885885;
	bh=wbMTid+XwavP1p4m02Prc6L/vMSCXFM1JSHEuUd95RU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=M1KEXPaaXx7tpwj2Ez7jYY30sjnGyaNNM2HbgfQiJC5jSSxKp/mon/NQJXO37TKx/
	 M4cKI5g39D/s9ysX0ewwY3m29FAs988gGDtTEdtCyQcmuYN5LrnzCbbkZFyJccZwG0
	 YhNoqviyFBQEECXF2DUBiwUvxvxI9GlI0BKmv8jsQkmI5IkkYZJwrdkqGzQjdhscU+
	 MpGBQ1pqirK3wxeOgkT415SbsyZFr2UmD5Isfd+MfRwnZsf+sDq+UL5j/TZx8OJ8rv
	 bdiJCLBC1s1oe+kIsKtPElLPd7moXyT0VTqceBZZZOH0cRk0t5z3largQDJgQov56I
	 OfSE6r32G2Iog==
Message-ID: <d5508a2a-518e-46ee-a821-b6209ef35bfb@kernel.org>
Date: Tue, 13 Oct 2026 12:04:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] gpiolib: shared: Don't define variable in the
 middle of the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20261013094412.945609-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13. 10. 26, 11:44, Andy Shevchenko wrote:
> While the C11 allows us to define variables in the code, we do not
> do this style (see more at [1]). Move the declaration to the top of
> the function.
> 
> Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]

 From the link, I have just learnt two things:
1) I am not alone preferring declarations in the middle of blocks (it 
has more pros than cons IMO). But again, I spend a lot of time in the 
c++ universe.
2) the kernel defines "auto" even for < c23. Therefore:

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpio/gpiolib-shared.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 5f9623e40b0f..40c08f1ae5f0 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -196,6 +196,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   		for (i = 0; i < count; i++) {
>   			struct device_node *np __free(device_node) = NULL;
>   			char *con_id __free(kfree) = NULL;
> +			struct fwnode_handle *curr_fwnode;
>   
>   			ret = of_parse_phandle_with_args(curr, prop->name,
>   							 "#gpio-cells", i,
> @@ -261,8 +262,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
>   				con_id[con_id_len - suffix_len] = '\0';
>   			}
>   
> -			struct fwnode_handle *curr_fwnode =
> -				fwnode_handle_get(of_fwnode_handle(curr));
> +			curr_fwnode = fwnode_handle_get(of_fwnode_handle(curr));

For me, much cleaner would be the c++ way. Ie. doing:

   auto curr_fwnode = fwnode_handle_get(of_fwnode_handle(curr));

Everyone is supposed to use clangd, tree-sitter or alike nowadays. So 
inferring the type is the very same for start-of-block-declaration 
(which is miles away from the assignment now) and auto-declaration. 
While the latter obfuscates the code less (and eases local vars addition 
w/o jumping back and forth).

>   			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
>   			if (!ref) {
>   				fwnode_handle_put(curr_fwnode);

thanks,
-- 
js
suse labs
