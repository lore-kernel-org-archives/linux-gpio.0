Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F799492E31;
	Thu, 10 Sep 2026 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047115; cv=none; b=bAMLUFnfM7ROPIrtfKg1xXfmh63KsYY/JpIN800jiET9A5CGjpqFR+0ns0hC/t9XDyygxDzvuhd2SaZVyaDOCei+SqK/XZrF3zxeOe4u+K6KgKSiXWWrE08VU90C3UtCPFohcns1J6M0vqxD8abTiGlUXnJXDDv4Fr3ZrY68N1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047115; c=relaxed/simple;
	bh=q2y1E+jfz+e2loPgk5uTMKvJJpPn2qFQADreOTA75TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqfthMLuBWXAgSo0VjRF8lgyvctTDv8BGBltXCPzJerHcHhboRiFqWtAL1XpnAYM8Fex63+MXn+T/p6ePnKkTvvMbd7beL1O3LjETY86G4IsUKj9zHMFWExyvVcenRp4/RTpfZppyVpkMT+yOYLI727UbrmJcXwIAjCzA/3R6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LH9up4Du; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LH9up4Du"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAF2153B;
	Thu, 10 Sep 2026 06:31:48 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7201E3F528;
	Thu, 10 Sep 2026 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047112; bh=q2y1E+jfz+e2loPgk5uTMKvJJpPn2qFQADreOTA75TE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LH9up4Du6y4lg3MG2LYVykgQw0LKCGzFD7zHgyyrJrMa0ENvf0EYwGNnyn2inXtKw
	 jPfnW+q+TLHjAisKlgb1xbRyeNUguD1docHILvcFytT8kkTNw1e1N0AYWs7+xTAP1m
	 +tGr4x8OHatjQ5Kj1/wEKH3r9C8hDRgVcnc8z/2M=
Message-ID: <82b2541c-ea6b-41d0-89b1-ecf9a9920cd9@arm.com>
Date: Thu, 10 Sep 2026 15:31:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible
 string
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-9-andre.przywara@arm.com>
 <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julian,

I know this email is almost comically old, but still didn't want this 
left unanswered before sending a new revision:

On 8/24/25 01:09, Julian Calaby wrote:
> Hi Andre,
> 
> On Thu, Aug 21, 2025 at 10:46 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The secondary Allwinner A733 pincontroller ("-r") is interestingly not
>> using the same new MMIO frame layout as the main controller, but is in
>> fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
>> each. From the driver's perspective, this is all we care about, so we can
>> re-use the a523-r pinctrl driver for the a733-r, too.
>>
>> The individual pinmux settings are different, so we must not use the
>> a523-r compatible string as a fallback, but we can surely let the same
>> driver care for both the a523-r and a733-r IP, as the pinmux values will
>> be provided by the DT.
> 
> If the bank and pin counts are the same and the pinmux values are
> provided by the DT, that means they _are_ compatible, right?

I wouldn't say so: I would argue the devices are different, and not 
necessarily every driver written for the old device can cope with the 
new one. For instance U-Boot still goes with hardcoded pinmux tables 
(because that's simpler to implement there), which don't match between 
A523-R and A733-R.
And I would see a point if that would enable old kernels to use that new 
SoC, but because the main pinctrl is different anyway, that doesn't help us.

But it's not a very strong opinion, so if the maintainers disagree with 
me, I am happy to change that.

Cheers,
Andre

