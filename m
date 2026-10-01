Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8218EF4F1;
	Thu,  1 Oct 2026 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857888; cv=none; b=XY4rdX5Z7gtybivWF95TKHZ1o8OtV65kdsGB86fZKuftUXuqORgLk0EVwNdJsYSuI/LuYMcSmiuiZs2I4iZQCQLfFOvxpATcEjXMlanHlQ7OLOk6rHbLMvC4Y830sj3FPYs5T4vafGsaN2Wyy3Il8dOopzSiE+Qry1GhvY8p/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857888; c=relaxed/simple;
	bh=eERKWhF85t94Bs7+PLZLWpYGNSLRDVTFxjP7kuqbi2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O82GdeoGnbAJDHkQb0BICLgmZo07jrvslNXKmws8oBnfIhgu3bcgSFoqsnbavQHpYiL1EQFkNJF0e8Vo+RbQnrmM89J86HNCGU2Yua32CrvT1P+3lhD0plJlT5HOb33m+MRIgl4fEw88bc63Ic69zOUuqq30iAqMaDu7I+y3DNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YDDMJ5no; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YDDMJ5no"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9E2497;
	Thu,  1 Oct 2026 05:31:22 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DCD03F959;
	Thu,  1 Oct 2026 05:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790857885; bh=eERKWhF85t94Bs7+PLZLWpYGNSLRDVTFxjP7kuqbi2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YDDMJ5noT9LRN+ABKXzOFFVO4Gzf23cFQ6JGn4tFKTHHb4RNAOJoCPsDUaI7h4JYm
	 Dk/O9jDw+L3A0dNXfnakaOtM9g4lhSmVVo/WKhsvQjRsqZHW7uk0KIIdt6UrFWVAoH
	 2WJWT0mcCpXOuGbS/HyA59sR21t9nK/vaysmWLTY=
Message-ID: <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com>
Date: Thu, 1 Oct 2026 14:31:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260929203634.32998-1-pmazzini@gmail.com>
 <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

On 10/1/26 14:06, Linus Walleij wrote:
> On Wed, Sep 30, 2026 at 5:27 PM Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> Yes, this is a known issue, and I already provided a quite different fix
>> for this[1]: the A523 manual actually lists a PortA GPIO interrupt, even
>> though this is pretty likely not functional. But specifying this IRQ in
>> the DT fixes the problem as well.
>> The DT binding does not say how the IRQs are assigned to the GPIO ports,
>> so from that point of view my solution is similarly usable as yours -
>> though admittedly yours looks a little better and more future proof.
>>
>> I guess we now need to figure out how we want to handle this in the
>> future, and add an explanation to the binding. The A733 has a similar
>> problem: PortA does not exist. This time the manual does not explicitly
>> specify a GPIO IRQ, but conspicuously leaves a gap before the PortB GPIO
>> IRQ, so we can use that as well.
>>
>> Linus, Chen-Yu, Jernej: what do you think?
> 
> Can't we do both patches? Maybe there is something I don't get with this
> code...

Well, if we change the DT and the code, they fight each other, and would 
be off by one again. So we need to decide for one solution, and since 
this affects the DT, this has compatibility implications. At the moment 
the code assumes that GPIO IRQ counting starts with PortA, regardless of 
whether this implemented or not. That does not sound very future proof: 
while A523 specifies an IRQ for PortA (even though it's not 
implemented!), I am afraid future SoCs might not.
So having Pablo's patch would make a lot of sense, but would break with 
the just changed DT for the A523. That former DT change was fine, since 
it never worked before, and the new v7.2 DT should work on older kernels 
even.
So we could revert the DT patch, and take Pablo's code patch, with a 
Fixes: tag, but that would create some broken combinations meanwhile.

And in any case we should add a word to the binding document, to pin 
down what's expected here.

Cheers,
Andre.

