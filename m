Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796C43D4F7;
	Tue, 10 Mar 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133317; cv=none; b=pFpa/4+Na5+3kdkNT5sJ0GwQwSrM/R7QWqxXV9drMa2AC9+8WWBiQLgzNCVE6QCRZ1xbBwGYf2aGHtgMoVhEEsFRSmJFLsYXkCeh/ENTdW5OlY0oGdjW6G2q+hF3zAcqWQhKL5TspDxcLuCwSE0/xWCLIfE4GIIOQgjkH9UwAns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133317; c=relaxed/simple;
	bh=mKmlWpJSVFmPNSSvosazkIhAx45dE1Wz10snfVVWT7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLrxXrBou2QXy+w+V1ufcXXZt460nbotbC+3rYA1hcNConFODNl+iY3Pp3dMUeKr56IUk7JivppsJHbrB9as5EEKNIcTGgGfefdasrQudDJL5aFqA+VaSjqhIpEv44+GDVSbz/Pl8Zq/refWvwPINt0EWS+Ir9w4Q8w7SbuIpkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHgVzSVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHgVzSVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D016DC2BCB2;
	Tue, 10 Mar 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133317;
	bh=mKmlWpJSVFmPNSSvosazkIhAx45dE1Wz10snfVVWT7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHgVzSVeRgz1ifLQ6hWBWKcebKsTn2Mn5CUK1OmNTw+cbCCos268YzTfcG8f8KHqP
	 0/hqQ/qqYngXxxC2NjjCxP+as3ycJZWmtU3z9fiRq9x55GfzJNwsn8ycLP2cpi0auO
	 y36rFCtjEaIvVuCoyp44wMBFOmSgiMA4m6glEevt7cChdWtA1eINSYLb8yiIcsj/n2
	 Rd8qCpCb2udq28QRDRU9UMIj3h2bpHEZjXFSv4TAj7516QzW0eQ/xcBAldlxl5JkQs
	 beSn/nL8X5fJH+43sunpqPonhHwQYu8I3Z2nS/HvcXmFSoyt3595Rub54VzOBI5LRq
	 Zef0vcEawA2mw==
Date: Tue, 10 Mar 2026 10:01:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI
 pinctrl
Message-ID: <20260310-dark-quixotic-lion-24edff@quoll>
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310012446.32226-3-mailingradian@gmail.com>

On Mon, Mar 09, 2026 at 09:24:43PM -0400, Richard Acayan wrote:
> Add the pin controller for the audio Low-Power Island (LPI) on SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

