Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D674BC006
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212620; cv=pass; b=fltr0/W3Af2DQbgNMCgihr/k5JhWsGGl8isDjr+kIJt/FwMmf878T+9mMYyyQYBVRwtvwYBwoo84J7vrmxzw+ETMuVZASDgPNWNDb6Y60212CBZjMxWC//I3K3kHj8wpkGtGbze6VP0wIWaaMdAibL1/V9F2pm3AWPZBPxJ/TOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212620; c=relaxed/simple;
	bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOJEvq6+S6w+tJk1zXt+tXC/CDao5NmS1Z3ILLJAkjhU07SlbgffVcctisvM8/uKnOf/4kfHFCmEjvwAqfDTYy1GwwvctDsRXQI2DjuCLzX+AlHnWlntDAIV9EXYd8Ne0B2xVju0EKqXuTaIatvujnFp9phIKHpAZu5eDfIo2cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgzP4+Ec; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgzP4+Ec"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895353e9051so15361877b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2026 08:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212618; cv=none;
        d=google.com; s=arc-20260327;
        b=kxzqvvN2jiZXBSKobBstoB+zRDQk8MDqWX6RyQLmZwfurwZAz4deHb8OO2f26iqEb+
         dDWCO+zXftgwJzP5aR1nARQOqrw/g4C0xwjrE25Vz/TCPmj7wbPadTQssmNBenoViVjF
         Ej0EYnJn9jPHrpf9jtiKMDLtO3uhikRvIvliwWwU1S7hsWIBj2gAyP5gbHvC3fHf3QlA
         eaBKWzVV+Bofb1+eoUGdbgkfsbThExnBTRmekwfzEZOG4skLJVp37M6/DEPPQOq7+xx3
         ATrxZrRp8T9t7vTPXwhY0mnznzjG5kTIM3fnEFvN98LnIYQl6hR8WdAHetBiK9D9uX9G
         t9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
        fh=d5+Cqs+Jq5Yj4x36lvB0frJMXP6X6ee9P2AUzefxjlI=;
        b=k4bDL4j2bOV2FcvnhMlRbzhYtCbyOXOB4vIVP47Ij1E327zePeWQrmS8gs07QX9m4L
         /jAdk7zu9JSUkwL+of2WRWGyYbTF5YNBZr1ZDQKRZrr3ObRIgOGmeeiD+2Lu1ZuGY4D6
         +xirjhgAnBtR8CQLbieHd49jgRXRGYGedooxkD2i7+hUsGcinStMK/E/Wv4uJczioFSO
         OSAx6rJJ1KpG8YiuYTKwMKJ8X08ZvCwARP3+AvckzhbpQIElpGnWnfAsaI7vn0fcHkTR
         +1ZAn11eBiPX0OP/FFrpEuP2i+axhtkkw4OLtcA9R0ma3RxADkFGRG7XxdKMj9le2veS
         iWOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791212618; x=1791817418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
        b=JgzP4+EcKnKXVfAcwXs4VJ/FBNS0mi2QGeastASyxHI9cq6SIZaYJpv09oZwQMSVKF
         YMQI9bvKH4tPh/NFffnFFekmZDS5ZRVlmcGATyg7wfdq/I31cXm+61qbPSA9vKY0atyG
         /BJZGJuuxzhdMT8YfKDoEtUzG01vpJDCa95525GCg1+kOdN9282NUd3D2NpF/t1YISGT
         fiAn2Pm6tQmOuGHViIQIubkTymNKkJ62THEMMxioLIYLN9t6YMwNiuMgq+cseHfQbig0
         fj+rySET1mW/EmIqzpDogNBqYrD1IbwQJVybLwLDv1k3n9cK3k1HBKyJmeMmdNAg3l/Z
         +JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212618; x=1791817418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kABzR26FUddzoC8F3veFCKtMWyeoXM1NVTRtaYeniwY=;
        b=FFTyMi+jKtMU6fSHOISphkwuEuAYzS/rGdfA/ErSEj4GFW2olQWcQuR/lvcxxfGRSn
         aL9l2i37JBYoMn61wAxFIEpkHS/SkxnrjMcluc13lMR9HfLjLfoD9ad2EWAe04AJig92
         +xu8OJs51VTSmiJRUqKcJdItQoftMEZ2LsfWutj5nIFWUqRHcRgpcDA0ME0Ak8uHrOPO
         uGXgu9zpj1Gp1WQUkVy32SJeHHxARd4oCv8LmHvFCMXihMMJWlICClMXsSoOHfRzpyP+
         DSTZQa2y+0TwZwhszDVU0h2yL4qttmAQrx4otGuexpcj5H3e6DbITBDJ5yvQ8rClJPz9
         XWvw==
X-Forwarded-Encrypted: i=1; AKwUvBweli1c2PZKHC/dr/AzmdpiEa35m+QWKI0piiYxooU4CyWvQpK7PutMzuprRBpWsHiDgptboDn6yovQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJX8/MVdgzWY0FFmCrhXGjnocoXEq1IcbP25AdRegHb4ykq9IFa
	gv+kgYzXpoXyc4zOBEuk6RWlB3wtdFD/Oze5pu9VO1xxHFOiANiZZFZwVcm+uedA9YK8SR3p8SZ
	7piu53TKyHJZUbEueDroWykQHFNMmzhk=
X-Gm-Gg: AYBFou3IYGwC4PiOwzqzhXxbb23duyKJYMLXlkD9idIKm4FDizB2TAEV07NFnGg+glp
	+RhKzYL6BJuvID/sw6gLdjHybouFM9aY7e+9PNSACFXNElORLxFHeYslrFMHsHOSy5EcU3chXL8
	feQD7DmF2zNCQRwr9QzMVjUaHw0DvfY05DQcjY06BT6L86H6/UGVcQmFUjP3Q0XqTIfM6tHvVgR
	mMDv5bXDCOdqW7si3sLjU9lQFAEgXHxdFN4sa6HhpClhj2nVSHHH0Jlr2yaxp/YBDEY+XbQQ3RO
	4hWezOV7Gutjov0pO1DOhFHYdlZMt5XWLPF8LrYWB8euxzfWd2jc4O+84w==
X-Received: by 2002:a05:690c:9988:b0:81f:64e8:cac5 with SMTP id
 00721157ae682-8ae3690bfd6mr39572787b3.7.1791212618431; Mon, 05 Oct 2026
 08:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
 <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 5 Oct 2026 20:33:26 +0530
X-Gm-Features: AclHuK_6E3giw7DMVtI3NjFHjcW3o3GAmqzSvLwH6NZdDb9tYMvxI8L2SsjXb4U
Message-ID: <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since THRU1 claims both pins and is mutually exclusive with GPIO
control, should the power-control consumer acquire GPIO122/123
normally and select a temporary pinctrl state that disables THRU1
before driving GPIO123, then restore THRU1 afterward?

On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Hi Prasanth,
>
> On the AST2600, the THRU1 pass-through and the GPIO123 output share
> the same path and are mutually exclusive, they cannot be active at
> the same time, so having the pass-through pair also controllable
> through gpiolib isn't achievable in hardware. This matches both your
> observations.
>
> Could you help us understand the use case? If the pass-through
> already handles the host power path, why is switching to GPIO control
> needed at all =E2=80=94 rather than simply keeping THRU1 enabled througho=
ut?
>
> Thanks
