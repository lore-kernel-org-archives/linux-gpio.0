Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900F3612EC;
	Wed, 19 Aug 2026 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787121829; cv=none; b=ukWuTyqKAUWll3aIvXE6C5k8CGVDbQMptGkLzCGpy3eu6bERjmAsex8BQoOlFQdYBLIVxoUD2cYg9J8I+eP6BDqF/2TD5VUYqWZU8563d5ugDtgtZU6doNhopX8AdmMnJa9SSnIu6WjPOaPvFOOwvmCgbirjI3mUjBrQ2AfD1Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787121829; c=relaxed/simple;
	bh=kj5fMI9cy1huiFshc2s4iOoGYB80qEKnw9BygHvL5vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPCBpZajeCGpvZu8is+shYbR55PQTNvzWK7g22oJvOgy+ryc5gnB2BBwq4gQ7HNGT+0BSCdxMI3lCn0Q7pM9fGJ7q+SFeBhyActFtEcekOqyIZ3/YrrHgUKNu03QUFdpCJ/TG/eDIz8bcyzC9z6e3ATzlwUJDIWv7gloDFXY0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG1IALg9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG1IALg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4451F000E9;
	Wed, 19 Aug 2026 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787121827;
	bh=pBeI4LSUCsKWR92NNr2fzdaoEZgirvmeMcG4YeV6lt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oG1IALg9IcRgh7YDL9NG4/48nVho2UEJgnAhI6qv4aagz0Ja0Tq+mGHV+C1S0ST75
	 os1egMG63yowg1mHK+31cIX1LgQuaCXoqK05Ibl5Xh6TbMje1+PFsbFWVT76jKZXWc
	 V9pv1C5+IJGubIMEQMXNTa3vN5OnK9O4BxXcBh3JLOzJgPkRdgOyJwTT6mQju/YNPi
	 Be0bVgHgh+CQblQxNXYQdA0bEmByiBMDMH6VempDSsNzV7l0nawYZCQfu0kZa0wm8y
	 RzUuUFH2wv0uKll+QySTWhnEVOrrhdarcx0JLKABk10+gEUjve5VUFsmdjWX8zzXDt
	 tsvigyXhUE+Hw==
Date: Tue, 18 Aug 2026 23:43:45 -0700
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
Subject: Re: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
Message-ID: <aoVQoYDWZ-w6PUJr@hu-petche-lv.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>

On 26-08-10 18:42:10, Dmitry Baryshkov wrote:
> The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
> and nothing pinning it active. Right after a successful probe the
> driver core's pm_request_idle() runtime-suspends the glue (the ci core
> child has runtime PM disabled, so it does not hold its parent), and
> when the glue sits in a power domain - the HSIC instances live in the
> USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
> underneath the running controller. The EHCI register file reads back
> zeroes, an onboard hub's connect is never seen, and subsequent bus
> accesses into the unpowered block wedge the interconnect, eventually
> taking the whole SoC down.

If you want runtime-pm support, you may set flag CI_HDRC_SUPPORTS_RUNTIME_PM,
The USB core (EHCI) would resume the controller (CI core).

> 
> Pin the glue runtime-active so the domain stays powered for the
> lifetime of the controller. Proper low-power handling can later be
> built on the child's runtime PM together with the HSIC wakeup
> interrupt.

If you would need HSIC wakeup interrupt, the CI MSM should support
runtime PM per my understanding.

Peter
> 
> Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_msm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
> index e28ea87f9898..9a9410a814e5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_msm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_msm.c
> @@ -276,7 +276,13 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
>  			dev_warn(&pdev->dev, "no wakeup interrupt: %d\n", ret);
>  	}
>  
> +	/*
> +	 * The glue owns the controller's power domain (the HSIC instances sit
> +	 * in a GDSC): if it runtime-suspends, the domain is powered off
> +	 * underneath the running controller. Pin it active.
> +	 */
>  	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_no_callbacks(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  
> @@ -294,6 +300,7 @@ static void ci_hdrc_msm_remove(struct platform_device *pdev)
>  	struct ci_hdrc_msm *ci = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  	dev_pm_clear_wake_irq(&ci->ci->dev);
>  	ci_hdrc_remove_device(ci->ci);
>  	clk_disable_unprepare(ci->iface_clk);
> 
> -- 
> 2.47.3
> 

-- 

Thanks,
Peter Chen
