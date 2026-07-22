Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77482473C8F;
	Wed, 22 Jul 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734310; cv=none; b=r5aGbIIZU88QyzdDLhFMKxuxS3V7NxdNcnb7U3xCC9dSXDDZIm+kZbVFCToBzcAagDN/n2d3PHI33YDhdAmxssqYGli8BbHaK7VMDCELcir+Jk4r45A8T3jfC5Z0oaTWYkbkvM+kaYD7QrxORvr2YqW0WqeitJCjyLWUwc+vrDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734310; c=relaxed/simple;
	bh=0pMysZB2TLYoHUJ8ggDxOicbwXFfmDiU6A4FhFu4QrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8U67tAg1RUWQXkHt/sHkBS98VjAhPjnUT25AOR79yV1pAyJOpU+D2z+2rvQB/Egn5KoHue4wuFL3VhWMJnRGhKBZhckacmad2r+5qFdfeZU9J1Kb8Za1GbqCHK4URWIb6azc55MGVlKkKuiPhSzGGZVssdZrARfaBzuPehHcso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+340JMP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+340JMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C301F000E9;
	Wed, 22 Jul 2026 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734309;
	bh=GIyxzcyxu4KX8Kz+gSWClSAe1DI+cNRMQZqfJq0aSs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n+340JMPz/zTCAh5G/JqDfLBZUH2uIZvcYJqmXeoeSYOUvEnNmO7OqyT5NDw+0p6e
	 9Qsm5FGpI049dzqa+orfFdWQ6A2neWodoftVuqU6dmX4q+6PCwk3ojSq74aCyn3Q2m
	 EYYPRbA2KlSOjTOKmKgcsfx7CVWNjpAK48jzG2PdnYCzu7epepfZvG1Yi31hZnNSoo
	 t1Wx7EYsuut7tejcms0vK6w00eXUbKyXjOsYkyN+xhsgDktMQC5ThtmZLURtFqqoR7
	 gvJojV+goKw0euj96kaaEUATb2Ypzcz/QHaAEcy8Js6oM09YzOARHmks2fupKjqmq8
	 YAI4FuFhg7d6g==
Date: Wed, 22 Jul 2026 10:31:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel@dh-electronics.com, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: stm32: Sort the document
Message-ID: <178473430598.971819.5105666655246477441.robh@kernel.org>
References: <20260713232440.120352-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713232440.120352-1-marex@nabladev.com>


On Tue, 14 Jul 2026 01:24:14 +0200, Marek Vasut wrote:
> Sort the document, place STM32MP21 before STM32MP23, and STM32MP23
> before STM32MP25 . No functional change.
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
>  .../devicetree/bindings/arm/stm32/stm32.yaml       | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

