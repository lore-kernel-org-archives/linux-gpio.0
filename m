Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706374;
	b=ov8KUf8Qf2xWX3U6yOS6lastenWsoUgpUXmUk3MX9xAYgaLaPZtzEys1h3+4KGnSxtJ7
	 AhZJrDrYfRIhhZJVMtwa3aSGv+qV0y1cgfnkDfcid+dfRCsfmhTZm0BgfiTkNQ2CKI5ql
	 /J6GMZSCma50xTgr9/Dxte1zd4dD/NqSEkJqoHrStIiYatQG2cbexV+IAIAFMcB9oNN60
	 mFJfceJsetq+YkTRy6ar39Eeif/KLd0yFkNne8GCLMVmscp+exrbm8GRIlsnGPAJprh7k
	 LZO8BLz5p3v8L9Vi03+JqBSltmvXTeJtPSwBtWkdZoVJqdhrjBgKr1ZwUf2ho1yTllA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
	b=06fGjwlQiz58RQgRezdSI7xGuxWQNCjLpKVj9fq4LrUK3U9EFMEzgQ/JJwPBtWBYF/ge
	 pG9ckrKoq79sKadTrXdnnb0UoHeYXvg5dWWRVDmndUw41odNsfzI7FSP1J8s+ELfVlJAt
	 F6+/Oua+5dhPXrVkGsS7G1kqOzqcDeNkWCbRAw8yXlCxlcOaoOv987GKH13FrJ7y+t+Jg
	 oDNR2BU5OzbWsEX4h5MxQTpS+OiWUn99I6nvm8K8pHF6uRXnYknxzBkj53TvspW2K79RA
	 amnofe8jVZkFD9UIU8+/orehsG6eyP3PGKprKLfa0XV5pdA5D3dCWeUU+raX/7OvOig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DF606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729DF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbbYeYW
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0213202fdso37756435ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706374; x=1796311174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=CrbbYeYW7YZVgHercljukVu0b6JUMTJydB1LSJYAif4Z0fixzzCK03EWR/r37zd3Mr
         D0LO+Zga2qR1DP/qDPD4yyFYP0lzvabXVzmET6fDXDCC/If+2BgSHj5nIlaLFMjDy0iJ
         Mt32b2xqkgR9CnaHnBWEy4WnzxApp3Hy5lw0ry5Eg9UYILoAXBJIgOiy1Ts5ZJ1GzEKL
         T2RLvAvLFCJ2Q6q04CLlsDeLU0wfyhGEiG7yGcOqpDeQhGy2/AKLje+obkISeSfmV0WS
         +j7R+lIvzq3u/TijnwL/K8zWogjL4jmO9BZuzlCyHlWjsc/IEh5RjqW4XtZgZLytyLp1
         H5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706374; x=1796311174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbwgfhGpD/SnhZAxCCyXFJ8JiP4cUz8bLW1LvUKOW/4=;
        b=x4IuSQ7dKmBL3Z7VrD9PKPVSTvfYmTz1WWw60dGXa2Y1An7t0jt0I6Du98iYXPwrw+
         pZacu18nFVFfqHJkxv28JhUhAC+RuvJI7KpavunhHv9NsTRHfBQbgiKnbV/zgxcAziyY
         oeYobe97TtE/vtJX+Zt1MsPshdYyEOUc4Z4H6f0uNWU9/flrUuHO6JO0e87tQGTPlPOY
         8woUKL7gzoW3uhwEJtsopijPs+NYTGzsIu/LBjemO4pjYoKByFSOmApjZImH8ZYGoYNo
         DpdG8gfGhMcaVIAzxRGf/wNwS8fdX5PO+ru1ytxQHtRdY+a1VdMPsgTkgLfZscG2Fe6Q
         WicA==
X-Forwarded-Encrypted: i=1; AL+hErE28yB+xMexbGghpitAUG1yWITYcQnLY2H+Tub4UpB7Ss659nzbrN9T5i25ByAGuiwTvFHanIhKEl5A@vger.kernel.org
X-Gm-Message-State: APuU4Z8oIdez4h0WjFnuSz2MZ56WxMSVm/UzKsQ0/4eiiHEeA4qO1s+s
	R2GxyQYSNOB6Rd5F8C8MSe4Qc2RzKdkivuEwp/oqKEIWPSblfSPP+jQq
X-Gm-Gg: AZFdTZdddbt915xVR5BsWxf6htQVGN9MnZrgwNIDiVMONTd7GFiDx7B5FafRzBF8lIh
	qiIJvjnfHvYx/feg9SnaZkIfVdUaJpsiNOQIrI/yLikdc6L0cpMJMgAytdHsWD/313hMKpFeoZ6
	sntyAPoN6BDF8lANTUSXrCCbmehT5L49ufpthioy4TvaLQeaBDxd3X3bOKf5SiaBDKBLHsjfaEs
	KA0dsVEXf/WjoEAIA8+GWh4e3nh4OPikLhLwyeHqcwJ+P/S+lCeRL96oHXs1xD8+M1+Hz9Q8BG5
	21pHkmiVn1rPam0MfuAw5rJc2fo/agqKY+X7/Hfy8JMs9LWMdGETITYlzu4mExI4JQ0oU0jJ9m/
	TQzli1agLGnt//jY6Q6frPYPrWhIBICmlqj0wJgFJVJ2mxV/BDpKsvbGEnNwpYmX3H+poAs6E8Y
	tcX1U0TqE8lnhBUn/FBweV+nNOPEe/e3aP3/EVKZ/uBXaTq3DZCizoGt8lD1u2+BiL6ANtNKB6q
	xbYt3vAZI7zaMw9BDa/AbTvTfakMxi9W8iSXNwCjFHicZvEaGKfg75OKddq/b8Eq0s3BbXB3awa
	XvesZ8gMhPK5G+NyhAkFfptAw02k7AWxLx5Cxrfe8ZtmYA852KGeF6ZEMW5kRRQmslFZBL30kAz
	nGXf/1w5APBT/qbO3BF0l+dBxbhcSTq9QcWWQJl2mkDSfgXfXou0qRZsbd/EYHUOQ2CxhWNqYo/
	vSRdk/f/2BWECGRpP0CYNy55Q=
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr214437245ad.54.1795706373704;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Received: from ?IPV6:2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0? ([2402:a00:163:2ce9:4e7:3fe7:3a21:f3c0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm11015263a12.19.2026.11.26.07.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Message-ID: <2fbeab27-f57c-40f6-8f7d-671cd8a2604a@gmail.com>
Date: Thu, 26 Nov 2026 20:49:26 +0530
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
 <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
 <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <3682be02-3e2a-4e01-8066-15b51215854a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/26 22:09, Krzysztof Kozlowski wrote:
> On 22/11/2026 18:22, Suraj Sonawane wrote:
>>
>>
>> On 16/11/26 18:10, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>>>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>>>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
>>>
>>> I do not see it in the driver, so are you sure you used correct reason
>>> for the patch? Mentioning driver means you document existing ABI being
>>> used.
>> You are correct, thank you. In mainline, gpio5 in
>> drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:
>>
>>     LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>>
>> so ext_mclk1_c is not implemented for SC7280 yet. I described it
>> wrongly as existing ABI.
> 
> Did you just paste LLM output?
> 
> Best regards,
> Krzysztof

Hi, the wording is mine, but I refined it with an LLM to make it more clear.

Thanks,
Suraj

