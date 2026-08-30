Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA103A784A;
	Sun, 30 Aug 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082576; cv=none; b=FZuNV0beDuy07MQD++VK4FYEpxNg3eS1ZlYo5z5xfwGQiutks2HntnuQpgLu8qT1T1KvtbRR84VPJ6vToCmTNmexiKfL3SJBaSLIu8rC977rkpJ4ZNYPIB99asZL8DIzVGu/Y+j3wZU2tKLtdminLcPldSAq9UgHkFImdQ/VMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082576; c=relaxed/simple;
	bh=FnSkeNiD3MEoGptJCOYH/zeD/+PdZ3w1kiSQJgr/v2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKzGO/bgJ0kyMCRXrW1L0ES/pHb9uCtJD6njyKRObofhzhYhPubzZnm0EiO2jhv5SEeDJCm1ECtN7JOHHTiwG3QDn2f4T2Xwg7cpxZF37lRs7EC11cfZubBvgRnIP5bjUYDZpH0p+v9hJ9B5+qWsu3ZSDYyJOxL1D3lESHZ3FxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjgHt2dp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjgHt2dp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E08E1F000E9;
	Sun, 30 Aug 2026 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788082574;
	bh=TL6Im4wx7m6Xj0lKNqVVJKASKr+8fJ7vjGzyAf7NNYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VjgHt2dpl0oL1tfNTItSwN1n+YwUFB3Y7//GCyttZ5Z58a/SPG8ZEG4nyR4vaNj9T
	 iHlzSLPUjGJN1ycOqJUbmybEOYXe337MMnEuJRYEXgEy6UUnXrMwO+Npf6YHJS7mr1
	 xxFnKOeBN+ZSBckpNK9ydrJBY1Q2SZLPEBwlAhuP6z6T3ZROziQeQzZphJuUe2eYuy
	 k1CIG1vsjr58u2vF/+Qu83qo93zwgs6VljyVXRHyzr5ziix4eu5hJyj7pMtIo4Ek7z
	 tAYdh0yVuKUjciEnhgiTnUfGZbJqGwkQUPqd6GQPEwlTn0hustNW54YY2L0sk8J2WN
	 HB7jYJiIiat6Q==
Date: Sun, 30 Aug 2026 11:36:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Subject: Re: [PATCH v3] dt-bindings: pinctrl: ti,pinctrl-palmas: Convert to
 DT schema
Message-ID: <20260830-predictable-donkey-of-ampleness-745a2f@quoll>
References: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-ti-pinctrl-palmas-v3-1-f92cd3b773fd@gmail.com>

On Sat, Aug 22, 2026 at 10:08:53PM +0530, Bhargav Joshi wrote:
> Convert TI Palmas pin control text binding to DT schema. The legacy
> binding allowed any subnode name. Restrict them to standard prefixes to
> prevent the validator from accidentally evaluating standard integer
> properties (like phandle) as child nodes.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

