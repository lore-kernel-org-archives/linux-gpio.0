Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1F399CFC;
	Mon, 29 Jun 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715353; cv=none; b=qIVurPVZSDwSuW5GzP4IQmSsRz5pffpduhwUAhz6iWEdBI3D3Hxr0Aa9kv9p7MvsRi6B8Ab0DO0BJ+YlBhanJGYYxlXOcdbk7/QdAe49r4zLjscQi6XWErt26sBc5CKE9EYbPG3EbbZryRRtkS8ALK70wRETYoAKlQI0achbD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715353; c=relaxed/simple;
	bh=vNTfdT0/ALbjQXh7Z/YNsWIu2llZxfQWwmma3LVfLXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sw6gUnMf99mV0FTBr78Bj5wxmZyHrEuLOQU+C8I/N0rbZGSekpgZL0un7gwpVMknKjLB0QYXQsIKcFW6zpEksxLT6q82KlJEHYGCq43+wXj7Ei7L61yo92oB/bkrNJPeWYJNaEFfojhU3AQf5wqWuW0gmeOph26xJcIL54AY2xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcWPtk8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcWPtk8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2B1F000E9;
	Mon, 29 Jun 2026 06:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715352;
	bh=wr78EnuqSRjaPvDhU+/m42ml5qRCvbTZ/fBVTr06/ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZcWPtk8PXmu31LLew82wST+cIuRMIkzO0bscqeYqE89tHzzRY8UUCbVTG+mAM5xPV
	 6KyMUbGNmqiJfLHcqbmX92EpxMdb0Gbxj2LcThHBlXfFjTcs5JKXdOYgXdQ21S+VyN
	 wCyesbUqagN8Jv9gf9pECkTm74xiKAmW0YZco7BMS8tHLw8rUrPK4B60OZBntTwxS6
	 H1UhbLX32TFacBhl90Ugd3qGFNPaQoMjV9AJV7US+BFFm4jAXHX2voesLBERBojZ6D
	 hSY2R2WSlpwiEJ1LTDguwovj+9ZDEE2ju/V26YP5yclTbG4mpU1FS7hx+91QdYUFjs
	 kpR0FjIpcRgnQ==
Date: Mon, 29 Jun 2026 08:42:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 05/17] pinctrl: airoha: an7581: fix mux/conf of
 pcie_reset pins
Message-ID: <20260629-numbat-of-undeniable-poetry-deb3b9@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-6-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-6-mikhail.kshevetskiy@iopsys.eu>

On Sun, Jun 28, 2026 at 05:37:21PM +0300, Mikhail Kshevetskiy wrote:
> In the an7581 case
>  * gpio47 and pcie_reset0 shares pin 60,
>  * gpio48 and pcie_reset1 shares pin 61,
>  * gpio49 and pcie_reset2 shares pin 62.
> but current driver treat them as pins 61--63. This is wrong.
> 
> Also current an7581 pinmux implementation have following issues:
>  * current pcie_reset pin function actually sets corresponding
>    pins as gpios.
>  * there is no proper way to set pcie_reset pins as gpios.
>  * there is no way to set pcie_reset pins as pwm.
> 
> This patch fixes above issues. Also device tree binding schema
> was updated.

Same comment.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

