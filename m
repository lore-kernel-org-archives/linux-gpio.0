Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620338657E;
	Mon, 27 Jul 2026 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183361; cv=none; b=jpgH/tcEmLjfL2n54ez3Zy5XS6MTXOLw+UvxmOklMqAhGwT9Glb0daNyzkWjqUBdkviO3LWyp5UgioMUSiqiMsKeEd9j+E0zfHGjlwKNc2pqHfKv79lq72qY4B9mw1JbfoZ55kdkF3iqvqP7Y0pvs3YSafXkHcXHtUiQtpelr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183361; c=relaxed/simple;
	bh=nj5obe6BkemZLvDDXQRZ4IKGMg5Z33SG+E0KG0oeOeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xoc7SwpE3dfbWN8GhW6PvTbW0jCauG5Mo9e7o8kylF3UwHfi+XjSd5BswldBCJDZskrH13y7tSAEJTnIt/R2W8q8HIJQdta2yqjQ+46VDZRmL5s/h8jxQidPRIMAXfWZnNnrQPv2d90DR5UwwqZeghhvu5ohKXjfITHeNW92npo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9jkYlex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9jkYlex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9821F000E9;
	Mon, 27 Jul 2026 20:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183359;
	bh=+iWa0jM1thFE79YYtWc9/4bTh879bQM9UWNB7ryvFuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9jkYlexzlpVhamy6AuvCd51nDszhZ5Wle27n2ix1kbiK+6l2qFdaDGfe0c/6kaFH
	 +Ny00CYQxjrIicMi/AClpWItr9gv04z3FB6JnRRS9EN7N8MBLTdhpzyAZX5xNi8QFM
	 gFaMSZZ/+z4zkI76WhpAu4ltbZsRLnpgutWR7Vqe29TT2DuPMQ5WIadAryveXoQGeF
	 V4z7SXW3cWI/tbg+xtxW8sT4y1fiZrnh6wtMsjo6Fb4iKyT1SDR/8H94VGwp5iRHTA
	 VFRjCikSMi+HG14Bwxw3E0UqwpIqiZsx8438CX+9Mq8Xyz+GxZbeu1Y/o3djo/YMyA
	 H0cvpjqnwHt5Q==
Date: Mon, 27 Jul 2026 22:15:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v8 30/35] dt-bindings: pinctrl: airoha: an7583: add olt
 function/group
Message-ID: <20260727-chivalrous-legendary-goat-b9ab93@quoll>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>

On Mon, Jul 27, 2026 at 08:41:36PM +0300, Mikhail Kshevetskiy wrote:
> Add support for olt pin function for olt pin group.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> index 7deb48db52c3a..f016e0da65a57 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
> +            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,

You just changed this line in previous patch, no?

Why binding patches are spread all over instead of properly grouped?
This makes it difficult to review. Please read submitting patches (both documents).

Best regards,
Krzysztof

