Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084350;
	b=zDSEFaDW9WpSp17btrbOaCPTj91GdLXmdSiXgQjPCtnMukS6JD7Vmo9SwWMt1qDZnDUy
	 GtbKrY9CHd9csCWIVL7A7olrL92/eZwaNPnmLUogXGfVYSeju+/UqVdhYzKCnNfSN5A8Y
	 tGvkSGr7erpahEMQQQ0xOvK6xbjKr0IO7oD7L1mpQUELqZyxBH+xynfva4BUa2i8i0Nte
	 t63ps3DqJlrny0TH+D87iMT2gjY4F51+ev/WB0SqpCAJOhOQ5+tN6GaO+XcKIsFXf3cTz
	 ppEI+ZKH1lHHTxupXfPDnjntEc/5oJ/hu/oioOi8xfx7bjGinGtVsDDCZozKOcR3XLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084350;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Jxqitei9n4jTIEvLaRLKlJWrH7A0OCWEQUnpoPUhO5Y=;
	b=eJ0L7JTGn6RSKde2g79z2mNdXQw785dK4hmIS/TTSFmTrmofEMAPKvKAGrZQ4+E6JymQ
	 YEURXy2Cf3pmHeOe8ArL+la92sogOj6hoPCi/wRu404RV6o1e9e+KbxpfiXZAdnLRx+9B
	 FcdUjoBIIhvoq9QoCCO+kOkk49c892wWOmV2+ESv2eCX3w8l6z+iaLjQshAicAG95hJMV
	 pv4axZ5DvzZIxVpP3WhXKCje75JWOMQbbwxhXcYBV4+IIsMR+QnnWNh8siKPZEwouiJaS
	 qVML5vfSsXt/vNzksLjdR8nwTUTKwflkDbqsq2qaKfI0plvwBy2B4IuHsM9xmYGhBJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ola3z5aN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 82B71606A320;
	Thu, 19 Nov 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ola3z5aN
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 70EAF1F000C8;
	Thu, 19 Nov 2026 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084350;
	bh=Jxqitei9n4jTIEvLaRLKlJWrH7A0OCWEQUnpoPUhO5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ola3z5aN3akS10EcfjC4l+IeVZCeKiIcr+JOyPMGC6YqTmdZXAm7MVtszMOyqM+lt
	 MwDCVAytM1MkH2+OHj/l76KqistiZOE5eYfI2vSmammm5jtkzzlb+K5zcNj/JbVnf0
	 o6hEhleT2ZL2jtHk3ukaTwG+q3AaEMtU1udHyj6sJZpQ9Nkem7+rKrFobw8nZQE7TS
	 GVAOTuZpQgUCI+vkz5tQc2CxkyI0d8YkC+Q14OEOrXj+wLRgrmT3S/sQP+Ug6H5g/h
	 jIjwkZJgmJ6KM0BRSgF54m5ySxYaaaVC0BmUTQxGpRk1Y2fbmG02w+Vzw/4KinVqVu
	 FKnhnoupiQPIw==
Date: Thu, 19 Nov 2026 11:32:23 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: filipp.dunsky@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
Message-ID: <ndapsfnk4wdon57ihawkorz5rwrhxsb7ql3mujqvuu6ixi4sbc@ugtxsjqt7gcc>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
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
In-Reply-To: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>

On Mon, Nov 16, 2026 at 05:08:17AM +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> Add a driver for the GPIO banks of the Cortina Systems CS75xx SoCs. The
> data and direction registers are handled by gpio-mmio; each bank has its
> own interrupt with level and edge triggers, both edges are emulated by
> flipping the polarity.
> 
> A pin only works as a GPIO when the pin mux in the global control block
> selects the GPIO function. That is not part of the GPIO controller and
> is left to the boot loader until there is a pin controller driver.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---

Can you please address sashiko comments?

Bart
