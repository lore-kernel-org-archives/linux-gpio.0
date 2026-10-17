Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732338654F;
	Sat, 17 Oct 2026 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254013; cv=none; b=HlsHEN0y8P5rpkp1nklbHpXRJY0ewokor0wi4Advq05FUsbvGIuzaUZR+GL5uCmeAsJGvyMEeRNObPKFjYtt3zZ0zikXUPn9FCLu26Jzi3K/b4uhZ2yzPpbXB/6OCrD1FXo2sLpWWnbBBgN7EBI8e52hzX9RXJLVMCnUUEo9KZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254013; c=relaxed/simple;
	bh=es/BDdCfm/CvtnxZ/LEicQF6OddQSmMSFvIj6PgYFlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDPY/4LeRs5D5WzbvkBNQajYfvkxRTYCMqsGg3GxwlUac9jAbaX35NAZ4rGS643abvuK+Ruo5H/caMhyo27pBZ8yf42M7ZXQwaean+cDxFaDBILIYwcyA7l8y5WOaPF/eJz4ooRiEDUx6HJHpJUs+F4fdIyhGFyv/wARdTrg6T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKCLBzIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKCLBzIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346DD1F000C4;
	Sat, 17 Oct 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792254012;
	bh=QpGyoQykc3liLZie3yUFqmZ5bf5eC2Ns8mV45/9/ryw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NKCLBzIspt3WK/W1vyS0P5NtbOSFGGOuReVcNtQArGkc/GGqhEctHmCW83O/RR/Hk
	 o/ftvfeED7Gm4Ma2Mt0LBd72yCCU10UTwyMawkfutRux8VX/7mUltBZuVCBpCGI06U
	 lqIv3Le2E5WzpzFoP0jnHnSTOsxhUVRc7gCYW3vlN74mcf42j+r1qUTCWDHeyJLBKD
	 CR/vHj/BzaxE3Fg0ySJiKmsjLdpfR+xoDjlRe9fd8tmbd9IlK4ALYXdxL/uo1+yVTf
	 suFeK4aVA8vTGq8JpZISvbOJL4fnPhKJNL0v4V/M75jHX2q7Tsw9LKMYJn6Xq9kDzp
	 2ieuUcLTtee0w==
Date: Sat, 17 Oct 2026 18:20:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE
 ZX279128S pin mux
Message-ID: <20261017-lion-of-noble-management-d94cfe@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-10-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-10-ghahramani.navid@gmail.com>

On Wed, Oct 14, 2026 at 08:20:49AM +0100, Navid Ghahremani wrote:
> Use pinctrl-single for the verified PCIe and external-PHY bit selections
> without guessing the unverified field layout.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

