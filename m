Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6643939A2;
	Mon, 13 Jul 2026 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928990; cv=none; b=SmoZQpLmhsADS9dsvK+pxtlWnhi3je2HE4PlPKEtpp6/yZffia0BG+qhijT+zwZtoa1GWHtm8s6+HyTVI1ibuwFclVXxpDQ7FdXxNYPhsDq2t4Z98TmlxZY8gGesChHXRoRuQvE6fX8ysqWAVuOVD+V2DNO7CywWOeDHtLgcneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928990; c=relaxed/simple;
	bh=8z1X4rDCLNIn4uMUjJt5pFrJZRpKCWMo8T1ntNApPCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUbIxlqIpEQrZ+WOrQrzM93tCIH6xrsc3xDtGENLb4AHJaniDBF8oXWbPfkCVGObc+DvRuoKybCwHSZunwbucW8X/eHGAA3Vl10VgkNfvuyq2Cb0aBmoU5DFUmGOEVfpTxUF+BNixVr9/hND499y7gdEMQuq2Od6UH7CuzA4uZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYJfhOg+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYJfhOg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93831F00A3A;
	Mon, 13 Jul 2026 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928988;
	bh=Rfmhg39OXz6idRUtZ/yz7s9wg55pQ2awUJp2Z5oo0Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LYJfhOg+WG9R3Wi4cJ985Q6VWKdmpp6ETkmF7dw1JK/JxoCfh+SG5Ly8oVGTdiQFh
	 qpjr+atMbSqd5m6rvKffRbwcEn6xOm9UmhJF1Dh0GZa1mJKkmt+1I+wdlOQDAIOpSw
	 BGEUYyrRt9p+TP8nyz5ywrSN6xbdaBvbv4sQCeIyYT7E72IxDkWnDTp/YrxPq4m7vf
	 R7n3ew/n3AhHglHjjbOdJCau7HRYXjdSfAzvn8dLZr9RhR+PaGpSzEMZGci+EeOi5F
	 S9olo6B8ALjZgUmg4IViN9D3avBE6CtpS5KDYsd3FaQYSijmweOyahEwTNAfYuZAXt
	 bpxm+fQoubt4A==
Date: Mon, 13 Jul 2026 09:49:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic
 KTS1622
Message-ID: <20260713-literate-influential-kagu-59fcd5@quoll>
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>

On Sat, Jul 11, 2026 at 10:59:31PM +0200, Marek Vasut wrote:
> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
> expander via the I2C bus for microcontrollers when additional I/Os
> are needed while keeping interconnections to the minimum. Datasheet
> comparison suggests that it is compatible with TCAL6416, add the
> compatible string and TCAL6416 as a fallback compatible.

Your commit msgs feel too early wrapped.
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

