Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438470;
	b=ybg8y5rsijohJSl0QxTqSkeefaezn4hemAAwdDxn/bXJ3sR1jeMwSvRxC7qbVTAaSA3S
	 GX9+C6oUx9omocPDW9MRNmJeJGF1uKR0a3+Vjp4A8hDPtEQlbLF0WKA7vVXslAt5Ciojt
	 xR1BgvnMkuseMu1Z4/iNyyxG63M70se6i30ni9RSxCc8G/0V95ESHBCVymJ+P9YcNvjic
	 8MPj+fJBHuSHABquMYm7jOphkTUWrqVOss0O5GngiNE8byihz0aD5bi8essyahXGPs8+N
	 crAKZUWbgjCu01c22rXPjwPTbraEQfnVJlFDfEj1U+sFz6lvleZHFOe4V6hNTL2pVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438470;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ikrkT4unPcBTp2tgWugemt3WecqbaPqo/nqUTFKC3Es=;
	b=M4oydKLICFiijmDDHPfdgGLi3ZuCM6l/g12St6zfOL753VAtDootJPOABjAxcU7Y9Ng5
	 zsVy/YV6gM4c7dIjhSSA09M1wuCeGF5pBGFKHHwZcOe4Hv7saZwxx7GX21bZ5/9sDcNCu
	 9sNo7LbkHYLAmxxLoM+tktJiykCABQqVTRBNNIO82wXMTjkunfaJQdPq6RUdx/Zd7KfYL
	 7N8qnE7xHUx2L8a5EpVd+tHAALxd8TLAkVbew2aWg5TTCNywdGJwpSy5UX/VHQv5l+VfB
	 4vDoq5AYYFnnyGZLz0O0ER9DT2Y4CF40ZG/JXKzgiKAVytcraGMaLZdgHjxsH+5LyiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frqtt9rs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CFA606A31A;
	Mon, 23 Nov 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frqtt9rs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF331F000C4;
	Mon, 23 Nov 2026 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438469;
	bh=ikrkT4unPcBTp2tgWugemt3WecqbaPqo/nqUTFKC3Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=frqtt9rsqngqM53eCgPeF+xKKrhBTfsfd2UB6R8Et1Xxpkjp3jY90OguMFWibf4FS
	 8Pk2ck/WOrzk59vkCuAh/rY66LUBpYUr0wimeYtXjWYv6PUtSeu4FHyyUu5ZVghgLD
	 sQ2uuezGNrbvvR4zTet2A10LdJDjYJVcRi8RsulqSt4hbSAckIPp4amT/hC5LFFCvg
	 M/Lj+krM1Ja21tNrnftbGNNuKivIAAqDrkQVUeh0V9cl9tmD6wTHaKFLzR4QLNSIcT
	 Ccl82+XTNVuczqwcUXdE5ZElKe2s09C7b9bN+rSyM/URyXiwrJ5RWlrxYj6i/zOTkL
	 +DtW42d5Bu3yQ==
Date: Mon, 23 Nov 2026 20:34:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller
 support
Message-ID: <awQyw9fp8qTj3kbU@xhacker>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-7-jszhang@kernel.org>
 <20261123-knowing-eggplant-buffalo-fddfc3@quoll>
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
In-Reply-To: <20261123-knowing-eggplant-buffalo-fddfc3@quoll>

On Mon, Nov 23, 2026 at 11:31:42AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 06:23:45PM +0800, Jisheng Zhang wrote:
> 
> > +static const struct sl2610_syscon_data sl2610_mcu_data = {
> > +	.cells = sl2610_mcu_cells,
> > +	.num_cells = ARRAY_SIZE(sl2610_mcu_cells),
> > +};
> > +
> > +static const struct sl2610_syscon_data sl2610_avio_data = {
> > +	.cells = sl2610_avio_cells,
> > +	.num_cells = ARRAY_SIZE(sl2610_avio_cells),
> > +};
> > +
> > +static const struct sl2610_syscon_data sl2610_cpu_data = {
> > +	.cells = sl2610_cpu_cells,
> > +	.num_cells = ARRAY_SIZE(sl2610_cpu_cells),
> 
> That's just MFD driver, so should be in MFD, no? Why placing standard
> MFD code - nothing soc specific - in the soc directory?

I'm not sure which is better. But FWICT, sophgo, samsung, microchip put
mfd drivers in soc directory. So I guess the reason behind this is these
drivers are soc specific?

> 
> 
> > +};
> > +
> > +static int sl2610_syscon_probe(struct platform_device *pdev)
> > +{
> > +	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
> > +
> > +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> > +				    data->cells, data->num_cells, NULL, 0, NULL);
> > +}
> 
> Best regards,
> Krzysztof
> 
