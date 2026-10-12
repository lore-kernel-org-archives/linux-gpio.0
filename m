Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54C44AB88;
	Mon, 12 Oct 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794128; cv=none; b=qXPNCHtRq+kFp8Y+9BIQsrjlk00K58hua7DzHSxyclgOxycwEDm5WCjrjrS/7FtJTGm/9Fq6MDR8mucI1vdqbvXgdI//7Mq51C0QoboxQ8Ho9utZtvQc1MKBIvCNJYP2brGWW8H+mpIFeTTvGAqwkXxEKpcHi+sqSLn6cCojfjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794128; c=relaxed/simple;
	bh=ZY973Ic+lb7IfmmYgmhImfgw151pGl2uTh05CSs+GmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaEMym5rJ+IMJu9Dk4ga9hb1FLLdIitnnSzVGd+va1+gcDqM3XekDThtjZpglLrM38C64d6JqV+7PGvHHLtEtUyuxG2Cnf9lXTL8vHKXiES4dDJgIzgoyodaHqJjNWhh2caaNYWfPpejNRA2bwsnIyKqbK63Jhfg8eTNyyc7VhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEXN6J0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEXN6J0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8721F0089B;
	Mon, 12 Oct 2026 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794127;
	bh=DaE/ux2Y0gwxFVPnyRYtU9HcRApd/zjO6wXFG/Z4XA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AEXN6J0rMO+atMJUjcW+1/xyq8sQAeMCPdWE2TD+x6X9azVZp60nWbQMDxPT4S4pY
	 tsPjP3s5ICPS+9xtTEpYQF2ArnIflnIgX3PBjJXyIU9xD7+9CJOGzZUIkUr28tRllU
	 OpgWdmFr4XHryBP5ceuO7AbclnGr+nzoYeXex5FL+trwrEEVMLUo6aZpHPsyyYkHvD
	 Knjx6J2aPnt/cy1uDb8Rd8k+B8vDydIW9WeG+ub4hctoxkX9iP/piD32pi7NFejRRh
	 yBPfuJNjSFy8SbQn2eo1BTl5+mvUyS/lK7jzIpncgKIBZyu9lIcMHwJNHaESqLJjSd
	 jv93D1uMjA85Q==
Date: Mon, 12 Oct 2026 14:05:14 +0530
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
Subject: Re: [PATCH 03/10] phy: qcom-usb-hsic: do not run the sleep
 calibration clock
Message-ID: <asyZZ-3pl4dpCQog@debian>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb-hsic-v1-3-e5f93ea76ffa@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 06:42:07PM +0300, Dmitry Baryshkov wrote:
> With the cal_sleep (32 kHz IO calibration sleep) clock running, the
> HSIC PHY engages its sleep calibration: the strobe/data pad
> calibration converges to different values than with the active
> calibration alone, HSIC_CFG reports the sleep calibration state, and
> the port no longer detects a device connect - an onboard HSIC hub
> signalling its attach after reset is never seen (observed on the
> APQ8074 Dragonboard against its USB4604 hub, by comparing the ULPI
> register state against the vendor kernel, which never enables this
> clock: with cal_sleep enabled ULPI HSIC_CFG reads 0xab and the pad
> registers 0x0f/0x0d, without it 0xa9 and 0x10/0x10, matching the
> working vendor configuration).
> 
> Stop requesting and enabling the cal_sleep clock.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
