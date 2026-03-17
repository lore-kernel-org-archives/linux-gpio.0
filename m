Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9F391505;
	Tue, 17 Mar 2026 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733130; cv=none; b=SKI1wr4eIDazgyi0WJQaWMklQPTEXLt2iw7Vkp38AVx8betBTimg8ea7yN5/7IP9fCv16Njfx0CBvAgVei6ggZA5I5acX0o9TwWfwlRnwsRooKqREqsJxv4UY/rJ8K3B9k9rZxVRS+LjmF6akfNuWimWKZrnXJQ/JXRI9Au485A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733130; c=relaxed/simple;
	bh=sko8EAuNQshjeqzdBY1gNrd5ykW7gG5IlQMI64QEJXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCDi75DVl1WG/bC6K5fRlNEAxiiZJ1n9e7exX3nYMlgnrMriCImwT5eTk6Tz8A9k72zNVN1kbtsC+hB7qjMqczXF96uD85Io2adtHCZsm9lU1kaiFmyfUwtXhryAmFHXOHEkx/7HGYjvMEP5j9+M0v/inTwCB7SHHfhrE3njj/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtce48aE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtce48aE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E24C19424;
	Tue, 17 Mar 2026 07:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733130;
	bh=sko8EAuNQshjeqzdBY1gNrd5ykW7gG5IlQMI64QEJXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtce48aEFNFikERVM3vOZjr2+KEf0tNV5VZ1qs296UxzHc5xJoDO3f3j+9aLiI22a
	 NbznHOXA+l29Bue3hMebMxrZtp68dMFq53NWBXodymaHPLdA8aD5j+tnutobtUZm7Z
	 zQlZr+lrd2P5CD/xyczjVRzxJEOU+J240VNgyLTqAS/mxG7MRVPX1ME9PUsl8d1X2r
	 zJ6JZTP2UBz9yKpdBhkEqixofFQkGV5wdwmFE5P/H+PchCCKH+Q0VrmGeBXIeCoA+M
	 KleDumH+Oa5b0k1LnL8Fjs6ADYR86Ofi492MTyEFLMCYlLEwqL5F8qvsLboE9jY4xC
	 Xk7YFXqA+HhPA==
Date: Tue, 17 Mar 2026 08:38:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	brgl@kernel.org, sudipm.mukherjee@gmail.com
Subject: Re: [PATCH] dt-bindings: gpio: gpio-exar: Convert to DT schema
Message-ID: <20260317-elated-tan-lion-b91bcd@quoll>
References: <20260316122707.23353-1-ssrane_b23@ee.vjti.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316122707.23353-1-ssrane_b23@ee.vjti.ac.in>

On Mon, Mar 16, 2026 at 05:57:07PM +0530, Shaurya Rane wrote:
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  .../devicetree/bindings/gpio/gpio-exar.txt    |  6 +-
>  .../devicetree/bindings/gpio/gpio-exar.yaml   | 67 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exar.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-exar.txt b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
> index 4540d61824af..9f183e66bce9 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-exar.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
> @@ -1,5 +1 @@
> -Exportable MPIO interface of Exar UART chips
> -
> -Required properties of the device:
> - - exar,first-pin: first exportable pins (0..15)
> - - ngpios: number of exportable pins (1..16)
> +This file has moved to gpio-exar.yaml.

No, file is being completely removed.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-exar.yaml b/Documentation/devicetree/bindings/gpio/gpio-exar.yaml
> new file mode 100644
> index 000000000000..be592c7d4564
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-exar.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-exar.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Exportable MPIO interface of Exar UART chips
> +
> +maintainers:
> +  - Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +description: |
> +  Exar XR17V35x UART chips expose a subset of their MPIO lines as a GPIO
> +  controller. The GPIO controller is instantiated by the Exar 8250 PCI UART
> +  driver as a child platform device and consumes firmware properties from a
> +  child node describing the exported MPIO range.
> +
> +select: false

Never tested. That's a no go. You cannot just send us some random
code or whatever made you passing (by disabling) tests...

This patch has multiple trivial issues. Please read the docs and look
at other patches how proper submission looks like.

I don't understand why you decided to convert exactly this binding
without understanding how anything here works. This is a very, very
specific and odd binding.

Best regards,
Krzysztof

