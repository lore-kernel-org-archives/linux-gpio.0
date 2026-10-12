Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4533262B;
	Mon, 12 Oct 2026 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806153; cv=none; b=CB/rvZRZ4AhN3uCcG6fmSUimkDXwnF/rLKbKx6ESGMI4mFWcwFhEvFnqCzwdclVx+4Od9IjrVRJVVjnSScHOXhD+ZXcipPp29x5sv840opkBGaW/+O1RWwl+TBjwnrtYINnI3ALgrK6VRY57mGB5jA+UqG0a1d6QHgXzT+58tH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806153; c=relaxed/simple;
	bh=YNmFrs7Kqv2eR9cG4yY/hv50VUvPsarLMvBGwioXpDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIR4F0zF+bp1dLPk5vMp3hbOxs/tPsupfKRHwzot5FtxPiZT2jtaGc6ROL55r120YCcWBZqH2JHtsndA4G4yc+0akZTPG43M3BZWXoTFkTVZqIp3MN3nakI1mQ2ZGKOT326FqaKiffevMpM6dmpKRUrzpxOTTiZdWxLuZqxbuCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=s+Z6LiEG; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="s+Z6LiEG"
Message-ID: <19b5306a-2783-408a-b649-5d9ad63eb9f9@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791806149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UF1g1L39b0T2WSsLrDGz3aAt7ouAKhUKqYELSYbPgY=;
	b=s+Z6LiEGyZRFaNqa7pb2KvrwYCgskAFK3nJCcAv44Q1kMo2O8OQN8OZlchAchsnoRo7bry
	J+Ri8bVkcGl1tgkYb5EJCeAXScypFlURD/t5/tIRCiH3wvoUxrzScV37RWRKbyggcEXbMD
	ocQwQBxhGe6IjXAzmNwlkN5vmfiscQE=
Date: Mon, 12 Oct 2026 13:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041
 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>,
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
 <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 18:59, Yureka Lilian wrote:
> The pin controller on the Apple Silicon T604x (M4 Pro/Max) SoCs is
> compatible with t8103. Add "apple,t6041-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl".
> ---
>   Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> index bc6d41b63b5d..faef287309f8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> @@ -22,6 +22,7 @@ properties:
>                 - apple,t6020-pinctrl
>                 - apple,t6030-pinctrl
>                 - apple,t6031-pinctrl
> +              - apple,t6041-pinctrl
>                 - apple,t8122-pinctrl
>                 - apple,t8132-pinctrl
>             - const: apple,t8103-pinctrl

As Linus noted, the sign-off was missing. So here it is:

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

