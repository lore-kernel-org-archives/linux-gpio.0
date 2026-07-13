Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576D3911A8;
	Mon, 13 Jul 2026 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929073; cv=none; b=VBjXGarfQTl8vRxRuJ6EcESSCGQBKZq1fSutgDprEiSN9AYF9rG6JedrNu4JOsQbQJ3zERr1cv7nehNAPRkxKxztxgwxfsH0pywgB1diymfpB2TlaMRijZLn/qlPOf86zmThGpbZE6U/xU/lG9Xo2pPotcYuVIa/8mJfXljfT+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929073; c=relaxed/simple;
	bh=j6DK7prM48mcOvlkaODGN4Ffgr4pgWj/8uTCDR+6Bj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eg2QA5dvWHwrWoTz1D2Ng2P0adLMVSZ/kMbW85lSIKuc5iy8//N96DOKKimsiWfTmEodvxXFtkLH3KFZFDALDGCOlBQzEtt40TqTl541U2sHfHNzK9BlpjGTqpM9ACx9ePmy86+L3LsPR/dTLqNznDs0RIWZ4BTjTdXzxjdkovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yyjr5rgx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yyjr5rgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BEC1F000E9;
	Mon, 13 Jul 2026 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783929072;
	bh=8FIFnPA4i8Uh9sav+OYDKSxMFjPguw66anaA/6adj9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yyjr5rgxqGJLd4ab7WgiQ5BvmtH2qbg3TVLqR69cerg2tskgRThP731oNyfPPMcDd
	 kE7/22nb1dwDakw5xZPhIP25qwp1tAPiYh0XlqLdb3PKU+xKVFUenWnD5Ma2BwaEMr
	 aNzISpYVj+OP1cmTxrrSHN4U4jwseMxsH8ntgg0PPoyR/9jbeLKM8+ux4sb0G1GUGs
	 WR2tgF7+0nyFlN661jajZULEn8S6TNcXMF+PtLv2f36Up5Leh2255oXMxGr8UAkMH9
	 PmCv+3X8EGck8a0niArjVXBw7tt3sT1VH0eWIPEybI4XRIfC3xd11FouBAnmEraFv4
	 mus9RceepRfPg==
Date: Mon, 13 Jul 2026 09:51:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 10/10] MAINTAINERS: Add DH electronics DHCOS SoM entry
 and fix email address
Message-ID: <20260713-rousing-transparent-mongrel-ee18c3@quoll>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-11-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711210131.236025-11-marex@nabladev.com>

On Sat, Jul 11, 2026 at 10:59:39PM +0200, Marek Vasut wrote:
> Add another SoM type N: match and update email address to an
> up to date one in the process.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8729cea57c3dd..3532d425e41f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
>  
>  DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
>  M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
> -M:	Marek Vasut <marex@denx.de>
> +M:	Marek Vasut <marex@nabladev.com>
>  L:	kernel@dh-electronics.com
>  S:	Maintained

Commit is fine, but, assuming old address stops working, please send a
patch changing address in other MAINTAINERS entry + mailmap entry, and
in all of dt-bindings (one patch for DT is enough)

Best regards,
Krzysztof

