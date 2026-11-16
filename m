Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857969;
	b=JNmwXEVS4RlNs/k1qgKsR9NMirBnxbMq9SpATrt33rUIhmvoSpHNQNq7rzF5QLjJtv2e
	 wL0IhlJTOlY/G1T0Iblp0sLNugs+Pnu9hMuVKOr/aPMTHZ3bjVG392OXIVYdnhM9ePBSH
	 Vmhmnpo3e5TBaF77hzY8JIejrOWpQ4I6lfS3wyL6lIik8UDjOtdkrc9/h8ivjqemIoq4q
	 pihfNSUv9CgrDdbPPQixO7hvOdhNfVONA/wBddf7BB8HLIkgetG4fBIf3Kep2FmA1+VC4
	 RuB41W/D32VpjYtAxfhuU+28KJvIQvvGgZnA9zV+KcFJEkNhwKwMU0bhvRKMzwyvQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857969;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tb0Yt+co2HSyPMP/gmGUN3MHhQtM2v+tCYbEj1zzeMQ=;
	b=0uvd5fxog53pqEfwPJeJTCpw3ti/V8UDwecB+F0deaWsCoa7Kztb6PrRt3itzMSkShGu
	 clExX3u/8FJBOFtq1mzqtushDYlc6cLo8Giz4JLWGtwMDplDlfBMzyCsOprxG3YQjDBpU
	 OKGCNSU2Op5WVKFMfMa78Q2BfnXA1A8+7cHtwNAlK8YxmxKchaqv1o6yQR51xBIl5zeF0
	 Jhr9np2l2M8ct/3n09PErQF5Pv06akRGsZx6WrwwWLRoJ6gjjd3/vWqNGHjFEoKGA+m+k
	 Y1qRTWkGzF0XrITBNL0tGB6hcIK5HdrhJRhl/8m4+0q+XcEXmpcLbigYW3SRyItzm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19789606A323;
	Mon, 16 Nov 2026 19:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19789606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:39d9:16d5:775d:5525]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT2Xy-004L5b-1e;
	Mon, 16 Nov 2026 20:39:22 +0100
Message-ID: <e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org>
Date: Mon, 16 Nov 2026 20:39:21 +0100
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
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
 <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
 <20261116-resolved-riot-c6a310bb2d8c@spud>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <20261116-resolved-riot-c6a310bb2d8c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Conor,

The largest users are EN7523 pcm_spi 14, AN7563 pnand 17, AN7583
pnand 17, EN7528 pnand 17, EN7581 pnand 17 and AN7589 emmc 12 (these
numbers are based on a hackish "grep foo | bar", so they might be
slightly off).

I copied and modified what the other AN/EN bindings do. These set the
limit to the pin count of the SoC: EN7523 38, AN7563 38, AN7583 53,
EN7528 50, EN7581 58. Your call really, I do not mind either way. I can
send a v4 and then a follow up series cleaning up the existing bindings
as well.

        John

On 16.11.26 19:15, Conor Dooley wrote:
> On Mon, Nov 16, 2026 at 06:47:27PM +0100, John Crispin wrote:
>> On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
>>> As Lee requested, please split this out. Two patches, maybe even three.
>>
>> Agreed. v3 splits it into three patches.
>>
>>> Do we even need a child node here? If all this node does is
>>> gpio/pinctrl, why can the driver not bind directly to this node?
>>>
>>> What else does it do that warrants being a syscon?
>>
>> The block also holds the PWM controller. Its registers interleave with
>> the GPIO ones. The PWM series adds it as a second child, as on the
>> EN7581. That series has a depency on this one so I have not posted it yet.
>>
>>> Otherwise, there should only be one. uart1 and uart2 should have
>>> different nodes.
>>
>> Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
>> their groups carry different signals of one device.
>>
>>> So here, maxItems should be 1 for similar reasons.
>>
>> Agreed, v3 does this for i2c too.
>>
>>> I'm also curious about why this goes up to 74. None of the functions
>>> have 74 pins, surely?
>>
>> A conf node can set the same config on any set of pins. 74 is all the
>> pins. The EN7581 binding does the same with 58.
> 
> A difference in philosophy I guess - I would be grouping the pins in the
> config node by user. So that there would be something like
> 
> spi1-stuff {
> 	spi1-function {
> 		function = spi
> 		group = spi1
> 	}
> 
> 	spi1-config1 {
> 		pins = 1, 2
> 		config1
> 		config2
> 	}
> 
> 	spi2-config2 {
> 		pins = 3
> 		config1
> 	}
> }
> 
> spi {
> 	pinctrl-0 = spi1-function, spi-config1, spi-config2
> }
> 
> or
> 
> spi {
> 	pinctrl-0 = spi1-stuff
> }
> 
> IMO, having config nodes covering more than one "feature" doesn't really
> make sense, as you'd end up with something like:
> 
> spi1-function {
> 	function = spi
> 	group = spi1
> }
> 
> all-config1-config2 {
> 	pins = 1, 2, 4, 5
> 	config1
> 	config2
> }
> 
> all-config1 {
> 	pins = 3
> 	config1
> }
> 
> which kinda falls apart I think when a node can request a setting for
> pins that are not part of it (in this case, that's pins 4 and 5)
> 
> spi {
> 	pinctrl-0 = spi1-function, all-config1, all-config1-config2
> }
> 
> So my opinion is that the max number of items should be the size of the
> largest peripheral.
> 
> What's the largest actual user on the 7581?
> 		
>>
>> v3 will follow shortly.
>>
>>         John
>>
>>

