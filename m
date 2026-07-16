Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65D38887E;
	Thu, 16 Jul 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188921; cv=none; b=dl3RFqRiHridKDZOPiVBsMZ99/gXVIQD75uhOC/tQAY18CoqrczSVz1P8TyD+QFpaY6BofHx4qu26no/7XGHZY9afurbL+V/eVHp7aiOvvHqTY6Npz4K91QFFe0x2Lg3F5nbuNRjqRlgGF9Oj6QAl8Gy0nzn77dARtDqcaCL69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188921; c=relaxed/simple;
	bh=bDejbo93yQgr6W7GjRFEDtY5xdwkzyGp3xbScoG9wos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+lc0SE161/Z/JSwCiTbWNrEZ5czBDYKAbwEJrud3qEp+TbFTcDsYM9qSdsQOkweJzhSasoBFsRm6NHW0HkJ/6tIf9T0YHMICQuH0PhE0rnaNnsFePrcL9mO7jK0z+Y87UoTHEU3AlcneDJs1/IjuQQjNVZrYvQF9gTlZzxEFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4tYNcSK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4tYNcSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017AA1F000E9;
	Thu, 16 Jul 2026 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784188919;
	bh=l1enmY2p1KVZ+qo3xfFhOdv2MslkZrD2Vgso3vmEDBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4tYNcSK62Hnd6n/xxR7hhY3Yn0zHW4o5/k1NNwZ2kek12TRSmJ+UL1MQhxgAuIaA
	 wpBC+jLk4j5+iVKqePaRf6aONbEV6aX6Cb57CI/PI44cV6U330b+wOSgf/yIC59TOz
	 NmRkzuJ4l/yO/cNR4iKRBqANtsR4b9fYQ4CCvxx32Fy8wI0AwYvOa/syrqaD/+hk+1
	 7angPXkNxvSYuuHUVoVwY8k9T/fwHoSDfmqpvnet26WEWaN7mH6VeiHNwVYO0qSdbL
	 5JuM6k4FWzF8qeozTSPH4C4yGw+AKE9NIIYlVP0pL+nVsM14AGl3nhyAzyL+IDmRnq
	 kMczH9naWg+dQ==
Date: Thu, 16 Jul 2026 10:01:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
Message-ID: <20260716-powerful-aloof-wombat-5088a1@quoll>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
 <20260715133243.3170821-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715133243.3170821-2-prasad.kumpatla@oss.qualcomm.com>

On Wed, Jul 15, 2026 at 07:02:40PM +0530, Prasad Kumpatla wrote:
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
> Also update Q6AFE_MAX_CLK_ID to account for the newly added clock ID.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..06ca2c287 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,8 +236,9 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104
>  
> -#define Q6AFE_MAX_CLK_ID			104
> +#define Q6AFE_MAX_CLK_ID			105

Nope, ABI break. You cannot change that and as stated many times already
- if you need it, then it is not a binding.


Best regards,
Krzysztof

