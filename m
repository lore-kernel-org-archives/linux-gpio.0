Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69A043C7DB
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278345; cv=none; b=dwZi81j+US+7ntyWIxAtCGNNGXqtb7ZWVotP7RnZJhb9YN4ZuzGibEv1ghUY19eVvvmEmTTv+GySdRfNCL9T1mHOshr6N4hCH9CU515CxDKsiiHw38GsfLlP+3dTFrSHLoJbznj9FHwBdT0ao0RzCCNarR7gInODDgWQJCsQaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278345; c=relaxed/simple;
	bh=Oq7ZplkLYZ17Jd6jgncCN0Tnzdy5Yo0wIVW/z/36jGQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAVr+WQXIL8utU4Yi86pr7NvVsMBIAQ0GO3/BdeMSexn8TAYopP2KrjfAFRTuH8PVjcimpQdbVoAfF5DDZ3X6S1PM2WXpW8EUU0q4gaYJ7/TrPG1cJydWUtX54hYjf9lc5En6YbcYdC1lreWtuasyWAUhqTwzg8nP4p0IgolbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWcZvkqB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWcZvkqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB0F1F00ACF
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788278343;
	bh=Oq7ZplkLYZ17Jd6jgncCN0Tnzdy5Yo0wIVW/z/36jGQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dWcZvkqBZ0RelBOMhEWfPRzEqzpyr2Uaok0CnBqE+cCRXhOM6FI4iVuVriNOxGryp
	 W3liV9wKkydPRopz4NATBAYCeIboTKrk/rdxo8wfCcmqkVGmZpUQCn6HnwkMASPnuu
	 R2jy2OhcK2WfvoSnsROGj7OIApJfSEjW1SCZed6kSunfZwLH3V64bFZRBuAjpLuMGQ
	 SBBa7qhcP6ui0j2I4lqDtGTybfsZrPfReU7IcGvL2vzayc+y0hT6+To7N0+dfntSl2
	 hD4yJeI52yIKnuruDiC6Ly0mNquK4XtyuW+H3lkJJ0IAbH1TtyfvkTRiyc7e03fMgU
	 S7mpFpjb/7X6A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4ab0e4da6so4473079e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:59:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhCFZUkcC8edgjgd17S9JTLVvgAaALaQ3YkVBnCdtfCgLhFmp8HeRH0LchAreF7YNa7kDk911W+LEZ@vger.kernel.org
X-Gm-Message-State: AFuF++nURp9Mo5vqW5cVurnhQXyng25y77Nc2SDIHWd2NHHYSLisCo5P
	hurLF3hH358XLuoqxXclXLFJGSDsR2RjA/J/7cdox27s9z5pvv3elQs1pVRhf8OGc4dZHcDQmMG
	eg/8DVtBHQIryEc/147xvl43IQ/8VZSS6oU13V6hPvg==
X-Received: by 2002:a05:6512:318d:b0:5b1:589b:3579 with SMTP id
 2adb3069b0e04-5b5e68b268emr9763174e87.4.1788278341806; Tue, 01 Sep 2026
 08:59:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 08:59:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 08:59:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org> <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
Date: Tue, 1 Sep 2026 08:59:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdKT4RAWdtZf87k5-VbXAZePT2yttf2QPWgRJaowKuDTA@mail.gmail.com>
X-Gm-Features: AcwNN1UfNyHlYiZf5Y-cZ-ZfikuCsNoWOHA6SA5CDbMjoE3viBQPShEGvuq9myc
Message-ID: <CAMRc=MdKT4RAWdtZf87k5-VbXAZePT2yttf2QPWgRJaowKuDTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for MSM8952
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, muzafferkadir@mainlining.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Aug 2026 18:37:50 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Aug 20, 2026 at 1:17=E2=80=AFPM Muzaffer Kadir via B4 Relay
> <devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
>> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
>> has some differences in some of the pins and their functions.
>> This driver was tested on General Mobile GM 5 Plus
>> (shamrock) using my own kernel fork [1].
>> I'm holding off on sending the GCC (Global Clock
>> Controller) driver and initial device tree until I've resolved some
>> outstanding bugs in the GCC driver.
>>
>> [1] https://github.com/kadir1243/linux
>>
>> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Bartosz needs to look at this series, he'll review and merge
> it.
>

And to that end please use scripts/get_maintainer.pl to get the current lis=
t
of maintainers for your patches.

Bart
