Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E95316199;
	Mon, 12 Oct 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794878; cv=none; b=IW9aWnWBmjgU/LqHkLFvxIzPyayXJ0k0WWek5tw2W8M6DZhdmemVFFU1nbt/39pNbQjj5TTpIQqHaGgPYhL2FSm+85AEAFbl7GZNHWZ7s8uzlJqVu1V/pbnvwKkI4At9BFFfruhyYRzyTbF2RDmRRDPhl2sF4E0T9qww6CTRerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794878; c=relaxed/simple;
	bh=mRB61DVyw+6l1YCLi7gajc8GDTZlCa37b8N06fNjsZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm0+kzDgGo47f+u5TJsTHLx38cTIgxPBgcJLX5W1mEvFYzk5m5thLXZaeQKAb+wM8Obks4cIlgdzTCQT31aSW9uiW5YRAGedpunVZ7vOWqxzjzFadmKvF8ZEUVCI2pES9ZuG25231uFfp5ColzEKUgxDw6ZsnV8QLXSW/+I6DMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTFuMnT3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTFuMnT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC281F0089E;
	Mon, 12 Oct 2026 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794877;
	bh=zIaovKbpORetJFMV2g32jUqq0XNo4TNii9P+2eJRh9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KTFuMnT3Km982dOJoJpLE0aOF8IO2hCdp+tHoH1o9jUMWN+3J5nwqs8RgjapMhKAH
	 +kGFwU/wOTUngnha0SCSVetVj5mc5E4Z1bnNEl/Yv50XbXeEbqNKYPiS96tqfGpgsK
	 Mb/9sj0Nbl6E7F3Rnejogj7kMVlDXL/aSmq4KevRlCsXfVjyZZXjr4h3fFuLR5SIgI
	 G4N8QD6UHgWhcYA/+ZerDOmDtjUWe1dBygcF0AgHYBVlYr9KczhqGv3g39Z8JuC9+1
	 dfVaMwSmcrugzZL5qlVzStPfJz2ejU/prqunnozY8fACRn2mtX9h7j07tRYUTtG3sL
	 Ywr3gbA3ks96g==
Date: Mon, 12 Oct 2026 14:17:44 +0530
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
Subject: Re: [PATCH 08/10] usb: chipidea: host: calibrate the PHY after
 starting the host
Message-ID: <asyeTY7H9lCzA4m-@debian>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 06:42:12PM +0300, Dmitry Baryshkov wrote:
> Some PHYs need a final programming step after the host controller is
> up: the Qualcomm HSIC PHY latches the device connect at the moment
> HSIC mode is engaged, so that write must happen with the root port
> already running, or an already-connected HSIC device (the strobe/data
> lines have no hotplug) is never seen. The generic PHY framework
> provides phy_calibrate() for exactly this kind of post-init fixup and
> dwc3 already calls it; the chipidea host does not, leaving no place
> for such PHY work.
> 
> Call phy_calibrate() once the HCD has been added, next to the existing
> i.MX HSIC active-event hook which serves the same purpose. PHYs
> without a calibrate op are unaffected.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/chipidea/host.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index ced6076a8248..62bb2999edb6 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/string_choices.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/phy/phy.h>
>  
>  #include "../host/ehci.h"
>  
> @@ -192,6 +193,9 @@ static int host_start(struct ci_hdrc *ci)
>  			(ci->platdata->flags & CI_HDRC_IMX_IS_HSIC))
>  			ci->platdata->notify_event
>  				(ci, CI_HDRC_IMX_HSIC_ACTIVE_EVENT);
> +
> +		if (ci->phy)
> +			phy_calibrate(ci->phy);

As Konrad noted, phy_calibrate() handles NULL pointer. So you don't need the
check. With it removed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
