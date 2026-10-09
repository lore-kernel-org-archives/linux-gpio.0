Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5636B910;
	Fri,  9 Oct 2026 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530800; cv=none; b=HcaiEnhm87ZcT2pd9EC6eJxnkegJMRA+V8nGHl+YzhE6OLWopAMQPB/KmVTx76vbpDYr95UnY8brCWbhNl/TYnD8pjLs09LJPS9hjDAkSrgqSdt0JfZLq8reW1RXBk9/l8eCf7HfZKOxR9JfZqAMmpErpMiXqJzicKkgC+s60uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530800; c=relaxed/simple;
	bh=aPkQNrrBIrlV5mdhj+YwHaOjwHjgp+ytjlfMKwj94UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hz1KM6Ti9MwePhlT/nnTip7+r5j5u1UEocRuwnp3hnuxc2DJrcq1EbGas8ZOMADM3nflFr8QEw8NL0kAgQ1E8vqs5Ch/yuAsyqpTor6Nec75yrD4nZJmab6nYXb0pqgYrEdo74dfjtv6Pc7cB5PYG3Yytm7gY/m/xQKFhnU3Yfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbFq33Iv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbFq33Iv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460421F000FF;
	Fri,  9 Oct 2026 07:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530799;
	bh=I1qHOBgT/CueMugDlTYuOqEMIjmRXjresfAHqGfD+UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbFq33IvEwrTQc5VmHwrBXfuOr6TuiMK5/V40hqG6wJ+ctUqGngj4e2F0NaSvL2hG
	 yVytM3ejZK0txmm8hWYnwdT2/tn7rX/UB0uf+eoBD2Lhz/EBhhPMb8WssE18nxmeh8
	 jsRLC8UiolUYXM9rgsC8wbKJhM7sNLXEj8Ydv9UjCtNnY/S1dxRu/jNUef/t7LuuDI
	 lKE2A7Oi7cNJtFn2jZTjUsrKB/KuE9z6L5re2Uj+2cpqSgCsX49hjSuUOlNz4vo5IF
	 5VYf4mKVWRydr+i85nfetJhY7NpyKMXUdHcQDwZwyPuMj9ofo2h90NUCm+gn11zHth
	 qt3IVKiVfLtug==
Date: Fri, 9 Oct 2026 09:26:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655
 compatible
Message-ID: <20261009-venomous-carmine-locust-f788ca@quoll>
References: <20261004191042.143713-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004191042.143713-1-rosenp@gmail.com>

On Sun, Oct 04, 2026 at 12:10:42PM -0700, Rosen Penev wrote:
> The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> expander. "onnn,pca9655" is already used standalone by in-tree DTS

"Already" is a stretch - YOU added it here:
https://lore.kernel.org/all/20260905000415.153682-1-rosenp@gmail.com/

and that patch explained nothing about missing compatible documentation.
That patch should clearly document missing binding, so the SoC
maintainer would not pick it up.

> (armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
> the pca953x driver's OF match table, but was never documented, causing
> dtbs_check failures.
> 
> Document it alongside the other standalone entries such as
> onnn,pca9654, without an nxp,pca9555 fallback, so that the existing
> DTS remain valid.

There is no existing DTs, git grep. Next is not existing, because I can
reject that DTS pull.

And what about clear comment in mainline:

 * This is how it should be:
 * compatible = "onnn,pca9655", "nxp,pca9555";
 * but you can't do this because of the way I2C works.

 Best regards,
 Krzysztof

