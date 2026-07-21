Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E442A785;
	Tue, 21 Jul 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617135; cv=none; b=ZCsAaf+y0zdesqfCXt8mrc4yoZ5JxgnbtVkB9Qoo06XPQ8Cl1zVq0kRKHS0kq90wNbU5Eq5s8XGr6EifUEgND9bpEo4INSx4GlvB7HBCOdb+zLrcXmndNpqfZ+AlxM3HYpmjXnF6tQ4l3AuQ5LigUDJhoJgYT491I6yKhlqaxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617135; c=relaxed/simple;
	bh=NxGcrdua1B4X5mFuu5yUz1UuHhvXUStIBtQsSc85lL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGLe1mGSZ1cJGbxSlhfUa7/AB0NHwa5rsIuhbMILAOzHrT64uqfEHZ0rJ0/hcXmRnxiuHqDV+lR9/Sjd4Jl6q9hQJNgMMsmKfyslwIoA0xZe+b93Mvag92pucsqxQ/sLjsh0VE3fqma4VjBN0r/A11qvFWletgcB2b2hRcSFUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGIUV1xz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGIUV1xz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6681F000E9;
	Tue, 21 Jul 2026 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617134;
	bh=xeRIRGrfNWUX8GWj59TVY74odo1jPftUSWcC7afb/6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eGIUV1xz8LN+bzI8P/MvLoaec4JeSMBj6sTUMSvkcReJSC0ZSQytWebPAPQbR1cz1
	 GsOVOzCKc4L2uEIixnH7WeE9p4G21SaWVQASE6e9EzNd9KrNmVArYVmoAzx11o4tJu
	 Yp4ZBSmfBQ9/SfQhYpwkn1+cXPpwdpHkuVh3mjByD6jJfo+EdoXNBNrKVrQ99b93K8
	 azqRZAT7halR1GVxQxrDGJTNd9G/1NqBWojuek/U1PFO6NK6UTPIaYHPk7yYBmC525
	 pglwPgNEyS9524N/V7YExKCyddBaY42brORnDYXqN7AE5PPH+MRFKxv0o6z5f9Qy2C
	 pxbpGhT2Guzaw==
Date: Tue, 21 Jul 2026 08:58:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
Message-ID: <20260721-proficient-witty-curassow-e203a6@quoll>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 06:35:08PM +0530, Prasad Kumpatla wrote:
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..ce5e8589d 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,8 +236,8 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104
>  
> -#define Q6AFE_MAX_CLK_ID			104

That's a separate patch.

Best regards,
Krzysztof

