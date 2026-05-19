Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5162D47E9;
	Tue, 19 May 2026 03:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161767; cv=none; b=gPnfv62XO0fErDa0crhb7nXHD6eeM3VGsRq9GpVs2nACzBtuDYq65nOuKe9HWQUtRwpoHMX6+2zScTGp46ZSs4b8KQV82zGUGmacE65echGIvFOA2LgPPVIQdGM/67W35B/Izld3bI9mMVjgztXQUX4Cnpu4DyLaB7V6c9ueSJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161767; c=relaxed/simple;
	bh=9wUT23wJRSWBAy7V49IVwor34TwuZpIjPh5K+j8ijq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5rKwm2ZWXDdxQTCcjs+m+i5kKHTI9vK0pcdRyLFz1UfdNNGlCcuw79t4BqkUMLsCf+gv6HxakDgY5t1lFn39d5dN5tU0kaFMRuhZodBhbWzfrOymYbUp5LN9aJu6SFpIbKpG/+wNmVGLTVDPshYOYsyKm6owV2jytzOKOsZ2A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiKVIS8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiKVIS8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2AAC2BCB3;
	Tue, 19 May 2026 03:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779161767;
	bh=9wUT23wJRSWBAy7V49IVwor34TwuZpIjPh5K+j8ijq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PiKVIS8wLRB18sksYpfRX3It4h4TEMc+BqFKb+DkibU0mMJmeaaJaDfz4hu5Z3QPp
	 8wE04z2yn/z5QMEYtne9uTXqQ/qNSI6J0nmNSK5msKru7sFZ2wFTCtdaVc7QWN8dzf
	 MDFni9FiKgB8JHUK2mOLuy89rQLFH/b6r0yzfLmdk5nU9jU472SSQvuDaqRY5x7crG
	 fR386/ue/K9GSgRXMSUOnqonEFRZjgwom+ARcT0s4bVYmwe+idxly7RmI9pl3Dz+6h
	 g4jt9jf3VfIZpC7qMvRzYS2pLtGDK/A9lKKq1Dd3QR8MzLAlmqBg4T1ps1rvx8YJrq
	 83lzvCwAaUF7g==
Date: Mon, 18 May 2026 22:36:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lane
 functions
Message-ID: <agvaboztafz63P2y@baldur>
References: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>

On Fri, May 15, 2026 at 02:21:50PM +0300, Abel Vesa wrote:
> QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs.
> Splitting into function per lane works, but it forces the devicetree to
> describe a state per pin while these are usually configured in pairs.
> 
> Follow the pair-wise scheme used on Qualcomm Hawi platform and expose
> the two selectable pairs as qup1_se4_01 and qup1_se4_23 in both the
> binding and the driver.
> 

Given how fresh this binding is, I think it's okay to make the change.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> This has been proposed here:
> https://lore.kernel.org/all/agIZOAa6nYSb5PWX@baldur/
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Explicitly mentioned "per-lane qup1_se4_l[0-3] names" in the
>   bindings commit message, as Krzysztof suggested.
> - Picked up Krzysztof's A-b tag for the bindings patch.
> - Link to v1: https://patch.msgid.link/20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com
> 
> ---
> Abel Vesa (2):
>       dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4 lane functions
>       pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups
> 
>  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  4 +--
>  drivers/pinctrl/qcom/pinctrl-eliza.c               | 32 +++++++---------------
>  2 files changed, 12 insertions(+), 24 deletions(-)
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
