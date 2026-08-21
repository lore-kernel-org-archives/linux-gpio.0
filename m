Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9E3655C0
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327859; cv=none; b=Rl7/h2ytx28C70DH10UOloNIOMmUwG+L25Y4AKbVM3AA49tu6xI1y/h+IZFyz3JMhgF/RFMSZS3w01zFSnrK0Ul99ptPMKO6cPkPNNX9g4lyUtXzf+neidhIvlB57DziLKerS3At+rF7xaTg5M2y13tmvchTqrLHuaNfgTCEQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327859; c=relaxed/simple;
	bh=QPYcmCGE1j6b1oYmWVelzZOv9rRvxAYFCX/sMvIVkH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCOZeGAX4LRq1pjojiQrRHiuTMkrIHaDOqeCVYH4j/erDY4c6U/4jnG/qRq7xYfF+SakG4YNMJiKfNCszIn+zqPg8zZfcH2g7jbHwqx/cb6Bj9K3abF14Acy3f5f/zseTWB/qwFd+jfbhGn+zaCie1ZfLIHHLiG6jqxJFZ3TiwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DoXzwA1K; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DoXzwA1K"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-836cbcd0a48so15978057b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787327850; x=1787932650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQtmu6bKLrMNJM/WIbhky8MwVtdX8FoGCP3Tk6EpLao=;
        b=DoXzwA1K0frpKAlfH202oVdHn0woyQTGgEikG7k2usvBK/b6fQ7vvsOWklc91bwVDt
         CM+qpIpkZ7sNp5bG99AwV1MW8TE1bkTl+Iodqt+lG4G8LdA2nJYbVtn7rCnVH6x1Hjaw
         88b8PEPHaB859N99anGKwoXlbRtn99q3uxfNluwzEUsCTSsCXXjWdb2UlqJmTW5MWzkH
         ozirZM7exyUMXnueoQCT5zOXuYeqwsFpH1lc7Nzz1k/oI08PRAx0U+ND4G3LSEpc5dWT
         1yateCzxwP13iWwa7jogS3irsGTjdAANmiAdf6gfsaEtF0haFHJ+y5w2er+MQ/J/UZbX
         i7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787327850; x=1787932650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQtmu6bKLrMNJM/WIbhky8MwVtdX8FoGCP3Tk6EpLao=;
        b=WZyjsF16hEZvYhBSk/YRqgUKuxHk0jKzeWjq3gVVDGDzwoB5FVFY90pVHwqdISC1Gl
         nzvZhD/Uh+Vzwl5yFf9k1wj2jE6mZXv92ObG9vOX5CQaHmW5j3usNAono70opYlAD10m
         fo/xbV1koGpM4aCRZd6kp/6xSRUPDp6d/4so59is4AnFihO8jFaMYMhuLM2BZsGCME0H
         ZxZ+4omPPXaNuoG8mLXNDQbLjWBHx0R9rEG2KqApq86X7YNmY+r3z7OAv9DQdL8fqd1L
         kuVfnWixFX1NTj2WPLTO2JyfYYZwXA3RVRqcyIQNnDpzf+md9Wiqq/fEv3gPbsTmaO7T
         79mg==
X-Forwarded-Encrypted: i=1; AHgh+RpAmdhlRmtxz+ggIZUtZbp8xSAubVxwUEF/J1i5NGMH/sJbHdoay5NXz1ILYbUZZ3H8YmWFgBKwPKZf@vger.kernel.org
X-Gm-Message-State: AFuF++n6kP4FTUvDHbTLaTSpjzHkpjfOepF+n8Tm8FBaQpPVzkXJ8GMH
	gpDk8tDZSbPSzmLr8azDtKDEyBGEE8nrvn3ZQSA/HlycduEDsyBVYswDIok7AVIFf3E=
