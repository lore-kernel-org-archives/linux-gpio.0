Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE77289E13
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356911; cv=none; b=J5hebzsMlNZq1VKXa9Gusd5YXjokR9qzNsQV8q0128tqCXAJHYaM+mBo1OIIt9I4YQfM2NqJytOZ2+/0dB4hzAv7bHr4lNCvO94orEyy9YM5MktwQ3f3ff/rFLpj5535nPXo9PVXwwkpEQEsX+AavQH+fvyIPiYu+g58CNyMwLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356911; c=relaxed/simple;
	bh=OyZceqAgbSW6fTI/tIFcuhfj8nH7HlI0OKFZdUTwpTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/L4La2lpHOhhYA2+4YtJEanCIZH6//DoAD8VZ49qWTtBTM6ZAwAb9aLJZTmyXHRlx28AYYnmZwyRI/nn/VhzKPrtGNcHz1Qbw2HF6UEyTRtw4dCuPGGLVLFUuy0GybB8ar5D5gWVtBpMdqmQ6UpT+AzELfdHuYBWKp6LNE0kfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm3MIi5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm3MIi5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1BB1F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785356904;
	bh=Z14mhav6h5sZjYDVTsRCvZnPRsjAj47Dt0/VGLZobdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lm3MIi5UMpbk7RTT/Wl9HmHe2fecTkVve4mfHMp3WpsTHkApGc8GWk60M+Q/ty3Bn
	 MMR3whCEZgCfFLJWLpF1Mx8kfZN5V9B3GWu4UWk36ZxZBiCIrb7JpUb0c+7NkslvaV
	 LYHFWXyiKJePdX9jqcilEwtgme3TbggLngkNAE14WXCr/JFEdzdH4sSuv317haRB6T
	 Dw21FACNnd/yRsLlDa6JaK0+4R5cXiOVfG5IiBjzI3zuoQkhFLIhsnCEmHaTgEfx9N
	 tbaMpz3xrK78tgoqkeg5Ao6ilkeflP5EyRmHlTff+XbTtLTmmCrnKAErKk99wUCLXI
	 XVfLpqC3Ex6AA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so144822e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 13:28:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrogaKRaj+6lUc9nkJcRqnq+8z1v7vBniOIvuRS/qb9+yQW9qRsgV38L9c+/zMNcIjzvUdyzesuy9/L@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUYqF2oO07tom+v6kYluk3fSnMDXJWNHCAfRwFRdoNveeBvTT
	Wg2P1dh2yELHGpzYdephDEB+bs//cD51LYMvb4mes5+nIi0N+0Fy9yDQFkn3vmsbUz3Qikh3iI9
	YMyMlJKcY4F6ctA+EOUjnNlfQAUUjqXQ=
X-Received: by 2002:a05:6512:450a:b0:5ad:5ba7:5c2d with SMTP id
 2adb3069b0e04-5b2d80e762amr854582e87.25.1785356903429; Wed, 29 Jul 2026
 13:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 22:28:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnf5g-ZWKNO=zE6Pv6e=v-zTEDWWpWUq+xayjh6Vrzq7Q@mail.gmail.com>
X-Gm-Features: AUfX_mx3ldhVTk-2atv5ia0bOyA8wSlftNJ-eQ4lq0SQY3ZDNblxcWWydX15_6s
Message-ID: <CAD++jLnf5g-ZWKNO=zE6Pv6e=v-zTEDWWpWUq+xayjh6Vrzq7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: axiado: add SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petar,

thanks for your patch!

On Wed, Jul 29, 2026 at 9:02=E2=80=AFAM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> Add support for the Axiado SGPIO controller.
>
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions. The driver registers the controller as a gpio_chip,
> supports interrupts on input GPIOs, and uses regmap for register access.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
(...)

> +static int ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
> +                            int value)
> +static int ax3000_sgpio_get_direction(struct gpio_chip *chip,
> +                                     unsigned int offset)
> +{
> +       if (!(offset % 2))
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}

So every second GPIO is input only and every second GPIO is output
only?

How does this look *phycially* on the outside of the chip?

I'm a bit worried that the input and output would be to the same pin or
something, in which case they are the same GPIO line.

The cover letter says " Each SGPIO position provides one fixed-direction
input GPIO and one fixed-direction output GPIO." and I'm suspicious
about this.

What is an "SGPIO position"?

If a position is something like a physical line controlled by both an
input and an output driver block, it is the same GPIO line in Linux
terms, it will be used as output if a LED is connected there and
it will be used as input if a key is connected there, and we have
64 or 128 GPIOs, not 128 or 256.

> +static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +static int ax3000_sgpio_dir_in(struct gpio_chip *chip, unsigned int offs=
et)
> +static int ax3000_sgpio_dir_out(struct gpio_chip *chip, unsigned int off=
set,

The GPIO line handling looks like:

1. some translation
2. Standard things

which is usually what we use regmap-gpio for, and we have added a few
features to it recently. Some are even in linux-next, can you check it out
and see if you could use the library?

Yours,
Linus Walleij
