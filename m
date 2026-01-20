Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61769426EDA
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910686; cv=none; b=pR1e6A9+77c88tV1W+OBNj5dCvi9vAM+AXbKiXJstgHOFTToEC/lbDYSpVelvEAwJksCDpH+n4wspAzsaYCdwtJ0RD1bfKryx7cJvdbphVJahdaJj+vv7oibB+3ktOuL1GVvSN3822AE2Glm6RHjIGuzvt6Pw3Ylp7OEXSsrGD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910686; c=relaxed/simple;
	bh=jKyaAlehX7Qy5dIkcTxFT6tTeel+TstN11n2B93COhE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwPr9e979vfUVXVlyXdyj6Llw7x9ulwGrL/Pc8aN85LuXDDzYIqaB0HsgZfFbFbk+hMA1DZ+XUXhF+/1SuoVzBchmj3fgeH32eN7A98bKhRTxH7AVT+bceiYyvVVRbAeijPRXrNsLvh4ymjEteRfExu8CYsQOl3QFm+4EESi8dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5zqHn7q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5zqHn7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055F8C19422
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910686;
	bh=jKyaAlehX7Qy5dIkcTxFT6tTeel+TstN11n2B93COhE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=O5zqHn7qGRY+OMGtwYfBkJM8aq8kprH2Je9+4YgUlyRD3vxmqwweAXuEASjZYKbis
	 CMKvOjnctS9PWsX0gsO0n0IOxNW1igR+lTwJrsAQu25eckrn/oOLYKX0OcyZYIM1M8
	 uUZG8Ekg8novL6hgivp9odFr2c+HNyNhuxoCjyoRBXH3L2uVKe+3tCKwCkCnebld5B
	 iNI6DRxIRaaLnBkwFh1oERsf0hulvXrcnwxASbFQBC1OqhXkLmKBTkQstkQ1/Hqed1
	 A6Bb1+C4g/NJu7S9ryf2YkL/T6PkOgnMbeBM+ykxNo4JIPhARVCmX/qv5OdbEwUVkZ
	 7WBAp3m6K8fkw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b685d2b79so5269992e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 04:04:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUumHfnR3+E7vamlTbtzjokPf0tVBSuwndbMuoTmjenM2pjDPJVM0/Vj/oiw9qCZhTRodS+WInPvZF0@vger.kernel.org
X-Gm-Message-State: AOJu0YwG61kKcUnDdzsPzVXgw1PTDXmVq7SZXsIRwhXLeVYGnhLxGACL
	JmfuPWyd1lM/89I0HbBYL2Z5I1wAVWUT2fBaiLEYL9sburfv41AeLjsnWz7LvpEc34RdQ6WMYpo
	peOI3YqpLFFudwyDQgePDcG6UOxz5H2S5UEXSTMMMCQ==
X-Received: by 2002:a05:6512:2209:b0:595:910c:8eea with SMTP id
 2adb3069b0e04-59baeedb8d0mr4527119e87.32.1768910684697; Tue, 20 Jan 2026
 04:04:44 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:04:43 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:04:43 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-6-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-6-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 12:04:43 +0000
X-Gmail-Original-Message-ID: <CAMRc=McHieZFrdVkt_BhF1oEBz2breVj6zKjtgaQAaU9npCBRA@mail.gmail.com>
X-Gm-Features: AZwV_QjiJd4F6TfXTJkvg80886t2EMvMvx-E5YB_KKhZJvuYUWeZmMG4W0nTwv4
Message-ID: <CAMRc=McHieZFrdVkt_BhF1oEBz2breVj6zKjtgaQAaU9npCBRA@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jan 2026 12:59:17 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
> and "pinctrl_enable" since this is the recommended way.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index a98f8e7c2768..4767916dbcab 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -974,10 +974,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Fail to probe dt properties\n");
>
> -	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
> -					    ipctl);
> -	if (IS_ERR(ipctl->pctl))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
> +					     ipctl, &ipctl->pctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
>  				     "Could not register s32 pinctrl driver\n");
>
>  #ifdef CONFIG_PM_SLEEP
> @@ -990,7 +990,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return -ENOMEM;
>  #endif
>
> -	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
> +	ret = pinctrl_enable(ipctl->pctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to enable pinctrl\n");
> +
> +	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
>  	return 0;
>  }
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
