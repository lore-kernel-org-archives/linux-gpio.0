Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427567;
	b=XgG2IdgfvR/sXHcCnejFeJns+1+c5+SUuu4zKH12+MtF0Nk0/a9yLxaQd2hIUzvApOj+
	 5NZ3XMmnq+xeLM4qDddP1Iiq3MtZvWZuJ6Eruo60thB3H5BamglAylT+HVLA0sFt+vkPD
	 JJaJIZ6rYQz/giqOwonAN5vZPK0jqRue5UR5e2X5bUHoMxhfJ6uhHhoIIj1pIcLprKfGE
	 IDC6gffZAz1SzaUk55rZnggdfC2smtbhgH8I/SpQwnmYyB1cuIcOKsGzGBOqn85DXu2Ks
	 Fc4EcU9DjifhdQ5f4yDOOSwfUeeWok5jIZXGNBj32Gg6M76tO4RcP2zn6LKFSnH14AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
	b=f8yzX9JZjzSGShQxH4Io81QcNHU3ZzQX4BuAEz9ABOgua22C0ErnyirUWpYr5UoOOYr8
	 Y+XEs4+RafxgrIR7bXVnQfQbiuJDbvDGKgGX3N8dnTYrTi7prucaXtJr9BHMERjmnp+Q2
	 hCoMMVKdG2gVnE6ttMt/em446u0ST29qcR+FdGvqgn5988k5f5RpMVkicN44zd+Mkluy0
	 oxi9uCHBlI9Zb4UctmJDX1hcEyl/jY6t/eJ1mvhG3V+LW5XhQ/W7A3I+ggei0S7wFRdcJ
	 OLcVSsuAxuVk4Ijl9QTM8S8krXZXKqQt6j0yJ83RExf7tqvhIWoP0ZhbvYWZAFGcNfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uihAlf9K;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C321606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 16:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C321606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uihAlf9K
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1920120f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792427565; x=1793032365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=uihAlf9KMF1E7leWuq2ziF+jrvFzjVQh7yDYYwzmE3kGwVMD/K26Cbe/WTxyj+aj7T
         mAesrIGwyR4p4Ql43E484qxEkEgCc0OkE9YMJdVzd0q1ccVEqcLEq3T7yJPl0GDq5V2M
         VjoLaMO1/sSM9Xw0782GHEKPJDIi+C135kZe6YY73odVwoBYIbX6GUimHcMSomwtinBM
         qKmut9yiRk+wIbHsrkMrx1UWH7snwPL6op9IUbn8BCco5lV+VMY0sdLxsYG91VuGKJcF
         hK4ft3UJvUPrYuW9Afwdl5axq6UN2qcIMClH3N+BNIuY2d/Yl/VQCVizt+5p/aBByBlZ
         V6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427565; x=1793032365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=Ih/YfNKYzEcc56EzuwBHb7zeXtQ/sLXjjp7lPP5vB8rL7OV4yVVErwxt0H/yPljZA9
         opJVBfhwmicAbE2r6TDLEaV9e1JeV46FUORmlv7aXO183VEt5ImzEZqvMJWwhyMRGTVN
         qrDQpIPLf53zC9EzCwtbn+tWCnajiOLJl6a4vEZqhhYA5Yl/+lM7/Kd9D8KdKrcxJKFV
         mqRbnqIHZNNhN6Q9LbJ8HrFXGajSUjKCBd0Bpxk7T67MUqDWca44t+7CQJNR9+eL/KZw
         mntutsmpuE4ARNy47I9CXZ/dfA9PJ/Li7NjICExI2Y6c9MGTGusFZY8XgJL4v41sICTp
         LlYw==
X-Forwarded-Encrypted: i=1; AKwUvBzDm+hzFP6FOGXYPie/nBMpLfNHLGsmdpiaSB15e+mxvmbaz3zve0sfZAbhiYc2jU9BTMbLlFYpba10@vger.kernel.org
X-Gm-Message-State: AFq9FYJvO5HTbMyJXgvndWLkBjuzYRIZ9T6+fVfkSv4z0QQhnGD/h9mV
	mCt7etwpf1MQP7VK47kVblhazGrcdk/6BMzdKxQQfJWtrla1VN9UALQTuxOr8Bq4reo=
