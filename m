Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006620;
	b=jqM5mrVeu3TXzOvbMbnxpxoxmuRLRXT2D1HZsRU0iDeolYefVTfHenYmgeEVNHH1amRr
	 7QydNapx+6uIvwoU/qtqw1XmTRbUBUrhMuNJDbvKFrjs6rqoSxnx5UqOC253Gh6veEGOy
	 4UpDJ33JLJWU11kcAh7c8JlLmoN9lmsDZSztqPx0Cq7n32/tNvk3INk/yYfWcUSBIdx1Q
	 ZlQoBD9RzzhsDaugu7Q2rLUZcXa0WuV3eANti0hx4sb/ihQ38qEgxVYa8E39lT2YbtcP6
	 lIOr8nbj2tjn5yXVa7MYsFyBMziipP2k9+keEN/Dwf4ZgwDmDRuCrbFuMdTWr+vb/2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006620;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N4cUp91wMxlvYw09VF4Kr0LWtc6o4uhdniAPEgCzkbA=;
	b=SwwAJnqDCStgnXNBwhUPLK16k6CIxmTevEDYk20YFZ131/4ijI7IEBQl1xJ5km5P/Mi0
	 E9+17oQnfpFVgFazIdgKm9MnuR5JnGMrk0j1+uRUkv8EEj0WLgVIzKFEQLUuXdxbtlfeQ
	 s4usTMoS/j0wZfYEfx1jm2mImZioiNmk9i1aVh+acktMsouhEeU7ctNtcDyMphZ0QV3kH
	 dKMZA8sf6SZ10/xwAJ9h4B9GUEqDWughJ1633g0cy8bEpDw2cm536ClNfTo1iQNT6Evgz
	 9Mu6+t5/NeFS/hx4R+7zRhdc/pQTyQFWtVMqrf1xskjArl0QqQKGa+FQPltokw5gLvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6Ka1pZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7065606A31A;
	Mon, 26 Oct 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6Ka1pZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66D01F01825;
	Mon, 26 Oct 2026 09:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006619;
	bh=N4cUp91wMxlvYw09VF4Kr0LWtc6o4uhdniAPEgCzkbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iF6Ka1pZZl7HGvMtqtO9eK0gSGX1zimFZFXXY+TX2e+IdUF9puZCbKq2lBBJ32qWB
	 WvgvGxFLVUetHBZ4Vi7OuzKv1aK3SR4MZJwyL0mQ74/SuovCH0ssnVCRMj13osZFxJ
	 g9pkb8RxJXYKFUyYHd8tMq9M5fWch3EKeXJbPYYxFxIcNhWm3BW+UNIOI0xLrIggA3
	 7xnt48ziG2mg3YuB759QBRlwt7f7OdAUwmfaPoegc+PB8PwhbhI0Yanv7imA951BzD
	 Rs5tf0QlWQE+ymISkkgfU7Lp8Q65VhQyTJZCcWc8nxwdDUDb4RpXkf8udyngLW/i56
	 IyeoQYBcRti8g==
Date: Mon, 26 Oct 2026 10:23:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guohao Zhang <guohao01.zhang@horizon.auto>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
Message-ID: <20261026-stoic-grebe-of-grandeur-a4efb3@quoll>
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
 <20261023094220.2989225-2-guohao01.zhang@horizon.auto>
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
In-Reply-To: <20261023094220.2989225-2-guohao01.zhang@horizon.auto>

On Fri, Oct 23, 2026 at 05:42:19PM +0800, Guohao Zhang wrote:
> Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
> feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
> edges in hardware. The capability belongs to the IP instance rather than
> to the SoC, so describe it with a per-controller boolean property instead
> of a build-time option, which could not express a per-controller
> difference in a multiplatform kernel.
> 
> The property only describes the presence of the register. Controllers
> that do not set it must not probe 0x68.
> 
> Signed-off-by: Guohao Zhang <guohao01.zhang@horizon.auto>
> ---
>  .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml     | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

