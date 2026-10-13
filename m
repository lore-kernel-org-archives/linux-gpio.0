Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E45013B0
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898654; cv=none; b=kLdH3DmkLU4GMjLsWYPHDZQh+Cl+y5tAbK2mufcb2Gpr+wS3P1ClL3pCEF/MG0BZdhmnou6dGn4Co96+f9segrvCpkCG7qWGEMhthRZ94pwkyrESu1mNKbSaicGotp9fR56fJYClgGeOcTANvh98fZTjNKWRuEIetDdk3AusDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898654; c=relaxed/simple;
	bh=QoBODyQ6G8vIvuEuQar0BDtgJPSde7YXlduz1zgpCYU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s14LRyP6nK/x1goIWQNiJf2S0j1ICPWzJILC0W0To5LfZFb0/R86ui/s3nA8doL8izGWXWvbNzrfGCsyV48JJ1Glo+zUDl596U0VeTMaj3Y6JHqQ3569rbYUQn3x9hDrSOLA6LiRSCmGb2cgxBbaIt2eZPs4IS2xzLJHzw25C7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcEvCYCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcEvCYCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4651F00893
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898652;
	bh=/jpYxod55y0lkvSUQsLB9QjZICIEkF1DnOojB5WeKro=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IcEvCYCSzg9iyYqBYbZwOCepQr5fujYI6wF+4AXU/vwX3/qo+abij/6sRGUEI5wkH
	 HSnrWYDh911kIGcAZNNws3aevXnP/OA4M8FyTsJmy7VMCnJyI3FnwsGGObArwm9+pQ
	 qcjXGEuLFm4+LKQZO2G7Z1spFXexmntA9E6mNb6lFCm/cNIBECR79mCIYZOACn8RAM
	 zW33mrqEK+tIPWjEUhxcJN2MKXsmmoLtLeZZ7WbYnAYcKLnTQI8Yjd0KQbJd3/08AE
	 MKS9R32zFEk05ipQDzTXW6SEyIFYPYDeD846A2wS4KleXwWDSm1VyyUylqF6OvGaw6
	 4Po1vAB30OlGQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso25112621fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:37:32 -0700 (PDT)
X-Gm-Message-State: AFq9FYKDo6ey2zZeAyQNJzEW7bDhMLWdr/xS7NKQlFg3OOrQ7jGdSi89
	DRdLNL+9Ob7QFk0VG8sAvel0IAxaixmR4v8QVrkUuFmNMu8ahA02ea/9moP9ugtbxkMRQwJCeVJ
	gXSRHSKsNFFIkW0dBNmGGZIEIkeyTarqwsOzIIEvAWg==
X-Received: by 2002:a2e:be91:0:b0:3a9:707e:ad95 with SMTP id
 38308e7fff4ca-3a9c53b454bmr28581701fa.11.1791898651132; Tue, 13 Oct 2026
 06:37:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:37:29 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 14:37:29 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <as4twfDzv23p25yU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
 <178418869936.4524.15759697748852640442.b4-ty@oss.qualcomm.com>
 <aliWiN1EaGziNZ7f@ashevche-desk.local> <CAMRc=Meen-m7FohCe-uU89R60SNU=gJFXkwpBjpTZMw+3+1b6A@mail.gmail.com>
 <as4twfDzv23p25yU@ashevche-desk.local>
Date: Tue, 13 Oct 2026 14:37:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfTpaBT1-zwn4HP56v5FsRbu+tUkAYbtndouN+O4Et6gA@mail.gmail.com>
X-Gm-Features: AclHuK90fHYsUWk38rjYtt9AkqfQk-T-NfZISx_5s5AZLDxBRQZVRsyFODpDEbE
Message-ID: <CAMRc=MfTpaBT1-zwn4HP56v5FsRbu+tUkAYbtndouN+O4Et6gA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 15:10:25 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Jul 16, 2026 at 01:35:18AM -0700, Bartosz Golaszewski wrote:
>> On Thu, 16 Jul 2026 10:30:00 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Thu, Jul 16, 2026 at 09:58:42AM +0200, Bartosz Golaszewski wrote:
>> >>
>> >> On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
>> >> > No more users.
>> >>
>> >> Yes please! Thank you!
>> >
>> >> [1/1] gpio: legacy: Kill gpio_set_value_cansleep()
>> >>       https://git.kernel.org/brgl/c/aa4bc3b7d36d52caf7c3d3214ae4ce96d609e8c5
>> >
>> > Not sure, I put in the comment that this should be part of MFD, otherwise
>> > the one driver will fail (the conversion change in MFD tree only).
>>
>> Ah dang it, should have read what's below the commit message. Backed out now.
>
> Now it can be applied, can't it?
>

Sure seems like it! :)

Bartosz
