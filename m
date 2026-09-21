Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD635B63C
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980409; cv=none; b=InIcFpcv6dL+UDL/yBkEIzRA7BXVGqdhKmD45OtB5fPhgH1klYJesvmw/NLHttmSMQoozR56hKoC4M6NVMwB0KT6NHPyEos4BI9ze4xcM7+OUPoPOZ1teCZ3IK9ZLHLW7RPOHg2ReIzbTJGCnDrngVZ0ocdPmoD1qwYCipqJW9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980409; c=relaxed/simple;
	bh=KyBH7dhUVR4B0av3A00svT+cy5avMnDRCt6F/8hLFiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIXpqNEEDLRbX6nQ/4I+jNqfPQOWWZaIg68aa+OvRQb1kX/eKYF3CwWH9RqgewkUZtusclEhZP2iFGjZrxQD5Mv+9R2TnUw7dg8BlBJwoiT92tAH6O42OFaJcQykfjOlSN+G/mzHvCBsIFsQE7WdNNttpPwb20GRHD3cQqIcZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xde7lvO7; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xde7lvO7"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso4511734a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980406; x=1790585206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U83Tc5sQYnzc1MW72+9l9dJyYEc+FCbzixyfv/lGGEw=;
        b=Xde7lvO7wONq4WdJWo6Y4+36q0sugLQo7GicQlDObrmem8LfZ/gVLYU/J2MK+8WLTZ
         2ivBumskyL28bEmZAOVzELbUmX0SnMH2rRtgT8ZvVnuv9C+/LaB8PBlEvN25ATL+s6HL
         HAlIUK8ZHxacglxHdq09BfHLZi3O7HtmLllOlabGi8HV2sSF0qDwi4GiTMTSvu0XQFze
         /ALoNlmiU//wJL4Ff2F2H+fKfGxyYHQdxbD+vQG/CrRcMIgsedNa7QjQAlOUH5Mh31zI
         0WxL4FtQR5Ou2ds7yFd36eo+aXzqVdxNC8gcglkdlE1OnduVKtj+79o7rx0BNls/GL2A
         XFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980406; x=1790585206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U83Tc5sQYnzc1MW72+9l9dJyYEc+FCbzixyfv/lGGEw=;
        b=j4eJvwTMLt+URSsNGyY5/sZ9b2XP3kc0+q8a6y3bFy5E+WENbDQKga6mVUd3lYS87O
         AbJR8rIzn55/XEYigQk97wUXX07a8bKDaQfAflNWKuBbSFl6NZ3b/GohnxKiNnioLopW
         4tlUve2NuOVOcRYd02X0HaoCh620p0bfOu9r+Sy+QjWAfzz+P6tdOt7QJC6XTGg2gDUO
         sLtfBM9bA7PrTzzdnYBAF6CYeJ4mAOrEnxWDEuk/eWYm7/WzMGyBMRFXO0o+DIQ94sNf
         8E9YnjSwvgIn8mdiWgqVTiInZsTwasfbfhE6Yn7hGSyd+K8Ozw3LL20RtZdNFFndLTlF
         o7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIbxCQ8H6qKdox7pacsFaC2M2yn/p7HA9CmLLK2xCBScgYhYG4LlZ+r/F4fqPs24uecb+yaltPwsNg@vger.kernel.org
X-Gm-Message-State: AFuF++npJgotNTVMU87v/be6oVhVrUOrzT7kGUePWELHPZK6NAdJ0ZYU
	adzfNku41aDO9uWyWzxgSNW2pNKQCrcqAmEhPlmuegkSDcWYHM/Y+lEe
X-Gm-Gg: AYBFou0WWRGYwWvw551orsqBjaS7srcJNHW/RG2IWR2FRvEYcF5TQkLnvi2VVLo7jqg
	2UWT/z5LchDa74YHul07IzKy0Z83h3RHcDOdsrhOzPvWXLvDeTID9G0QQQTfzQyqg1t8krGnFn1
	omLpt7S8UL8VhkNFWsA4AlGxSfXnoPHjsxiY2fmiMOwuEU0YcUboK1Bxo8EljxFClwyHWydmAnY
	phxegm3DhT4hbZESUtP2m4vfC/+SLhz1R12QQ2hj051LF4i5ljC8iELxlUPpKfDd8/MPKv0tHEG
	60k5MHmcHds07FEOVBU1135m1/Oj+DEtDMjSQgwxubnfrb8KWtOE4aZXx8V0b3n5c68YiHc2Sur
	EZoyPoi/FoOL8JAFnRgnOURNqiNidANIv3atyKpA3dY6eHJvamDYqUI90nK00KE6QDm6Ots+CzX
	nKO6HGwJNgOnmKTw+ZhzEBXWEfL5xmiUbDDySH/92bDShuSWqkUWZp5DuAZyMkSzskvI+Ae8MKM
	0c910wN38Q=
X-Received: by 2002:a05:6402:23c7:b0:6aa:4529:4cb7 with SMTP id 4fb4d7f45d1cf-6aa53135128mr7228644a12.16.1789980405879;
        Mon, 21 Sep 2026 01:46:45 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d821efsm3882322a12.10.2026.09.21.01.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:46:44 -0700 (PDT)
Message-ID: <457da50e-a633-4508-a8e9-7e000933623c@gmail.com>
Date: Mon, 21 Sep 2026 10:46:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/17] iio: adc: Add AD7768/AD7768-4 ADC driver support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260916-ad7768-driver-v8-0-27aa24db5225@analog.com>
 <20260921013732.6c5399e7@jic23-hlaptop>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <20260921013732.6c5399e7@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/26 02:37, Jonathan Cameron wrote:
> On Wed, 16 Sep 2026 13:13:49 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Add support for Analog Devices AD7768 and AD7768-4, 24-bit simultaneous
>> sampling Sigma-Delta ADCs with automatic power mode selection.
>> Changes in v8:
>> - Introduce the DCLK divider helper in the core patch to avoid moving its
>>    register-programming logic later in the series.
>> - Document why register caching is not used
> Other than open question on regcache vs volatile registers
> this series looks good to me now.  So let us get that resolved
> nice and quickly.  If it turns out regcache can be used I don't mind
> just tweaking that comment for now and taking a follow up patch to
> turn regcache on when you have it ready.
>
> Jonathan

volatile_reg would handle the live GPIO and status registers. I will remove the regcache sentence from the comments, leaving just the SPI framing explanation. I'll look at enabling regcache in a separate patch.

Best Regards,
Jan

