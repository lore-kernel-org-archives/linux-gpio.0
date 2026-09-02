Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48CF44A3F2
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345303; cv=none; b=K+XZaOY8HHxv31YzA2mwdhp82pbVw1AzA+1W5C5uDRmc7gKrzXehz1fSyO5/VNT6KDJszwdCdDacGhXNv8dMG/wFqqiAZ+TKj62sVHMKvSbtCL4OK7F/DYHOJ98RBLnsFYu8Cyz9AEsvhXqsHm7RBM/jwdFBwMgNmqQWhqOpBo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345303; c=relaxed/simple;
	bh=mKJjTULkBOnEcszjSfuvlcfBmwQ8MNr4/URHAD8y2bU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1xuH/HIWvULqBZd+UIifi/x3Ri6Chv0CCh4cyV29YEr4dKfWf94DSLbsd7gDp+Qzf/52Ibd0nteQRymxBKwBooFEl8Q3GUX1gjMHjwZynbcGPeyy7Hj7BmkKn37YsJONUfNK4pt8tVexRnNimol4WMpOEQf48UVmijt+IhKJSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhEims3p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhEims3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2571F00ADF
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788345301;
	bh=mKJjTULkBOnEcszjSfuvlcfBmwQ8MNr4/URHAD8y2bU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lhEims3pqfBjfyHHjVM5GUDB+llXvMgGhoPh+gOVv3kninuIv0D5RiKXBfN58/Bdm
	 FTcPLDrtP0Zr6gtI471IvbWPfQBBTXb45RboaEc3DLV3kH1//ocDvziXIB/1fAK6Xd
	 PUW+1l3pC6kFEyHZeO6Q3nShrk1F2Z6JZjHT4IDYeBLacwbMGWxNaBeaC0FSxSdXK7
	 lJ++gawHr6wM/hYtVzClarxwp8PRup05VP1o+R39edDdflgz7VuEBIavr0m9F3i4Kw
	 u5dC1Zc/y4+TqYyvaPIdEgBDA+in/KMVR0zimlfJSYUb1sw1w8vGIpuu2a5ajzmE9t
	 vhdsAlDpCTRAQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so751171e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 03:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWdLlZgpJV3NYSyMjRJB6p92CDESOPThX7kA8KBRbHmQ9QKd+1hag2X4cDOL26KthUOLOaIW0YuR8v@vger.kernel.org
X-Gm-Message-State: AFuF++kz84+u69sijj325z8d08fOESaf6FIjdcLHMLsx92PglUNOd2E1
	qFAqMKisAppFXyycy9zdNXhXq7U7seucWV3uZcFCX82UUbCBasK7CezmTN9j1hIRaIErwsATsXw
	LfzhWpQSVIR2wTpe+F66V/9ygeJp1DIZ58mlmrK0m9w==
X-Received: by 2002:a05:6512:10d4:b0:5b6:4ad:77b4 with SMTP id
 2adb3069b0e04-5b6087d8dc8mr1402235e87.28.1788345300008; Wed, 02 Sep 2026
 03:35:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 03:34:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 03:34:58 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <a5956f0f-2842-4b80-8bcf-8763836618cf@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
 <CAMRc=MdKT4RAWdtZf87k5-VbXAZePT2yttf2QPWgRJaowKuDTA@mail.gmail.com> <a5956f0f-2842-4b80-8bcf-8763836618cf@mainlining.org>
Date: Wed, 2 Sep 2026 03:34:58 -0700
X-Gmail-Original-Message-ID: <CAMRc=MexQO0r-4+yPQrY_rCcGUY0E92q9hAD5EoTpwLJxMmX8Q@mail.gmail.com>
X-Gm-Features: AcwNN1UAOK8c2Mxdyr8iZ8QbzDnj6iosXdIQH9kWQ3Jhy2_2LFQ0Tzz1s6UZ58E
Message-ID: <CAMRc=MexQO0r-4+yPQrY_rCcGUY0E92q9hAD5EoTpwLJxMmX8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for MSM8952
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Sep 2026 12:32:45 +0200, Muzaffer Kadir
<muzafferkadir@mainlining.org> said:
> On Tue, 1 Sep 2026 08:59:00 -0700, Bartosz Golaszewski wrote:
>> On Thu, 20 Aug 2026 18:37:50 +0200, Linus Walleij <linusw@kernel.org> sa=
id:
>>> On Thu, Aug 20, 2026 at 1:17=E2=80=AFPM Muzaffer Kadir via B4 Relay
>>> <devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>>>
>>>> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
>>>> has some differences in some of the pins and their functions.
>>>> This driver was tested on General Mobile GM 5 Plus
>>>> (shamrock) using my own kernel fork [1].
>>>> I'm holding off on sending the GCC (Global Clock
>>>> Controller) driver and initial device tree until I've resolved some
>>>> outstanding bugs in the GCC driver.
>>>>
>>>> [1] https://github.com/kadir1243/linux
>>>>
>>>> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
>>>
>>> Bartosz needs to look at this series, he'll review and merge
>>> it.
>>>
>>
>> And to that end please use scripts/get_maintainer.pl to get the current =
list
>> of maintainers for your patches.
>>
>> Bart
>
> Hi Bartosz, I did run b4 prep --auto-to-cc before sending the patches. Af=
ter seeing your message I run it again to check and it said no new addresse=
s to add. Should I rebase on newer tag?
>

Please wrap lines in your emails at 80 characters.

Are you based on current linux-next or at least v7.3-rc1?

Bart
