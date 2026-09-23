Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12A5349AA
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189994; cv=none; b=FCmdKUWpDPEFBV/hFrbriq1+McuG80RADDIhIYFK4sr6aZ4bpSAv0+e9yEtzd8q6WceaqyvTP+m+kg6EbyV1mOH3nUSKonlGIo8VZQvv4as+StLvUeoxQpi+hSrq7m//lyszILfAf2Xq64xvaLaqdGkRZii8M3FRdIshaW3VeNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189994; c=relaxed/simple;
	bh=xI96Dl/fhao6wWEyzLZsy9TSrK8H0E0M06bNe3IR5xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UG3sZXDLdeBXvbOrUbQPs317OtKTMc1fb+n1bqg9QIdYUlsT+h231wj3EDIGi7q+MTTRPiliWSpHGiwBuXGAorb+xaQM00tfls5bcysO7yIn7rPzWHhIp9DyBmQWTQxBLqaq8YWCq+XBH4zYGkJoXFMnAX2rvbqx3YxQRhQzYBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=W2yGrN9v; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="W2yGrN9v"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e3so11755526d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790189992; x=1790794792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1y+0wCr5i5MV3nD9ttzhvDEOrHuQJqJ4iBqK0B1ubkY=;
        b=W2yGrN9v0WdJhn9Xrgi1vqJVcofTC8KakwZOY6LRG9Qs+2sRDfOO9pwCTpUM7+oE+l
         xzs6k9jBB5XHbWig9stw8UifrLtcz1sHuDuH7wPE5OiQTSgNpHTklAt9RfcXhf1Q9dWF
         mSUfktXeutfJ5feQNd6TlhYZveZ/zI0E5g5K9/gGvKerhmEXFAc7e9G8Omw947U/RWr9
         EyObXCtKcQvFvS+MNgSTBjU9STFYh0c+hkxIofEUE4J1rivWDoTjxWv8s6bFb6dHGSI/
         gVjicODBHR1B4EPaNUrBKK5dtJqOFM6rRkapI7jzqWwTOJjzk8VbdrskWrgwICs1LvIw
         qutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189992; x=1790794792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1y+0wCr5i5MV3nD9ttzhvDEOrHuQJqJ4iBqK0B1ubkY=;
        b=uEqTXQOrAsqb6IYQ70tb97S5KoaaJ8WZ0VWMmeDUZ1wA5K/W2J6gY2fCU3by5ePls6
         IkbA48tDUGZYKzXeMRm+G6reHgku3IwF5pgWmixvyla34Cv0SKvqXezwhVbXLKPTwns2
         I06R5xp4qTKatHlrDUquTgu2a33ILH0l0tBEUtg58Y8ETSwipUsjI92WlrhsXZVg9Hzs
         TKxeyl9myw0Ap7GnlLRu5Alk1PPoXiVESLIi3YO2mVs8KFbWzXbiEogTo691SLddipHk
         OA9H39gCsn+h1/auokmAJFkkfjlisP1Dd/iIXEkd/B/732WNSlXdGx4G1eWpNWHSjtuq
         tb0A==
X-Forwarded-Encrypted: i=1; AKwUvBzlEt+HvYDaK9/8w7gziQJfyaMK1jVZO9ae+yl44Po8iIjgt8r3+JLiCEpBPhiqRdef7or80/WEC3md@vger.kernel.org
X-Gm-Message-State: AFuF++mN2XlvY0NmxeVyTUNHWqCPdShmYzLCCEk8lXMdgyU7tw9oW33j
	kqBglT3PkHPb1Z6XhB+LfzGi5CyDiv/9M5Jb/EnwpdrBZ0f8Nu0buKALj3GBOv3QYiY=
X-Gm-Gg: AYBFou3TXjboFD5d0/33hB7uO4NkH8YFf7Y3QHeOisMM4zqPpQXOKBfK+Qo3uS8OEVJ
	AchK8lHjRMet7Abp2s2Grp0Rsvq5YKOjQbaZJDu77VBsxr8oupaPlmNtGOpk4MNvmlHXlLI6Vo9
	7XOF31LWCAOE9OncgPGNZ6oXHRSJhHD2kcyJyr5bIp3x5BktM57tGKDs3cXfIhUr2+mED5zx4wP
	82aJPPEGCr2KG+MAN6bvr0qF31YdsodYg7c4BygG3Q9JWYABPizNkkE9WAwIMuAUTPGoNsneOWQ
	bgdw4skpuUTp5gbBw73GfCIfznXN/R31NnCddVQIwH8/IeJhxLLTMLgETP3LsYgnVe7UBN4xEwv
	drmoBvFpojSWf4O3nLIQMSPKGaedOF+MPAEoq/X44YCEveF2SdbMDC+M/lfQIRHHRqv1dQsHgPh
	TF81ugAuJrFMoIugtB+PAWZkvwZ9t7j1j1PT68fOabXIFyqMl3S3xWjpx/UFqLbjUJ6NOfY7+Yb
	SSxlwXyYA==
X-Received: by 2002:a05:6214:4609:b0:910:3453:7d8f with SMTP id 6a1803df08f44-9141e8df748mr859276d6.36.1790189991722;
        Wed, 23 Sep 2026 11:59:51 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e21995fsm1074486d6.10.2026.09.23.11.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 11:59:51 -0700 (PDT)
Message-ID: <ea49aa8c-af1d-445d-b15b-25079cdcc72f@riscstar.com>
Date: Wed, 23 Sep 2026 13:59:49 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] gpio: tc9563: Add support for the embedded GPIO
 controller
To: Bjorn Helgaas <helgaas@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260923185242.GA1909536@bhelgaas>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260923185242.GA1909536@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 1:52 PM, Bjorn Helgaas wrote:
> Patch [1/5] and a comment below mention 37 GPIOs, this mentions 35.
> Are they supposed to match?  Maybe 35 doesn't include the two reserved
> ones?

They are numbered 0..36, and two of them (20 and 21) are reserved.

Of those, 10 (numbers 0-6, 12, 35, and 36) exposed outside the
TC9564 chip itself.

					-Alex
