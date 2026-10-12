Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CC846AA79;
	Mon, 12 Oct 2026 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794714; cv=none; b=AJxeeWGS3F0fhaYvtn5HLPLuLtaXfH/o7BPukk3HoWy9cs58rvdymndLmlXvfzW3GF9rzsILU/V0VsBQTBOl8bSiK1BzePNRVfaaIOyYAahCoD7t+zxj/tIqBGuDyJeY6ev8qI6BZOz7vMTJ99lRDnAIBBpL9Y8UJamHVlVvSQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794714; c=relaxed/simple;
	bh=hig3XniRR/HDfZHucwWx80FgVL/trsWH9Wxj+J7sKOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpAAt2TR0mc2ykv9ii9vLcYU3c0w4ulihGfH2FZIK5GXMbijaygdmvRY6MAds9w2zLzfVjEhnMzglqOuAh0+mxnA2lcGhmhKy2PR0XRoPivTPw0R97LvvqUf523pNaM7FKMwskdCFvdl0oXsIBOrBDFCosQ5VpbA3X/ZRtqVjeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5RvL1Sr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5RvL1Sr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17EF1F0089B;
	Mon, 12 Oct 2026 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794712;
	bh=mLq/ymuCxjQn6Fzuy7KDen+WF8JmVHF/Ne4WHKOpXH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5RvL1SrOadQ661Atpug9vUhm8R68LIzDdNNQP6l/xanOO4p9RnJNrWjpdsH2fyh8
	 AHv7N7XQHhr5E2H+q/DiKsUTsFNUMFfl3l5Oexgp7GGtVfXHZrlTkrRvINDnpIH1LF
	 xBKJf4vXeUSYxcIO37YNI90Qo1tovx9xysOWB54fc23x8EecvHidGoiVTxfT1RWF++
	 hILSrrQCZHzLz2O2iM09gbnvtyv45YrqtjEIK6uy4HwBEvX+8eIG4VkXzFqQ5lLF25
	 Rh5ad5B+B2CE08yRfGAEdw/d7azKCkfmyOXzGZci21h+b1Tiuj/3susKvIA7vd5P3z
	 9opJsy4OFHoSw==
Date: Mon, 12 Oct 2026 14:14:59 +0530
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
Subject: Re: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
Message-ID: <asydU5qSPDhJa65R@debian>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 06:42:10PM +0300, Dmitry Baryshkov wrote:
> The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
> and nothing pinning it active. Right after a successful probe the
> driver core's pm_request_idle() runtime-suspends the glue (the ci core
> child has runtime PM disabled, so it does not hold its parent),

Why does the child's runtime PM disabled first of all?

> and
> when the glue sits in a power domain - the HSIC instances live in the
> USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
> underneath the running controller. The EHCI register file reads back
> zeroes, an onboard hub's connect is never seen, and subsequent bus
> accesses into the unpowered block wedge the interconnect, eventually
> taking the whole SoC down.
> 
> Pin the glue runtime-active so the domain stays powered for the
> lifetime of the controller. Proper low-power handling can later be
> built on the child's runtime PM together with the HSIC wakeup
> interrupt.
> 

The commit message confuses between PM runtime 'active' and 'usage count'.
Marking a device as runtime PM 'active' wouldn't prevent it from being
suspended, but only increasing it's 'usage count' will. Which is what this patch
is doing btw, but just that the terminology is not correct.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
