Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893153BED35;
	Wed, 19 Aug 2026 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787121191; cv=none; b=j6vaBmFZRAVpKp/EuOuD8C9xc0NEUm118tztoBwRXWgg62kTvlSeTu1eWmG4gthU4HE6nRVrBCS14EctvRCZ73oOrJFiYIBcVK39Hf2lud3cBi/mA76KzxKHEu0aqSFDfCeH5wE2jas5cx6CRQLwv97wwrN65PSLmogCGMAqm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787121191; c=relaxed/simple;
	bh=JWowTWLL48ArN+gy1DC64FF7XZDfe0xC2cWtq8be/lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENk8SeXe0jQTrmsMA7tsxvSE/DTAakFfVqfixuXjER8+Vk308/FVtplkTAPTKl2vtDA3+vPkSEVbPdQ83vUMVBTIVIwLqeLzU06QmOLmnfiQkok8h2h4/mX/78Gv9PkEO6cvW58wLZ7A4sd04FUJeebx5kHLZoOByI8pAG9Ca4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDViCpCb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDViCpCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DC61F000E9;
	Wed, 19 Aug 2026 06:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787121190;
	bh=Tlw0UXpCBuq3f9nJWEiu2z4H3LwS0KIYrWqNlHzeNAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LDViCpCbRk7rn/hj6eAc0ua65YAETCwuya3/6e840pGe5t+tte2/B60LVBbG5yiDE
	 M5USLndQr94xclK4VGq+dI0S45rAWK9Lf6P0LpO3YHhh57rjlAJCq4eA1GdqX8EUmL
	 wse/37Ei6LED7vQY4FC8nUNjDnO6j/a8Sg4+WemySq8D6BSV4mctD/aqd6pqVAl2lz
	 fLLcCR49j66Aspc/EwhcnflXaaDsStgi4uA3Hff7oh+yDndog+Hxz/9AHTTMURAglO
	 2HXalWZNLDD6twl01W97zGT99x9Wv4Jc9OmErfql7I41v91KVcp7Jha0QVCPXYZeC1
	 2JMv58b8jGRAg==
Date: Tue, 18 Aug 2026 23:33:07 -0700
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
Subject: Re: [PATCH 05/10] usb: chipidea: msm: support the HSIC asynchronous
 wakeup interrupt
Message-ID: <aoVOI0euyCIZq9U7@hu-petche-lv.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>

On 26-08-10 18:42:09, Dmitry Baryshkov wrote:
> The HSIC instances of the chipidea controller runtime-suspend with
> their clocks gated whenever the bus is empty. HSIC has no VBUS-style
> connect detection: a device (such as an onboard hub coming out of
> reset) signals a single connect event, and if the controller is
> suspended at that moment the connect is never noticed and the device
> never enumerates.
> 
> The hardware provides an asynchronous wakeup interrupt that fires on
> HSIC bus activity while the controller is in low power mode. Pick it
> up as an optional second interrupt and attach it as a dedicated wake
> irq of the core device, so the PM core arms it over runtime suspend
> and resumes the controller when the bus reports activity.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_msm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
> index 3ab3daa78e34..e28ea87f9898 100644
> --- a/drivers/usb/chipidea/ci_hdrc_msm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_msm.c
> @@ -4,6 +4,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/usb/chipidea.h>
>  #include <linux/clk.h>
>  #include <linux/reset.h>
> @@ -173,6 +174,7 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_msm *ci;
>  	struct platform_device *plat_ci;
> +	int wake_irq;
>  	struct clk *clk;
>  	struct reset_control *reset;
>  	int ret;
> @@ -261,6 +263,19 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
>  
>  	ci->ci = plat_ci;
>  
> +	/*
> +	 * The optional second interrupt is the asynchronous wakeup interrupt
> +	 * of the HSIC instances: without it a bus connect arriving while the
> +	 * runtime-suspended controller has its clocks gated is never seen.
> +	 */
> +	wake_irq = platform_get_irq_optional(pdev, 1);

You may need to consider error case:

https://lore.kernel.org/all/20260807065619.30604-1-phucduc.bui@gmail.com/

> +	if (wake_irq > 0) {
> +		device_init_wakeup(&plat_ci->dev, true);

USB wakeup may NOT the same with system wakeup, the user may don't want
USB event wake system up from suspend. You may consider the solution at:
see data->wakeup_irq at drivers/usb/chipidea/ci_hdrc_imx.c. 

Peter

> +		ret = dev_pm_set_dedicated_wake_irq(&plat_ci->dev, wake_irq);
> +		if (ret)
> +			dev_warn(&pdev->dev, "no wakeup interrupt: %d\n", ret);
> +	}
> +
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_no_callbacks(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> @@ -279,6 +294,7 @@ static void ci_hdrc_msm_remove(struct platform_device *pdev)
>  	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> +	dev_pm_clear_wake_irq(&ci->ci->dev);
>  	ci_hdrc_remove_device(ci->ci);
>  	clk_disable_unprepare(ci->iface_clk);
>  	clk_disable_unprepare(ci->core_clk);
> 
> -- 
> 2.47.3
> 

-- 

Thanks,
Peter Chen
