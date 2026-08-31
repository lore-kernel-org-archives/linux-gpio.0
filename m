Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96F3D6CB4;
	Mon, 31 Aug 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168672; cv=none; b=o6MDvY9SoSpKeSJFy2aJGbrs0Uiq7iLaaTa5cIJcv8cRgtVp/+jvCL/dteGJ10WHfkW9M+CNprgDLe/gc9JkFczBRXtyKAFATMjkNsdkVDcVGrNa/T7N4AfvFazPpEivuuHmziDqeT3EyICVaSfC/Cm5Vw2zHWHKZFd9E/oDJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168672; c=relaxed/simple;
	bh=iO38sRkmYUX2bTdUdXaVO5atmwpmA3IgtIl8T4oA1Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfZrHDoH6STC9FdRmBqLu6ywgbOMYFOkZvZ4D9nOcazYtRL3Tkip2epwvQ7tlzKu1qagoUDm5atHNFAr58c/+p5fiVD+aq4blJzJmCsU4l6PtaRZgmbfMisnJlKXPTVanBH5vjepo2B/rx9KjqL/w1LXpVdy8YVIWzUQN4ywXRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AX/QJUN2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AX/QJUN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA671F000E9;
	Mon, 31 Aug 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168671;
	bh=H5/wgVIJ1N2Z7m4Uh3cxr6yACuxPxAQMwciTBbhU8Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AX/QJUN2tuNJAq28OlEQfrf58DLMpGIu3EP4JFA6MANE9f25deoX+jSaRExC05C1N
	 ugg1z02OBDzf7BizL7tnxuXz8lSVAQv2w+EKGa15aGqv/QvhcqmmZplyfBC3374esV
	 PDqrUEuKolVjcyFLbFObKIb0K83Cpc+x1kLCXv0E9V1mgZCi8vYrb90RubWISjjvw4
	 8l8OQAVWTwtJSMi4VyoPXLUdDfIQoCoTWaa1vXoa/f+EjNEzq93SwSl3JOzMc32Daj
	 0+w4Te0IS9dlhmzLImynSAkibuqVGjLnT8WBL/8x2L0s0oaPWXmSEXLZIRDkfTULvg
	 nzEvOkmEGsTAw==
Date: Mon, 31 Aug 2026 11:31:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Dhruvin Rajpura <drajpura@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document
 PMAU0102 GPIO support
Message-ID: <20260831-beautiful-thundering-crane-0bcd8e@quoll>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
 <20260830042939.144376-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830042939.144376-2-shengchao.guo@oss.qualcomm.com>

On Sun, Aug 30, 2026 at 12:29:38PM +0800, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Add compatible string for the PMAU0102 PMIC GPIO block, which has 12
> GPIOs, used on Nord platform.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

