Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE4C46C4AE;
	Wed,  2 Sep 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345733; cv=none; b=Ij91XhB9P9K8TWQyt1HTzNA4ffmxOl92V7MWczMKwPh1nPSfUQrKV/RB4el0+tg1IqaR/VoU7t3Lgx+ZUAVra9ZWpWumb3iktAn4G9v1s7JlKVUkZ/rKirTS3viv1Mpl2+2SWWCVX0ax0CmAhnH+iBZe7dMTm9Da7spYLMegAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345733; c=relaxed/simple;
	bh=rxND3ZAr+oYZRgJHJGknZR4Aewx4zK2E6tokev7TZMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q35m5ouY6INZ0/yqzzDBqgL39lePBSAoK2vZjD4kFRD+mjcndUyNqnJVq5AsrYiBXtGLgbmAOG0HeWSbTCEprOIu/i7ljnGIM97iUVhJm1eMVmMc/Zv1rBXgLKAF6uPT2bHrx9XvowaXIV/kbDWr93mmX+IQXh15O5VQfCQuokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oAHHBOtT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jOS6I88W; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oAHHBOtT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jOS6I88W"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788345715; bh=/05FvKF24KDm+InPqQKP53Y
	5sODqZQ4iwRbSWrzJJoQ=; b=oAHHBOtTUc1MFKpJj056x9/L+fGgP765idZSQMzxrAGMZpYINV
	pU7n7NTec2KU9rC8UysA6vfeZo5AwHCXg+yDgF+YehAhIy3kuabjY7nhFbYxHmq5ZwGhhddXqia
	2xFr47LW60ovgwk1lYgDuex5gX4qv/gWqxMxrk1SE1jBLhJjf69suO5Vte5VLtUfNOpZVT9A02w
	raE9pI4dtsLfnKqRs/B/z7DwqeShLBkD9WOyAL6RvqnwRKu5LLo14d4NNGnIUIthc5srNx+8hUK
	fhvDzx8LUOtMzTzz6FPg1GqW93tHd/tc6Firb3zCK/3k/0w3PSYMqqrFn4nwu3UevSA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788345715; bh=/05FvKF24KDm+InPqQKP53Y
	5sODqZQ4iwRbSWrzJJoQ=; b=jOS6I88WmxVwfH+433uUcTkMHP+1Q9So4MA8l35Vv/nQD/pZgP
	JQnUmzB9jFXlfuG4KVPDnuOUR/PbbeXZjBAw==;
Message-ID: <99593b39-6851-4ad8-aba8-d4a39192e5ce@mainlining.org>
Date: Wed, 2 Sep 2026 13:41:53 +0300
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
 <a5956f0f-2842-4b80-8bcf-8763836618cf@mainlining.org>
 <CAMRc=MexQO0r-4+yPQrY_rCcGUY0E92q9hAD5EoTpwLJxMmX8Q@mail.gmail.com>
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Content-Language: en-US
In-Reply-To: <CAMRc=MexQO0r-4+yPQrY_rCcGUY0E92q9hAD5EoTpwLJxMmX8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On Wed, 2 Sep 2026 03:34:58 -0700, Bartosz Golaszewski wrote:
> On Wed, 2 Sep 2026 12:32:45 +0200, Muzaffer Kadir
> <muzafferkadir@mainlining.org> said:
>> On Tue, 1 Sep 2026 08:59:00 -0700, Bartosz Golaszewski wrote:
>>>
>>> And to that end please use scripts/get_maintainer.pl to get the current list
>>> of maintainers for your patches.
>>
>> Hi Bartosz, I did run b4 prep --auto-to-cc before sending the patches. After seeing your message I run it again to check and it said no new addresses to add. Should I rebase on newer tag?
>>
> 
> Please wrap lines in your emails at 80 characters.
> 
> Are you based on current linux-next or at least v7.3-rc1?

Sorry Bartosz, I accidentally sent it without wrapping.

I based on v7.2-rc7.
Should I rebase to v7.3-rc1 or linux-next?

Best Regards,
Muzaffer Kadir
