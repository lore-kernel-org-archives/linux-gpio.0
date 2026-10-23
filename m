Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744099;
	b=gx0L0RaVmNQkh+9fGQ2T4CO4Iq1K4jwmjV3ZKGa2ZRMrzilqlSfuxj2GmSFiB8EQzi6k
	 HfzpoaGUzmVvxqEK9FwiiAZdSawVP/t08r7vuozebLlET8hDCa3MBKunVsKKb1cdv/I0B
	 07/7s2xPOGGrxsDkxIctyogKYmm6O3yLg8QFl5hIRl6HGjrCm1GHVD5BmPJSg+UzUHGkt
	 Kbtsu0U/rvgLUhFDxQsXxWH+m0ml8uXYTWtYg6zkqg9QdjvkRq30UWwjecsghcrp74j0v
	 gQO6bDlRaxlKjnAcP0P/ynujtDJ9kZ/NH0uLlXKnr+X7qSOurz3RBBUnIdUYxVgTT5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744099;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tbu6KQCYR0HIbEcZ3PFIb172SAM08206TRIlFmm9r2c=;
	b=TDSpfemGqAkehjYAmf9D9/AKsnQv9zCb69B7/hyAYNu5KNx0APizP+njwOCrvmLQk1jN
	 OnobY0C/gvE57glvPV6aNBhnkygxbCSwGqf7QSFgSCcIran9NEFY31f97AEm+FH1jeS5b
	 +6soTODZ4rRlwGc5evL+gPMXF+K6RyNCx99KNR4YUhrPI85wyCjGN8cia+/+a9u7f2jeN
	 XReCjvRDQj9AgECI2NB372zzN806KbSatzi7B5P4taYw28gmdTSffAqEZhbv4JwvaqCzW
	 kPRbDP8Gr2CQfm0c14BtU1Ai9jaV5cwPOHWhVXg6cxf9eXezw2tx3nIltWley3WnB+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma26LA6K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D091606A31A;
	Fri, 23 Oct 2026 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma26LA6K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA7B1F01828;
	Fri, 23 Oct 2026 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744099;
	bh=tbu6KQCYR0HIbEcZ3PFIb172SAM08206TRIlFmm9r2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ma26LA6KRJ2xmPXLEtu4nqIk5Fexa/c+6M2S5CrxTBtPYsMJo6Hjv2LrTNyrvCd2o
	 FwnZb0wiJtzOgDffW72jwfj6sr0H6KX/wEDXDXvTSEy48/bw8gHXu+zbvjH6BihmUy
	 RCN/MUxb6SdmRS9Zb11QejLUoesen2m++WPx0cQBWp1hNZsp9gYnw6413FpLox/pDL
	 3blYZ+P13T7QnFz+LXlG98gVQVg7DEpE3M/h/lFnNCSZRXW8kJ8EvyQL4ew64TtURw
	 FiRLOxxSRDGuCY/bR0YywD5eb8Q095tKRlunL1YmihY4kEgn5QJzMdMp+LP6zgNEDz
	 gtgdcJ0gVDcyw==
Date: Fri, 23 Oct 2026 10:28:16 +0200
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
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Message-ID: <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
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
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>

On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
> table.
> 
> The controller is very similar to the IP on the RZ/G3S. However, for
> instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
> RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
> therefore cannot be described with the RZ/G3S compatible, as its bindings
> require at least 17 interrupts. The same point applies to RZ/G3E, that
> requires 3 clocks while the RZ/G3L requires 2.
> 
> >From the driver point of view there is no difference between the two
> SoCs: the driver only consumes the tclk clock, the presetn and tresetn
> resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
> all of which are among the 16 shared ones. No driver changes are needed
> besides the new compatible.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 4fddc1b4fdbb..80a6df1151bf 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
>  
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
> +	{ .compatible = "renesas,r9a08g046-i3c" },

So fully compatible? If so, drop this and express compatibility in the
bindings.

Best regards,
Krzysztof

