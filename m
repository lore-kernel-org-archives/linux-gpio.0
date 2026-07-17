Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4C42C21C4;
	Fri, 17 Jul 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276669; cv=none; b=Kh43ig5nIN+idxb7aYhqdclCj5sfuV/WleLyuAKlmn23rrGgWuW1LEaUG05ofwvyPYa7n+DV1MRQSG9/yaLcaDkMalYVHKVdlz0Ze64bgu2At2+X91Fadl/cvD4vfYotcTA6TUx0AjdT6hw7j7X21uE9jCdzf+X3YuQxHJLNABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276669; c=relaxed/simple;
	bh=/jEoraGyDvMeUaFbsnr91uo4if4I9MbZokQVio2oq90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuHyqwXScBPTeGMLWQtIDV4Hr+I/KV5ZglAPWhkXTdJ1QF1i3MWYL70KX02ZOeT96JokXVGtxofFAItsYTfwU2EkPRROpyqD7pbgl3v+e4Wac+NLvSstOw9jeBhmAU0DRq7+dKv9V4cC9nZwxk6B9RBi0O3fLr879MmhcE9boaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3tGWyhX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3tGWyhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3121F000E9;
	Fri, 17 Jul 2026 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276668;
	bh=nX6AcdnaMGEy8ft7F3vJvHMGIp7fZ/2TL3BYEYIv4xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L3tGWyhXCQ7eSKhZWh3DWbLAMbjb6vDQMrShh/8nysesSeZ0R+l3+R1I0My8E93rJ
	 xvhtk0AUnZP/+0AguhvpeQRpQd4Vtr13lPTXCFBn6qZ/hhOGAq0TF6+6h7EkK0CtCo
	 N6aufSld7sMwK9Ca2J6WnyedOXLMYOpVSI3iLVl3xJgVHyonEZ8oXbrouoHZCW02Ak
	 2Hqcm06igy4g30QXxqHmrBSBvPc+UFdcknA6NVqNPVnYrIDXCF/4c2jxNB5dbHAd/u
	 vmpApHSeleuLD9XQkUnmm7GqTYF5ZkPbjNQN0Tz0MReKahE0pTVWmdJ5YfWXwXKOvG
	 5+UZEDbRUjwXw==
Date: Fri, 17 Jul 2026 10:24:24 +0200
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
Message-ID: <20260717-aspiring-topaz-ocelot-8068da@quoll>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
 <20260715133243.3170821-2-prasad.kumpatla@oss.qualcomm.com>
 <20260716-powerful-aloof-wombat-5088a1@quoll>
 <ea6d2f6e-977f-413a-86b9-faf1bc2a8e23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ea6d2f6e-977f-413a-86b9-faf1bc2a8e23@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 08:16:33PM +0530, Prasad Kumpatla wrote:
> > >   #define LPASS_HW_DCODEC_VOTE		103
> > > +#define LPASS_HW_LPR_VOTE		104
> > > -#define Q6AFE_MAX_CLK_ID			104
> > > +#define Q6AFE_MAX_CLK_ID			105
> > Nope, ABI break. You cannot change that and as stated many times already
> > - if you need it, then it is not a binding.
> 
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> LPASS_HW_LPR_VOTE is intended to be consumed via the DT clock
> specifier, similar to LPASS_HW_MACRO_VOTE and LPASS_HW_DCODEC_VOTE.
> My intention was therefore to add a new DT-visible clock ID.
> 
> Regarding the ABI concern, would assigning LPASS_HW_LPR_VOTE from
> the currently unused range (for example 100) and keeping
> Q6AFE_MAX_CLK_ID unchanged address the issue, or is the concern
> that LPASS_HW_LPR_VOTE should not be exposed as a DT binding at all?
> If not, could you please advise the appropriate place/example for
> defining this CLK ID?

Just drop the Q6AFE_MAX_CLK_ID from the bindings. I do not see it even
being used in the drivers, so no need to move it (unless you are aware
of some out-of-tree user).

Best regards,
Krzysztof

