Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498618;
	b=SjsV1CJWzsQz4rLpixJxbeIBTgOJ5vAAgNMqlCQ60peD3DMht5Rj2cMOIlx0pRDP8Ul7
	 H22Sk1PvThlcfcHvjvD9Mrpu2sYlLACE/v+WB9Vf4RXHSe8ZrKYiJPvdAzIWt8u3avNyu
	 Or2vWJHOfqsAFEb2GC00/u8x61qFpmwUtPXHOlkRcMuWkB+9d7u/f417F7QMRjqL9zbIv
	 9E8s0ZC7MgYs95awoZBWQbv5+MK7lGFZ4qoJPP4J2kerMke5etigvCD1k0Mh3m7g69cDh
	 Bo76L1VZGwRi7oROgCDt1mpMRZRsoc4qu00IRMsTYv+L20LwCRyOw47TRuk0k6m4Z+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
	b=D+e2DfWWPu0k6ipC9hdDmRReYiyG+yNnL+IO5xN6SdaRSV/KcfF7kk7rpdhK7GhQ3G9S
	 vLHUuP7UGqneg+mkNLLDxbWLnoqajzwQ8scFkGe6l6T3z7eLFXE9FtgDf93I3kpXXZ5KT
	 1NazDr8UjZEpzUfrBvm1/JVohvB5bBTg/8sqwyDBl5OrbskEpCHxTEzT2eX6B3NpH7wVD
	 e7kT0qy6B2kRaIgZkKbbbfKrivHhwSfGIwk810arrif6d7NqAAbCAdDWRNNA778YAn8U1
	 4rodU/zH4X1LAgLjY5vUmi8nTDaC0tf9rMAdfLsBoV7mQqjEj4eKZ+s0UiV8zoZaFyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XyHuAhl0;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66907606A321
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66907606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XyHuAhl0
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2103843f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792498616; x=1793103416; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
        b=XyHuAhl0Ihg3o9iu+ZV6Mt5r2QN8C7rlBmRSdsYa81fuHYYZSOnxDoWvNIgUGEawb5
         ivqJTz66q91RngbDRNkaw/L6s2z0qhycRZKq/kozmieuzZapGem71jaX7SYHApsfagTz
         4zR2KY99z3O+t8esfmsuWCjBNuGsxl6VUO4nDVrAP8rye7FNOE+vgnPIh50J6KDdzc/k
         Nm89xIfOb0YZqt42r+owb6SzMPvl2ABryPkIwTo0aqTRszI/FBNXH8EQKZJgnPGidLo+
         KWnqS5fdtOfVIkhqnTdhEBTbTZ0aZHJs5bXoFpo7hzyA/qQg/7Ks8sGk3Bgr1nF25rss
         VinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498616; x=1793103416;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
        b=VTp5o/sMHjpr24YjLqjTLtnLAZRfopb/9VFvFVMcBotO3mBsli2EeasLFRfoLELCqZ
         HyNVfN3hQmBpsrcMBh6zHrTa3Mqq0w1Wpm4OlhoY2XyMxECVJgftVLTz84qdJWwJ1Rn4
         ABXnJsur60j8zZGxhQrGBweJF4LGfDC3VwzxK7MA4ciS37rkujtKOaQgq0qYGfPM0DL0
         kqgkO6j8kT1iLhsBKleU7ADC7e0Zjyk3EuqTLBf9vnjk0dtoTUyvGFDaZ8lrd12q92FT
         h4VGK/zkzS/vIenAUG3i6AE5kLRym23lP9oJcvsD7Sw+O2C+jaxZ3xTuLmG11SBVvC/S
         PJvg==
X-Forwarded-Encrypted: i=1; AKwUvBzSF9/gWttWz89OR8bKXmDNLrr9QcIJvXRMcYueAKpXpbTCVzROge71RC1US0akeIgEh+Erz7S5Tgov@vger.kernel.org
X-Gm-Message-State: AFq9FYLZxzbyGgregoyUai/Dtu2RrhD3Fck+cQv54gHXMixaOZ8B8wzx
	//KAZGY5IPp99dtX4vk+ie6ugG2NMLHHzIGlJZ1cLSuzVjE/jpGyaK8MYB4f7w9+O7Q=
