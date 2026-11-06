Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969001;
	b=EbwEHt9nKueJevndWYbWivulTOKqzZUFCiEYcHPhd5POFshfp9nxuXcayzdX3OB2q320
	 dRA/QIdCnHF8F+ql1+xCun7yTIo3SOVBygNVsN7JWvkR1oaXxCzjYTU/pXZtXGoZOfi1X
	 v3X+2ShbOQjdrEmg38ImLbUIOcfOZGLgcZiVRxHGUsYrwJb2Ti/0soND4aYi0o7zlcOa3
	 4pm5qxjgfRTRXx3VvwYWg3rHLV1GYQ8P2B/ovHyxprRzPrp1Q4OMigiuVQGpsuOxKa87r
	 IgogiAfdgi+HtmW8K0+yHbP1/f20qkX0chuOIe/DkmeA6oewRybn/7CFMfTJOdt9qyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969001;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AbLAJ3WxDTVKx50wvXdvbuoZC6cGIpM9TIIss9ASD2o=;
	b=gBarOe8nwbV3ySNAQX2idMOZqUIPcDxRBw32aMRU7+lJpVf1OQSgXguNYu7ra88ZIJkD
	 YEXzTs+nXtcN5dj73gnbdw6k9JJxqT5zYT0tcBYtFtKJGF+CQN8qd70CrktIbDx+cGUWQ
	 J9wbYSWS+eAKKeIL9KD6JCCjOdOIOFrDQisvwrBkJUZbFOfu2QVXP4SPvFYNKCG1JkQoq
	 iazXYjvhFZQyCZfYw1QD9AYboq5WJivmYbyUSb73nZw0cNCKX0UktiJeAVJtShm7rPAOa
	 aG8jzsv7/o8RT+FkyNCG46dHRyPvls6jKf52l3PGkIYreWN4TR80cg/sDQ+4XVMxEsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUrI1d5y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D1606A329;
	Fri,  6 Nov 2026 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUrI1d5y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A881F0089F;
	Fri,  6 Nov 2026 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969000;
	bh=AbLAJ3WxDTVKx50wvXdvbuoZC6cGIpM9TIIss9ASD2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUrI1d5yzxmdokjfAzvYAko5RWwe/LLqGo8vqE81Gq9ySuahoNu4COUDy60hTQBG1
	 pbLci13U7h/1EfLfUkkw6PVEXOTy1Jb4tpApZIjjwNkF76HS63MAo3HFOdT+SE+zwz
	 6hJkNTD4AFpsg/qFh1uZTPCSOZFG/xQoyMA3DIB2K1exCK5HGLI6VYkDwa7ZNO4bRy
	 1e0KE3D0a18ueouSvtUbSlNTpuK/JBi1ZY8sShRcj9Vfw+sihRiNqc9H23lh9GLCF9
	 iJ91oNs768o/GkHrxRY2pNRH9N3PQ+pNL1ksBZZDoNBI5j+KWAqiwiSDSW7ia08lWN
	 gFZz0tdfOnZzQ==
Date: Fri, 6 Nov 2026 13:43:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <20261106-smiling-infrared-dugong-48ee5c@quoll>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
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
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>

On Tue, Nov 03, 2026 at 07:12:10PM +0100, Vincent Jardin wrote:
> On the LX2160A the DCFG node holds the pad mux, overridden through its
> DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
> populated, and the pinctrl child, on the LX2160A only.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> index fc14fd0bf84b..dd6a00ba04eb 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,ls1028a-dcfg
> +              - fsl,lx2160a-dcfg
>            - const: syscon
>            - const: simple-mfd
>  
> @@ -62,6 +63,12 @@ properties:
>  
>    ranges: true
>  
> +  pinctrl:
> +    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#

Why other children are bus-addressed and this one not? Such mixing is
messy. Either this is a subdevice with its own addressing or not. Keep
bindings consistent.

Best regards,
Krzysztof

