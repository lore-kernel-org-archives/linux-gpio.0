Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54D3A05FC
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786264000; cv=none; b=YXt0YbRhvwYMoUQNyz4OZK53MUN9cwv0L+QRfbUmztrkS+9olmfScQFpGD/pJ8RMNCOqcAQ22GJYtSyXnG1+t84uH8oHeiOOtmS2Rdx7LVJPRykmMgsU+qBNwgNYzgAAa+37G6THNuCagBSZh+t+enWIrl5W1wBRIetcemS+Vks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786264000; c=relaxed/simple;
	bh=t0JDNj9mERyDG8GojcBw/UvrNqGcmnYmtqSdBqzS86s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=ivt/u/CbhD2XcCZNaD0/1GMIA4LFxzhx7OxJEYlSJk8JrSiqQu4eoHzxGClZsvxzyTGcexpfLtDTy2pzW8zm3fw/tHkl7XZcCCEcT2J3Qhl/jEBHI1TCEgZKiC1Zf7oqq6U7D+sXYzAG4l8qSLv0E/Ks2eCxYeflVd4cyz0idfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erWkiBdE; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erWkiBdE"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so125636241.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786263997; x=1786868797; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahfqHlld29daSD5k+fkfkkNtfM5Y9Y/mUH1o32pzzv4=;
        b=erWkiBdEbdmiMRXMLUxuxMD+4FnFwnKbqOfJSSYkd7x6hX3/7G5M6bysM8wSGWVXVc
         sd67fAKdjlS7E6lhe6KQ6NI1rKkpdho+p0ehVpYTGXiHFYQpI50alKWYPlpSw/0parWm
         Lx+4iJJM2vl5QWv5gAGW6p03GoGSY4MCzfJA8pDheVrp6RrDwNG7RwrMZMjV5FW5XmYN
         LxXLMXc1IpV/DeIk0jrND3ybHC0O51hckQFHgDNcO7nQoci/U4A6oEdPhYVRCnJH8d7X
         UQ+dDEF/eToCbi7xTJakiFD6+JWdwIxMbp7C97jL0l0mzYFQy1hArX9UYZouRRdZttRc
         v+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786263997; x=1786868797;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahfqHlld29daSD5k+fkfkkNtfM5Y9Y/mUH1o32pzzv4=;
        b=M4OSoe/O5pTtDuYyeF14vvm8mOjlSZDGa2qK+T+H60/jWf1xCnROHTN5I7YcC0PMRh
         bKlOnW19QOrSwttzjzNimk2QarA6W/tQISU2a6MdkvS3WMJBRM5FbNaEqgzYFv2XcGhi
         9zsx97AjBaVdeeRvOmALLEJJdupyUiXTxpREUnGsyKtfdW7tjJMk1tXz0GCmvyzl8vel
         j5yRRhFT13tsJIoJPpWsi8HMZBdJiRPH2o6Btqth8BOH9Ycjq0cIiUnYDKS49SiWhkb+
         mPfhw4OkqQhQZ8mrn26MAsKBFi0+Ff+kctixflN/7EPm0SOr4qr6a4QEA8inY9FgyipV
         b9qQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiaIWtODxuMQm88Xn0K1UHPA7kXKv2ShH97BrRfosxX9ZNEfVHrvnk/8o2oPliqeSqlc1qdAkLdz+H@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoc4bzKfZt65/eDz0m8t5MOgLSq1uZF+R+FqrDfzQXA9LH7tix
	YKw3KyvVyeMdX2kmvtO9igoc9WT8n5MV4EviNTqFLn6QbAqFsH/gI7FO
X-Gm-Gg: AR+sD13/1J5tf+OM6Ww/NMwrWTHnCK0H+LgJO9NAkhpO384P2+ylpztLD+x8nXlFNXO
	4mVpobS/TsbA/GP7Rx/OynbvnTUxiWdWdtq5n7vEwdSDef9zGFwZk/XatrpxGEFSfGkd2bTA1MK
	VLQXlhzRMbZWbZJ7DVcC2KJKhwy9ukPhkwL9K+ouWjjiNWmdR0XZDSwVyWnfaQlhBEpXm+b2jJ3
	dY42vs0VWkgHOe4HFLD06+lXIaFzjc4AMvv30Pp3vWlCicm8B7fzRb4SN5F5f9lGXb8VGXw5DoE
	ux46dJ1sg1DfKo8moJ9zb2czeGRUmsU9HDiJhRmuiiildA+2bXgIcaWPIlUuTEFi3orSuERWRRg
	hwVXmZeYAUTEkLeShQfOF0ReVhe8MIgZHWaI+/zAiAtmRbhFQQETt92wTM2Dgym2yuPSwBSGQBb
	7ZLKcXteZ1I1GBgJGqPYQ60Bak5zjm0QYkCXi9XOhRmS7JOuBUBf8=
