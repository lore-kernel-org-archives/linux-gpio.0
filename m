Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311053;
	b=UC34AJZYF0I3d3tPF3Pj8TRJFfTo7LfgoqYpchixAKnDgNHHiUvJF0ohm10oT56rjXE8
	 Wm4XV7WDKRTqpZiHze/bvPGjT1f7ODRWAhu2JrstAQnFd8/zVI1um2mdw6It3NO9ReADW
	 CFq3skbSiurvnCfl6sfLzTPdpazkuHd2kEenbJRDwBazTNkfu1xMIgmYX0o1t9nW53uXk
	 KKFyt1FvOEGzTcOonXcofiADYDikFuojX8Kj6v7wQV4mMnOV4DuY+NdlxapL5KmR9quKt
	 PvoxkFZO8wr8NzwlBhUSgl5ocf3tsUTRDozQarq10OF2ODSE4apIjUvBRFv3P4i/XZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311053;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IN60gOhiFLXTiUujpua2k2lDg3kIk++JqhLJJqH7/6g=;
	b=i6GL+ckyDSdC5qrQ3oPW7/DYda5mI35boFbKzey7Pk0NF4bPwRdJwYj3kUr6/3J9lE4Z
	 CyKdTYBeSD7fdwdBHO2IBfdJkxfn0jvWIVIg7fDJbJ6yhHicHT4BwjQatLE6PfMy3OKwQ
	 APw3d0LweNX68uJ5KBhhWDzpHfAoBz4+zFAehWegAOQZBCJS+o9Lcv94jcIzNOoiHPYC4
	 T6hRfI0dRKfroJD7XLWKAZqJuD7/7dvni9cS0ZFAOausE2/Y8AvL93zf8xwEXY35LLdfE
	 tlzmhGUgY9zry8tcGyfqs3FE1u+8+sx9/tenNdjY4DheVcq/Arntm53xYwkQrnCjtVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3JG0qKZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F0606A31C;
	Tue, 10 Nov 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3JG0qKZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250591F008A1;
	Tue, 10 Nov 2026 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311053;
	bh=IN60gOhiFLXTiUujpua2k2lDg3kIk++JqhLJJqH7/6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H3JG0qKZ9niYs6YjHIufI/k3dsoPl13q0IBWxSMbWj6z3Dx2ASXFeABv7ljz/tTVJ
	 w5+1n3xgQbW2VYc598nFr0vwNccC60tWXoMpvdxfexmeBxp8zOvTZStBAXo3Pe6ZQa
	 iPgiHa9k6AL4ZgYoXbRQ6ZafZzjX+6cce1adWMZ0OBsosqLDjMb+JFBgSxvxbYzEWM
	 IFkN+1zfqCBOuLHEVYkwaJlb5NBaB/B2WMxUNbaTIPpiY15/oNnsPpF3diKV7dsa1x
	 E/tpcYtBHBMXmjmxbrcF2UkoOuELMKXQIGxVUyRHC1VVbwyRNj2MQajuO0OYAaW/rv
	 hQ47pcUWS0qVQ==
Date: Tue, 10 Nov 2026 12:44:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: realtek-otto: Add RTL9311B
Message-ID: <20261110-classy-normal-zebra-0a0d7c@quoll>
References: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
 <20261109052808.3035449-2-joshua.scott@alliedtelesis.co.nz>
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
In-Reply-To: <20261109052808.3035449-2-joshua.scott@alliedtelesis.co.nz>

On Mon, Nov 09, 2026 at 06:28:07PM +1300, Joshua Scott wrote:
> The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. It
> has the same GPIO controller as the RTL9310, with one bank of 20 GPIOs.
> Add a compatible for it, with the RTL9310 compatible as a fallback.
> 
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - Add the RTL9311B as its own compatible list, with "realtek,rtl9310-gpio"
>   as a fallback, instead of adding it to the enum used with
>   "realtek,otto-gpio" alone
> 
>  .../bindings/gpio/realtek,otto-gpio.yaml      | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

