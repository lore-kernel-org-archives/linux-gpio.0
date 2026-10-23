Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744030;
	b=GdRS+ulMuNgKzXGDFKcj0+GzEcsQalGhJBKKpBv43f/RCY4MFJa+sWr+FQz5GEpgZppe
	 +D71VWQN9UhCRPK/ZYm10LQLny0j3UmR+tX0Pw8TXNEK0x131xY+tZsskcmIk8NZTiP4f
	 CiJLG98qlwuVmkNnI14UwXiBM4T7pcGfIIabe+7gWndZ0eYpnQLfS6mlxT+G+BA6MqYyt
	 AnuvSKGgXixk6P69K+KdUtCUVP16tRzq+uoiqy/orpoOTLYa5Ch+ED5cu+094TRVmnWFf
	 ecYKgNGf/zqIK6QrHC4GXkUIhQfKlOwXiqkr7k4c7HMvYE7jYaKou28a9sCDROj20hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744030;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hZ4LTxTbxL21MjLYHVGFboP9xeIOHT2gI+p386T6LsI=;
	b=cneTC4EGdBl6jU5AVbx411mWsri/vl4Oa/2FZkpZqPYpl/S9W8AjbBIv21k2045BY/EM
	 NTPWPFN9SXOziRHveIOhGO87ip/BQnHEZwlhN3ab9tfIQtqzUU6BztWDo32P8rGf1Ymvu
	 dh74itDyVm0nMNUP5TvsfNYfPpfLjOEgWEUTZj35VYcJSuQnhRQWCWbl2zZSKh1M6lt+P
	 6i2BgWxLPJ+SF3QwFKThshI0c3eZuLkMkzwNe0cugnIqI59uiljxUuVO6Fs618tvvZXAW
	 ZPIkrC8XWjlUyzyDe5l7CwYCS1iq6sAZLhnphy2uGKkn8+KU+M2t12UpbOJr6v6z3ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hr8ZJelB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D0606A31A;
	Fri, 23 Oct 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hr8ZJelB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B131F01825;
	Fri, 23 Oct 2026 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744029;
	bh=hZ4LTxTbxL21MjLYHVGFboP9xeIOHT2gI+p386T6LsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr8ZJelBTW1jgFsheUQ5A7Met57CUogRvURMPTN2z7dioE2BCqbE/ONRfjnTxe9qd
	 nNbcYWA3Mggs2MALq5x8ge64yNAL/K2WUvoJ5dJ5nkMjwmZHXsAWXsHLtacdFKcWGi
	 9Q6RZf/d7gVSRsOIzqFxahJeNHW3uVEkpTwfsTNQ/6rcTVXGqB2nEPccjSVIbiwEDy
	 J2gtBacADqktHFdQZMoTMgvzC8UUVSlbJKhWZvgU7A+4dIX1VRfpieVjzW+Gs2t+2H
	 jlPxyrUuTVCtEU19TpUWjS07j8EWp4qlVvcTp6hlx+LJhJY6ifYjPKsXbZ4hUl1GDL
	 6vwMvrqJk0wCg==
Date: Fri, 23 Oct 2026 10:27:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
Message-ID: <20261023-jovial-agate-bat-f4bdc9@quoll>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>
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
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-3-30a47f25e515@renesas.com>

On Tue, Oct 20, 2026 at 10:14:57AM +0100, Diogo Ivo wrote:
> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> SoC. In this SoC, the controller has no HDR Exit Pattern detection
> interrupt and no SFRs clock, so constrain its number of interrupts to 16
> and the number of clocks to 2.

Your driver code suggests these are all compatible, but commit msg above
is silent on that. See also writing bindings doc.

Best regards,
Krzysztof

