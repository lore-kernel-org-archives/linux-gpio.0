Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188978;
	b=e3TNNlaAsC0r5SlY77qiPq09MbGUBeU4O/ynEVHl2RsN0+JRaQwNFhcsSIsQ08QNRqk+
	 nTlm5MrxUKm008cA5dM+DvnNdPxsf2gdy/M3ztoeiqe0ip+2lTiUPHvfTknFt21mYxFQs
	 qUtzCA7aGHsyHkjSVaTNF7bq1SF2F2h+mZIAr2ZAiV1tNKecKr2LIi7p026DwkzlzxJ2X
	 xYhvyq6eYkQ5ncm4SkBqTDYdh8frkf50udNcjtjcprcBRxyDHPrTHGzDD5CEe9EvyyGu2
	 FhiVZcw5cQ9sZXQpjX2bVlJxqb70u8queB2A+54kGFc/Fa0zXA/DbkLBqsKwfxTouUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188978;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=db2MO1a70PIE6Fv5WZXGz5F9j2CW0g9J+SpZG3GxKeo=;
	b=nr3IJVgnN0WPEcXgGsSF8uOBldaFGV554gr7/CLUx5jCy2Fa4cveyVACL2f0gRmbERqs
	 DaF6NVTT2PhNB2iH8irqhYGZ4PXKcWAD5/8JF/GX9rdx/XYObNPBjISpK0vdXklukctaD
	 9R/CK2SQrGg++9zMIi09TO9oTnC6p/KMW5c3hEFw7viHokACdPJqLN4biDK1SBZyookJI
	 k6v/hN5JyCH++1L2W42L4o9qMIwFcja3CZKdGwU4xMGlvONy10J78HBJClKY4ckBMctpK
	 HsKfbIUvQFhB1mrxyTAaMSDmp4qaYH95ZjRfmSNsmJw2cZZm2QgioLQzpxiyBVe4Vrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iY7qbtRX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288F606A320;
	Fri, 20 Nov 2026 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iY7qbtRX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACC41F000C4;
	Fri, 20 Nov 2026 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188977;
	bh=db2MO1a70PIE6Fv5WZXGz5F9j2CW0g9J+SpZG3GxKeo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iY7qbtRXUOcQFowK/jqsglS7S97JW+1X5C5Fwcm81+MKpDNUZduhnGEeIU1oh+Aer
	 fpK6iPk9Am9peRUHDCbwruJ7KiPDfWWNTG71VAT1QVxMd+AZryE/DY5K3SCA605XhW
	 3rkWv1M29RDeZG+T5ZnaRxM6XlWOBhcQvr5SPNVDxi18QC2FLK+vFXfj66NoXL3+XX
	 wMLhb7jCy9Eka6FwWa7iuo1sT4fDoBvjcbWPSmptA5OHIyqMRq8hCrxhCAAPOgeEgs
	 bvT1Lh3+g+CM9VCzhouhuC9DbnJTA8MUuf2/ijBXWXgwOshPlB6i7J6FDtgmmzPFpO
	 pZQyzi78LzyRg==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 19/23] ASoC: qcom: sc8280xp: allow using the
 sc8280xp card with lpass-cpu
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
Date: Fri, 20 Nov 2026 15:36:11 +0000
Message-Id: <179518897124.6016.130748488943015768.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=760; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yjz8fAQ3kPUwHl3NaYwbsrK24UeGk5MNb2vPPtnlmvw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZMl5flv7+cs/s8ksfd2gXesrP8v/we9HlaS4PG/q27
 zuXtixPtaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATSXZjZHj093gn057njsve
 uimc3TGrXnSbqJOnbKXX6oAYxRkszyUZ/vA9fbC880DHwxnXebgFOKsvXZ2bHf9gs4FflhO7meB
 EH04A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add the missing DAI ids and set the ops to allow using
> the sc8280xp card with lpass-cpu and keep the sm8650 sound
> card bindings working with either Audioreach or lpass-cpu
> interfaces.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

> @@ -533,12 +540,11 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>  	int i;
>  
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> -			link->init = sc8280xp_snd_init;
> -			link->exit = sc8280xp_snd_exit;
> +		link->init = sc8280xp_snd_init;
> +		link->exit = sc8280xp_snd_exit;
> +		link->ops = &sc8280xp_be_ops;

This now applies to everything for all cards, that feels like it needs a
lot of care?

-- 
Mark Brown <broonie@kernel.org>
