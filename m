Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814826;
	b=YyxaM2IndbsP0Tx+PJ5/eaFMRPcBByiw3J8BinYImIuOT6P/e/BeZ/ooANk7ohzi+/Po
	 u9u599lQ9Bqevw9dtuhtF3538IxgbTdOPkBiUvOtKTMG1fCR7iimPlwjNUsToeR65xAVb
	 umNBbh6phw/UCT9920RyRzkhkTUtcH6kcF8gEhUXVSA5DMyZ9vSX+IVsVgTv7htGGYswV
	 NVOqPUWQadCz8YkKwxrWAMIGWoEgE8kJQDE0eh4dvjes+vKtR1vBU2MgGEeoJAcvhj/ix
	 /1rS71q1cKuQDf/jFywQmvnKoA5Bo2ZiwTnxQfHjrOwhoJVrFKH3yrVDnimYGL1FScw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XaIebkWcz2a8QcsRqGjnVGOPQYVk0phRmVCTzZlFBOY=;
	b=3BbsKT4wyQTWbA+vz9hTBQPS7K1aF2yZwF9mw8gz9bfi+vNMJIVk8RP+o6KG2pPeFH0Q
	 QLXlYGtnbGeio9oi67lNBnLoAGSQcJjEtGWTvdjzA/bEwwtOoDC/COctdqpXKNBh1DO5y
	 iYqa2jp414oltzw2cOekg/pIbwro1hTdzDjmU/swrGUEMJtMFCr5RRbj6xaJMBSvivB/m
	 sejFkkciChdNG3ekV+l2jDVqi3POFa2eNyjfrRtj2qC6CM6TjN0l7qVjuLpKfh/XT5dbv
	 hoM/2TMnABiGtMeKHlme0oMSGIfsMc0VDeIbHUdqCcI8a0sPkK4JDVp+8A/8Nps05SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xsyJMSsV;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3A60A5BC7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E3A60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xsyJMSsV
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1777804f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794814824; x=1795419624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaIebkWcz2a8QcsRqGjnVGOPQYVk0phRmVCTzZlFBOY=;
        b=xsyJMSsVQKSoUONdPaX0yOCY4hbLYZiF3aTqxT6HWl/nUY/GUdKYFKv8BXWpz4xVMU
         am0Az4ZEMKTvJuuFDTuSoXS94GlJqUZOXa9rC5BTni9yTokJoCJ6xUXdZ5zj7mXynoTE
         8UHF8fFyq6nxfIKkb8LyiW8CC3g5kncEPteyCEDJS/oFPbAsdFzNZqI/Nyn36YwrkWGM
         cfhbKubicV1UgA4EeoyI+Tt2MLkaELKwtnWeOHw3Lyn4KMFBoyY6GdNCZR+Lkz4f7Xhy
         ATP0ZSngarjg8alxPL3nuojNpKh3cGZ+nH9pNOpkKpA55TzlLGOFfhYydGF6eE6hdUHt
         KZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814824; x=1795419624;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaIebkWcz2a8QcsRqGjnVGOPQYVk0phRmVCTzZlFBOY=;
        b=Mw2rltLfK0Lnhp+blYdNfGNB6CgiDDNVOInnyd4l/JjIIJMidiA/y6ZtFPQT8l2rlX
         HY19cpWzSDLUtD9FsEhJpwjPnnp31YCi5vLEbZ+JBjbR/qUhF7J4pBxdEdt+9rfMrgDG
         gDLnxWRJnUsYhVj5q4w1EADHGmsIzS5VqBNrw/7x8uRpxrND59yVpKDBp7KkEp9WuU+G
         Bz/MKg2OlmXAYU8wZCFN+TUt/bR6X0YpWXM7KB1RFJitu6jvfn47J8Mihqc4pCIbyiAf
         BalmsLIZMoST+NKqurCYE32H66JPVKOszyZR18L0aAuk/eGUTdnzdf6mw/z0Q+aHwYlj
         bnVg==
