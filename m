Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477130;
	b=fuoWXrX750DgMyDQ17bajvGE7wOnsQ3SlhQiA7q+SzIf2luDVQx+yhKwuvQ4lPYoz1eG
	 Pm1ANrb6wm6+pYgz60juaRaP8i6Fp8Bo/rS0RLT9t9tKdnlvmV/CFOoQQzqXT11DvVq0Y
	 scvj8+CN4Cv8bY5h238eVEfY4ZuODE27iwyfZ28Iz3OLxRuMAUf4pO5BbLnTs4bl5Kz5L
	 e8YsjF7dvNlk6eDtUv6skWv9wPcxyyTX/Il9xtvogkYQAXiRsng/stUcZcG8srA/ZnKZq
	 kfxLyuNEcS1rgrWWgcygk7BtLT2pDYbgaAVJORBmOwfThvRAyvrh2gy0XFSfQ7Xz0eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477130;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ue6WQ8V5KbtaG4r5Tl1AsSdifGF/P8iShfTurS5bphg=;
	b=S3Y9h0sMbEq2WKQoKP1ffZWLZ6z8d2rRyFyjrszBh4M6TgomGE1li0Nuj5ekKkblK1yM
	 DsiUkIpEEtqMbRrNa99E/VKBzUXmaFjggQUKRb6G1HNYo3w/GcMFaRsSwFIzu6TEYU6Dx
	 aGwU9Xe2P5hn6BBHG4cae6V5jz9okqQbU9CJXNKzQ8j1HWczhQH141y2mkeU9qNzPchFy
	 yqlq2edwsgVKa8x8xQ6AvtUIEI8RTJcehnUHB5sPqI1lfEPSh/1Gf+q4SsjbG1KEjvkGN
	 NFeJsUGIq3DDqhsnWESfhQS83KdDSE9kSBsNwjpAwclvj4I1pSXGfrNg6/SHAr5192A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFXR0nNg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B695606A31D;
	Tue, 20 Oct 2026 06:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFXR0nNg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBC91F000C4;
	Tue, 20 Oct 2026 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792477130;
	bh=Ue6WQ8V5KbtaG4r5Tl1AsSdifGF/P8iShfTurS5bphg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TFXR0nNgQFceVvTVIlfkaaWfAbeAsJYF4C4I7qY/c0Z6mp1okw1hgZcHG2xXypDJR
	 L48+lAengzUx2QiPI7PKhrLwi2D5Go2+TwSraWpvz+48Xir/LtBjYgv70/kGk5T3w8
	 z58KKJm8NrR925QWVDUDO9r2uPzaoaq+LMgS5eEoYxDac59VflceMtRXUyWxU0oKUU
	 5jBvofa4ArtVWwojJyYO3ziskYuFKMZjcnLMwO2Wi86hOOJAPpsVNgbj8rygM3AO5b
	 ilPKeQMaXWc8ry0Mic6aJYBT3WAgNREo536i9jUzPVuP1mdhS7JwmJQG1lqmYrXnFF
	 9/w921AnrgIqA==
Date: Tue, 20 Oct 2026 08:18:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add
 wakeup-enable
Message-ID: <20261020-delicate-serval-of-fruition-fe0cb8@quoll>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
 <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>
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
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>

On Thu, Oct 15, 2026 at 07:52:59PM +0530, Mohammad Rafi Shaik wrote:
> The TLMM can gate whether a toggle of a pad is transferred to the wake up
> controller (PDC/MPM) while the system is in a low power mode. The pinctrl
> driver arms this for pins it requests as GPIO interrupts, but that path
> takes over the pin mux, so it cannot be used for a pin that has to stay
> muxed to a peripheral function.
> 
> Such a pin exists on boards with a SoundWire codec: while the bus is clock
> stopped the codec requests a wake up by toggling the SoundWire data line,
> which is muxed to the SoundWire function and not to GPIO. Unless the pad is
> armed, the toggle never reaches the wake up controller, the controller is
> never resumed and the event - a headset insertion, for instance - is lost
> until something else happens to wake the bus.
> 
> Add a pin configuration property so such a pin can be armed from its own
> pin configuration, without being turned into a GPIO.
> 
> Assisted-by: Claude Opus 5
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> index aec72e8c0..95f539611 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> @@ -87,6 +87,18 @@ $defs:
>        output-high: true
>        output-low: true
>  
> +      wakeup-enable:

As Sashiko points, there is no such generic property.

Anyway, the wekeup is per device rather. Arming a pin would be different
sleep function, no?

Best regards,
Krzysztof

