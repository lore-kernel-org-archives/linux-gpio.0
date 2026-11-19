Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107892;
	b=CCmF5829ABNVpxhDGXCa9l6JL2lkYTQhIsPY3AyPsNW0arnbMixakitvpXZmkDlE0Ldc
	 nePteFCdjY+wSzrJoQHMxnuQMK06HKXgS+qFFjMbuv2j8W4ZgxnPhjRWSPzED92paeZRd
	 H4AaD3Xd8qaHqDbtuOy75Cwyrkl2fzb9pGrn+IXt8aYopSin+450uzz8t6f7Wt37e08SO
	 5IYndmS9dw+gI5Y6ipZPysrBlvBG79tZLHRdA9x/F6rA6oxBtIQIoc3INOk4RECEEl+3q
	 DsaJeBuKGEblWp5K0syPmK8MTcO0Dv/xsuBgNlxUanOyYziJl/hSEaj2zgtrb+ALMOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107892;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=75ij6pDSw/dGd/ThqsciwAi6urz37SF8jJVI1DSJXJk=;
	b=qUZwUqI9JwjT00dxbpLhkF6XHn5RluNBudKrMyMMfdg4Pof1f4Gri6TFRmlAMC7/UzM5
	 U7vQw03Ym5l30Ndy+3RcF/0LgwjRQbj03YhmMNInYB9WW2OCNITTfuuw9/ItTzCHndJMN
	 zbGKQsJRdjOd/C1zv4DKYapI9FPUjPBxOliSk/WDQaklmA2ZufbOzA/Y724blT6UWNdMX
	 cqh4Ce8Skf0h7nNLjs14dE1lcvhAifjyHAA2ST6y5ReOW9DrvRHL2BpVLzFfivqTWtOzL
	 PYbC0jKUSoDdK4JG3zyOsDggNCSiURQ5CKdhy4cnmipMVGSmL3UqjqfzKF7XOHfFfaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Y+tz4o8T;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6769A60A381B;
	Thu, 19 Nov 2026 17:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6769A60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Y+tz4o8T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795107893; x=1826643893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3GtScdnmVD92QIEfzF/uKMq+5JtKePSJLKPuyf+l/OE=;
  b=Y+tz4o8TyYC08Mo3lcj3e83F6PaVWVFAz31nYlLtNC3pqC1db9VnpIoM
   bKMY5cjW9D4vFUk/EDRtMUQQWT2t0kL1dLGvDTlEu2FYcPa2/3IGFoeG3
   5YCNwySQgkwEFCV5voZ9Qd1KmUsWWVZXB8uMzXMpHV5nB2iMWPNnkZ/82
   RO3qnegtSVbYItmOb/RlOjF5sFQp6vp/F3R5jmCINFYlIRgUi/JBfbQNg
   70vd3izhpLTicHncPweGnVwTaMmEFhniafdhrkypxh9kEY53j6av2cgp8
   NqY3VRxyNaV3+6DNoewADKexifxV8LYBGhWrE54liG0jnB05yeqRm0VsF
   w==;
X-CSE-ConnectionGUID: sHUV5i65RHCnATXYcmTEJQ==
X-CSE-MsgGUID: SNuLV1XpRpahQOxGm4AAwA==
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="67008031"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2026 10:04:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 19 Nov 2026 10:04:45 -0700
Received: from MON-LT-C78453.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58 via Frontend Transport; Thu, 19 Nov 2026 10:04:43 -0700
Date: Thu, 19 Nov 2026 12:04:41 -0500
From: Charles Perry <charles.perry@microchip.com>
To: Linus Walleij <linusw@kernel.org>
CC: Charles Perry <charles.perry@microchip.com>, <linus.walleij@linaro.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<joshua.yeong@starfivetech.com>, <anup@brainfault.org>,
	<rahul.pathak@oss.qualcomm.com>, <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC] RPMI pin control specification
Message-ID: <av8sKVcE17v56Vew@MON-LT-C78453.mchp-main.com>
References: <auEa46zLITsk-pAa@MON-LT-C78453.mchp-main.com>
 <CAD++jLn2dBDakGxRzCby5bUJpianq65=WdmHKrpeF9ZqwH0Zgg@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn2dBDakGxRzCby5bUJpianq65=WdmHKrpeF9ZqwH0Zgg@mail.gmail.com>

Hello Linus,

On Wed, Nov 18, 2026 at 10:36:43PM +0100, Linus Walleij wrote:
> Hi Charles,
> 
> sorry for replying so late, kernel development is intense these days.

No problem, thank you for replying.

> 
> On Tue, Oct 27, 2026 at 10:43 PM Charles Perry
> <charles.perry@microchip.com> wrote:
> 
> > There is currently a spec under review for adding a pin control service to
> > Risc-V Platform Management Interface (RPMI). RPMI is a messaging interface
> > between an application processor and a platform controller for riscv.
> 
> I actually have only one question:
> 
> Is this spec so similar to another four-letter firmware interface that
> drivers/pinctrl/pinctrl-scmi.c can be used without changes or perhaps
> by a simple addition of a compatible string?

No, that is not the case currently. There are semantic differences in the
protocol, the message format changes, the enums are not the same, the
underlying transport is not the same, etc.

On the topic of SCMI, are you aware of anything that could have been
improved or should have been done differently in the pin control protocol?

> 
> Because what I'm not interested in are two necessarily different drivers
> with the same content.
> 
> Other than that I understand these specifications are similar for some
> reasons that I maybe don't want to concern myself with, so I'm fine
> either way.
> 
> Yours,
> Linus Walleij

-- 
Thanks,
Charles
