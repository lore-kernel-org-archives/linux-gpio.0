Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617144;
	b=mQUiyT97A7j07jrKCf41fGQNnmUZmSVqWYuhUU9ALQg/ONNBOEUF3ZMhaobyAoBcq5tF
	 E0SzMeSfu59wFXgZgr6y1PAW/sHwAZCexUhDcPl5YTYvHprSALV2Nmay5dh2a3Jotr5XF
	 BW+Y/7a5RFvELX+8LEIqql9KCycvu7mv7hIHcoou0NNy+HU+4q2EESJaGQF9r31Vletkm
	 dVJzFCEyIg7tq43NWJI4zIv+4/8qvR1ltEEpAMaMic0Whl0IEkqRjl0GYzt+6PI0IeVs8
	 q3nVK5g2JS1Mn5Dg9W9B0H88AGsFdn3qbhtD3MF8AbaN0aZXzhA9nyeu08a8ArLWjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617144;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iqIBYKdAwsyESmO2lR9a06vZxhGrpB8ZFTJay9yz+LU=;
	b=Ym48Vhvqm5eXXTP6pV6i/3V2bAxiro+pz5zhfvNdv5knR01FEBg6chiDcIHe5Fo0mVwR
	 +fmmm05fhUBfJts7uQVsZRgKu0xHOHKyB0t7peKhOP4IU+bgRKWqn3vZDfR0V97NOCMMT
	 aN32/hVdT0XDknaDEdOUTFRkFlOHFSQT1C7JjqdRpImQ3ajG2VFKcra004keIFS+Yua+l
	 kTTKAiQn1FdACFzxaQ0riy4vD1urBjP0xxiK0Qu1/d0b7lsXfPk+F2Vb6tq8+aghwRkkL
	 AsYTg/Ggl7nMgdHZyAPtreHXhRcdSDzzAt9aBpM20NzDkmfTAhW8TSWeSv4g9pMiKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDdCGWcV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648B606A33F;
	Wed, 25 Nov 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDdCGWcV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749081F000C4;
	Wed, 25 Nov 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617143;
	bh=iqIBYKdAwsyESmO2lR9a06vZxhGrpB8ZFTJay9yz+LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nDdCGWcVlg/Qg/5rHJtRVXgh/YB1pU8C/TW2fK8r1CTPgJZeZ6ERDtQfwcRSKvpLD
	 DIVBETx8i+t5F0Wk9B4rx3J2QSRLIC8MKd93mGOcCitxa3egVjLtIeqaM2DgXshM5c
	 xKLLXoSVocnalQp45slqlRYL4jGeFPkEARwTvS8xVfqeUIigzv5mNZ1SrKR7BI1cDw
	 Ii48Gda723bb+S8LsP8m/l05yOPigGFD2rIXTjkOY1LGT5XWTLWFi6mjp8AYkrgOPJ
	 Zi1RdGAWEpqIybWWdjyr4UqWHOMcDm08+rJ9/RKr/jyA5VEGJgZP6i6RE0Cm5P1ga1
	 HAF0uECA33fmQ==
Message-ID: <a2683841-a169-4cba-81fa-823553f37159@kernel.org>
Date: Wed, 25 Nov 2026 15:32:17 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Prasad Sodagudi <quic_psodagud@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
 <396403af-1505-44b7-bf21-8c656c64c936@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <396403af-1505-44b7-bf21-8c656c64c936@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2026 12:35, Pankaj Patil wrote:
> On 11/10/2026 6:58 PM, Krzysztof Kozlowski wrote:
>> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
>>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>>> be owned by remote island io independently of the selected mux function
>>> even if function is non-egpio.
>>>
>>> Presently egpio is treated as a mux function level decision where as
>>> hardware programming guide(hpg) specifies it as pin conf level decision
>>> i.e setting egpio bit is independent of selected mux function, the
>>> driver/apps claims the ownership of the pin if it's egpio capable in
>>> case of mux function being specified as anything other than egpio.
>>
>> I don't understand this. If the pin is not owned by Linux, then simply
>> do not list it. What is the point of listing a pin configuration which
>> should be skipped?
>>
>> Best regards,
>> Krzysztof
>>
> 
> The pin is not owned by linux but is still being used and driven by

If it is not used and driven by Linux, then it also CANNOT be configured
by Linux. Otherwise how do you imagine for example that remote island
operating on unconfigured pin, before Linux boots?

> linux for it's intended function specified via function= property, which
> would mean the required mux config for the function selection has to be
> executed in Linux
> This property simply allows a second driver/peripheral to use the same
> gpio since it's allowed by hardware


Best regards,
Krzysztof
