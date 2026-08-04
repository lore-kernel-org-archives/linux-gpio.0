Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B741308F23
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 04:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817283; cv=none; b=HzCZm9+MCa8tcF9ebiJ3o/FGMyyOeHDkSKG3jCY1iKTJ6nS2OyXviTYTiVSFtMcw0vS+yiJMC3dTowTCvq4ro0JBSXOupxD7VLfYFr92eEMHf5EaJL86jZulgqYho0mx8sKuphmRdywRjorMyNQu5putbcGdG4d74Z0VyYW6VnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817283; c=relaxed/simple;
	bh=N1U4YH2rA30TenjPpOvIQ7i8FHYyt9DTIYZxboCCGto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXgCDzgWKUTFVWJzYhUgtv+XuJiv3EAqlKWTIwo4Pkgxt5ScRm/hP3ugVcq5Upl/jvHXBq4i0zacGlF+Nq3IbpMe9D5s1aTV/s0J6xSFrV92vo10I6OOFLjyxBiDU54Zkh1+FTRZALlKfjuu92GpH+TzjJy/Bvr318p2xdKPZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTEcDkei; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTEcDkei"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2770605a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817282; x=1786422082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=uTEcDkei2vb/G+qdIOtZbaB9NJHR76SZdFJ0azOpGcEjg3b9dUma5R5oaM5+67xWsk
         2vByRxiu8ggMmw45H0y2V0m5H0INr0D7wdNaf1xGqp4oAr7PmuOnVC5QCKd/ZNFY8TDq
         NIQFql2LV9v0AImQQG7ayFcywyuGjrDld8S9G9ZIwL9fS1eYSCnkjlOT8rLgLlhixUpI
         OO6Yh3JqcC544zi7BR4AZ8M2uol3HRU4AeOyimbNbN7cHoqEZV7oHNKlZEfbUzSbQadS
         CKfmIlRa5cB/PPsVYR3DS9IqOY3jvW+oeImJOSwldRfT7RfIuo+nGF/0qt6gR0D9LDEr
         asVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817282; x=1786422082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=XOP16fxmTEC/vnjUq9ckmLet+kxhtRgVVXHkar7yESVqRzBjPN2Zr+iNA51AU7DkrP
         LhtiYodhlBQahKmKCvtYlrdsbYF4ZBgCcRM0nWzdJBoOKPBG+vA14o1r7aA/poHAXpCh
         9mY8xZtFdB7DN2oTiA7WjGypkU1bc4BewqP7LtO/SbQbM7o7+pBH9+LRLRd6MImXyJig
         UsQ8C0CbS63/XJBKc2y+qDQfbpwW4hCoguC7pvvQ07Rglx7opZah21k99njrL2sXcJjX
         4QsOlSr9WAxRUskI2NQbG+1mePKq+gl15NYs0WBVm7vFdhUWAfaPtZk/BQaxw4zvHfkd
         yENA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+4+HLnlTzrulSVIhrSSa8FlHCWuC4Y6eyDK1VP9hLdiEc049ndQGGK6D+1z8vRPxMBurnngPh5w+j@vger.kernel.org
X-Gm-Message-State: AOJu0YzoR3cIwri3rdq7i8pQ1KpdHZovzJBicLZ2R2ypX4/fVkKck2FN
	rv5GcE4Nr6HPB3FFskwHqgDzuQQKkOYigSYVmYvQYky6W/i8Leg1tUzy1Bs66kKksgA=
X-Gm-Gg: AR+sD10IP5EGI1bTMAtKTMXtpJ9zQo7VK3ZL/pjHJuoOl9afNiK0NF1IBqSrGxZCutB
	Wl8QC7FArjFCTxsqqgNUp2jsu8Ynq4trdvRYVer+8U5DUXgKlWVNoFSYl4abi8BBbdPyz4RcHAL
	S2CppQ+gYb4RLU0cBOOVXG1M8m3EnsSIItJyTmhE5aMEwD9FkmgvB5RQDSEfFpLfrjo5cluF32J
	GYNPQ1TXB7PRIx1jznjp4Tq8Lx5mslLKBkuhcdTpvdUnXCICW0uQkHAccgiNiaFSxk00nni0M09
	uKrlbJbD7W33Seev4+ozyHdzS9UXQUB6tGW5FVa+FlMw8WuQmx15sf/RlmTyQ2KbUdNjVSZ3QzN
	eTFnUiw27VVgzpfUlYLVzOYb2S1woweEWKZzCKzbXpgKq9u5o1CQG4jvCmFoLA32kuWP23lMAnA
	yhrpB83NM0x3bKKpL0fvUmWsIjRdJJsh01dMynQBo5OAAkd1ndd+CAWZTZP5ZH
X-Received: by 2002:a17:90b:4a09:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38fbc60c7femr11264577a91.43.1785817281575;
        Mon, 03 Aug 2026 21:21:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm64394331eec.3.2026.08.03.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:21:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
Message-ID: <mre6ggyfjxo5dgvtrp3nsrbxngenw4r2eb6nygi4ybs5zsefyq@kcu6u33q3ien>
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>

On 02-08-26, 19:35, Maulik Shah wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 1ec22010a3f9..5fcbea32089d 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
>  	if (plgpio->regs.eit == -1)
>  		supported_type = IRQ_TYPE_LEVEL_HIGH;
>  	else
> -		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		supported_type = IRQ_TYPE_EDGE_BOTH;
>  
>  	if (!(trigger & supported_type))
>  		return -EINVAL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
