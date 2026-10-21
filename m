Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564994;
	b=d+qSDR6+zUIkP/yRtC+ePBp8clsy6uphutkCdM9gmTrKXXxWXg5q/bdstjJYj4l44pXA
	 eyIxYWmhgK0dqHNdLkr/sNpIGOZ0AfqM+Zfd3lK1Hopwv3U+am3W12HpH1X1P/PA82J0n
	 KH8rOZzaDK544vP4I67JX3nd4ro/ccGQu6wbPkOBYoc1ZBzgqDKvX4Xr6HJXlQdX9RGDp
	 bnlS6yTK/2/ybi3LbNm/BNUv+19R7396gfl6G6k6yyDmVSVbgxIkIFAx/Uyqfus//8lrO
	 sTaOHM62fL9v5DVyk7buVPFA4uypxi+mjjEk0IAALGwYNCaPWTeu34ARfFhXC90FsoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
	b=1PDI7+i42AyvLdi1H4w9kQ7VMnsUHkdfzKTxu4ovk/3gla3x2YSWGZRb9VgznGsKoQq9
	 X+690PQ3usvt76DfCTg/qASwBtbKLGoITduNDQN9P9bSEQ979ug/6bDVmKOHqaFCeLxr4
	 1gAGcnKfw1R0os0nRhUdT+3G5TaoVuKoQDXCR04J+zMq1SdAs+iz3sUiWD4/IvmYUkJZN
	 kkiHlQKQLBZvppiGPeAHmXRoPQoDgBEUVfikkHgS6PpNTRwM65BBHV58vHn2TFdse6l3b
	 9Iw/SsciS303DISFa20Xhk01E0HBVgclbgr0m25Hbal4WpJZGi0ZsSsBHBFn8OtvwsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/GZzHF2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643D606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 06:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1643D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/GZzHF2
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6767d92cde6so329032d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564988; cv=none;
        d=google.com; s=arc-20260327;
        b=iF6IDOeP0PSqXYLefvkR2NXyqxekN1j6PlVcBXCLOFIOcBC3K8tT9YtyK17x1OhRJq
         0DC26QXy4w0YzM6w41HeeKXOaIOC89ewjA4bIDgzMEaT+8bROgHJjevWZWNIRLBrmvoJ
         YsdtZgrSk649A0/55d4enN2oqxg9EFHuHy2b7CNXMLzaiiUnDqQngWkS0PvD3ACXzv0z
         mM/0dAAhIr8RQbm+7RScLpHAA9ORrZB9TlLvl7nxlamePFJfSmuRpJD8oDyLseSNHH3k
         t/Lck/V5AdLjcK+GadBfTVTTTKOCO+3gSmLOLkliRYtOE8lix8isF9T9W8RV5Lc3/hzM
         RYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        fh=q3jdDuZ2bufaOGS1vFm7DJMzrVz9ukkIFBkPV1UzSww=;
        b=aiIsL9BlwthpMdoUQil/NJ0bmkEMi1ktoZHPwWVq8q/LCK1uNMuuZ+5vqXaOefG/Ui
         ht4CzTWHtObVJyJVSNedm32JiFP3GIOJyNa91mnk4GhZtIZVGs2erEgfPvVRN4tfu0ZS
         O878EZzatD/uR+tEcWjr9ggUBjG59QH3aOe2MlySczBMH4w80nWtmsyo6X/uXi7HghaC
         z+XKkWqsMiC9yOYjLVlR15jOWNQQHTq3UBO3xE0x7r+APt22rdcGhsBjYdpmdiS2F/cS
         so0vIT+tS6N1G0EgTB9Ue3YjO2IOtH8aMpBW0ZvazVxW4ck4QCC8E2SRJ/Kdxp5/FGQF
         cQJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564988; x=1793169788; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=W/GZzHF2NY06v+oXZlgyivPlfoDTpJKe9CZuhEPaTuP3Qidpu3yorDYA41xB4bcPSC
         /M1QCIYeBX3/6FCyGJwl0TF8pFqTe88oUv3XwwvX1E5VlPp1911HfPcH3d5saDWQgsVU
         Nsll9UVTXZZuBMTm2Nwc2f03wOSjF5w+FPenbmn78a8sK+qlNzx+w1Y60DCOuAWUn1OR
         UDv5dhCVm0SZxFlLUR/YUHiWZCrrR8+FOmbCrNDyDDz8KnODQNNH/R7qPMfSPlYd8n0k
         Jxr2ymTOX88uWC8p/jyO/uN1fBbx888FwDve3IgT2GsonRNMcqXLmqB0eWi26eXiw5YH
         ZjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564988; x=1793169788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=Jnp54NlT0vv2YmYQN+pSToU75EDPosMTSBhn3se7+MM4cpYcVKGvssB0ZidF1dvSRy
         MqG5IOVijJOyd5AqL7687yYvdzaNpgEDOXK7bf+lsmDxGlkK4+l2K+5/jQKOnTIUJtlG
         d4rc1BYMdlvjgiYdx1rqJuX+mSjp/tAxkRQXL6pTs7gJVbZ98HloObaYaensuUD76G9o
         SrRbL4uzWJA0EZ5u9XOpmKoZswWOmwznrQ+cokOLX3febJl4GfZWj8snucS11VRkJTdd
         t++LbklEGmF9aeRMgaFrvfGCDYGMe31JGuxbqeH5tYTHxwmO4CSzpwgTxBigzhExYphj
         QLcg==
