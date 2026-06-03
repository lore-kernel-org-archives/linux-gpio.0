Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2618472;
	Wed,  3 Jun 2026 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474779; cv=none; b=lty3YuNbCfKviaKU8qW8DcD4PFOHSM0zQVx1+rinB653mqD1RhLM35XHlkn5egw/lg0+4uchFjm2fMqpv1ezUXovpajcr6G2QdjDzmtAQqLE+8cGaqxfdrgu67oGfjeBTsOy+XOCTjfD+sTicGYuzNnsqIw1YOHuJFzcGN/X1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474779; c=relaxed/simple;
	bh=nWwjS8Mr20fDWKSL0zfgfubdVpa6oMYco7fA71M/hAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrkX6Ci346Gu1YicPzXX4GfBMle5pWQr0iiwaAXSBF8lEhyioNiYAp8nmqLOthDHAqbqTtlQ5L8j5RtLArPFMsLBb3I5tOt7TH6thj18K4gWBO54fkIY0ArgrAbRjMZsiP4+NOe6yrgio7ojG3Au8IU1KrkLrSMsupTqbzwspoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWvm/YIk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWvm/YIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919751F00898;
	Wed,  3 Jun 2026 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474778;
	bh=JcYA2oFILzb6weg9P7dCyayz8oFLadaOOZdee5CSgOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SWvm/YIkETWsR0+HHd1o6beNzkUd/KKdobYbOCh05Lm+8gIhs4MeR+3xEl9obrGdG
	 AqcHLpG+OjWP2m7BsJBU+w0xU5V8XWaQZdVFMqF2foRkSTVshRUZ3jBL06Yq4ZYkKZ
	 r3ejsSBdm40Il+8NXJWCnIJBhRXtMKtKnoJ8damxm3i8IVOV7xGr7zopfE81FnvcvM
	 2+SwgmTWA9QHrG56g+yJI4cAMWTZ77P1vkUOCmIEYxu9VzCwF3xUNQxzB5PFWANCy7
	 LbG/3gyg1Jk94lM2BPOHAWJZMO7miFmlMolxUJO+8WE8gW6PUUgS3eB7MGF/ut7272
	 6j8u8jBMoB40Q==
Message-ID: <096df078-1027-44f2-b02c-c0a27b646a87@kernel.org>
Date: Wed, 3 Jun 2026 11:19:33 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-2-claudiu.beznea@kernel.org>
 <ah9BkQjUKwZ9KXMH@ninjato>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ah9BkQjUKwZ9KXMH@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/2/26 23:48, Wolfram Sang wrote:
> On Thu, May 28, 2026 at 11:04:33AM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The current functions used to get/set the pin power source check the
>> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
>> code to be extended for other power source functionalities (e.g. I3C on
>> RZ/G3S), generalize the functions used to get/set the pin power source.
>>
>> For this, introduce the struct rzg2l_register_masks data structure whose
>> purpose is to store SoC specific register bit masks. The members of this
>> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
>> corresponding to a SoC specific power source capability.
>>
>> The conversion between HW specific power source values and SW specific
>> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
>> rzg2l_ps_to_pwr_reg_val().
>>
>> Finally, to keep the code generic, the register update in
>> rzg2l_set_power_source() was changed to a read-modify-write approach to
>> cover all cases.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Have you seen the comment from Sashiko about this patch? Doesn't sound
> entirely wrong to me...

Indeed, that should be fixed. I'll add a fix patch in the next version.

Thank you for testing this,
Claudiu

