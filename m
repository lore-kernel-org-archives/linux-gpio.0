Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436303;
	b=Yr0lGeJKuv9WuaQmo2ADLVWxEzDtAf8X6FsZgQy0Xb6h/IE/6PL/PTCI1WuE8aWKaZG+
	 USwkHiaO91WT6Y0brUUdqbPiotcOa5VRfzWTP+cmgVHD1SNzscm2kSb6e/2XPu3tWbNCr
	 fkvS2u6OXL/7BGu6I8iCdI2okfN52vSHKIUz857SGa3mUaPhd+gwe58JeyWm/i4nKlMy/
	 q+kfUnZwfG4AT4qTuaNVdm5nNGlh9gy9vThYeH+l+tkl/Ebo4zEUgBJzMGtBnVGpQYKgl
	 yOGqgMp1DAhKnM+GEMQYWBOgPajm+KktjwtkkisXbG2P2Iw3tioQMGwYTJimgB6qOdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436303;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pGK0OBvYCJu1N8yu8PM9PisOzbkPNFWd36gKX1yw1zQ=;
	b=Lg+SWRO304DsjGaA+CpEGZBLox7oSgAvzkTg+HmrQGWaajQ/26aYSkOTnKHDlWTQtXcT
	 x9S+kW5kBfU6ClfUMSUd4FG1Bz8ZMwYgXUxXAvTehSgvALjiCKA9krthcGkqPo4TES99o
	 DN8mvuzGt1UD46C9dsgqT+GSOmE0QNbUgkjEDiVoPgMDzCupn4r9PcPGyvaXblayxi0lK
	 VQcsxv0GFlbRK8fKKKEjtc0Xi+dy1ARlH3+miPpWawAMjHEpXGFZ/QPNW/hWZEwJczFZZ
	 evFVaX8+HtBfoJWZQC2iutxgVUav7UP8RNlGAYE6BvmnQnKVNpKfkKLJac4zku+FIYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9NAW4ty;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD2606A31E;
	Mon, 23 Nov 2026 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9NAW4ty
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4351F000D0;
	Mon, 23 Nov 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436302;
	bh=pGK0OBvYCJu1N8yu8PM9PisOzbkPNFWd36gKX1yw1zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9NAW4tyQumdHU1SyR9DOiq0llWoBFUTtQXP60kSigWkq42r8PO68XCY5iiclGcow
	 ZrmVXXNJ8ENvxSVAypk7u6dD+kSAx1SBK5/cE2FKqFxG9PAy7+wPceL5XdjH9nDok+
	 T3QPfkXqvvn/+Rk8CD2PhMv8S1pqOeQmWvRmVDhJcUIi7XA8m/mzuiCeN1sMcv/E5+
	 nM3MfpReM9bxGFuonrlrC9DR18Mq5exDoHDV3VTXr35AQI5wc6tqxqQapbXggZdbDy
	 5qRv93H0KkVURKGItiB8Ma+jiDjwF5WcD8BNX7U7cBq/v5QLe8RQDSyqT9PMGl2qM6
	 10XxwgsECfU9w==
Date: Mon, 23 Nov 2026 13:18:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Halliday Top
 Level Mode Multiplexer
Message-ID: <20261123-competent-pragmatic-cougar-4be6b3@quoll>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
 <20261116-halliday-tlmm-v2-1-b4dd502ca142@gmail.com>
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
In-Reply-To: <20261116-halliday-tlmm-v2-1-b4dd502ca142@gmail.com>

On Mon, Nov 16, 2026 at 09:23:58PM +0000, Stanislav Aleksandrov wrote:
> Document the Top Level Mode Multiplexer on the Qualcomm Halliday SoC
> (SXR2250P).
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
>  .../bindings/pinctrl/qcom,halliday-tlmm.yaml       | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

