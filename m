Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317054;
	b=kJUmICTL8td5AshnCvxOiulAGyVR8tHGViWl5VrgtSaPtqgY0FvxJhOjvzS0F4u8ul4a
	 WnmYlnbPJEpSzOo+h8A9h5M9Y6P7zgpNqZBgZBi10j3r+mr92jtFI4nTuT3B0T8BpEKC4
	 3dca5uQyYOKZNqWSsq/PP9dacm6FWSlnnB6XVKVQGRsg1XNMBvkkndCaZEqqgoautLl2M
	 jrlrqDrasHCSwdp8+TuvdrV7WvKEBqQLbsN2WxEtsr38fxT5SCXq2/TeWceKRci3oYLDB
	 ZYHlLe2EOdmjhaH7I/AGLRXLdOrukogB2WZYVN96BWr+ROXVMuxyjSpiZoDyTsdWdIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317054;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gLbu+QmOwl55JJoKnVaiXzCJO4FEEFP748REBSTuBYI=;
	b=iNYNA6GRS/XB45nf+l9nva+3DswFlsLDRC8q5C4E57ungABEvUVGJPeekBne0UNHOz8O
	 keiWJ9FHpHvNDeIiRTkzYLD0FzhRD955Jx8/wqvmI0iae1AEPwafcor0sKUjVcISO4YpO
	 Suxx07pPjzAnyrpAxlc4I6K7/42UgwJPetn9iVUieAvzcOx9yCJN7W3AMajvK4ldNdgR6
	 hYMBCEB3y1PbVsowWDssv+vU9suMA30Q5DodswEKDz+gCNP0x6fH+Xt7tCh9faMiiq+RD
	 j+9JtOMF5n/8617sZj/uuAp4/5R3IcYtfQIJACheC2p1+8rhH6DjULOJ0D902JQUfAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMel5y4I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44634606B2E6;
	Tue, 10 Nov 2026 13:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMel5y4I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF861F008A1;
	Tue, 10 Nov 2026 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317053;
	bh=gLbu+QmOwl55JJoKnVaiXzCJO4FEEFP748REBSTuBYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BMel5y4IpY6KSXoDb6VVesQT6DeL5FnncCKYIWdP1DVhsWlQnNwUBDd8tJlcNiiiC
	 xFP5szs1/hZb73pQ4fBH0kATTvIT+WEAEoFI0ZiVtPXdqoVCyMysA1AEpjocNXiFbB
	 PL+TK29ndBzAi0T/XcurANYr+rWgp0MRyeoMR9CqL6rjT+CU/+efdiNSL8pMTfEX1K
	 tPTnMaNwZexeUvY6ISFhWnmOI8LF58fjc4WqmhJVpOOQiQmBoiHvhrCLK43fZoOosA
	 S9ur8BsV9arNwXL3GbW9Zw0VTZrZ3n0kNDyFMfYAhWVCdcKKM685KxHtqxPWcjwb1X
	 WiNcjW2g1I3uA==
Date: Tue, 10 Nov 2026 14:24:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
 controller
Message-ID: <20261110-pearl-peacock-of-brotherhood-f9daf1@quoll>
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
 <20261109-sf19a2890-gpio-v2-1-b885fbd84c4c@telaak.dev>
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
In-Reply-To: <20261109-sf19a2890-gpio-v2-1-b885fbd84c4c@telaak.dev>

On Mon, Nov 09, 2026 at 03:09:31PM -0500, Joseph Telaak wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
> 
> Document the GPIO controller of the Siflower SF19A2890. Siflower's SF21
> RISC-V SoCs have the same controller, and will get compatibles of their
> own with their device trees.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from Chuanhong's siflower-7.1 branch
>   - list myself as the binding's maintainer
>   - use GPL-2.0-only instead of the deprecated GPL-2.0 SPDX
>     identifier
>   - indent the example by four spaces
>   - drop the ngpios property, which the compatible implies, take
>     exactly four interrupts, and order the properties as in required
>   - commit message and subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../bindings/gpio/siflower,sf19a2890-gpio.yaml     | 76 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 82 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

