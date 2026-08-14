Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0A453A54;
	Fri, 14 Aug 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697961; cv=none; b=FB7HOeLPVdPvz8ewd++r0O0jeVokf5oum+Hx/zTBI6uKOMJKZYpxfiItrjrgmu5D7hN8Q/qTi980Ae0/6FJb/frHJOc7uodu5kjyrGlHezi3Zo3RNnw45knSh3qnntz4R++EZnOhwfKBRdcfczDGBTLtotq8pcxOelcRwTmE+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697961; c=relaxed/simple;
	bh=TF3ZNkxPaHFHw6jQnK0xA8IcvZ0iGMMBMW2bwnJXS38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/jVfSUh4WYLivqBlWq7eDd2jiv2WJzO2L4PfiCUQ2nSoSpazob0u0AlAbESRK0xgn+0VRqKVrKiw3rIg4XFhVwQBOoik8Uyps1qfeOCr5hzEpzzNwTUGEgPGj7TRDx6r3PUyZaFrVpQO75/yAH3tDgaiN3bCh57thSZ1hTJ4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDefZm4x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDefZm4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF7B1F00A3A;
	Fri, 14 Aug 2026 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697960;
	bh=64zJfBFVLsa/r/hTy+ZXMCvUd6FMvrCGvORICSfFTTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDefZm4xUhCy9ejdkmsluExNgWKYDYzlhpqB49+oJNzwu6KULQR4CC/u+dJ9Q0nUt
	 h1/cGA217YAC+i22n7oYGt1SfzGAciNP+zlpncOv7KWdY555a13t60+D4jVAijvNkb
	 00WxGVThrlKmqLg422hRdEGUl0UQ2c2Ghm1PadWFLPQJfdV8TKDlybCtzzUdczWVkJ
	 dpcB50dMtQzyUG32vSkHvhhOSSf2qVsFsc/uDouFnF7O0Kl3/V1kfHcLIExNW3QIsM
	 vkQvvrON+FI+9xkMuh18hfIEULJUgfjdY9ubP63L9zNB/rX6+eKOF6P8M/XrBF8uSK
	 466zDanAjOk3A==
Date: Fri, 14 Aug 2026 10:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register layout
 variant
Message-ID: <20260814-nondescript-quartz-shrimp-3ce74d@quoll>
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
 <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>

On Thu, Aug 13, 2026 at 06:19:37PM +0800, Long Zhao wrote:
> Extend gpio-pl061 with a per-variant register layout so the Ambarella
> CV75 GPIO banks can reuse the PL061 driver instead of a duplicate.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  35 ++-
>  drivers/gpio/gpio-pl061.c                          | 280 ++++++++++++++++-----

And what does the checkpatch say?

Best regards,
Krzysztof

