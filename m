Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D7A36826E;
	Mon,  3 Aug 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751242; cv=none; b=cOMVuvuJLeu5qVI068jGcpmDd3vyDn2yzI9UIEX7HJxxNOfz6OH+iwwW0JkLTp6z+o5lM1TIzwY/nr7QdXncrUMpd6cyh+bPR2XEFZttajiCPochcII6TIhwaOeXMicxmaemC7rvA90i+tZeIuyqR1gpxroX+JHpHJp6bSqFOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751242; c=relaxed/simple;
	bh=L6oNT+HDW5bFqo4PXu8zY5Fgd+Li3abAZoVms3Hct9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO4GHRdHgCJIlXX08TtO1oL97jNrqu++bOwuLzStjJerufDmBgJUC1Ql28LDNW5rvryqKyTT8NJL+irA8nKF0/pAnY9xZ/z5WUGtXNqAXsi7UUbMVgDpjzh1ioo6Od/NR0XGN+18/T8vnR52APyP82ZoyKHVMPYUU+z37z7B5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTGzOxtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTGzOxtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F991F000E9;
	Mon,  3 Aug 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751241;
	bh=L6oNT+HDW5bFqo4PXu8zY5Fgd+Li3abAZoVms3Hct9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTGzOxtGffiUvjhglH/QjdPoGVHEGL+++vcMksz9Pwocehly23c54PlEOdnCSDpXz
	 tPNhWEQkoMzNbbFHigWZIhYzWCwYCX1wd/6MSmLGXWKXd7SjjJLh//KHzwb66yQovF
	 /vtzlYRteUh/iPn7FGT4qjHiMotkDZ6h0FURVc3PhVD2OgK+awGcyuHIY0nCKf9PfD
	 5K6qKfNrGvC5IyKVhnSQA1ykaJ6WnL0LcEZiN8Kl3B0lZcdQiDmuchH1VC0pG0jUmT
	 EETMW1l4jNpaY+t/3BJc0AN05chCKIpI/n80unr/fnFMj9rha6O0dFS8fy5vFunH4k
	 QjWi9FdkQ4vkQ==
Date: Mon, 3 Aug 2026 12:00:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: pinctrl: qcom,sm8450-tlmm: Add
 compatible for SM8475
Message-ID: <20260803-greedy-ruby-whippet-8ed6eb@quoll>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-3-a93e1d1cb53b@proton.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260802-sm8475-tlmm-v2-3-a93e1d1cb53b@proton.me>

On Sun, Aug 02, 2026 at 03:30:56AM -0400, Esteban Urrutia wrote:
> SM8450 and SM8475 have different pinctrl drivers, which are incompatible
> with each other.

Describe the hardware and its incompatibility, not drivers.

> Add compatible string for the SM8475 pinctrl driver.

Drop references to driver completely. See DTS101 slides.

Best regards,
Krzysztof