X-Received: by 2002:a05:6102:3e87:b0:738:9abd:9eba with SMTP id ada2fe7eead31-760e77ea7f5mr8084364137.4.1786263997382;
        Sun, 09 Aug 2026 01:26:37 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2eac14fsm2391114241.7.2026.08.09.01.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 01:26:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 03:26:29 -0500
Message-Id: <DKK9QKE0OYZA.3BCNK78VTHNYN@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-1-f89925d72792@gmail.com>
 <c7faac0a-e3a5-42bf-8cc1-aee1370ef662@baylibre.com>
In-Reply-To: <c7faac0a-e3a5-42bf-8cc1-aee1370ef662@baylibre.com>

On Sat Aug 8, 2026 at 1:38 PM -05, David Lechner wrote:
> On 8/7/26 10:58 PM, Kurt Borja wrote:
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>=20
>
> ...
>
>> +patternProperties:
>> +  "^ain([0-9]|com)-supply$":
>> +    description:
>> +      Common-mode voltage supply connected to AIN<N> or AINCOM.
>> +
>> +  "^refp[1-3]-supply$":
>> +    description:
>> +      Positive voltage reference connected to REFP1 (AIN0), REFP2 (AIN2=
) or
>> +      REFP3 (AIN4). If not described, its assumed to be connected to gr=
ound
>> +      (0V).
>
> Would we really have a case with a negative only reference? I would say i=
f not
> described, assume the pin is free for other use.

In bipolar supply configurations, I believe it would make sense to wire
the negative reference to -2.5V and ground the positive. Also we have
the ti,reference-reversal case, where you may wire the "negative"
reference to say 2.5V and the positive to ground.

>
>> +
>> +  "^refn[1-3]-supply$":
>> +    description:
>> +      Negative voltage reference connected to REFN1 (AIN1), REFN2 (AIN3=
) or
>> +      REFN3 (AIN5). If not described, its assumed to be connected to gr=
ound
>> +      (0V).
>
> Assumption is only true when corresponding refp supply is described. Othe=
rwise
> we should assume the pin is free for other uses.

I'll clarify it.

>
>> +
>> +  "^ti,refp[1-3]-refn[1-3]-resistor-ohms$":
>> +    description:
>> +      Magnitude of the external reference resistor connected between RE=
FP<N>
>> +      and REFN<M>. In ratiometric configurations, such as RTD measureme=
nts, the
>> +      IDAC excitation current returns through this resistor, generating=
 the
>> +      reference voltage for the conversion.
>> +
>> +  "^channel@[0-9]+$":
>> +    $ref: /schemas/iio/adc/adc.yaml#
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      single-channel:
>> +        minimum: 0
>> +        maximum: 10
>> +
>> +      common-mode-channel:
>> +        minimum: 0
>> +        maximum: 10
>> +        default: 10
>> +
>> +      diff-channels:
>> +        description: |
>> +          In addition to the analog input pins 0 (AIN0) - 10 (AINCOM), =
there are
>> +          special inputs that can be selected from the following values=
:
>> +          11: Temperature sensor monitor
>> +          12: Analog power supply monitor
>> +          13: Digital power supply monitor
>> +          14: TDAC test signal
>
> For reasons mentioned in the reply to the cover letter, I'm not a fan of =
the
> monitor channels here.
>
>> +        items:
>> +          minimum: 0
>> +          maximum: 14
>> +
>
> ...
>
>> +      input-chopping: true
>> +
>> +      ti,idac-rotation:
>
> Should we make this one a standard property like input-chopping?

Maybe excitation-current-chopping or excitation-channel-chopping?

>
>> +        $ref: /schemas/types.yaml#/definitions/flag
>> +        description:
>> +          Automatically swap the IDAC1 and IDAC2 connections of alterna=
te
>> +          conversions. The ADC averages the alternate conversions to el=
iminate
>> +          IDAC mismatch.
>> +
>
> ...
>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    spi {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +
>> +        adc@0 {
>> +            compatible =3D "ti,ads1262";
>> +            reg =3D <0>;
>> +            spi-max-frequency =3D <8000000>;
>> +            spi-cpha;
>> +            avdd-supply =3D <&avdd>;
>> +            dvdd-supply =3D <&dvdd>;
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <0>;
>> +
>> +            interrupts-extended =3D <&gpio 0 IRQ_TYPE_EDGE_FALLING>;
>> +            interrupt-names =3D "drdy";
>> +
>> +            /* Typical common mode voltage configuration */
>> +            aincom-supply =3D <&ads1262_vbias>;
>> +
>> +            regulators {
>> +                ads1262_vbias: vbias {
>> +                    regulator-name =3D "vbias";
>
> The node name is already "vbias" so giving regulator-name is redundant.

Is it okay to leave it empty?

    ads1262_vbias: vbias { };

>
>> +                };
>> +            };
>> +
>> +            channel@0 {
>> +                reg =3D <0>;
>> +                single-channel =3D <0>;
>> +                /* The VBIAS is enabled on pin 10 (AINCOM) */
>> +                common-mode-channel =3D <10>;
>> +            };
>> +        };
>> +    };
>> +

--=20
Thanks,
 ~ Kurt
