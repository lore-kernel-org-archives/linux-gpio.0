Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C73D410D;
	Thu,  6 Aug 2026 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000085; cv=none; b=mOp9bMef+uUSZ+TAvTsid3FdZLlumSDwdhYZRLtn5+peXUAWXkpLOhMc3MoWMrk/AXom1fFkUhhJ3IjGqeb7/NNumhipwQ/uVeTb0mpuGG6UuZbre4nPqH6wsBSycaiX/BefZ+zpb/L4Pzk+XaRfrLkhLPsU70FtwlqYiBdMhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000085; c=relaxed/simple;
	bh=HF0c3BHXYWKzV8nBJivipAkiFeW2j+ZAxLbElPyufCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7ZiQFjc3ovl26CC5/+bHcaIYoBNjD4QL1WfaFKs3eN4px7exCji2W7IUynyFLkRXJ75HU2hY+mZkRQbydFViA4SCmwFkwK0oVQupO99EVCpYXCufInTYn5BK6DRx9DkkU6uSqTN9YZhk2hsGfWfeFhBFmRV1qM7Oek5WnJ4M24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnV4eU5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnV4eU5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81701F000E9;
	Thu,  6 Aug 2026 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000084;
	bh=SwNkJ5k/Yg61eA28+MStpfNR2SV/C3habiYRXhmHhCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QnV4eU5TzkqPq1Ftksvg5xOjg8ledIprFYrZg9FMw8uGP8cEvEdPCteE592KBx0q/
	 M+7pWqn8vviIrWSaaHBS5Zr5VplijkzHa7JFD7rw+zDGEglomgo+938ImCrrenC4fO
	 avFZBgWZEv5xwwjY8/tcDHKI2lYF+eH9KxTnJAtvxiRijfe8vcggUFvTUJRjzMZyNN
	 cdxecdkV+T5YKmNcIROQIYTeNFAKPW9aQuNzFWoa8Bw3tso71ctoLXQXTtuNm+GURs
	 GRyb+tQXXFL3qKulMcRMM/aqtvSIN7k8IUdLNBZTyLblXiusSZkbJtlPS+6K3ejkbc
	 6hu/MAPuRHlrg==
Date: Thu, 6 Aug 2026 09:07:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Subject: Re: [PATCH v10 02/36] dt-bindings: pinctrl: airoha: an7583: fix
 device tree binding schema
Message-ID: <20260806-large-ingenious-guan-c5df98@quoll>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-3-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805123408.3767648-3-mikhail.kshevetskiy@iopsys.eu>

On Wed, Aug 05, 2026 at 03:33:34PM +0300, Mikhail Kshevetskiy wrote:
> An7583 device tree binding schema was more or less blinly copied from
> corresponding en7581 schema. As result it's not correct.
> 
> There are following issues:
>  * i2s pin-function is not really defined for an7583
>  * i2s pin-function by mistake was replaced by i2c pin-function in the
>    functions/groups checks
>  * pcm_spi pin-function defined for less number of pin-groups
>  * pwm pin-function should have more pin-groups elements
>  * unexisting pins was defined
> 
> This patch fixes an7583 schema, so it matches actual pinctrl driver.

"Fix ..."
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

