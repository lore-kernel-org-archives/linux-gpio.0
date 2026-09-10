Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A683AAF6E
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031516; cv=none; b=SN0laJH+ceP5csLzZ17tIMJgBM9xteyujM6W0Gjc/DOMaga8m9q+PhmSAlLY3KfB4tBmJog5kSTukjWXSWpNW4dE6jEq1PvMoAFIFJuNjQXrnzoV3ZerFWHB0lUrBZwWdzXzYw7btb3bnvADD6meFUfKpECULZdCzk4VdAynl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031516; c=relaxed/simple;
	bh=bXm5Cfmda9rEtHcvdnpOqhj5TeaygiTj6KNxu971ruk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phbmVb9j9eOZnYVlpVNkwMFGDCwLwoiZ88VXBav4jQ6XlFo7u6ECJAPCzV+FeUNQQde47g/Q4XNeC9+x/hEI4c/BFV8P1soubGP19QcjPDNLKlOreAEPY1q025B5pt/3hcQw2vi4WQCCpFwPAaeAhAA1pBxfUg+J1bsyeVDYDeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqTVI+Wf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqTVI+Wf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CEE1F00893
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789031515;
	bh=bXm5Cfmda9rEtHcvdnpOqhj5TeaygiTj6KNxu971ruk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mqTVI+WfIRetFZGXQuuLKlTH1YZeOL1XOVSCgYB8qFxdR8PmsVYTG0h9cLNI+uSEk
	 238/349oXwlYCmxpnvrhUxjIMuGOY9M1ENib0ogg2ygAS4SYAcUR2mMuDlgjcMrpLR
	 jlycgpRjwUG7HrD0dXaBEysn02new+uq/MYl3Fk03QoxAxsyi9vuOssdAbAGbgoh3Z
	 W/RjOEDK67mSEcjyscLZ+Jx+6N9ZE31nFb4ueAFyv77A1Z/HdiQJ0C+Vtm53KkYZF1
	 aC3ELvEWD3pyfGSrRyYu4ymoNnZi7uux1W6ul2iaal7+vPKaQQtA4DBaLoNdr6egbR
	 jwfaEh1oXSccQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so1009985e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 02:11:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6OJfnc46yYTm0RP92J51Fi7uIrkE+yQ1HAQD0U7MrBG4G/7HM3hXCApU0JxxAQ0xgpu+Ahbpwoax4@vger.kernel.org
X-Gm-Message-State: AFuF++mEhrUKGmtRL5lZR9qm9Sywamyl/tu2KW7uUTZeGuNcxAdzIBhC
	lMSYgml9UEZwn3az66tbBWsXB+4tOIvHKf3MiNMyhw9f0C+pDsMbuapF3cs1JlrjtRmEVKP1qdf
	D1fsQLyEvV3jMo/4jq1Vk0808Wiqoeqp25Doi3+xJOg==
X-Received: by 2002:a05:6512:6184:b0:5b2:1de0:5ea2 with SMTP id
 2adb3069b0e04-5b8986f684emr2334382e87.16.1789031513815; Thu, 10 Sep 2026
 02:11:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 02:11:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 02:11:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <apgeSVMUQlwqFGEa@gamepc>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787830440.git.misha.zavertkin@mail.ru> <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
 <CAMRc=Mf16PBE0=Udm+A--i2d1VoZCEC1=LNC2q=t8BwqtgZY0g@mail.gmail.com> <apgeSVMUQlwqFGEa@gamepc>
Date: Thu, 10 Sep 2026 02:11:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfTTZKBRPGWi3Bu8n3V0y6TN6TR0izdxZ=Zt0mM2eN+_g@mail.gmail.com>
X-Gm-Features: AcwNN1UsxsZc2HohvTmvUHy9FFHSATa8ekyZ4FxFWlxS8M0dUdohxyBtP8RPc9o
Message-ID: <CAMRc=MfTTZKBRPGWi3Bu8n3V0y6TN6TR0izdxZ=Zt0mM2eN+_g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: realtek-otto: add pinctrl support
To: Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Sep 2026 15:02:01 +0200, Michael Zavertkin
<misha.zavertkin@mail.ru> said:
> On Wed, Sep 02, 2026 at 11:27:50AM +0200, Bartosz Golaszewski wrote:
>> On Thu, Aug 27, 2026 at 4:29=E2=80=AFPM Michael Zavertkin
>> <misha.zavertkin@mail.ru> wrote:
>> >
>> > RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pin=
s
>> > for GPIO.
>> > pinctrl driver for other SoCs might be implemented later.
>> >
>>
>> So for now shouldn't you make it conditional on the compatible for
>> this one model?
>>
>> Bart
>
> It might, but enabling it for all will spare time if/when pin
> controllers for other SoCs will be implemented. And it doesn't change
> anything if pinctrl not enabled/provided for them.
>
>

Sashiko claims otherwise[1] so I had a look and it seems to me that it's
correct saying we'll defer indefinitely for GPIO chips not backed by a pin
controller.

Bart

[1] https://sashiko.dev/#/patchset/cover.1787830440.git.misha.zavertkin%40m=
ail.ru
