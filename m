Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56F3F660E;
	Mon, 27 Jul 2026 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183179; cv=none; b=W7NksN4zMq5Xe7ovgLqvEOIbJ9Itux8BLA7vO02g1WRNKFgcg8LDTtNQcI7u6XGzysMEv7xlN2GNMfX6nzDAWMUaHsidOVMon8eu4vpvweVEqnGd5rYuB8ugNPydkPcF9Ex6DXWAMjtqSwfe+RwNdBUp7I95pelf2hvPfvGKNz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183179; c=relaxed/simple;
	bh=nRXAP9RwPapzRXwOuIxa9wbkx6438CQcWQXAuTlTSwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJBXRJs5jcuTy3Fb/6GHKJgiev1ysNj+y4GXpEefNV0XVk/y+jpGl6YRbDX7lBGKGtqfimrn+Tu+VvzHFPwceFXlyQNre39W7ncwd2eACicsJzy0KWLhqfaggJ+3/vL37CJfrYvAws5TuC+g08o+d6t+jL5Paihe3pv+2hIa700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=au89phaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="au89phaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09CB1F000E9;
	Mon, 27 Jul 2026 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183178;
	bh=kXkxAzMXIXFrCosu9W3EyUqTk5gQKizKUSmuhAPFZ68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=au89phaHNhJVD3pPwAzT1BHKXqubkUm2P86+94nLzvreI6Bv06tti53W4KYnjTSXo
	 jZNLZ4xpRdcHvxWWySxLL/SJubHE6DH+aO8qAjEi5UJkjMIv+z+Ahh249B91o5MtFN
	 g5gPg4KwwB6ssR6eFFPcr+YkJBQFGALStB/Ikyfj6dtQFsTk7I5F1mcGdNGs4N3U2b
	 LUnYrXnPHmsST8QIalmXy2nboFXPUB6rzbIKKmXoCn8VhA+o49EgePVVcXo6d/wbXN
	 3SBHCKPESY3JpChyGP4bIgE1RDP90FaIfUa8gsGNFZMcp4PwZ89AzcxANH373cDSDs
	 RbCKl4w0HB+/g==
Date: Mon, 27 Jul 2026 22:12:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v8 00/35] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
Message-ID: <20260727-pastel-skinny-muskox-f99fa6@quoll>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>

On Mon, Jul 27, 2026 at 08:41:06PM +0300, Mikhail Kshevetskiy wrote:
> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC
>  * adds support of an7563 SoC

You sent this patch bomb today. Wait a few days between big postings.

Best regards,
Krzysztof

