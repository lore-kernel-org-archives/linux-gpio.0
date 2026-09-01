Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2094582C3;
	Tue,  1 Sep 2026 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249066; cv=none; b=sPJpq2pB/9V1IA92YpSkWsejNCG1vOw4U0BmHEGFdSp/+XmW0EeTe49Lhg1Tue3EWo2q8npl60zKUvNwSzcArTvPUp6fam94AK7vldaPQ5tJxcvhf7YkMKjmP7mfItGJ9+nqcMuhstGUnM4fkt1XPQpBSKrYBRV+/DDYotlLYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249066; c=relaxed/simple;
	bh=ejdbywNqTpmJB18yhFS7CkuAyrwxUlI4tPYkwzvRFao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoIp7wpzyoKz5o8jBbaJm4qwkNL58cvxCKv9EFrCkMHYBZ1UqkNSBbahlG5mDc8gM+cFtHgeEkPhyp0x9IETMaD2eDAcIXRNZPFLUMHJ5Z+/nvr2tKMFvh4eAU5Nb6EK/MkzK8wk/xsNB8p3joLX2trbS/YrEXVa0gpywwsDDKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkihtO5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkihtO5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824C91F00A3D;
	Tue,  1 Sep 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249063;
	bh=XnIWq2e8Znfy7Of2/y6rseFC9fMg0/n8amTNj5fGoOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jkihtO5jkCjaYeG5V9HgdRRfgKIQQB85IejzP0wXYoMGfjQsIU1lPAq64I+MKS7UH
	 wBDQnWiM4ghKIDTLGokbnEcrK00GJ1IsZ/Vd23zBVl8T8HBbkHI7HwqhbSWhptBmyZ
	 MJ8jHNntvp0qOpMlMSajbpcWOwvJwSo3C3oDbB63n7yjAY8hwN7B+HwPYxp/YFkHWE
	 ct6m0AP8ZMOPhYPuV5UNaC2H8DIQxfW7+gvse9vq6xyBmNse1eNDCdJLFypHjy+orj
	 9wQbchDW9U5+TJIh8E555XnO2zprnU+zhZJ5Fy92UmIRraHAl1VsUu4x47sQaPsv8F
	 9rakAKqAO1RwQ==
Date: Tue, 1 Sep 2026 09:50:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
Message-ID: <20260901-upbeat-lemon-griffin-d7bcaa@quoll>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
 <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787830440.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787830440.git.misha.zavertkin@mail.ru>

On Thu, Aug 27, 2026 at 09:29:30PM +0700, Michael Zavertkin wrote:
> Add 'gpio-ranges' optional property to reflect driver changes.
> 
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> ---
>  Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

