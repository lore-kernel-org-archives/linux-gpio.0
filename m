Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10593AEF3E
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522508; cv=none; b=mUyeYt+2od8fYF1kiswBUsjILcxlXA+5FaUK49VUo5HdUln9eGED0hUCrC9R+l8/CTI6pKz2mdOawG4cFV+UhZOdXYwBXH9vaWgPYgNDQUC0TcfPQZpjKgdrX2PW8yE/t546Jc4IiYOxTiDP2Rdhtl1PUfu8KZ+2DtmcaVECE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522508; c=relaxed/simple;
	bh=1aTCBDot2rWqL3Wcu4hdF2iXis99mvno4rkB+hcpYnE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUiR40YB6BYZWAvpNkOvFAQOs2MMjUCpz8qBO2zWS0SPW8qYc7jSgELG/ptSC68vmexBmZqcotUAHTgMS1ltI23IOwJmnEAxwqVEEHMYm7WBRo+ztyD0ooD79Zj6sLIn0DVDXNMWQBNHADpQC7MOMM1b5KfXh/ZWsGui4VOZXDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+NhIeL0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+NhIeL0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E361F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522506;
	bh=1aTCBDot2rWqL3Wcu4hdF2iXis99mvno4rkB+hcpYnE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Q+NhIeL0py+YCo3FKXDnvkMR+IyIfBk0r+R5BxPqsxL9ALh2xt6Dys/hgKbr37623
	 A9YXlMlb7jv/dKs29aRgIjh3ffhmS57D0JM7xUIXM5kCy8vp7FVKUk9dA36v2lxOT6
	 qINnMYUHF+PdVlre+5vM5ofNuk07YSY5TWT5rO8EM/4IFTTF7BT7Dmaupswu6OY8XF
	 fHdtdOuxkvgXPooBfQPoJ8cD96V1yRbHEfwuptHhXygKJ5vIvuXyyBQybCs5eDRVBT
	 5I2CG7I8o2wcfWRPtVDAWX1lUC2bIFhxPPlOytONO9JQ+r8Zb2rR6DYSHYEITyQ15j
	 q5t+NsPZgT2tQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so5145151fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 01:15:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCUOn9ofOFM0xnJ3pd5C59iIj/nxWx1ySHjuRftJcJPbUdFKbOLpRBUNqEbaz2P4I+yQhBHU2t2kIR@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCrpEqirYX77Rfru48Ys8nCrNBc6VIa71vhAVYt+4IheQ5yY2
	TA6dioUpD2KHnUVqemmahlLJU4N8oVN8Q11JD6iHus+b52zTly0Biq9kFA6a40fU9tF6FEIjqBB
	JJ2FSThzBBt7bu/b9zC/4yFwVnw48k4DmWo/YaYP2/A==
X-Received: by 2002:a2e:ad13:0:b0:39c:9452:15e4 with SMTP id
 38308e7fff4ca-3a10d58cce8mr2976611fa.19.1786522505034; Wed, 12 Aug 2026
 01:15:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:15:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:15:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c5eb8d0e-39ed-4211-bdfe-7902f6ee7f99@proton.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-1-a93e1d1cb53b@proton.me> <CAMRc=Mf+_3CYbcT79NhBPLz2FBs-xWKA5xZxY_hmHbvYvJxF9g@mail.gmail.com>
 <c5eb8d0e-39ed-4211-bdfe-7902f6ee7f99@proton.me>
Date: Wed, 12 Aug 2026 01:15:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=McCz40maTP_MqWEdXS8OMJCM1vJrGSpa9mB5htJhcqQqw@mail.gmail.com>
X-Gm-Features: AUfX_mw0GASBsAuRPdy3KFsspzME1xqYkyH0b_vJyxQeqB0FhTWxT_fHqZbHa0s
Message-ID: <CAMRc=McCz40maTP_MqWEdXS8OMJCM1vJrGSpa9mB5htJhcqQqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: sm8450: Remove duplicate reference
 to gpio81
To: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Aug 2026 18:01:42 +0200, Esteban Urrutia <esteuwu@proton.me> said:
> On 8/10/26 7:24 AM, Bartosz Golaszewski wrote:
>> On Sun, 2 Aug 2026 09:30:54 +0200, Esteban Urrutia via B4 Relay
>> <devnull+esteuwu.proton.me@kernel.org> said:
>>> From: Esteban Urrutia <esteuwu@proton.me>
>>>
>>> gpio81 is referenced twice in prng_rosc_groups.
>>> Remove the duplicate reference.
>>>
>>> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
>>> ---
>>
>> Please add the Fixes: tag.
> Is it actually needed? No bugs occur with it.
>

I - and many other maintainers - find it useful. It seems like there'll be
a v3 anyway, so what's the problem?

Bart
