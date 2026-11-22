Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368164;
	b=pnWpiEbCAR6nPsJdKEIFThTF/qXqAVvWIJMX8pDm8S/Z3vrEVTDVirTfllJNAWT8xKA3
	 LyMgsXipHh9jTSZelVIwyLwwwuNhig3tzWdqnFaMLtY3NIUaZ3Z3Z8Dr02DW2Msv/8LCq
	 D4/mU2DO2/pZJBhaDw69p1BLPNu6sq0qZvarTdg5wF5RVpYUjDw6nlVS3yUFMLD74+eI5
	 aPTK1GDq7YUg/3g7OI6RtdWmxW1onbDjjpXxzTHwCK7O2UfJHQGEtz0fktftRs1jrHWIZ
	 X78LJJRmY3sUh4pHe6wEeGRNBFLbOVxVHrKI92hN2D50xd+UbUQIWGT2YNFI1OmAe4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
	b=tM9To6zfdxNTPTUzyOomg4EmKRoe8VZXKzXzc2GA/cqgrH94Q7e1poh9MOkXZx09Hk0l
	 4iE7JkMa3ad0Fu8bQu96IUDE5CrPJT3oJehUtenywS8Qxa1cP3Nq8ErOQTwHpMYla0vH4
	 yBrorwDln+584boq1BlawfvHUzybbSkmykWi41XQ77LtqRQnTEWm/03CNLqWARjC/Ggc7
	 RCrKY2LHyXBnkQGfH5vZjKGB21ByBkh1owOjyFQcXpxqig/Bepw91aZMewaYb+fSxefx6
	 UNsXzNLOnVUuba5/lUPuxFU9KM4huJcJrFf8NxLoKk++oirgPQzexJZOk7noktVwxoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdMN/uuh";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34C606A332
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 17:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE34C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdMN/uuh
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386ab9ab619so774952eec.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368163; x=1795972963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=rdMN/uuh37VKObF52K9+lcme53bqcVhzqmpmYe9zYf4xuf7IMBHBGOWYyCDpwozQem
         HWXEws9rArjqW8P+BJrs8nA5WqwClIUasxOguhVLwHBAfr+1EfGiWqdYOGJcP3CtmHI0
         gFM2LT3VrFa+7Y1gdLeG9WA6HQpTTkVWY35gj/quFUOILDjm/CiPqDGJ91U16Z19CGBl
         KUK3EdQL3TDOO5ADOUiFXPerabn7IEcmxNlrpheQJPGdqhsKbS5g6fctTEQ8Xc8PYA1C
         8gAFgyUBNZoud48/lrvtNYJu2wAHKjInCOYGYtovVezXg95EEZqg2FGRsu8+8BtEPE3j
         PHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368163; x=1795972963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=nlZu53LDqy2bvS8pokdyZQ3Qbkke0aK0woIuXvp60+kYmiUoD8TCCt0BZuH7VpYOzB
         hH7xg4wFoJUnnS/AdOm0fffIfcYMgBQHK13a2adtnmgisxw/bOPXHX5C9x5vbqBUi8K2
         hDmIQefx0pSi8bebLT4P+Q31rUrku20bOD1oUmL1+MHPEGIrhgI9Z+TBJWk+HGowppt2
         GgKq9cqvsrqrhUQelWPNmskRIAKj/P3a8lNxrYvSB6fMW9NURlvJe0BeuvlvksGbJNsV
         o/FaNYTg/zTb2CsWdCx17w9+/knMjliMXOJ+K1fbMDxZn89Pnjzbfg3BZpNAycsMJE7w
         feRQ==
X-Forwarded-Encrypted: i=1; AL+hErEAcarA7oz6md8Nd/wYkhohNhqo9ujNOir51dUTex7Nrz/WnsZBJx2CinbO+dL3JwJBtAYuilo07CAV@vger.kernel.org
X-Gm-Message-State: APuU4Z8RQgYAVH03RMJ8tRV6qXoWTX6IZD+rW6lENyMaItSWCbtPuoq8
	d7CjirG3W/2deuIC7qMi6V6f4DL8/VC8b5gqLmF+8lRp/iSY7Xx6pPWx
X-Gm-Gg: AZFdTZd7Q0RgBdU6uGECoSkC8Mz+J6zU/Cn0tDz/8KiTRIGtaYG9JK0Vu3HszNUIhjC
	eWXd7+IoZ7JjjlM0YgB77E40RQmeWK9tc2VFf/mRSwYX6ipG1MuPCoMTDL7jCaTVDG1NuJ3tqvX
	CBGyLKgylQAJLfy6yW+10OHDVuhnhlt6ahuhSflGaFPARYthzbfzlPPEPfe5k8f4raW7mJMJyHz
	TdgaCJQTSiy+WWTXx1YqNPJ/SMPximmyf8+Tifn/J7Hh0cxCNrTWm149a/XXYB93rEOc32odUD/
	iXA3RnEa0A4dq8+A8ySAK+IWf3qvKd+3Ym8ccYIa47MK1B+OJUVABuI2BjU43ezboWpoiZ3O7q0
	cmNhCEqBYkPqx+TQGLjTlJ2FgwMosM9krOJwcH8NncvkiPpU7K3tigHsu/a1+hKuIV7P2R/nJFi
	CHce5MmOmmfSicapm3fMRSXOdyc8AFY4gQGU93mLaHUyBUpDQZd6wfAyH35MCx9ciqH+D58pMmp
	TcXCBsoLGlQpOdjpAjInO1V4sV933VYYzU4gP12t4idCo5vXMKMKaF81PwCOhOLUQCtS/wA4Bi8
	HmNXNWZ+r1cZ1I+JvH4qDkp377Ud0whZRc0G4eXP1oFEidwkigoFb7j0GODDpduG0Md2NAcU4Xj
	Ga22OQOw30lLTinzk0BwdPM/HI6mfHX2LuOUs4gNb5Yy5HrR5OkurBoHHy9bqjFELbTRNSWoTOY
	0KfvZfUHioDqAWV1Q3Z2IojSZ6MalIqG2WEm8O1c0go/+cOBc=
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr10817054eec.4.1795368162901;
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Received: from ?IPV6:2402:a00:163:3509:b842:8324:ef7c:136d? ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm30943866eec.14.2026.11.22.09.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Message-ID: <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
Date: Sun, 22 Nov 2026 22:52:36 +0530
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/11/26 18:10, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
> 
> I do not see it in the driver, so are you sure you used correct reason
> for the patch? Mentioning driver means you document existing ABI being
> used.
You are correct, thank you. In mainline, gpio5 in
drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:

   LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),

so ext_mclk1_c is not implemented for SC7280 yet. I described it
wrongly as existing ABI.

 >> not allow it.
 >
 > Entire sentence is clear here - there is ABI and binding does not allow
 > it. Please point me to that implementation.

There is no such implementation in SC7280. The same mux position is
exposed as ext_mclk1_c on SC8280XP, in
drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c:

   LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),

On Vicharak's Axon Mini SBC (QCS6490, sc7280-compatible LPI) we need 
LPASS gpio5 as
EXT_MCLK1_C for the audio codec MCLK. Patch 2/2 adds ext_mclk1_c to the
SC7280 LPI pinctrl driver, and patch 1/2 updates the binding so
function = "ext_mclk1_c" is valid.

I will send a v3 with a corrected commit message that says we are adding
the missing function and binding, not documenting pre-existing ABI.
Thanks,
Suraj
