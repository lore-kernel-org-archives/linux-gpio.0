Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E0044C4F8;
	Wed,  2 Sep 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345179; cv=none; b=NROXjbcw2n7q73pAAR9QOSO9fNZh9Gp8HbCORGrFjHvGQNZF9nE9mR1XCMfZ7VpURek01qQDBNScUVzUpWTXn+uBg+kxwUfzo4DudTFv1BrIlJ7ead9IZaVWFzyrsk13PztHd8OttWDyDNEzb2WdoxVZeM5/4gBvcWltFhklQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345179; c=relaxed/simple;
	bh=5JBdUXJJvuEcp7tks5LrPonCifHKYKUHk8238daTmPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1I7xKqef1IEb16d0nZ5gnHIi5q7slECJlwxVHlEp0UkY40ErTsH2QJ9C0tfgZlqfmDyl3e++xy1zSzPk6HFntYGY8TFlWsu8aEUUX/QnQ7cawdy2fEhsbR88muHYWlHmMwbDdgmT42WrHHKlltaz8qHW/OFiMUvJ2mUDW+9crE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KtUiesOt; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JtpdZrUu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KtUiesOt";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JtpdZrUu"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788345167; bh=5uz3wkS/ty/h0Bcac8Dx4yE
	3FbjuVmTiQdoAOiTMxqE=; b=KtUiesOtDT7UctWzL4v+NT9d3y1LAbgbMetq30v6t/iN3S8C28
	hwvOM/POgC1Gfiw9DgVfVhWjVbhBFOrAjlaxv6wJXt/Ht6AomGHzR0+43KKDQCB3+9NQ9mYboWP
	0FkZmo1ZJ3k7/csi9RGvyJUJjOMhuOlytGGO2RKFBNczYwIpuolTV1nCZYyxkOwqX1QOdK+YK9E
	zVZCaTiuQ1sfAmJ0bFHYBFpcu0UmQScvSsdkjEJIbzLTPvz+4/wiyMambvy8/YEhVefKllPkTTq
	WAgf0V4+9CkVHdXxQsHaos33tcOn8agsGabctKh3GM/s+86uKfjN7YGseEeBUPW8wVA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788345167; bh=5uz3wkS/ty/h0Bcac8Dx4yE
	3FbjuVmTiQdoAOiTMxqE=; b=JtpdZrUuGXvVq7vn0XlP/nAlOO7Azkg3709+nmqgsbs89ZVawv
	8D9W3oTnkanUpW1Q/cI9cMDCM6tLosS/b5CA==;
Message-ID: <a5956f0f-2842-4b80-8bcf-8763836618cf@mainlining.org>
Date: Wed, 2 Sep 2026 13:32:45 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add pinctrl support for MSM8952
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
 <CAMRc=MdKT4RAWdtZf87k5-VbXAZePT2yttf2QPWgRJaowKuDTA@mail.gmail.com>
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Content-Language: en-US
In-Reply-To: <CAMRc=MdKT4RAWdtZf87k5-VbXAZePT2yttf2QPWgRJaowKuDTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Sep 2026 08:59:00 -0700, Bartosz Golaszewski wrote:
> On Thu, 20 Aug 2026 18:37:50 +0200, Linus Walleij <linusw@kernel.org> said:
>> On Thu, Aug 20, 2026 at 1:17 PM Muzaffer Kadir via B4 Relay
>> <devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>>
>>> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
>>> has some differences in some of the pins and their functions.
>>> This driver was tested on General Mobile GM 5 Plus
>>> (shamrock) using my own kernel fork [1].
>>> I'm holding off on sending the GCC (Global Clock
>>> Controller) driver and initial device tree until I've resolved some
>>> outstanding bugs in the GCC driver.
>>>
>>> [1] https://github.com/kadir1243/linux
>>>
>>> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
>>
>> Bartosz needs to look at this series, he'll review and merge
>> it.
>>
> 
> And to that end please use scripts/get_maintainer.pl to get the current list
> of maintainers for your patches.
> 
> Bart

Hi Bartosz, I did run b4 prep --auto-to-cc before sending the patches. After seeing your message I run it again to check and it said no new addresses to add. Should I rebase on newer tag?

Best Regards,
Muzaffer Kadir
