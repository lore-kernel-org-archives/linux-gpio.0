Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49140440A21;
	Mon, 12 Oct 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794241; cv=none; b=XqLRvOUbVPRkGhMJ8OpklB4arKbO2qqp/UkDY54JLFWaa3wVMfmJt7qswIYCYnHSYYdzDlTyexw5dgTtZuD2QQr0OPTLgS0Z4gp+RQQxKIbJ/YonhqkoyeFj4hCxBchndVK9kciECl7hqnC2xoFr6q+ZE65ua2/UTDHoI9PrWLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794241; c=relaxed/simple;
	bh=ib/cXoywJoV5dNxAAwi+gN34fVQh4bcMbypCB7URA40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndSgl6pKnt+ukNDy8M4xwPsqfUCkybE7mdc9MFfYvnJTwi65EO3E+RuEr+Y3xrUudcIykIOWQa2wCMxkNZTL5xSw5KrlvRExYOleaW5ixpo3dBGwjQp0gj6u4qv7zfGXQV+YVm5z5hH8klhLyPU0722Eao/2qFojcvcK1sFxGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2EZZnBG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2EZZnBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D991F0089B;
	Mon, 12 Oct 2026 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794240;
	bh=KvZy95ZhNcF4IVte9MXNd6mPq0WFSjrJGiB+RwhluU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2EZZnBG8mLG+z4vPjOJykSoc8ClM7D1FcoF8RxhMHrvDBrOISNhHs8XaT91I2Iyc
	 tC+WEp1Qf2RVrn+M+pH6nXegcD0Q6IUh9pWqmBPUtvYjvZyOeSS8VIpFmXZVbkVOAI
	 qDSLIMO9OXkZujpxJvDvZ4DF4Vq7cKsGbVRv3N6pMiF3U0V7OWQsMULC1EDn4nQ1Mo
	 OYVJM+LDfPSdV4AqH0Ah3xUuOi7uENkbCHAAzAEDpSh0O2F6MDt5VCjp5d2fV2e+Ne
	 zXThZFLTMQM1SH5SSZbMgfqqEbYwxT9ZNTUjgf1m6jyauqzf7hQbmAdOTV36qteG8f
	 ugg5V9fVoM+LA==
Date: Mon, 12 Oct 2026 14:07:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Chen <peter.chen@kernel.org>, Pavankumar Kondeti <quic_pkondeti@quicinc.com>, 
	Stephen Boyd <stephen.boyd@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>, 
	Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 04/10] phy: qcom-usb-hsic: engage HSIC mode from
 phy_calibrate()
Message-ID: <asyb2KzFNAQJ3PVm@debian>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb-hsic-v1-4-e5f93ea76ffa@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 06:42:08PM +0300, Dmitry Baryshkov wrote:
> The PHY power-on sequence ends by engaging HSIC mode. With chipidea,
> power-on runs before the host is started, and the HSIC connect of an
> already-present device is latched at the moment HSIC mode is engaged:
> performed before the host runs (and before an onboard hub is taken out
> of reset), the connect is lost and the device is never seen. This is
> why the APQ8074 dragonboard USB4604 hub never enumerated on mainline
> while the vendor kernel - which performs the whole PHY sequence after
> usb_add_hcd() - sees it on every boot.
> 
> Keep the calibration setup and the pad mux in power-on, and move the
> HSIC mode enable (and the auto-resume disable) into the calibrate op,
> which the chipidea host now invokes after the host is up and the
> onboard device reset has been released.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
