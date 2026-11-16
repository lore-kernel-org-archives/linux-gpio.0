Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828990;
	b=q1EUMsrYR3J/sU8bupESbvi8kkGiy3RKBwi3bLTa+Ejr4b4PRoFglferE5Z6v+56Fxn1
	 QILHu04YzWOMF4NGo3lmx/4qyvH3s125VCDR82+oYYqcRfBo8fk7Uqp0r4A9gzYrNjH7w
	 Wn1aNomgZZ2WPyTBV54jBCiqMWSvwD8OyoOnIoRUt+qKJ/oB6lePjVzeD8U8uEDoIZR+9
	 fYqek1/n2u7xZ1h8ANVZvzp5zhrr1hCT1h2nmoBXevorPWI589f+irxSPYK8kzF9/g2Ek
	 qK0/cavqW9YXzk8fjd3kCjT5CqFU4TtfUMtSpNRu7LhmK1v6hpIGPF1+Z03iIryVMbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828990;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Jrkn+iO2qxKDc8vSbt20tA6wQd7qR/MNXzcYza4ZjkA=;
	b=Y7zbd/T93SZSoae8RcFtOgTweXLLSbnwGjHdOGyZub3qY1TKvUuddewZ9m3UnKyQ5FoR
	 RyS5zjuFwIWf6MUPgkGhxpH3hKDDaFz0nPdoO7EFHgnnemPE9wwRLd134X+wT+TG3Gydm
	 S9JJv+eOa4c7iKaCiOTpiQSxUFjoc0Mp6mMom8XWHmIOgnoe/bYzY7h8JaNRbO3+twrij
	 7YXHKveTNgVkO6CumC0IVanGbAXIetyHyBgdGxMKR9TGou4LnfK5EEhfy4zI7eouSBSDk
	 1llj2wOCVmSFzlj0eqY3ouhngduhr91z6p+KsziT9fGY805dEe1Ft6NB2rHQ6OYyfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlhtjMp8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36481606A329;
	Mon, 16 Nov 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlhtjMp8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D922B1F000C7;
	Mon, 16 Nov 2026 11:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828990;
	bh=Jrkn+iO2qxKDc8vSbt20tA6wQd7qR/MNXzcYza4ZjkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PlhtjMp8MB+qh3Mac/Q6jAIc7kPG3vr9iApjmYHqoMXeNJD6hv/T/X64whrLsuwi9
	 vVIHlsmh17hhL5gZ3VRO9rT0oXCRKfP+mUp/gFjFfdjtPFXPcgrkTfn8YX6xLI73iz
	 ZJ2SDme8ywJ5Wwajxksk0rM0S0eDLk1OjR80FWVn16OEVehG30+HTI/9hEMhfkD7yy
	 5VGLeqSkl02fuCsKZHFsknPZodNaEg1bq29EegjE6VZhn5xzwGjafI3bVkR88GSrdr
	 G6a2PEFxtCtfpV3nuzaoK2MZl/+HUXhpmzmWV09Wk9cTlLWj02YF95yl3FIiuxeJ6u
	 NilseI6xWLxRg==
Date: Mon, 16 Nov 2026 12:36:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: Add Cortina Systems CS7542
 GPIO controller
Message-ID: <20261116-brave-barracuda-of-acumen-ddb4ac@quoll>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
 <20261116-cs75xx-gpio-v4-1-ad80a944e966@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-cs75xx-gpio-v4-1-ad80a944e966@gmail.com>

On Mon, Nov 16, 2026 at 05:08:16AM +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/gpio/cortina,cs7542-gpio.yaml         | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

