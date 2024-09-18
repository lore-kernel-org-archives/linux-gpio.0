Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5DE176259;
	Wed, 18 Sep 2024 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726649739; cv=none; b=hShsGOARppzZ/X8T6GSn2aq9Dug2bGXBNefcMwn9eggcqvsAhLDyslALLHgOZX9E0ohPwekA8k3OCeOlKw3lGGmJmTGW/5R6hQLS1nWX+AqVdxTVJ72GEmJmglawUL91QV3j777B/JfVTUz/wBWiwGaCsj86xmns9F/Fiq3u1bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726649739; c=relaxed/simple;
	bh=p4BtcUQEMRuKzAnWnDWhnr8TgQuevzPI5xRDhaISlsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+GB23I8usYiTUT8aPnm81X0H2ikQip8cMYdGknThA6oF0JgZcRetFPTUNv130dKX0M+UXpB/qHubBdryzUZaaKp59fNOrAsXFTUi2gW92oMlMvk/cLYm0zhVpNt4V3B44oWwrSYHQIDgigmdL86z30euLDgwN+DPHTOUhEfDdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CgU0y1q+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CgU0y1q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=kndYrYYqDkcp0197Z0G5UQyfDrIiCK/y6NU5mK/gTYQ=;
	b=CgU0y1q+nDKb6SY1S+EW7QzMKUFSwVH/gQMUgNJ+ex/NexpfQTJ6EnKeEhUwNC
	zGUJwLAih+oCxfm/DJIzWJ3Ut9W/UzxLI2nGKbEMbSCJ5jUMOPnaGE3bl7+5QsuC
	3PhlsFtV8wEB5azw9pGls207mzXTzXbMReehhU5p5ent4=
Received: from [192.168.31.242] (unknown [27.18.168.209])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wD3n2PBkepmzEcuCA--.53176S2;
	Wed, 18 Sep 2024 16:39:32 +0800 (CST)
Message-ID: <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
Date: Wed, 18 Sep 2024 16:39:29 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
 <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3n2PBkepmzEcuCA--.53176S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWxWF43CryxJFykJw13urg_yoW8XFWxpw
	4a9FZxCr1xursIyryaqF90gr13uan7uF4jgw1ak34UJr43XryYkwnYqrW8XryDWF4Sq3y0
	9r4Fq34I9r1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRrb15UUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJwheomXAn32U0AAAsQ

On 9/16/24 11:52 PM, Krzysztof Kozlowski wrote:
> On 16/09/2024 08:47, Ze Huang wrote:
>> Add pinctrl device, containing default config for uart, pwm, iis, iic and
>> mmc.
>>
>> Signed-off-by: Ze Huang <18771902331@163.com>
>> ---
>>   arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 +++++++++++++++++++
>>   arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
>>   arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
>>   3 files changed, 336 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
>>
>> diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>> new file mode 100644
>> index 000000000000..0737f50d2868
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>> @@ -0,0 +1,316 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
>> + */
>> +#include "k230-pinctrl.h"
>> +
>> +/ {
>> +	soc {
>> +		pinctrl: pinctrl@91105000 {
> That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
> that's preferred coding style in RISC-V or Canaan?

Pinctrl-related nodes were separated the for ease of maintenance, but the
convention in Canaan is to place them in the board-level DTS file. Would it
be better to stay consistent with their approach?

>> +			compatible = "canaan,k230-pinctrl";
>> +			reg = <0x0 0x91105000 0x0 0x100>;
>> +
> Best regards,
> Krzysztof