X-Forwarded-Encrypted: i=1; AKwUvByhdqZ/7NFebPAmthQIC5wv5l+3jZo+KbPZW+vZdq6oRgFgfetl5U9JumMIi020ScyZ3NOlKrrEoXqJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIilBLGaPV3WtM/+Ob+BlKj+oTfJ9H3I6o/WAJhMGQW1PdYEgkx
	wlAuBeImvowIakNE9Y12ZDGa0OlnaeBa8zleFOfJSrbhVWoLa0TaX6bYDc/J/etjNg6RQ757ail
	aoHpmiQvqENGvSpKS9uFQHwtn8ETp8vs=
X-Gm-Gg: AYBFou0DbkeMrIOTL13HDzPnueFAtTMhVtg5MwoW9Mna3ThAynl4AwnJkgHhvhyzvKi
	E8zkRiQMfxveFVrNmmL3pxpu2hbrYKBf0MCYrj5z7JjOCUtqlPgvbWGDPJJQ7QmF3/0t5TRNiCC
	RJH0g5DLpfsjNHcQqxIj7M3dsEbtcCnCWQoyH8zVAiZfPyck4Mxu55LTeLX5faMkF8jHjNNevUl
	J/mm5HxQQKRkkhpLVK5Cycn7nMvfJlW4UKu3SZDWi2Jfrvh4vOztlGrsuR3ZQsYzH5OHXOXgxxH
	VAtpDQEn5YHHuNdv/KkKRBuM9xFC9UneZG8iSg4lse9k+AYKwEforZ93Z3DxKy4hrcv57LisOOw
	zwUlVBnMk4h+F4WIbeUshSqkTDMZjgnthfnU=
X-Received: by 2002:a05:690e:b48:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67a0e02fb85mr644184d50.7.1792564987934; Tue, 20 Oct 2026
 23:43:07 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
In-Reply-To: <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:42:54 +0200
X-Gm-Features: AclHuK9RBvE_tu1JJML2kndZnV_iY7Vg0PVQd2A9ECqRfA0-uzrQqgVwLULojEo
Message-ID: <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And here you write clear note about dependency, once you fixed
> bisectability.

Just to confirm, would the same text I put in the cover email be ok:

"Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. Patch 0009
also depends on
patch 0003 because of mt6392-regulator.h."

or did I misunderstand which dependency you are referring to?

Thank you
