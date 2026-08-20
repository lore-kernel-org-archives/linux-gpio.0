Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220847D451
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243011; cv=pass; b=AD+/icD4T+66Poos0kdk25dHtgXRMMKFhzeCJGubi1Clm4WhuEPOF51CZk3oNS9ajt19iiozrTGETdCudHPj1HcHKg41yhBxHjJ/gkYnr9Kg/2bhb21mgttVazAp22E2D55Gc7HZgFmqqlabn44HME6+xB26m4y8Rf6H9CfSVdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243011; c=relaxed/simple;
	bh=nM7522pMTSm6ohXpjcirSMLxO2bUSl44i0fllcYRFAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoHi53YAHvmia9iICxLzsEXg+vs2XjQZr8CnQmQqS9iLk+0pk+MNosakF7PHobHBM9NoHfzvbMrxW5Ry4wMRWqfU3+k374uOv3peaYk78ETgs/os1yY6cHKeBImhBLz7ViOyHkaSKY2PUYQbsN3wKEP5Q9f2j44BjSqLHdWZDM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOlEWY0M; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOlEWY0M"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2055573c8cso362374266b.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243008; cv=none;
        d=google.com; s=arc-20260327;
        b=Hj8YSghMGs8theEYFX/of29VHTce4Sxtic/Egvx+IwwbsmkoTFDCgQTxkxLYRQVcQ5
         B11+JtsxNOXebV0XGi7bHsMLHCP9/ERjv5/BIzd8JNBPkQdLCV/MEpJeA2VTw1y6msvI
         Wqc8tSlX5t00FHu2aQr/xeLUN9UPYGUY1BFLXG+bhj5ObIzpijXubYAxOwfg7NklYw3L
         NN2K/3H1R5LRzyWkeE46wt2qUYlb/EWq68U5bgeLsy4BmpxVv+DwddBpb04etg1nwagi
         ws/5+xiFqHMex4TtzTZ7KKucWLZ3udzb1uCc+ayLc8/vxcCB2qXfUrGcsDcihf7CiNVN
         LilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        fh=YX5cUO0msXvYiIWqZFZX9/Ajez3WmN12Wk/+qL6H4zw=;
        b=m7SuMRIkgFSWNKL/miNfQE1pZzJXVEtNfhjIdAEagLQKKPzrAOX+2wZLwDeYsww2W7
         WHEF6ccTlO68KglwOZBuYoT3kWv5nD3kBRLwg4mdg2lt2xx0Le5a36G7Rn+eIc8Bl284
         eunVBGgUV5U6BeFrEO2L9AV2c1+YaO+CG9zyYTrxn+7+WosWh90wiiX0SCWsNpKXhsiG
         Lf4h3HETTTORyg5bHCfzeoqJpFM6yBhaH48hWE3Xa8Veegh8UxZvzxuRH8daPQE6qDXV
         9o8BGVzYhmzJs4WycUyDfwKwwSNIdYT0gwNTgSDe/nqnlIGaTOWUHhOO7sXq1geyFCjn
         YYYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243008; x=1787847808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=bOlEWY0Mb292rIMAKTE6vd/2FxvUetWzvZEY63S9Avih8hLO9+PCK5rb0GHwFLtbKH
         kk6Yyekz7v8JyRhvAMKxxrElNC5posK7Q/kEiwL2lTIIDaq9/a08fizXIo7lDyJrgqP0
         b5gdhtWHvAoPgZjSNxI+CQ4NsOydysVImcu+u/xsGrEcKrPHk5smpVKqGROCgs7aVEkv
         yFqwB/fLbbyTtVeP8L4wcLkSq/Ot1NHJjgJ8Y/wFGbCLecv3jNkvmi+gt/rtzxb6/A5F
         2a6XcFm0RVzDVbzeeb5oq8dNKe2jOt7WD5xzQ7b54KuQM0ddOntBTLtv02t+AFfyfokM
         Igwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243008; x=1787847808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=Zpv2Yt3AVt8iQbCHaXGNGNhllwau53qxIboDt0sEhtVSWcgmG6YqIIsvDFpAe/YMOe
         kYSCaGKslLMeEzFMZrqCh+iBVkMDJi3c2WyYg05aJFxJT3mm6h/Vo9KwMSIlsOUkSQkP
         zRcmSmYaJkclWIBrowT2iau1Y7xEzEcmEZwmdxHXfkuTy9cR3ZIVYNVIVZRNs5IK6JF1
         Jrm/X2s4hePW1/yKZalNKv/XTXyodVLFHiEp4F4AGSjHTV9+KRwyzbEkY0CqhVeIjf0+
         2wc/OEgocVXnn5dMJI3mdNppM1iTcVcEQ4cV1Q+b55XwAgKR/q4U2UXUs6wAcYU/kJ/s
         RFrA==
X-Forwarded-Encrypted: i=1; AHgh+RrZ7XGHIx3og+09SGRMXGTYOE+iIvBZ4ZNnTHbhyAmeVWtQHF/puQgM6jXRtAaPy2ZVawBYl+uTmJns@vger.kernel.org
X-Gm-Message-State: AOJu0YwTt1fDCqIPs/vTSE6ACi9CfqzsgilDknAkcoZHR2rHYOAG7qr0
	YcKJ9lKXUPx6ITFMZBz4kKEsQ1W3XiMRqY3wzZILMtz9Ww1UQcCXb/PWaKPzIpk2ZU7Z+aDiXWv
	TdpH8hzuT6tiEhfiWNnXBB0zrcOAJ21A=
X-Gm-Gg: AR+sD13ecQQfIwyx4z6GbYz1L8guAPdwm5K7S+PuZ+4YMilT3Y9Xv4zV6zl6NVPrivZ
	W2yN3oPF5VajqHZjydRKqUBpw//Y9Xmx0946bd1Ylgo3M7FFwcMsSIw5p/5UzaLMExlhez1dRBG
	ByoftPc9kL2/Tm9tG4FY64T+bA9ku8u9+CrrHOn1c2zvKjtrP1wBhM0Vsr0ujkpS5xmRuOTcYWA
	GSA6HI1UuOrfEN/h1YpXgwP0d5jrIrTl2Fm65hY/q0tCn7sNbV8M6T+C2UTF0Ul53KNDO72KR1v
	nvQH6eTmCg8p4oVWHJrGjVanD9RKOysWaknIme3mJ1E=
X-Received: by 2002:a17:907:a647:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c23e86dd23fmr1141726266b.6.1787243007488; Thu, 20 Aug 2026
 09:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260820122242.120039-2-l.scorcia@gmail.com>
In-Reply-To: <20260820122242.120039-2-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 18:23:16 +0200
X-Gm-Features: AcwNN1WN15gIPFE-wS5GMikP40k9b6tUzSd1TSg8R6uNQUbH06o6RfXy9sJzOY8
Message-ID: <CAORyz2Lgo=teK89gxm6QBMfREY=_cAFN2TuLUFvwGcYpozkWww@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:

Please disregard this patch/series. Sashiko correctly pointed out that
it's not necessary and actually wrong to provide a fallback on
"mediatek,mt6323", which was needed on a previous iteration of the
series but not in the current one.
I will mark the series as archived on patchwork and provide a revised
v10 once completed testing on devices.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
