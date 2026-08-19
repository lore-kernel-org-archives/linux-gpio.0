Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE43304BB2;
	Wed, 19 Aug 2026 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122105; cv=none; b=p+l+qXC5kvB2Rr8hMEH/UpZRf9G9tOGEnuqhjMQEMHChgz8vIdnaBzGOrG9Z8s1r2ooHiGaG+aBwE6FsG88uyHhLG0AKbYHi5ZuZ8qoNrXo3jfXkNk56crpV5UFqZ8yAhVlDlpwkGO8/XSO3E6Ysq+0RQGuYzx6u9gLg9LCjmME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122105; c=relaxed/simple;
	bh=wQHyLGESPH68wY+d+xwMRFArrHAFi+T8zmfJlOR20Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/XSdQnl4sz4V9WSNcB+LV+PW6GmLv0rdZ7f58p/zWrUHI+ke/C8niz1N7DFM+DLy2SI23hpCVb1Dp1+wEq1W/oMZkIk1LrN29HonYDl14PEXt17NV5hbSs0jkXCaM8+ouf66yerfvUdHWuemNRydsj3eKafCoR2OrHrzAsfuQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxY2Ggte; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxY2Ggte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F741F000E9;
	Wed, 19 Aug 2026 06:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787122104;
	bh=zNiG1hgVV74gYmbP47bMIwtTyThAgGJICdsIfO9pDjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nxY2Ggte4S1bF6/f428LBhplxCT6ASV6xQzgpd+UYdYOhF8TKGkAzNkK/N2pCORud
	 a214lyWlwvptxVPyHJs93o00h28j03xbo0CQRNEwgNCOt1hxn6ZQMPTKpVOh0MwgZD
	 q9bKkI3mb80wRs5Lz6LqCPORa2Aeu/WbPgnIQw3arOetM1KNFt/NZhFXLz7a5ADFw2
	 mGfc7pNWRcOXfC13MwJGh0lLy8Jy2l8gzKK1SYiharNVeVJCBCoiXfK9XwmsREyD2F
	 84/Wry6GutpJ4Rm4w93K2/GT1tCDfH5dmDC8TP+V6R9hHS758n5riEn3Bd+K6acVqi
	 OfV2RL8v5YgvQ==
Date: Tue, 18 Aug 2026 23:48:22 -0700
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
Subject: Re: [PATCH 07/10] usb: chipidea: msm: do not force the TX FIFO idle
 on HSIC instances
Message-ID: <aoVRtt186dVs1sG1@hu-petche-lv.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>

On 26-08-10 18:42:11, Dmitry Baryshkov wrote:
> The controller reset handler unconditionally clears
> GENCONFIG[TXFIFO_IDLE_FORCE_DIS] as a workaround for an RX buffer
> collision issue. The vendor HSIC host driver never applies this

Why you said "vendor", it is just CI MSM glue driver.

> workaround on the HSIC instances and leaves the bit at its power-on
> default (set), so clearing it makes the HSIC instance diverge from the
> known-working configuration.
> 
> Skip the workaround for HSIC instances, like the neighbouring
> GENCONFIG_2 write already does.
> 
> Fixes: 47654a162081 ("usb: chipidea: msm: Restore wrapper settings after reset")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_msm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
> index 9a9410a814e5..69be194f8e27 100644
> --- a/drivers/usb/chipidea/ci_hdrc_msm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_msm.c
> @@ -108,8 +108,9 @@ static int ci_hdrc_msm_notify_event(struct ci_hdrc *ci, unsigned event)
>  		hw_write_id_reg(ci, HS_PHY_AHB_MODE, 0xffffffff, 0x8);
>  
>  		/* workaround for rx buffer collision issue */
> -		hw_write_id_reg(ci, HS_PHY_GENCONFIG,
> -				HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
> +		if (!msm_ci->hsic)
> +			hw_write_id_reg(ci, HS_PHY_GENCONFIG,
> +					HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);

So, it should be a standalone bug fix?

-- 

Thanks,
Peter Chen
