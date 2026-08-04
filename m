Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59C282F25;
	Tue,  4 Aug 2026 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826309; cv=none; b=NehKuzubttAoPUM6wSRoUv5rluwgw++cJ8z9ondVK29nQuKiSF9BFVOcPCFII3I87YBgHvNAjHV3Ms9TqCWTQ1dNy9n+SbfefbLO2y1Se1rPoyQiNpJXJ5jd2IiBwWZSQmSj0YO+3ESZ70Af0GNmCX52v14JL3NZsgi0hNfohUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826309; c=relaxed/simple;
	bh=1GDoniqTPKOnS5mE5dFVUD5gOt9CPCHTm1q7gbyWVu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH9AfCPCvnMnAPVfolKIrqzCBL1q+zYPYVf69b4yucEWsO3wGMbi1d/r+CHhiExswOZqwG7ptITjIaJ+DaWgJfRIR8H4ehBj+5R1Hl7O/+inBzg2u8nxccEX/QM5W6GqD+i3wIBdz4Keacf/N7FiQ6grpPHEHR20HS5ItKx9/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYWcYct9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYWcYct9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2FA1F000E9;
	Tue,  4 Aug 2026 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826307;
	bh=E9AGxBVYQpbNREErx1f6eRinTorOtZ7ZJAiCWo6mJWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NYWcYct9Ik6x2Xq+ZGFnrvDBMhu8CYAQcx8ZgNlQcT0+zB81eVr3WepEdyG2R/bff
	 CwxD4WfnF3aAPt+VJf4YHJ0cXbxk9kPER/9h42Q7rxRq+0i8hcLkr6+TP4UhCeWjvt
	 PduqE6NXJSK9XDQne/BapirD23q8FspgolIdWQAM7m8TNFhfJYa1boNXS7qXG1qWHK
	 KJlDinn+Xti7FcPGoX4cYpma+n67agQV0zMJLGbwdX4DDL9KylaldmCszUY90ybu2m
	 ldS3GdtiuBPWrp7WKCyreiYJ/YRPY1vCQRBvz8Nis5mxAzi+/4IRy+FABEFKfGf+Fl
	 Gg1v70wpLdleA==
Date: Tue, 4 Aug 2026 08:51:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add
 rockchip,grf property
Message-ID: <20260804-advanced-meticulous-bullfinch-2657a3@quoll>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>

On Wed, Jul 29, 2026 at 07:27:26AM -0600, Simon Glass wrote:
> Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> IO control (IOC) register block rather than grouping the registers of
> all banks into a shared GRF region. Add an optional rockchip,grf
> property to the gpio-bank binding so that each bank node can reference
> the syscon for its own IOC block.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

