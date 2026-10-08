Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44B430E0FC;
	Thu,  8 Oct 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453916; cv=none; b=GEBjQ3aHfdArgbykuabI4R7z8e8mSC7ryFWSbub6E40/Uy6b7N4NWuxBMaRrMmiqL4pXtOjlOUYuii/w/5P4mnKC7a6QDq3jdwYNUjFj1ZBw/DcfRHxc78xA2yC/rgZL9S8GXPM9bkZxByVbdJqd85WTyjsiW9raZx9VtAgV9bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453916; c=relaxed/simple;
	bh=9yshqY0UsvsN2Mu7vdC0H+AY9MBl3HX2n35HE4yMhMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL8KocperhFAd1KSzt4H5z+jPFIw/nI+lRoadgoCU6VADs6V2AFNQy6x7RsnwZVf2UxOkxF3Kv8xdIdVTOdwkWXai2hDureNxovXolQaN1SmkE5dT7ZyxLsErh+OQe4xbM6v/Ym9fqSVcCwn/yGCsRuqrlYAVZs1l0eXPDUlfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AOURYJ4R; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AOURYJ4R"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995AF1477;
	Thu,  8 Oct 2026 03:05:02 -0700 (PDT)
Received: from [10.200.189.43] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 456533F763;
	Thu,  8 Oct 2026 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791453906; bh=9yshqY0UsvsN2Mu7vdC0H+AY9MBl3HX2n35HE4yMhMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AOURYJ4RFZP2eUpD9e3naQX9rcXMBm4r9ZpeLyLg9mN0ienQYSL3PYRj5KN+WBfe8
	 JvHtHFmAAfmzMlFtlmoHLrDURDE7yUaSOugZ7DKeupGFwo/+SS2/aPVc6B8fA4k3jS
	 Gqivs41alLwZ/RIhwpfzrVbzgCYgR7VbvtJNBmDk=
Message-ID: <c031b259-e6a2-4eed-8174-b7fdb4075646@arm.com>
Date: Thu, 8 Oct 2026 12:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
 <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
 <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

On 10/8/26 11:21, Linus Walleij wrote:
> On Thu, Oct 8, 2026 at 9:50 AM Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> If you mean to just drop the allwinner prefix: this has been discussed,
>> but NAKed, because the generic property carries a different semantic.
>> And implementing that generic behaviour in the existing sunxi pinctrl
>> driver would be quite some effort (read: a rewrite), without any obvious
>> win, so we decided back then to not boil the ocean here, and just go
>> with a special property.
> 
> The point to switch over to the generic "pinmux" property would be
> when a completely new SoC series with new hardware arrives, so that
> it is significantly different from earlier iterations.
> 
> I don't know which semantic with the standard "pinmux" property you
> got hung up on though remind me?
> 
> The bindings just state this:
> 
>    pinmux:
>      description:
>        The list of numeric pin ids and their mux settings that properties in the

                      ^^^^^^^^^^^^^^^^^^^

it combines the pin number *and* its pinmux. For allwinner,pinmux we 
just carry the pinmux bits. The generic binding makes a lot of sense, 
it's just not very appealing to the existing sunxi pinctrl driver.

Cheers,
Andre

>        node apply to (either this, "pins" or "groups" have to be specified)
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> It's just an opaque u32 array controlling all muxing for a device.
> There could be one single element in the array.
> 
> Yours,
> Linus Walleij

