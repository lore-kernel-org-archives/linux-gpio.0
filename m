Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619255;
	b=1rZFNXAFx2yzfXdKelSwc0Tjr88Rcg00kr3Yd874JYmVlMxSXs9Oa/akOIG7Uj3BD5VB
	 9SRk4VOqd7qvxw8AuW8heG2Z6VJvshB/bhb5QpELtqRBsCJ1HG+w2FnPflTzQOy5YxDqq
	 d/Ditu8HcNPwFpQgSDd8Q9UTwJ7WTcdGp+E2wc3LRb6yX3fusdbHsw8K4WClQr9TxRt+R
	 LUbzYGfAY688CHY4iZTTb+STuT7uiBvbMkVO+cEaoIu8Joh5RYOEDdN6NrtKNYXT2oWn5
	 3i3D620At7diTfIrf3S3hKzJ3TVBLqnxWcULFcIpXHvTuaN8bWqOzDIcc6PQGLZfN1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619255;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MUaAdZxy09NmnoCy8i2jDHPfpd3l+1SIdAz/twJwCH4=;
	b=angtxEAsc0cghf7cMOsqMeoFfhfYYneMBqYCvmc8wH0QGy1Q7a+MQn+C8sHGsJB6CZXe
	 ctgvdHRsF3Q59+jLSZni6963o9oc1/puDb61K2VZpFJV45WhMyOxwT659WlyEZKRiIl+9
	 TGLQueDPVqrnx3yfqwE9yKi5cjY8OW+IMb1gxc0uBRKMwo6sIW6DZdYuynH9QG84QuFnD
	 9q8J5myxBMNlYGIgIWotp7M35hiKEIZuEAAJewYgSunNHiezAVEPAkyY583xue8DF7pkZ
	 +3H7R0q4FlQfdzZZy6IcpryMmktS7lpP3e5gWa/ngmGAj4sM/wEaaN5D/4Fxuvz2WIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLrGxy6L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 176CD606A32E;
	Wed, 25 Nov 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLrGxy6L
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A537C1F000D3;
	Wed, 25 Nov 2026 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619254;
	bh=MUaAdZxy09NmnoCy8i2jDHPfpd3l+1SIdAz/twJwCH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NLrGxy6LcvjFqDINki0RKuo8b4rW+9CRti+leJUjrE61xBj2B7CbOh2n8KzV1q3aS
	 Psh2JaIdyYIsc6AvgU/S+xJ7FJO0ZS90tieev02LIMU1fziYFcln7hCBDsKO45g13B
	 55tYToHA83hu8V4caEC2933VAUIJ7lZ7xlHXNa5MhRYPmCgdD5aLYzhb3wx/Kh72dG
	 kjZaV9+GwdUdmNAj4OeWerVyNMrjF9LoXNk6iIOHF9Ta2P2Y1wLzFWzrhQ6nkCf1nG
	 75Htuo/ulU9uFHxoF38EANCOhv5fTQxjIMZYt5Hc3GzK1XoL4hWmu8nAoy6k260mVj
	 wjPOc+mEraPTw==
Date: Wed, 25 Nov 2026 16:07:30 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Norman Herms <dockseed@proton.me>
Cc: "bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>, 
	"linusw@kernel.org" <linusw@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Subject: Re: gpiolib: hog on a three-cell OF controller takes the first cell
 as the line offset
Message-ID: <bl6ikqnu2chrn4hmi5zuriggfjbepvjv6zlot2m5l4s7ggd3rn@tnzw3qpn3tqa>
References: <qh4LV99kGaQYdQuGbsPX4b9Fm6Cip_Ow7ImY4icfwI8IsbMQy_09FovZY82b-_HVkDmR2ELMlKe8bzCuBB5NpaZizoO-s4tc11zAX30FDhw=@proton.me>
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
In-Reply-To: <qh4LV99kGaQYdQuGbsPX4b9Fm6Cip_Ow7ImY4icfwI8IsbMQy_09FovZY82b-_HVkDmR2ELMlKe8bzCuBB5NpaZizoO-s4tc11zAX30FDhw=@proton.me>

On Mon, Nov 23, 2026 at 04:59:39PM +0000, Norman Herms wrote:
> 
> Hi Bartosz,
> 
> Since d1d564ec4992 ("gpio: move hogs into GPIO core"),
> gpiochip_add_hog() takes the line from gpiochip_get_desc(gc,
> gpios[i * cells]), so on controllers whose of_xlate() builds the
> offset from more than one cell the hog lands on the wrong line.
> 
> On sunxi ("#gpio-cells = <3>": bank, pin, flags), a hog with
> gpios = <1 1 0> on the R_PIO of an Allwinner A733, meant for PM1,
> took line 1 = PL1, the SDA line of the PMIC's I2C bus. Taking the
> descriptor from the of_xlate() result for OF nodes, as
> of_parse_own_gpio() did before, put a hog on <1 4 0> on PM4 and left
> PL1 with the I2C controller. Still the same in today's linux-next.
> 
> Measured on my board by AI agents, analysis with an AI assistant;
> a report, not a Tested-by.
>

Thanks for the report, I sent out a fix[1].

Bart

[1] https://lore.kernel.org/all/20261125-gpio-three-cell-hog-v1-1-724b15c4f0d8@oss.qualcomm.com/
