Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399736829E;
	Fri,  6 Mar 2026 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818771; cv=none; b=FYM8t142P0qa9LTwV4rrVeiRqaPcH7sUOTPX1RJKaB3xEoCYN4+iFCCnCsD7jodVeG4SCbJfrZruWvQpM+FpDsBdrRk16MAvjKDzNASdd59eXGFp/+g6vfYuJ5c8lJdzF9TX+wnMwqJea6f7Kf+wcjEbBQ32W5uDDy+2b379ra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818771; c=relaxed/simple;
	bh=zoEi7VxgNK7pjBkVf//Mzf4Zaf224frdZM5tU/Sy/H8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=K4IPqTEWFEp1D8NAaVNqWShzpCrcivq2OmizsQGtatYAFKKbNVRXZzvbVFxSqEUHDGoHOP4vNdOPG+e3YCE/+QU5ONsWZq1+n10Uwa22w4ook2bXOtnxRSNK9PvzvWGAOMRADC9bCbseK5evw52tIdoKllfRhRGGdE6pnAtyIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AX4d/kfj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AX4d/kfj"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1B40E2650C;
	Fri,  6 Mar 2026 18:39:21 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkeoDy83W2Wx; Fri,  6 Mar 2026 18:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772818746; bh=zoEi7VxgNK7pjBkVf//Mzf4Zaf224frdZM5tU/Sy/H8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AX4d/kfjFtESGj0RJPLyhIAjRlS121O0wIdoRPBZPMg+9OYwJ2b025K5HtmyRZ4yh
	 mxj1Z6J+LnuxtAtbj9yIboybeZDBIMvmUQYHrPO4ttkjvnsRwtisr2q1wmlVvIITgr
	 j35uSZbspNcLLXR9Oa1GNkxpZmraLaU+Deh6s7FgEUl91tpng6SsbKyF4k4ng5dNTC
	 SZ/1En4vCwtO06ppTgHfJbTZsLeKN9+gEpoJoJWA1D09o50r71VkVJ0Sggh+9x92Gg
	 VtrQF1/orHuDQ3BaTw/2Hwn+Iv4F8HifMY4W3l1i//RwAQPy+IjfjKDdld5+D4Pk1V
	 Cd92jQHkc6KZg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 17:39:05 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bert Vermeulen
 <bert@biot.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: realtek-otto: add rtl9607 support
In-Reply-To: <8d382a35b5e2304b4c869ced560c0c3880af5b84.camel@svanheule.net>
References: <20260305161106.15999-1-adilov@disroot.org>
 <20260305161106.15999-3-adilov@disroot.org>
 <f92a2a8558ebff7a145ece97c2bc44f1f7aafd26.camel@svanheule.net>
 <6a8538a1990dc02a6a0bdbf60ebd747f@disroot.org>
 <8d382a35b5e2304b4c869ced560c0c3880af5b84.camel@svanheule.net>
Message-ID: <b01752f6df465b11a220a84620f29335@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-03-05 21:49, Sander Vanheule wrote:
> Hi,
> 
> On Thu, 2026-03-05 at 19:54 +0000, adilov wrote:
>> On 2026-03-05 19:04, Sander Vanheule wrote:
>> > On Thu, 2026-03-05 at 21:11 +0500, Rustam Adilov wrote:,
>> > > +	{
>> > > +		.compatible = "realtek,rtl9607-gpio",
>> > > +		.data = (void *)GPIO_PORTS_REVERSED,
>> > > +	},
>> > If I'm not mistaken, this SoC has a MIPS InterAptiv CPU like the 
>> > RTL931x SoC
>> > series. Were you able to validate that the interrupts are functioning 
>> > as
>> > expected?
>> > 
>> > Best,
>> > Sander
>> 
>> Hi Sander,
>> 
>> Yes, this is correct. I played around with gpio-keys in OpenWrt (though 
>> it
>> has its own gpio-button-hotplug but it should not change things) and can
>> verify that button presses and releases are working. I think this should
>> confirm that interrupts are functional.
> 
> Thanks for the info. I was mainly wondering because there seemed to be some
> initial confusion [1] about the port order. If you get the order wrong, you
> would be getting spurious interrupts.
> 
> [1] https://forum.openwrt.org/t/240741/25
> 
> If the order is correct, you should see the key GPIO interrupt increase in
> /proc/interrupts. So, assuming that's the case:
> 
> Reviewed-by: Sander Vanheule <sander@svanheule.net>
> 
> Best,
> Sander

Thankfully i had saved the testing image so i quickly booted up my board and
yes, i can see that interrupts increase in /proc/interrupts.

Before button press:
           CPU0       CPU1       CPU2       CPU3
....
 27:          0          0          0          0  realtek-otto-gpio   5  keys
 28:          0          0          0          0  realtek-otto-gpio   2  keys
 29:          0          0          0          0  realtek-otto-gpio   4  keys

After the button press:

 27:          0          0          0          0  realtek-otto-gpio   5  keys
 28:          2          0          0          0  realtek-otto-gpio   2  keys
 29:          0          0          0          0  realtek-otto-gpio   4  keys

It did increase by 2 which i pressume is from press and release actions.

Thank you for the review.

Best,
Rustam