X-Gm-Gg: AYBFou25iI0ffU381V+WzHNWPtEsHDmV7X9XQ4SGTSb9QNgFh05Rm7oRh8LOJxSU1+7
	5EjBSNQhXbYwdKxAG0NAjtDM2jPArUW6MIIYFRZ6ksa2t3KDwPYGSaCTfqMcKz6slk3vE9dNcf+
	X4TOElGV48y/TQCRM0JOsV8Cxh9zgd0SAnKbNh53o2JeRYx+4hZ7/ya8nuVuosIIknS6xyR3K0D
	KXfVlLC/UjyfIaVmdw/gAxYfHcclqYDDBErY0fdjd3ZtJOWrJ9VfkLkULnLSLygjFjZyshEwvXD
	9W0wtOFx+BCxh8JZ4WROMxAxjpqsXaVULYyBaxowpgg8lJWAefoEyXAJbqXkXpKzODHlkAFmTI/
	0TqVRMXm/WsBZnBzeo0UlWgYY9W0Bg/BcJo1tqxemGW1ov2pEn3GkrilX5QigwFtT15UnCtJm3V
	x3HMc7hEorkfCSWRE0aIWQkN9kmHNRYn49vahYXUXx4SyaxMgL/FRc+rFacVIQPI0cRFyg3EU1p
	xXjZEbLCmMEr9aytodnL4eB2vQdR0LZ0vFfie1b2ztE1nFOfXx4vhvxT0gYXg==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr209137105e9.4.1792427565319;
        Mon, 19 Oct 2026 09:32:45 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm3538555e9.8.2026.10.19.09.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:32:44 -0700 (PDT)
Message-ID: <ee975969-e310-4950-af09-f57fb423a9f5@linaro.org>
Date: Mon, 19 Oct 2026 17:32:43 +0100
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
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Ettore Chimenti <ettore.chimenti@linaro.org>,
 Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
 <20261017083957.7c2696f5@kemnade.info>
 <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
 <20261019154503.2111a89c@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261019154503.2111a89c@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2026 14:45, Andreas Kemnade wrote:
> On Mon, 19 Oct 2026 10:36:37 +0100
> Andrew Goodbody <andrew.goodbody@linaro.org> wrote:
> 
>> On 17/10/2026 07:39, Andreas Kemnade wrote:
>>> On Fri, 16 Oct 2026 16:41:21 +0200
>>> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>>>    
>>>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>>
>>>> USB node was not working correctly with DMA enabled as the supporting
>>>> code had been updated without updating this SoC's device tree. Bring the
>>>> device tree more up to date so that it works with DMA enabled.
>>>>
>>>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>    arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>>>>    1 file changed, 25 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> index 7f3ef3a00ab8..5be9efc60785 100644
>>>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>>>>    		};
>>>>    
>>>>    		/* NOTE: USB needs a transceiver driver for phys to work */
>>>> -		usb: usb_otg_hs@47401000 {
>>>> -			compatible = "ti,am33xx-usb";
>>>> -			reg = <0x47401000 0x400000>;
>>>> -			ranges;
>>>> +		usb: target-module@47400000 {
>>>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>>>> +			ti,hwmods = "usb_otg_hs";
>>>
>>> Why do we still need this? It is depcrecated.
>>>
>>> Regards,
>>> Andreas
>>
>> Without that line we get the following on boot and USB does not work
>>
>> [    0.110148] omap_hwmod: usb_otg_hs: no dt node
> 
> It is somewhat odd to use both ti-sysc and hwmod. It looks like a
> half conversion.
> 
> For an example how usb_otg_hs was converted to ti-sysc for omap3, look at
> 42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977...v6.1-rc1
> 
> It has no hwmod stuff left.
> 
> Regards,
> Andreas

Thank you. That was the pointer I needed to sort this out.

Andrew