X-Gm-Gg: AR+sD12AbTHSvkw1l7hvkPfndoWi5hp2ozfd3UTiZOvlvczfGxVuEOXLYX8BHJLSkXt
	Lbm8DnZbcsjRvWV3w3LMYON/2gPn3MA/5NLgW5meW5Mos0/cjzn5DfvpT4VhN0l6l6yMUICsVod
	pBqnH/nnbHGQUYbfHADx7ODpJM6JyepQi1CLimP6UYywpGgzRT6cQ8cLkvSfVbpqG1J3Ry7YKD0
	/xO3jnymuY73VWyDCqzwjKcFMH5kTDhNwdaDQSBBzKbVXFGqY70GqERIMsPZOyyIoJWDpu0xH5Z
	1tHx4iujBbODlZwy6WyO0iN+eUVF06u1ckmQaUSKPPqHn1FojAEeqo1Gd4tMdXqINjdNiCitPBc
	KTI1u5VEARbwQQocsoAOMXL6QQ2KTNbDMbRZF/oqE63//Fo6ygeL7HvmVqhBYrdjPKH4/XPnTQ+
	2Bq2uRJ3SAK3YVN2DpEjuePMubUbzB+Z7qu8MjNETyZO++iEpdpk4CUJ13qnEc0RpgBfJTyUCGx
	xH6tZxZZapN8yxLgRxeIg7KRTSX/VnPRMb2y3Sqi1w=
X-Received: by 2002:a05:690c:ecd:b0:81e:ad1b:cad8 with SMTP id 00721157ae682-849f7ff8dc4mr33817707b3.36.1787327850173;
        Fri, 21 Aug 2026 08:57:30 -0700 (PDT)
Received: from [192.168.1.169] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8451955a784sm43139267b3.47.2026.08.21.08.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 08:57:29 -0700 (PDT)
Message-ID: <718f6ead-d1c0-4dc6-82e4-cac49cc73bd6@baylibre.com>
Date: Fri, 21 Aug 2026 10:57:27 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] dt-bindings: iio: adc: Add AD7768
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-2-bb8fbd06d4eb@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20260821-ad7768-driver-v4-2-bb8fbd06d4eb@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/21/26 9:06 AM, Janani Sunil wrote:
> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
> simultaneous sampling ADCs.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  .../devicetree/bindings/iio/adc/adi,ad7768.yaml    | 314 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 321 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> new file mode 100644
> index 000000000000..df4b179df988
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> @@ -0,0 +1,314 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7768.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7768 and AD7768-4 ADC
> +
> +maintainers:
> +  - Janani Sunil <janani.sunil@analog.com>
> +
> +description: |
> +  The AD7768 is an 8-channel, 24-bit simultaneous sampling ADC with configurable
> +  power and performance modes. The AD7768-4 is a 4-channel version.
> +
> +  This binding covers SPI mode only (register access via SPI). Pin control mode,
> +  where configuration is set via hardware pins rather than SPI registers, is not
> +  supported.
> +
> +  The io-backend represents the high-speed data output interface, consuming the
> +  DOUTx data lines, DCLK (data clock), and DRDY (data ready) signals.
> +
> +  Datasheet at:
> +    https://www.analog.com/media/en/technical-documentation/data-sheets/ad7768-ad7768-4.pdf
> +
> +  HDL reference design:
> +    https://github.com/analogdevicesinc/hdl/tree/main/projects/ad7768evb
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7768
> +      - adi,ad7768-4
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Master clock (MCLK). Can be supplied as a CMOS clock on the XTAL2/MCLK
> +      pin, a crystal oscillator connected between the XTAL1 and XTAL2 pins, or
> +      an LVDS differential clock on the XTAL1/XTAL2 pin pair. CMOS and LVDS
> +      clocks must operate from 1.15 MHz to 34 MHz. Crystals must operate from
> +      8 MHz to 34 MHz.
> +
> +  clock-names:
> +    description:
> +      Identifies the master clock source.

It would be more accurate to say that this describes the type of clock that is
attached to the XTAL1 and XTAL2/MCLK pins. In other words, drop the description
from clocks and move it here.

