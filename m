Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0783515E4;
	Fri, 24 Jul 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784872541; cv=none; b=PhUdeZagjyr6N234aCqF78Kt85VUDK+Sc4ypfyRrvDL6UqOgKX6w8eDgYQ6CjWOsjnakKtaYgnnoXMq081oAImAOuinQCqSyjcx3fURrg+F5Z94ffAfl0cwDzSx/24gil8JksNqG06FzFZvdMsvtcY6CiEigQ+JeCySntMHrtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784872541; c=relaxed/simple;
	bh=G0j3ES8ws1BFmBq/T2uJ3xK6dgcSU3TUoioBu0m6cAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reTr/pg0gKPFIl0NiXXYujT7gOMIJllNHIUIAYtSF5EH437HNbB+kD2QyC5w872cTFpa6FXG7nyBks4LIIfqJf0mVCzma8DbYa//P3pHaovpeqX9sYORAreVT4/f39PujHqLe4mN1lIjwoC8F8hpELaFrfQEvcD4o08dmAdLbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByLhB8Jv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByLhB8Jv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E171F000E9;
	Fri, 24 Jul 2026 05:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784872540;
	bh=n1jHgU/Nqu8GS5YAZQ5GRLyNHuTnU4+eQ8xCXuvKzm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ByLhB8JvlCr/1cFd+XVmo9TDBbuXr8GKQU6cU49wwHk2LcoI7KDXMhbzzdamqcdpx
	 CE51ODr+FaN9s1SJ4wn1JMPDaBXZRKn44GGnYHveWS3M4e97HFwYez6A9fD3aSKMLp
	 +uuYudy8SEFG4sGFMVStkQnBw4oBai2p8mCB3WufgHRzwtDjDRNAaRN5ayB7qebOvj
	 CQzBx0VSKSk+hjU29DOn1X3rIXFGurw/osWsDoy37xvexVY/aW59Y9zqdeelPs8nwA
	 uHlCh2d447AyvbdxPKryYWhRktQJf43I8ZT4kZQPn4p25zwdQPV+KeH5WPoeRb7168
	 ZY46lLVXHeAWg==
Date: Fri, 24 Jul 2026 07:55:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
Message-ID: <20260724-rousing-resilient-degu-c2ad69@quoll>
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
 <20260722120217.3609506-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722120217.3609506-2-prasad.kumpatla@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 05:32:14PM +0530, Prasad Kumpatla wrote:
> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
> resource (LPR) vote through the PRM interface.
> 
> The LPASS PRM supports a resource voting mechanism to control low-power
> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
> clients to request the LPR vote using the existing qcom,q6prm clock
> provider interface.
> 
> This functionality is required on newer platforms (e.g. Hawi) where LPASS
> clients need to explicitly manage LPR resource voting via PRM.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

