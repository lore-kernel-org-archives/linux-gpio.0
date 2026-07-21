Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8544331D;
	Tue, 21 Jul 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621630; cv=none; b=Fk4m9tKKA5zL5WdAjnQxM//K3ck/RqcZJaOi6Kbuz6ysO4SRYLqwQczleSddLc+CjMxeVMOjxX0E4vxe5GK84qB0aU3eSrnnrsqAuVoQdbUV1rZ16Whmdhy2lCKcfUP1XGPpfSh7fIIc+lOxkvwF+x37ok9sxRfBP9cRP29suN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621630; c=relaxed/simple;
	bh=34EDIy9PGVf70W7f/HasRN1+TvPSdO2b2+vbEuWRqnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YomZwsdYoXGk029HIKjb1PoMsY7RN3aHspfbN6cRrVgT4agoS3lc8u6MKObuo1/YjLJRcuWbwJeOmuL/qKoxXdUl7zPDjKJ1SUHIHQ6jm3bZC27x5VECxxAg+r0mGcSr+MqiB1yTtXd7BiDjcNOBkZmJcTb2Uh5qUXBu4NtYBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tk4ddljR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tk4ddljR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04611F000E9;
	Tue, 21 Jul 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621621;
	bh=z++pE21nLJXJJg1BIOPJk+S2n/QJjhsEu8ZSVPIm7QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tk4ddljRsI3lpF1DgL57KFZuV4kwZIn7ytSSPu0mjH1bcHJ49WNl6D5Qmxso3lMQB
	 hssk6K3t7jSSIboRGq5KNSnPLJVAWHnwtW7OfRQR7QwfmPcH0zRJqK3g+uHWetYFwQ
	 GNfArEOkYEr6Vx8JG7fl8RdUi4QUDrJ5kcM6HArbokaBzr1OMaOMIxLY/Vlq3seYyy
	 D/mVUanA9EQtGthgqcsf8I1so2I4qCGlc2TT9vkuBFsU4SSQPTlbpWXsB30I8xRZZb
	 MESngIpSoVSfx8U+vcau76QKjzbxXIbeIOGhx9HMmTFuKbjIewV3V4ss3EKs1uWJro
	 mwMko09/Y6y5g==
Date: Tue, 21 Jul 2026 10:13:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add
 rockchip,grf property
Message-ID: <20260721-ambrosial-raccoon-of-glee-6219dd@quoll>
References: <20260714192535.2082729-1-sjg@chromium.org>
 <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>

On Tue, Jul 14, 2026 at 01:25:29PM -0600, Simon Glass wrote:
> Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> IO control (IOC) register block rather than grouping the registers of
> all banks into a shared GRF region. Add an optional rockchip,grf
> property to the gpio-bank binding so that each bank node can reference
> the syscon for its own IOC block.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Add new patch for the per-bank IOC reference
> 
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index bdd83f42615c..774e9c7de606 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -44,6 +44,13 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node managing the IO control registers
> +      of this bank, on SoCs such as the RV1106 where each GPIO bank has
> +      its own IOC block.

I do not see usage of it in patchset linked in cover letter with DTS.

I have doubts that whil having one GRF region you have GPIO banks
pointing to different GRF regions.

It's possible if you would have multiple GRFs, but you do not. You have
one GRF, right?

Best regards,
Krzysztof