> +    enum:
> +      - mclk
> +      - xtal
> +      - lvds
> +    default: mclk
> +
> +  avdd1-supply:
> +    description:
> +      Analog supply voltage for the AVDD1A and AVDD1B pins (5V ± 10% with
> +      respect to AVSS). Powers the analog front end, reference input, and
> +      common-mode output circuitry. Both pins must be tied to the same
> +      potential.
> +
> +  avss-supply:
> +    description:
> +      Negative analog supply rail for the AVSS1A, AVSS1B, AVSS2A, AVSS2B,
> +      and AVSS pins. This rail is referenced to DGND and all AVSS pins must
> +      be tied to the same potential. In single-supply operation AVSS is
> +      nominally 0 V; in split-supply operation it can range from 0 V to
> +      -2.75 V with respect to DGND. If omitted, AVSS is assumed to be at
> +      system ground (0 V).
> +
> +  avdd2-supply:
> +    description:
> +      Analog supply voltage for the AVDD2A and AVDD2B pins (2V to 5.5V with
> +      respect to AVSS). Connects to internal 1.8V analog LDO regulators that
> +      power the ADC core. Both pins must be tied to the same potential.
> +
> +  iovdd-supply:
> +    description:
> +      Digital supply voltage IOVDD (2.25V to 3.6V with respect to DGND).
> +      Sets the logic levels for all interface pins and powers the digital
> +      processing core via an internal LDO. For 1.8V operation (1.72V to
> +      1.88V), IOVDD must be tied to the DREGCAP pin.
> +
> +  ref1p-supply:
> +    description:
> +      Positive reference input supply for REF1+. The voltage range is from
> +      (AVSS + 1 V) to AVDD1. Together, REF1+ and REF1- must provide a
> +      differential reference voltage from 1 V to |AVDD1 - AVSS|. This
> +      reference is used by channels 0 to 3 on the AD7768 and channels 0 and 1
> +      on the AD7768-4.
> +
> +  ref1n-supply:
> +    description:
> +      Negative reference input supply for REF1-. The voltage range is from
> +      AVSS to (AVDD1 - 1 V).
> +
> +  ref2p-supply:
> +    description:
> +      Positive reference input supply for REF2+. The voltage range is from
> +      (AVSS + 1 V) to AVDD1. Together, REF2+ and REF2- must provide a
> +      differential reference voltage from 1 V to |AVDD1 - AVSS|. This
> +      reference is used by channels 4 to 7 on the AD7768 and channels 2 and 3
> +      on the AD7768-4.
> +
> +  ref2n-supply:
> +    description:
> +      Negative reference input supply for REF2-. The voltage range is from
> +      AVSS to (AVDD1 - 1 V).

For all of the supplies, I don't think we need to repeat so much of what the
datasheet says. It is getting quite noisy and makes it hard to see the parts
of the description that are actually relevant to how the devicetree is to be
interpreted. (includes VCM as well)

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to the active-low RESET pin
> +
> +  start-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the START pin. An active-low pulse on this pin
> +      synchronizes the device to other AD7768 devices. When not used, this
> +      pin must be tied to a logic high level through a pull-up resistor.
> +      When used, SYNC_OUT must be wired back to SYNC_IN on all devices in
> +      the synchronization chain.
> +
> +  sync-in-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the SYNC_IN pin. Receives the synchronization pulse
> +      generated on SYNC_OUT in response to a START pulse. Must be synchronous
> +      to the MCLK clock domain. In multi-device or daisy-chained systems,
> +      two successive synchronization pulses must be applied to guarantee all
> +      ADCs are synchronized.
> +
> +  sync-out-gpios:

Unusual to have an output pin connected to a GPIO. Usually this would be an
interrupt or trigger-sources.

> +    maxItems: 1
> +    description:
> +      GPIO connected to the SYNC_OUT pin. Outputs a synchronization pulse
> +      synchronous to MCLK in response to a START pulse or SPI_SYNC command.
> +      In single-device configurations this pin must be wired back to SYNC_IN.
> +      In multi-device configurations it can be routed to the SYNC_IN pins of
> +      all devices in the chain.

Although this description makes it sounds like the SYNC_OUT pin is only ever
wired to SYNC_IN. So wouldn't be described here at all.

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  adi,data-lines-number:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8]
> +    description:
> +      Number of DOUTx lines used for the high-speed data output interface
> +      (distinct from the SPI control interface). AD7768 supports 1, 2, or 8
> +      lines; AD7768-4 supports 1 or 4 lines. Defaults to the maximum number
> +      of lines for the selected variant if omitted.
> +
> +  regulators:
> +    type: object
> +    description: Container for the on-chip VCM regulator.
> +    additionalProperties: false
> +
> +    properties:
> +      vcm-output:
> +        type: object
> +        description:
> +          The VCM pin provides a buffered common-mode voltage output used to
> +          bias the analog inputs. It supports three fixed output levels of
> +          1650000 uV, 2500000 uV, and 2140000 uV, as well as a
> +          supply-dependent (AVDD1 - AVSS) / 2 output derived from
> +          avdd1-supply. Select the voltage by setting regulator-min-microvolt
> +          and regulator-max-microvolt to the same value. Use
> +          regulator-always-on when no DT consumer node references the VCM
> +          output. The VCM circuitry is associated with channel 0. When VCM is
> +          used externally, channel@0 must be present and kept enabled because
> +          placing channel 0 in standby disables the VCM output.
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +  io-backends:
> +    maxItems: 1
> +
