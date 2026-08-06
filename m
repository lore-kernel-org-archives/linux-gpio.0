Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA131352B;
	Thu,  6 Aug 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000188; cv=none; b=V1Jv9qd+AWhGjber+THR4qschEyXZHo4ydgLZpSAVXwZHUdgtFdRt8/VcoEF4KrvaLPy3OawF2Vo1/4KeC11LLhcXT11yWTadzNOqzHlJ/Imzz1/b9nzLeVDU4n5XRrKC/HnTgw3RDX1fNlXzvZhtt+AIV1zXgglMARuVaU2K04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000188; c=relaxed/simple;
	bh=fsH3E2GiQH+gWl3OlWYrn9KhyDOvLBqUxDfZK0xP7GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HguLAzCJiG8Bc/lmIpCbDpLaigMvpWuq0LmUfSDEJG86N2BLwY8R+iRM1lXgrbin37ekutlw+HOkmBtmomZEXIEi1m1uZQAC7GOi5VqFrZPEEBQeJF8NInpPwRxlsIU/BDOjdCx5lHciCFjQSSbjZxfIL+P92wFWewdOIbu/+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR4f0eGy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR4f0eGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D971F000E9;
	Thu,  6 Aug 2026 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000186;
	bh=XmN6+jVaBWN+uFT4cw5mCwCOTi/lvtaZPxfj7h/ZTPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GR4f0eGyWYzjDa4N1wC85mZBPVzdXFzz0DMB7MXtgq81BPt8qLOQF4b604EiOJzmr
	 Ufn1oW/NPVMFRECtHV3XegO3pOXuB5S8S0ZjZ3cF0siv6Bd/PGNfw3cS4xxIPnSsfM
	 NnpuWsnFa7sYNQgVZALWdfftXJZ4nztckc1ohipulWR03pU9HdKaS/+rKZVeDGawNb
	 n2uOOF5tVUnXp3igW4D/8BWhgJTD7hzRDU/+fPNgEb0u03o95GmF+ctgLrtf5s0Tj6
	 frcApx34SXzqB4vomNU1fCSIC3zW4TdaUYZqsGfx/E4ehAEguhVWY3LPEJAqfBxjlH
	 Z3UuUmssdWaaA==
Date: Thu, 6 Aug 2026 09:09:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Subject: Re: [PATCH v10 09/36] dt-bindings: pinctrl: airoha: an7583: allow
 configuration of non-gpio default pins as gpio and pwm
Message-ID: <20260806-influential-foamy-lion-c1aadd@quoll>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-10-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805123408.3767648-10-mikhail.kshevetskiy@iopsys.eu>

On Wed, Aug 05, 2026 at 03:33:41PM +0300, Mikhail Kshevetskiy wrote:
> Some AN7583 pins have non-gpio default settings. This patch provides a way
> to configure such pins as GPIO or PWM.
> 
> Please note that gpio52 pin can't be configured as PWM pin.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

