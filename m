Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28842901F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 16:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380182; cv=none; b=rW1HjcD4pw+Ozu1u/FdHSvyOWfzKVSaRjP1yIwynsfpwgkLHPmMHydLa8LbtP4PJcnCWmvw9icwePNzhvLSkDY1qNNFtw658SYTtuUGaMruppkuwrbYsQyRG4WA84QSRZ0UiCHxn+7vKPE+7VOiVCD1oLh7Hw3cffREfyBLlncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380182; c=relaxed/simple;
	bh=qswzUvLeWzD1ypEyusL4JpuvZviHdsdZlDLSs8pxD1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2o+gr1BPS1qJN8ByZxAqz0mtTe9zpHQjdsK56PfEDppXXGVmdsZCEW/ehEZwjJY6aVMSnnIexdifzv1gQkKc0p/G278+frvuV+9a5rzg2+/NvKx9+v0WXgMI/XM3ooNylv+Dfy/TEJhlOc8sIfMPOwD9/yiQKuANpRa7tmu7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aeA02L7E; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aeA02L7E"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb61bbeb25so1382775a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786380176; x=1786984976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SF0UuKcYo2PEY9aDv0M4yYRYVyTu0AJ1rxJHPH4mQVc=;
        b=aeA02L7EvQN2bdibNcN4KqlRuYCVq3wgwHOuuGnrz3J88LwnPay54FF6zkDqA8eYh0
         vbdOWfTmIz1bdwNJZIcobwTZL6Ql+ZUHtualTsqAn8+xogfK7TGHz3M1us6GxZHj1QFZ
         nVBE56zEGKRnbmSBmKV/995cThNOVPc/bdBr0iA+FhYJsVGyAXVldam5GqXwSNrkLoHz
         IFVDnqo1riis/fMhbkNF2u2Oq9ibNtCow9yaCBwB02+jlKLVxgiFUHBhBaojwl8KwyhS
         LakjXkjLSPLxmS1pEN9nJwIaFm+x/M/gjoOSFB4MeMyJK4KZ7KcPwdkdskKGQW0I4SlI
         Ju8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380176; x=1786984976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF0UuKcYo2PEY9aDv0M4yYRYVyTu0AJ1rxJHPH4mQVc=;
        b=gssZgXeXf9HRIu0Ll3mgR7A7aEp3in73R6Ba6/HJg0zBa8qzf6K9ghUB9xyiBmOB5+
         MtRzJZ+z+kfj/fSHY+/U+EqIkZVlnW4gpfRyeDC3ikNs9vLSTKwRabt4pZGK3QGL6dwE
         bO7BshG4NvhjwbSRLyE1SA1q0uW960wK/8LWbzNGd9c9j++LS3Aqz97d3tW0ETiJFQZF
         IkxdMTPfnEDgeD1NmXJIhc3WcyBpOE6FZwrOT7oNfBVm4chFa1f0UyISZiCapgHkgsj9
         IONrBFqw9ADmowogkRWNCytDwIcHG+v31TAfDXm97Yb89oujMFQb7UbKI4wMrcAHvvIk
         ZXWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNAQbzI8RgrmyY7tR98STY5+GOsjra5oCuaWz7JzHag5detDT4VLJHc4/7ywsMDFkpK43Yq5QfN7k6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kTW+2XPPCQ9PNNV7MYHX/GpQWVbCpmZrMPBJo6rQJ4/CACWr
	4C2ZsQ+VJCH4oCP8fQxx0u62MkCrjv9gfLJM0gN2dfLWcMgkwkD4xYqDbQQ8M6nRETo=
X-Gm-Gg: AR+sD13Ofe1O+49z04fKubK3G3EKFehiQI/wVvRtYP4X5nkFvjpr+4aXjsdFtrVEWFM
	t9L8EiZ9GpN4JTkvWxx+0Ma2Wyel18wsELOGgpZDiSL9+/h16Or1AH2BKR7kXmq4rBneVKvi7LV
	6r3wZVnh6S2B0KXWPExmjBJqgIJpjS0IUNP9cG/HxU1JEQTRmG4ACdDAYWCy7eS6a/kdVouMjr+
	nvN0BitjjysBJsmpBy60u6BJcaz7jsWoZqb1+fXAuLswcbPUQTHHxMBW4e6vy8sFXjdL58qgaVe
	iUjkFG/l37oVewG1LgILuPhJjLHOHAKvabxzRVcw2DmT3XlXOvzaJ8uoGqtk17/vqIQnQ/n7wmQ
	UQ84bjMLZQU3fW6KSg1ZxF0mDySZc6rWnc8BVd89AnIeB1jHMfXlPSwKIAnAo3EZ+YqyagLB0Ye
	ftpHnGjMpJNmmIL+Zf1CJ/mFgIRbCRAyOElGJgftIERNNtcnUW1i9thCLqlvFAbWCLdNl1aRWVy
	XPzffeqCM7Nh/6GGYzbAJxnnSTjMX07tnspPLI=
