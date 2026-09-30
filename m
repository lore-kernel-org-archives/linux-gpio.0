Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC1523786;
	Wed, 30 Sep 2026 22:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808899; cv=none; b=Xi38oGtxbnxvlD0FqKgxaejRTz/eDRPp1Y647JeJMbVznmsxpBSBA//YwcsODFWVA92flmhgkX6fXDWJDDJYhkIzrVmhSxqBZ/Tduqw5uKfbIGwfcPAXkkORafYHB1hgC0oJsLLi7CbCpmhueWsEEiISia+ZBi4x4hLV6/vcxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808899; c=relaxed/simple;
	bh=swUrUuOo2ZZy99KBqcHea9dSbCt/Q58QbxdQRRptMWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZloSPtzhr1RiVNvHYem7RnfkY8vD6jIRXOowuX5BInmr0yKVua47LiZKc3+Zu/T5v8f4WdFn+mKVL+9iTUeKao0HgGcfa/b2BUjJKI9f3P1jC/amJHBJYnx7QI6AFcRMyXPA6OjY9sVR0YjNE6CFzOYw46qevYOIJ4CPYwnAqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=M4zNjgxB; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="M4zNjgxB"
Message-ID: <6213fef4-5cbb-4ed1-8e12-d5529fc7469f@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790808881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qHPlzGy4dd9m6Tg6m6EuH4FV6ScEYz4fEuF681xzp6Q=;
	b=M4zNjgxB2Iy8jNu//9QdhE0Dkzz6N2fDyRSkLS9yGlSbN/+JioTDFPN1H6yMyt7ew90Rkd
	WsI9Eata4Z2dn/7SvUnE5Qe9pcOzZjTRh8TtKhwnByPPis/W7PDqiKBuMLU+9rybhXTOcn
	EkPDPJ9ZaHWi8DfXy5aVypE5PLHN6PU=
Date: Thu, 1 Oct 2026 00:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
 <20260930-fascinating-armored-sunfish-ddcb59@quoll>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260930-fascinating-armored-sunfish-ddcb59@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/26 12:03, Krzysztof Kozlowski wrote:
> On Sat, Sep 26, 2026 at 04:51:44PM +0200, Yureka Lilian wrote:
>> This patch series has fixes for probing the pinctrl_ap GPIO controller
>> on the MacBook Neo. The previous code would crash in the regmap_init on
>> this device, since reading the REG_GPIOx for certain pins causes an
>> SError.
>> To mitigate this, we adapt the gpio-reserved-ranges property to describe
>> pins which are unusable and whose REG_GPIOx should not be accessed.
>>
>> Also add the new t8140 base compatible to the dt-bindings, signifying
>> the different behavior of the t8140 pinctrl_ap device, and make the
>> driver accept it since it now respects the gpio-reserved-ranges property.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> EDITME is here on purpose.
>
> Best regards,
> Krzysztof

Sorry about that, I had to send it twice (this is the first version 
to actually land on the mailing list) and forgot that b4 does the whole 
auto-increment and add these cover letter entries. Will be more careful 
and use --preview-to before *every* send starting from next time.

Thank you for understanding,

- Yureka

