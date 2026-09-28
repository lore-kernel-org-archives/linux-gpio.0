Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C064D954F;
	Mon, 28 Sep 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604741; cv=none; b=GD/CDlNckJQa/SImjd9sRCOFy0SS0fUKTnylNHral5F84X+RBLihgkRbkfkPFcccHSwKbZuMm5Tl2fMNPnFdE+Ig+uKOmgZ1qqFVILm/c8sajz+iYuvG5ljOOfl1ahouZrKo75+AnhyaVwI7H8JBbo5Bd0sEnLyIy+jW4V3fyb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604741; c=relaxed/simple;
	bh=rEYYJFbIuLsi0VKUK8LBbQUGCNwkgJPeDuTsVEKrsdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbF7c7Vkqlp7b8cPHLFKMsEw5VxmBiBgPvqup3YNFPZrQEoyeqJ31o1mQY5VF7V80mFpEfzUb5xT34iqBjiE0KZHcb4YYeYPcmZ1vJhhVpdO8+gM7qIIwcvAa3A+KlcXfUiv7j6FhhRmXXPsjCdnDLy/oGJUXDOQNq2v0SVxuE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FqGKF+g9; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FqGKF+g9"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63680102F78;
	Mon, 28 Sep 2026 16:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790604733;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Iue+XSYCya8VUiQZMGubQW6H+Q0XS2fIhg9CPANr+eQ=;
	b=FqGKF+g92fX11yKaZtVMc6+lKzjTYtzrtTzLOJm0Pt9KUYdT4qvhtwAIGkDy/EG8BzjVMq
	gF/m7/9mYFZZX1YjbA8gQS0vsRputkWh/BvCtkegfFo5T/zUqiECwQx9QrnVB158/wfaix
	uZR2yPMIdNJNJlbWWOwbpJ4Jf8kc7hT5d1ilsNASmTkyS9jMuzQQhppedM6MELgD4e9ocP
	36Cd7aCMArvXGanpZ3GRq0mtCzHinFLMvHsbujAVPubhVUe6WsuRNuF7MX0SAH7HJO8Y3l
	qxxsnOD7gHlcVL8ElsKDAV+m983W6RI1KJMR/Z39ILE1+gNfst0cBWK5ofsyGw==
Message-ID: <b2ad62b4-1858-462c-b249-8c6e87126847@nabladev.com>
Date: Mon, 28 Sep 2026 16:12:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: st: Add pinmux nodes for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-9-marex@nabladev.com>
 <502b58ee-2421-41d2-bdfa-a870ba8e325c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <502b58ee-2421-41d2-bdfa-a870ba8e325c@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/28/26 11:02 AM, Alexandre TORGUE wrote:

Hello Alexandre,

>> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/ 
>> arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
>> index 456ece7f8ebc3..1aadbc6b47da9 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
>> @@ -182,6 +182,30 @@ pins5 {
>>           };
>>       };
>> +    /omit-if-no-ref/
>> +    eth2_mdio_pins_a: eth2-mdio-0 {
>> +        pins1 {
>> +            pinmux = <STM32_PINMUX('G', 4, AF11)>; /* ETH_MDC */
>> +            bias-disable;
>> +            drive-push-pull;
>> +            slew-rate = <3>;
>> +        };
>> +        pins2 {
>> +            pinmux = <STM32_PINMUX('C', 5, AF10)>; /* ETH_MDIO */
>> +            bias-disable;
>> +            drive-push-pull;
>> +            slew-rate = <0>;
>> +        };
>> +    };
>> +
>> +    /omit-if-no-ref/
>> +    eth2_mdio_sleep_pins_a: eth2-mdio-sleep-0 {
>> +        pins {
>> +            pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* ETH_MDC */
> 
> I assume it is G4 for MDC ? If yes I fix it when I apply.
It is PG4 , thank you.
