Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64783C1985;
	Tue,  5 May 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963938; cv=none; b=k0JrA4/Dw7y8Y+QR8KoMYsrEeRtOJNwpCRcy3opzvb0gLKl8Q9VLDy0vseVsAXRw6MzfdpdaKl2f9v2xOJ2/bQrtzPgzU4DHM33ph2OxASuEAvTgnLX/Ql21HiN8K+y/nTWyyG5M9FC1LyzwnzsqHWrsTQA4bGlF+4I2ANCkzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963938; c=relaxed/simple;
	bh=zOL/0K1FBvyQMex+LGh8M+wwatwTFe/uvvd9bnxgPpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duz3j7pFBffEWfVf6DQ58A4ls5KcVS9bcrzBX+MFLnUN6vxEW+V3HlIcdTlV3bFxvjLCsWgir2IucFDon7AC/vlZ0nI7EVwf2ZQGBQay6TgUuqVLbLstPI2UzXDc5fXxjtnZose2XHMcEwgJMtLZ9Cv0ZxKl9niI4K4tm0AAVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqOfxz0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqOfxz0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6A8C2BCB4;
	Tue,  5 May 2026 06:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963938;
	bh=zOL/0K1FBvyQMex+LGh8M+wwatwTFe/uvvd9bnxgPpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqOfxz0Fz8aYqks0js7hRngME7icV5PjqIfkeYWFUW8wZVS0I/rRjeobedfC8jiBz
	 buuplhPWRXXKQ6AdVS/c8NB4qbrITUYTv99n7QSVDN0Osa2uqSJbBb/DSvFTdu2zfG
	 vRrpjhbw9Ecprnkls/b6PK7ANGb8hbRjn+E36VcZ6uF/g/s4QndZEKjl+VYF8BfDTj
	 ZmDJeo6qZNceKmafKoanBwGRYUqTk0FYwTJvVxA6pvnyL80MKxeJAQ/42AJdoUqAKP
	 Tkhf4UXm59XQeS93AKihT/qQ5PzkO6wYs4eVJBYPonH291HwwTK2/rILlxFkjimVee
	 +LIHfd8bIvp3Q==
Date: Tue, 5 May 2026 08:52:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom: move gpio-hog schema to
 tlmm-common
Message-ID: <20260505-warm-attractive-pigeon-1cbd82@quoll>
References: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>

On Mon, May 04, 2026 at 12:19:36PM +0530, Swati Agarwal wrote:
> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,ipq4019-pinctrl.yaml and qcom,sdm845-pinctrl.yaml are not SOC specific
> and applies to all TLMM controllers.
> 
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> schema duplication.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v3:
> Move the gpio-hog patternProperties for qcom,ipq4019-pinctrl.yaml to
> qcom,tlmm-common.yaml.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

