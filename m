Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C939A7F8;
	Thu, 16 Apr 2026 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331814; cv=none; b=P8bsURDhcJxFXDTAfsFl22HwJZIfFOZksbKBMgwb82hGqU2+Z3jLlpCT/oZVB4PigiamQ8GUt4BE2SxoSFiSu+f2LVc+7HJ3O1Kxa1kKZYqAms58VHlOjviXsxphV0ZuaiVoau2/pXL7ukRSHoke3/v5VkMfUNu4hNm8qH/waqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331814; c=relaxed/simple;
	bh=mniGz+KFTOHEPMp0qTFF3z5lzmO7QiEiuYq23UlzO3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kObtDM5rWn8+9hFiAuSmm8YJ5aW3mEZZaBWwDW9vPU+b3CSQ9Sp9dYRH3QVLt20HMSfxMuIM4Mu/mOy4JY1s1jUncTyVF1+40ccVY6k6X1dlpRO0rMYyXAYByk0Qf6iygb/kG1CcFcwj6Tf98vEnD/KYink+h8R5oTG4xookEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/JNlUDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/JNlUDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C3EC2BCAF;
	Thu, 16 Apr 2026 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776331814;
	bh=mniGz+KFTOHEPMp0qTFF3z5lzmO7QiEiuYq23UlzO3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/JNlUDKXIjCt7sw1QUi+uqOMdbkibmDrEhqCJ6/y3zuIFbSiFMYpQqp4LIMvpFx4
	 H9nNzVerx4jP2fJg5pFKtMsGJItpNxpUYYpYYrQ8oWan/p8FmKoWm+DMo49hxe9j7f
	 gfi2litFdlTgBW5l5MMl++ngG5mQa7TLaZ+Ku6k/q/wVf3SvZV4XXBt0v5mffUX080
	 LJbE51x8zoUtV6CaynE251W0E7RPVQA/DlO+P8Z+3M8yMoVIc0eE9IrKT7cFAXdGC7
	 /qsz7PiwYeTBJ6nze6imXEXzIK7lPXgqXvE7XQB/1d+OFT3JhHB2GxDwLhOYPVBtl9
	 ZGKq3wvQZ4SDg==
Date: Thu, 16 Apr 2026 11:30:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
Message-ID: <20260416-electric-dandelion-scallop-1dfb24@quoll>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-1-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_tlmm-v1-1-bd16ccb06332@oss.qualcomm.com>

On Wed, Apr 15, 2026 at 04:59:24PM +0530, Kathiravan Thirumoorthy wrote:
> Add device tree bindings for IPQ9650 TLMM block.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 +++++++++++++++++++++
>  1 file changed, 118 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

