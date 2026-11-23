Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429796;
	b=mmez74CZtic9mQLMOTZVfImRgSCp7GyhfIEatMNwEvmYil1LEs6y1Ho4d9V4CPidi3q1
	 gUg+mxL3OYnKE9aGZuH7JpXNoqFpoAvwXZZP+g/2OYIOpFrklk9AJHvAR/hT4U8y1rjIl
	 uQo9RxfQIccUlCd69yyZIBBAFY1bgFzXaBO2Q16/UUZRi6rosKxbKBRtwAKwK8X8t7yfM
	 OAW+S67CvrYzFB1XUAkaGeGxy/2QzmfgK21dToc16J6ZxyTY2rxQ1VOr54xhToNp4xd6n
	 aQUOeP+ncYnWwcQ/nVeZC8huS63cWGkqze3eaHKcp2VfdormkvE2vrihZtvihuaktQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429796;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AuVnC3QeDQmp/2GBHhjFUynHCQhwPZJBh/DIv/2i+BQ=;
	b=cC6eJ7ZVPJwohTWxrRE68/dQSuZQPC6ZADacZ747nKwakgE3cnVhbbBSeIn1Qf1LoDOg
	 nKIO2HGNxuSrwRpOAQQP8jyN2oEi/uZG/Id6FbrOG+Sa86RQKZr1YOui5o04rW6WASqFg
	 kO8IGrT4Z1moNLAmugX7zbay2bNzsVsa0/oJr84LbiT5yqHCZwi5oVlRpGQPY/YQOJRX3
	 sZuXGaDf33/ENrmKsgmy1f1qHRrCfjE1CCTRDoS+mRKyZnr0AMqWxHDBmTQz7DKHNcruN
	 v4mEkQxLxQLWvXnU7vWogXBkFrhg0fuSDW6WZb4xxBTMpI5nU8/zv+nKHFTwXeBp9nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrZt0FAZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA42606A31A;
	Mon, 23 Nov 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrZt0FAZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52B51F000CA;
	Mon, 23 Nov 2026 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429795;
	bh=AuVnC3QeDQmp/2GBHhjFUynHCQhwPZJBh/DIv/2i+BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TrZt0FAZWCxadq6lSV2HocGz28UeBDFH9LDs72d3p+3O1oevKMIg9PVDj314BYMkd
	 2SDvwt47R03mghBk/OaBe8jrV9uuGhp+nuk+Z18IhbvNmHblLEjlcYCRzgawXh6gvP
	 aDUrakno3/+mqEh5ZxcvuAOT4/ibYkoydZHxOTJNJm4rzOiy5c4VOn08fB1PhFyicd
	 SSqbHfaKThmJCXvPsnE3vM2I3luCJB7513rwvN1cS5BJNXXQTAxCAzYI17TxBsbB+m
	 BeeumuqL/y/3pWr+HKoNJ2/0gfN2gtuVrWZBYt97D2S/crhHpQwmtTwOV1iT0bO4yW
	 6ZDtoBGYO2bmQ==
Date: Mon, 23 Nov 2026 11:29:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 04/13] pinctrl: berlin: add optional pinconf support
Message-ID: <20261123-pillbug-of-objective-whirlwind-7f341e@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-5-jszhang@kernel.org>
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
In-Reply-To: <20261115102401.3520-5-jszhang@kernel.org>

On Sun, Nov 15, 2026 at 06:23:43PM +0800, Jisheng Zhang wrote:
> Add pin configuration support for newer Synaptics SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

...

> @@ -339,5 +563,5 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
>  }
>  EXPORT_SYMBOL_GPL(berlin_pinctrl_probe);
>  
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("GPL");

I don't see how this is relevant to the change described in the commit
msg.

>  MODULE_DESCRIPTION("pinctrl library for Synaptics SoCs");

Best regards,
Krzysztof