X-Received: by 2002:a05:6830:6605:b0:7e9:d634:77b8 with SMTP id 46e09a7af769-7f34dcf165fmr18922818a34.2.1786380176296;
        Mon, 10 Aug 2026 09:42:56 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e05b:7923:cf50:e4cf? ([2600:8803:e7e4:500:e05b:7923:cf50:e4cf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a836dsm7575949a34.12.2026.08.10.09.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 09:42:55 -0700 (PDT)
Message-ID: <c902cbe5-6435-4548-ae92-7399d8d48d62@baylibre.com>
Date: Mon, 10 Aug 2026 11:42:54 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x ADC
 family
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-1-f89925d72792@gmail.com>
 <c7faac0a-e3a5-42bf-8cc1-aee1370ef662@baylibre.com>
 <DKK9QKE0OYZA.3BCNK78VTHNYN@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKK9QKE0OYZA.3BCNK78VTHNYN@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/9/26 3:26 AM, Kurt Borja wrote:
> On Sat Aug 8, 2026 at 1:38 PM -05, David Lechner wrote:
>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>>> integrated PGA, internal reference, excitation and burn-out current
>>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>>
>>
>> ...
>>
>>> +patternProperties:
>>> +  "^ain([0-9]|com)-supply$":
>>> +    description:
>>> +      Common-mode voltage supply connected to AIN<N> or AINCOM.
>>> +
>>> +  "^refp[1-3]-supply$":
>>> +    description:
>>> +      Positive voltage reference connected to REFP1 (AIN0), REFP2 (AIN2) or
>>> +      REFP3 (AIN4). If not described, its assumed to be connected to ground
>>> +      (0V).
>>
>> Would we really have a case with a negative only reference? I would say if not
>> described, assume the pin is free for other use.
> 
> In bipolar supply configurations, I believe it would make sense to wire
> the negative reference to -2.5V and ground the positive. Also we have
> the ti,reference-reversal case, where you may wire the "negative"
> reference to say 2.5V and the positive to ground.
> 

OK. I guess the better wording for both of these would be that if any
channel references one of these in reference-sources and it is not present
assume it is connected to ground (0V).

>>
>>> +
>>> +  "^refn[1-3]-supply$":
>>> +    description:
>>> +      Negative voltage reference connected to REFN1 (AIN1), REFN2 (AIN3) or
>>> +      REFN3 (AIN5). If not described, its assumed to be connected to ground
>>> +      (0V).
>>
>> Assumption is only true when corresponding refp supply is described. Otherwise
>> we should assume the pin is free for other uses.
> 
> I'll clarify it.
> 
>>
>>> +
>>> +  "^ti,refp[1-3]-refn[1-3]-resistor-ohms$":
>>> +    description:
>>> +      Magnitude of the external reference resistor connected between REFP<N>
>>> +      and REFN<M>. In ratiometric configurations, such as RTD measurements, the
>>> +      IDAC excitation current returns through this resistor, generating the
>>> +      reference voltage for the conversion.
>>> +
>>> +  "^channel@[0-9]+$":
>>> +    $ref: /schemas/iio/adc/adc.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +      single-channel:
>>> +        minimum: 0
>>> +        maximum: 10
>>> +
>>> +      common-mode-channel:
>>> +        minimum: 0
>>> +        maximum: 10
>>> +        default: 10
>>> +
>>> +      diff-channels:
>>> +        description: |
>>> +          In addition to the analog input pins 0 (AIN0) - 10 (AINCOM), there are
>>> +          special inputs that can be selected from the following values:
>>> +          11: Temperature sensor monitor
>>> +          12: Analog power supply monitor
>>> +          13: Digital power supply monitor
>>> +          14: TDAC test signal
>>
>> For reasons mentioned in the reply to the cover letter, I'm not a fan of the
>> monitor channels here.
>>
>>> +        items:
>>> +          minimum: 0
>>> +          maximum: 14
>>> +
>>
>> ...
>>
>>> +      input-chopping: true
>>> +
>>> +      ti,idac-rotation:
>>
>> Should we make this one a standard property like input-chopping?
> 
> Maybe excitation-current-chopping or excitation-channel-chopping?

I suppose. All of the TI literature seems to call it "rotation" rather
than "chopping", but I did find a few other sources that call it
"chopping" and that would be consistent with input-chopping.

I would go with excitation-channel-chopping since we are swapping
the current generators, not just the current magnitude.

> 
>>
>>> +        $ref: /schemas/types.yaml#/definitions/flag
>>> +        description:
>>> +          Automatically swap the IDAC1 and IDAC2 connections of alternate
>>> +          conversions. The ADC averages the alternate conversions to eliminate
>>> +          IDAC mismatch.
>>> +
>>
>> ...
>>
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    spi {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        adc@0 {
>>> +            compatible = "ti,ads1262";
>>> +            reg = <0>;
>>> +            spi-max-frequency = <8000000>;
>>> +            spi-cpha;
>>> +            avdd-supply = <&avdd>;
>>> +            dvdd-supply = <&dvdd>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            interrupts-extended = <&gpio 0 IRQ_TYPE_EDGE_FALLING>;
>>> +            interrupt-names = "drdy";
>>> +
>>> +            /* Typical common mode voltage configuration */
>>> +            aincom-supply = <&ads1262_vbias>;
>>> +
>>> +            regulators {
>>> +                ads1262_vbias: vbias {
>>> +                    regulator-name = "vbias";
>>
>> The node name is already "vbias" so giving regulator-name is redundant.
> 
> Is it okay to leave it empty?
> 
>     ads1262_vbias: vbias { };
> 

Yes. (Unless make dt_binding_check says otherwise.)

>>
>>> +                };
>>> +            };
>>> +
>>> +            channel@0 {
>>> +                reg = <0>;
>>> +                single-channel = <0>;
>>> +                /* The VBIAS is enabled on pin 10 (AINCOM) */
>>> +                common-mode-channel = <10>;
>>> +            };
>>> +        };
>>> +    };
>>> +
> 