X-Gm-Gg: AYBFou09fUBCNUaoMSHuM8K/7usmziu6VGvwklA8r5vU81k/sk7YK9GIabQSbjORw9R
	5NWSFHnMiyASwxZVnxc3TjRbRPDvYqQivbOordWljNeBNUAezZSxRWjNJm6b/dH40ux4FxiOCl+
	umbFOYSaX24O/3RK3hLYHUnYo/ATrlInJ1BitHX1WR+xKYIfSZxVbOXMIOkkyH0x7BfLf84FGr0
	qhzOI1VgNqqD81/e1a9CO8u2Qt0L+Ix/ZerUsyRLYOgVGa9HVx8PnBEQHmp67iaglSvc1rTenRA
	+ydkDEVwIBB21WOywkZljowOGN1QhnA2Nkfjc1fUaGmGPvwOwXcc31D/TE3ApUYy7M2S9Hz+7rz
	N2wRQ9Oil6s2s/4TdBZdoIIwx/Mlh3uigs7aqGuy4A8MfxQ5RgdTTfGAjJ3NFkeg8wAf8D7RhDN
	fuLfb3CxVHLzxy7LMtcwi+idNDeid0fvIZ7lW5guw8ZjBR78FYkBM151g9ATZI1Y6XXTbfQBYc2
	Y3jdtYjUlTqG8VA/myfBHwfbSc781O+7K7p0U7y29dApBGWPXPrjttj1ASrxaHbglG2uyJMQlQ=
X-Received: by 2002:adf:e001:0:10b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e1bdf80a0mr5011790f8f.48.1792498615536;
        Tue, 20 Oct 2026 05:16:55 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d8bsm5130862f8f.24.2026.10.20.05.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:16:54 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 14:16:52 +0200
Message-Id: <DM9NQ6MMED9N.3QP4ZDCCAZ85Z@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Christopher
 Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <c91b063f-69b9-4e9b-8e1b-af503de672b7@kernel.org>
In-Reply-To: <c91b063f-69b9-4e9b-8e1b-af503de672b7@kernel.org>

Hi Krzyszrof,

On Tue Oct 20, 2026 at 1:22 PM CEST, Krzysztof Kozlowski wrote:
> On 20/10/2026 12:18, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 17:07, Ettore Chimenti wrote:
>>>> Hi Krzyszrof,
>>>>
>>>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>>>> Using same definition as OMAP2/3 except pullup/down enable macros, w=
hich
>>>>>> are inverted in this SoC.
>>>>>>
>>>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>>>> ---
>>>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>>>  1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindi=
ngs/pinctrl/dm816x.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..15aa15bca9bd
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>>>> @@ -0,0 +1,20 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * This header provides constants specific to DM816X pinctrl bindin=
gs.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>>>> +
>>>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>>>
>>>>> I do not see this being used here, IWYU.
>>>>>
>>>>>> +
>>>>>> +#undef PULL_UP
>>>>>> +#undef PULL_ENA
>>>>>
>>>>> Why are you undefining other macros? That's not a easy to follow code=
.
>>>>
>>>> Do you prefer to duplicate `omap.h` defines? Only the defines above do=
 not
>>>> apply to DM816x.
>>>
>>> Not sure what you need to duplicate, but if you add header with binding=
s
>>> for this device, then you should not include headers for other devices.
>>=20
>> I basically used dm814x.h as a template which does that, is that not
>> correct?
>>=20
>>>
>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +/* DM81xx mux bit defines */
>>>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>>>> +#define PULL_DN			(0 << 4)
>>>>>> +#define PULL_UP			(1 << 4)
>>>>>
>>>>> I do not see this used by drivers, so why do we need one more header?
>>>>> What part of SW are you binding here?
>>>>>
>>>>
>>>> I added those (DN/UP) because they are not defined in `omap.h`. It may=
 be
>>>> convenient for future board upstreaming. I can drop those if undesired=
.
>>>
>>> Just add the header to proper place - DTS. These are just not looking a=
s
>>> bindings.
>>=20
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> I asked  which part of SW are you binding. There was no answer, but
> question. So if you cannot point which part of software you bind, then
> we can assume it is not a binding. I did not do any extensive look,
> because I assume that contributor will bring the argument in favor of
> their patch, not me.
>

Thanks for the clarification, that makes sense. These macros are only
used by the DTS files and not by driver C code, I got confused by an old
header (2015). I will drop the dt-bindings patch and move the
definitions locally into arch/arm/boot/dts/ti/omap/ for v2.

>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>
> I gave you one idea, but feel free to implement it in other ways aligned
> with that platform maintainer.
>

I'll do.=20

Thanks for the review,
Ettore
>
> Best regards,
> Krzysztof



