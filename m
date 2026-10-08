Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996BB3D5236;
	Thu,  8 Oct 2026 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445853; cv=none; b=d2jVC1K9gJ/mrMuY0+BHsS1GM442+nAG78LZ1Jrg4INVUMjCqjFzcparKibaAI6aGoISidQ/zZ4NB/EDI67jVl01qciMbrspFd9R0Y3AqMJfMJSqfQc3NObGQrr5eZpJr7tlvYywi75d0ntVcFNBakefst0csuchtJQ3so7m3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445853; c=relaxed/simple;
	bh=M7FNo7bgBUiaWI/HcaQdIdCBXfKJLk20mb3qyz9nUno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObD4j4bMPzxM88/ZA60pfWMyDDui/3bHFlK9u5WY2A6uFLlkkUII6y94Ff4rMSNXNfDSYxssks1SJnZpR+HlkSude40Mx1jmW9K0+ak1Livde4qQMjKOLrjRse4Gt8p8gaciD6ZlxDA2pXrX5J4t5iDH7qlxMgOsUUUaS7CWg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WruXY8bo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WruXY8bo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906B61516;
	Thu,  8 Oct 2026 00:50:47 -0700 (PDT)
Received: from [192.168.178.72] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 919353F959;
	Thu,  8 Oct 2026 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791445850; bh=M7FNo7bgBUiaWI/HcaQdIdCBXfKJLk20mb3qyz9nUno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WruXY8bopBSNctghFvI9GjTqI11dUVfJNNXm7mmPDtfD+stzVxn15wyrJqYoJoAbM
	 dc4UCzdiloByiV4ihV+DpAtpow+9tmDOHN1OmU15LZfRMWAy3cv/FyXuqNNgmC33Af
	 38uGRqrsjRkL7XEBmLtEKfw5g8VV96G9cwXmkj/U=
Message-ID: <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
Date: Thu, 8 Oct 2026 09:50:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
To: Rob Herring <robh@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/7/26 23:16, Rob Herring wrote:
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
>> The B288 driver takes its mux values from the DT, so allwinner,pinmux
>> becomes an allowed property here, required for this compatible only.
>>
>> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
>> ---
>>   .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>> index 45b7a0b6c626..b1f093d218f5 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>> @@ -39,6 +39,7 @@ properties:
>>         - allwinner,sun8i-a33-pinctrl
>>         - allwinner,sun8i-a83t-pinctrl
>>         - allwinner,sun8i-a83t-r-pinctrl
>> +      - allwinner,sun8i-b288-pinctrl
>>         - allwinner,sun8i-h3-pinctrl
>>         - allwinner,sun8i-h3-r-pinctrl
>>         - allwinner,sun8i-r40-pinctrl
>> @@ -120,6 +121,15 @@ patternProperties:
>>           $ref: /schemas/types.yaml#/definitions/uint32
>>           enum: [10, 20, 30, 40]
>>   
>> +      allwinner,pinmux:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description:
>> +          Pinmux selector value, for each pin. Only used by SoCs whose
>> +          driver takes the mux values from the DT instead of an in-driver
>> +          table. Almost every time this value is the same for all pins, so
>> +          any array shorter than the number of pins will repeat the last
>> +          value, to allow just specifying a single cell, for all cells.
> 
> Perhaps new platforms should move to the common 'pinmux' property?

If you mean to just drop the allwinner prefix: this has been discussed, 
but NAKed, because the generic property carries a different semantic. 
And implementing that generic behaviour in the existing sunxi pinctrl 
driver would be quite some effort (read: a rewrite), without any obvious 
win, so we decided back then to not boil the ocean here, and just go 
with a special property.

Cheers,
Andre

