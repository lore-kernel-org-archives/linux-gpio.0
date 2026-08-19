Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253D3C81B5;
	Wed, 19 Aug 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124538; cv=none; b=JpgyBoNrSp5pQ4nkorx2ylS9o/08HzznbAToe8Dkw2MpImVHowXtFSQKpPjYgixX8GygbVtsznne0baZKOIO4VaJTApmtnntYf52QFKdUQ6TykqYOlcOZIlOvy0k+P5PR8ffPOBiFwArTKkZoOnjEuJU8F5JpnKxtxNb2KKSZE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124538; c=relaxed/simple;
	bh=KvPwAk2TY4MSM1WnmG6/LrViwMvQr9kYyXkS6271FQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjYPJvs2uj2/kzCaQha8BnKOuQyFOF983+/xH8o9ZGuQqUryu/5Dem3FdeCNET1cVOx+hNMay6/WTZeYQKv5fpH3UHSnL4WNeOkr3kghSAUPiYeNtaGfEZaEawVsif5b1tdb36EQqzP5G4w5TTuw+CbsBgo0iHjnwtiYLlYPCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KicRI9RG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KicRI9RG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BEF1F000E9;
	Wed, 19 Aug 2026 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787124537;
	bh=+c4hxv5iAZoAl6x2Vsz/LzNf0z4N+7E+7ULYEPv6Crw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KicRI9RGqR/qCu1MkdulTJy84Fb4AkP/xipZO2cpfo3I7e6tfyKokUDLhAh/XBKCw
	 jj/e9/Z8fAr9XTlSURXYW75ag1DZoU5eHVGKztMlL1JN9XA58o4C0glgmYD7lWKTh/
	 opmBGNch3Cp/opPlU/bv4dqToYYRnvENSso2o+fjLkPfLP3Mal8vncsCHL27uU4iBI
	 TfEGx7co+XwL26ILXaFHc1NViD4MQxMG+jkrXHH9NgwwHgggA57W/8opNpJ9Vz6GMj
	 ZKE8t39AUkdiv4/rXy3r0TyHSbOsvLAwdMxznYw4Wy/zDbBNts5MJwUq2e3r0i59ia
	 Z1lwBjtNRMVsw==
Date: Wed, 19 Aug 2026 00:28:54 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
	Stephen Boyd <stephen.boyd@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 08/10] usb: chipidea: host: calibrate the PHY after
 starting the host
Message-ID: <aoVbNp0J2feQ3ezX@hu-petche-lv.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>

On 26-08-10 18:42:12, Dmitry Baryshkov wrote:
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

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
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
>  	}
>  
>  	return ret;
> 
> -- 
> 2.47.3
> 

-- 

Thanks,
Peter Chen
