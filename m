Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8662E6CC8;
	Thu, 11 Jun 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168524; cv=none; b=h0KorUipHoxYuc3OeNXs8Ea13H9so176htWcGQ0FS+Eqjjr+prrMr9WJBzFOu3avj8wuqZ/JFTTJiGz4CbHsTPIWYZFJDsZWM/1ibM3bJi+YLmgCmBHn6QT+IdHWBYMwk2wMpS+8PFH78mtGynYnqzKQO1ZpuJjGhXbApiPlUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168524; c=relaxed/simple;
	bh=05C7YVk+Ye4JAbAfVaQXIXbWntaA74XSmgZGjyHuK18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGIx9TXmn8GPJXiXBwUeWWMJ+EiBAQrYyCE2upX+Md9aK8Pw4pZuyD9yqKCx1m8/O3WfvIQB5ghG8SzLx9o9rXDOPZGGIhzWVzmfDupgwDc7SGXdw2u28cOiqHQR7+nH4DD3pS1actklLZBwms2qMydE+IZ1x8JW2FDHC9zdSY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcB6M4w5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcB6M4w5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD0F1F00893;
	Thu, 11 Jun 2026 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168523;
	bh=3abfMnQopptbvqv9LvYqjEn47VQFYzlpPP3q8uUXR7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UcB6M4w5c75MrAZlzWaH0A+4TMl9b24w4XWZAG1EcdUWJ5NKPRS9YmXKDA8v0qaZJ
	 kLNR4euSGSaQs9F/FlDq05I66/za9rCSPQYcqCt/bdA/tBNP29VfIUga8qaXIEUas8
	 KMHTyPT+7Zla9Z5JGw25X9j3ooKLvRl2lXEP02gos3ayh8N1m95XBzAsY/9lY0V0hJ
	 afFKwWGJ7yhg9uBXjStkNK3iqvwdpvRwvUAxaevmWaxGeJPiwWS9BucalxqQXBSriU
	 m9q1MVK846zcSm59UHpvJvzPeGX8a9Rh3oqzeGTX84uz98ofnvpbJokbkKwVi5JhNB
	 ax5vZMkMzvyvQ==
Date: Thu, 11 Jun 2026 11:02:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document
 PMG1110 GPIO support
Message-ID: <20260611-meteoric-mysterious-dinosaur-232bee@quoll>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-1-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-pmg1110-gpio-v1-1-a9c50cd8b5d9@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 12:05:46AM -0700, Fenglin Wu wrote:
> Update the binding documentation to include the compatible string for
> PMG1110 PMIC which is used on Maili platform.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

