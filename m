Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27671271468;
	Thu, 23 Apr 2026 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932563; cv=none; b=BhYlvksZDEOujLQa/qsmatd4UkDYC07pn9C4Wxzho3egETHhY4AVNCaPhQlifN3Pv7pb1UHVd6rUiKE0orJ4Q04vaq8hSlw7MsExZClQxWvZoYl7H42YOXw297VPf39ubb0b8zuUtIUIfZSY181Cmb/W5ns/142v5Jyz9OGlA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932563; c=relaxed/simple;
	bh=vjO0W4xhzk6tblqgpAPofuql89V8b5L7c+ViVsQsqrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7OLzTN66NjU38GkuF26VPh4/HvMosIvYK7cn/hwjs1mYSs+1rQ+/0p0dJ32vDjCc2d+Qv/x7O35Z3UjK2MHirCak8qi4Y/PbtBibE+Mo2MxpLIEr7fFbGrlvkVicWvgxyg9C/5DnK0DbzZsD8G93I8nL9CI4AzUvz9LG+sgEcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKHC9Ump; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKHC9Ump"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F0AC2BCAF;
	Thu, 23 Apr 2026 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776932562;
	bh=vjO0W4xhzk6tblqgpAPofuql89V8b5L7c+ViVsQsqrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKHC9Ump3tDoPNADMfoYh8aCowRN5rOhaewHoXZ+E5K7o5c/ScipH737QgD0e2c7Z
	 Rmor/fP7RKaYTz6W9pII04GM+qvL8P5BmYk+HQMK+P6mzaENPtEWPrrUkO79zDWW5W
	 uoycram2VzcrAHyFzOncW67ptmVOdWQ3/tBflyKyvskC8egC6iCwhTgo4EwwCzGqrN
	 1k9ZAAGCnMz/Umk7Z82vtJcZzltKO2KuRnFPXsUuniTH+09rhuIrup76jY1gnM+Qnj
	 +lyWaKWrcFlF/Bkq2kYS9XEYdLSED6X+1RHjgJlrmbRuvIFhWiTVoPJ+nudFZOqfXK
	 Wr/wQ6/jbGiTA==
Date: Thu, 23 Apr 2026 10:22:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: qcom,eliza-tlmm: Split
 QUP1_SE4 lanes
Message-ID: <20260423-congenial-quixotic-skua-cc77ae@quoll>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-2-68b24893ae63@pm.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-2-68b24893ae63@pm.me>

On Thu, Apr 23, 2026 at 04:43:27AM +0000, Alexander Koskovich wrote:
> QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
> function name cannot be the same or the alternate function cannot
> be selected.
> 
> Split them up into individual lane functions so boards can specify.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

