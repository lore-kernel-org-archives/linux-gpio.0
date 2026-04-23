Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484203644C7;
	Thu, 23 Apr 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931635; cv=none; b=Mjm2c6e2313vTMlqwCU7sAdv9bbTXUC7KXfOUCHJQUv1Zstit8mh6lxt2CY1PZl8Pd+JLhF19pLHw/MSRbDV58XF+FfepR3WeYeYDxGjlfBTQkANI+xHFka+whgMPZsnF6f4AupH/1zZZA+MBMwod7VYYOSD8gyhc+3lYIGz/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931635; c=relaxed/simple;
	bh=KZdY/I2SIdWIVd5t4gmBWX2mobEjxJUEQlkg/Ig4yiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkAgWOSglHp8Nht/b1pF9DfCJ/JMzooT2e8VukPAQ94DgvnJuAOE6OwNvpiUSm17FMBtdjEO3hSFP/mEY12WL6WJNSHATiVL6Ri5c9Plc0AWCLNMLKzOSMcOoVNARqzb05bFcVhnOITMPDyQFZfaReIJ0mW/bp1BD8pH9uuGRGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNnt9Y5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNnt9Y5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55597C2BCB5;
	Thu, 23 Apr 2026 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776931634;
	bh=KZdY/I2SIdWIVd5t4gmBWX2mobEjxJUEQlkg/Ig4yiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNnt9Y5IygthZXCcpl9lfkbzwiHIB4ys9vOe57tc8ql0sHaJaeXU4/+R+0pcwEKjx
	 qX3lvOp2LHZb6oK34KgmJjwewUlUDGqiw36VNNihx6Q2Nat8BMzpVAqtPa1IERmmhD
	 SHGpTaWrVKqNpjJefMP/zs2IfVmBWg4n7nPlTJbbqjlqqbRW5mRjJ9JNMu1gJSTIPR
	 07Tyzt966yT7bjukdElu4QjX7uprEWnDVvJpB23TIK8Rk829N+n0cdKrHpkeKHE+R8
	 InYEki9H8nnHgAVzUjGgghYeq6s66duOqLxrgxcWP4RlXrI5gG2hZ/DY1Ii7SyWcmB
	 6wT+CgTJRhHqA==
Date: Thu, 23 Apr 2026 10:07:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP
 lane mirror alternates
Message-ID: <20260423-wise-zircon-shellfish-ccfc40@quoll>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-1-68b24893ae63@pm.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-1-68b24893ae63@pm.me>

On Thu, Apr 23, 2026 at 04:43:19AM +0000, Alexander Koskovich wrote:
> Several QUP lanes have MIRA/MIRB mirror routings that let the same lane
> be muxed out on alternative GPIOs. On Eliza these were all collapsed
> under the base function name (e.g. qup1_se6), which prevented boards
> from selecting the mirror variants.
> 
> Add explicit function names for each mirror lane, matching the pattern
> already established by qcom,sm8550-tlmm and related bindings.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 25 +++++++++++++---------
>  1 file changed, 15 insertions(+), 10 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

