Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C05A0AD8;
	Thu, 17 Sep 2026 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661617; cv=none; b=uveDQqtGuTHVL+cBaUnAwIJv4Pjo1BlaFchWj/EZ0yaGTh165rRlB2VMmNNsWQC1hi/9nGE8YPHMS5+9aR1UAoydv3Fje7ZOvbHnHPyRQHlWn4d+SLv7QQYgaqkZEomt4JKQBDeF4eYzlNp1pRd9nKh+iXJiLM/s+TVtmSVEco4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661617; c=relaxed/simple;
	bh=zFnrtR6SYWGKC61aeWXOhe1WfalrrgftswK6msDnjYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqzbTIzmGNZ3P+2ouglz9bnsPMa6T7WdXWMHtBOq8AFf+fYuYx2gE8y1DNyI/nlCnKO41Xdyc7Oa3sH3p3U/wfDQwdBi4sVKSt5+C8F43eenTHqGNQqwTy6xnysEOSUwijOJZ+h4cwgrPt8M7fksUJjKG925A1GvyJtg0OH2eRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr1udzYe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr1udzYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087BD1F000FF;
	Thu, 17 Sep 2026 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789661614;
	bh=BsvcEjBliaX9TdmSwFzrnVUUlHtLFgXzHxEGbGjvIm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kr1udzYeKEPBDP03ZbRubs/QyurD+XczCH93LmrPm7m4sO3m/oXdLP96tmPEONN6X
	 Kba3dKkgC9gPSaWPyQtYVRw71l+HWjxdmnfwGVCBQAw1NSmUU5/llvHgJ/tcopwyFy
	 UYGxkJmevjLB7w+4ERurgLaxEQwJQPbCxktkAIeL8AMgo60UPPLy4bS7K+AUXO1v27
	 idv4le+17n79han1WeAOr0IbSCZ16GjZLXSSLuihgMWpXCdwmlgvh2CYh02XTi7NZL
	 h8BcVqwackVekrwgj8GWOU5mQJgjq6hyCRrNHfqoxjyVdyBbWmAg4yT0PEIcgYcHxp
	 BCWllf/aFLNCg==
Date: Thu, 17 Sep 2026 11:13:32 -0500
From: Rob Herring <robh@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Message-ID: <20260917161332.GA2301937-robh@kernel.org>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-3-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917075611.47881-3-farbere@amazon.com>

On Thu, Sep 17, 2026 at 07:56:10AM +0000, Eliav Farber wrote:
> When the PPS input GPIO is routed through a pin controller, a board may
> need to mux those pins to a different function while pps-gpio is not
> driving PPS (for example after the driver is unbound or across a kexec).
> 
> Document the optional "default" and "inactive" pinctrl-names and show
> both in the example. The "default" state selects the PPS/GPIO function
> and is applied by the driver core before probe; the optional "inactive"
> state, when present, describes the mux to restore when the driver is
> unbound or the system is shut down. The driver looks the states up by
> name, so "inactive" may appear in any position; it only requires that a
> "default" state also exists.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> Changes in v3:
> - Do not constrain pinctrl-names to a fixed ["default", "inactive"]
>   tuple. The driver looks the states up by name, so "inactive" may
>   appear in any position and other states may coexist; only require
>   (via "contains") that a "default" state exists, and reword the
>   description accordingly
> 
> Changes in v2:
> - Rename the released state from "idle" to "inactive"
> 
>  .../devicetree/bindings/pps/pps-gpio.yaml        | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> index 383a838744eb..db6ecb17cb54 100644
> --- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> @@ -28,6 +28,19 @@ properties:
>      description: Indicates a falling edge assert, when present. Rising edge if absent.
>      type: boolean
>  
> +  pinctrl-names:
> +    description:
> +      When the PPS input is muxed through a pin controller, the standard
> +      "default" state selects the PPS/GPIO function and is applied by the
> +      driver core before probe. If a state named "inactive" is also present,
> +      it is selected when the driver is unbound or the system is shut down,
> +      handing the pins back to their alternate function. The "inactive"
> +      state, if used, requires a "default" state; its position among the
> +      names does not matter.

Don't express in prose what can be defined in schema.

> +    minItems: 1
> +    contains:
> +      const: default

minItems: 1
items:
  - const: default
  - const: inactive

And yes, position does matter. pinctrl-0 was already implicitly defined 
as 'default'. You can't change it to pinctrl-1 now.

Rob