X-Forwarded-Encrypted: i=1; AL+hErFVk9zinn+Lyg3ATUNBu1CuKJDJ3l2wjZ2P7PdnWu4f9IicA+vAsom7XKkIWwBmi83ixaUUnMg1h/54@vger.kernel.org
X-Gm-Message-State: APuU4Z/9T9zPzfDSdLOfoy64TpTquVt+aTTXzlzNXLzvtYVS6Zv+SS7K
	2LLj2QSU6/sbxGAL86n8yqT809PkARInNzP3zSLVZu7tuMJIasYfFxbetBFtIUZj8Cs=
X-Gm-Gg: AYBFou1dF3sM3VYXXbVBATIj5WdJFH5yD3wNgCe/BZRXboOSkxZFGOXQPbfTT2gPn9P
	q52uNbV2N1WSpYiX1tT39Ra7PDeneO8Kh84As+zH9SyuH8+3nkTg3hdtqcpIvsbuEbDcffmyYdG
	MJipO0K5mEQXpyBTWaO1yo8IkJqhEbdm869gsl/4JkTc2QOd++5gG7HWYEHQSv1LdBTLIK3HiMy
	STexQHjrGrpf8wjqPFEca1QkxYKFM3Yd6onj561/v76w6Txh3D9IOi36ZhgYKz/TJotnYUNz8KJ
	3s7uu3DicWgEPyY54DkVVrsgPfqSXjsOJa5o5kv3TrkkX5AkQUFA9UzVzahVfVXRjuQIVKvIX8G
	HJdUd8pj94L0xpwWPkKykvvjqJ9D9inGpckjQER8j9aLJ3iWQbz9UoS8kY+lHyUgaNmGQdeHPGO
	ty4Ykx03DKAYznNOwFDYkrXxv3wvr099w9rcm9L0xw2TncFpyyDOVT5Q48gEb+lkhOVXZyYTYdX
	bKdQXG2+nu6aZex7ABL+1Z3vpupkQKM5xrMipqR+qoApqrwScuZRAnppU47uqwS5J264AgngwIX
	iTuEBEq7I5tk5jHAao4UoMxiKhb/JEUJxGIyzc/a/q81sW81s+/hJbnht+hn/nxM4bpJWdkRMTj
	f2d7tm7gv
X-Received: by 2002:a05:6000:250d:b0:48f:bf71:2aeb with SMTP id ffacd0b85a97d-49c70ed8f89mr23615064f8f.23.1794814823845;
        Sun, 15 Nov 2026 23:40:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm20080240f8f.46.2026.11.15.23.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:40:23 -0800 (PST)
Message-ID: <38c038df-caf4-41c3-8899-20a3ffbd28c6@linaro.org>
Date: Mon, 16 Nov 2026 08:40:22 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 20/23] arm64: dts: qcom: sm8650: move EL1 Gunyah nodes
 to sm8650-el1.dtsi
To: Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
 <f5bc0271-5ecd-49b7-aa5b-d5742bf2fe03@packett.cool>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <f5bc0271-5ecd-49b7-aa5b-d5742bf2fe03@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/26 20:08, Val Packett wrote:
> 
> On 11/13/26 3:38 PM, Neil Armstrong wrote:
>> The reserved memory map, remoteprocs, SMP2P, IPA, GPU zap shader and the
>> q6prm LPASS clocks only apply when booting at EL1 under Gunyah, and
>> boards booting Linux at EL2 had to delete them.
> 
> This might be true in practice for this specific SoC just due to these being the only devices made,
> 
> but in general, "boots Linux at EL2" does not automatically imply "does not use smp2p/remoteprocs" (see Glymur; and earlier laptops with hacks that happily use ADSP under EL2) so the dtsi that includes all remoteprocs being called "el1" is quite strange IMO

Yes because the early boot loads the ADSP "lite" firmware for USB-C and battery management,
which is not the case of other non-compute platforms.

And you can entirely not use the DSPs on those platforms as-well, all the nodes
I moved are entirety Gunyah specific on this platform since when booting
from EL2 without Gunyah the firmware interfaces to load the firmwares,
setup the clocks, power domains and IOMMU doesn't exist.

SI instead of el1 I could use "gunyah" ?

Neil

> 
>> Move them into sm8650-el1.dtsi, included by the EL1 boards, and drop the
>> node deletions from the Deckard dts.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-el1.dtsi           | 775 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  21 -
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               | 774 +-------------------
>>   7 files changed, 801 insertions(+), 773 deletions(-
>> [..]
> 
> 
> Thanks,
> ~val

