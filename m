Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640E3C1D7B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361419; cv=none; b=Iq5sgUjXa0kidP3YAS/Z0Cj73rxdNSz7LiEiBt2BvszGDzRMVjKq4eO3O1QRheVLmI+O8Hu4Xrgq6N4VR9K0FU8Pg0fZF5o9u5bQZax2u1EyJq7qeBy9oHCsNCqUbECdRk8iiLatOJeajhHRHx54lRfFxNL08J/+WRKNYBte0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361419; c=relaxed/simple;
	bh=2rIN49E9msb0j7mFIV/9GpalM5n44aALwyt8u829UHo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poIFWAcQOewVOjOHmmxTT1dcwRSomrOx7Q6N89Bg4GpOCgc3ZhEnenC14p3Web/91fiJ9U6pfmc4zgKCqhZycGdi0JzvtEQ/nuptmlGzL9DBWSLY/mwHzA3yU7pzAlw3HBLgeGqNVwQh9RHYfh5qVFNDoTxukFcwNB1FS+Vdjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu+kWiRp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu+kWiRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387061F00ACF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361418;
	bh=2rIN49E9msb0j7mFIV/9GpalM5n44aALwyt8u829UHo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eu+kWiRpuEZlYhaq3RJlITQ8eY2OugImVbdMMa5c8sI6nURe64MySC0GtyiACxjbF
	 stiXbOSxvsQnbMqIEs7S72adX3L+u9Otn/B4ZpCXx1XmDsQPNlB52flhadTM2me65d
	 HhH2Lq7BVtjGuvd5qgceJBRDQNOJ+WO8w2y2mO8AdkUNuCjg+jeVi6lB2JOuposHJ5
	 XOuBnqiSjjkfnVDU0uFlgKp3FsQNMosTlZWPIoMK9Aljfd3PDnBu+drTdDh+mJMauC
	 +gbk5+T6V8TS7SnbMae3HoDGAKarX7BbsyQat6jakrps0vLxhXhrmzC43SFxswTkwl
	 j+DaF6DCTXXyg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so1097698e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrh3d/sig0l0nGTQvtE5Br+IRHmD2rjaOy5a0XQCmu7Rvm5pq7yiw4s3i6MWhkA/FzFicB3h0VPYOxD@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdShzFlWnaGqyBNg1eEjG6XuKxlyyiL8weG//wkkksEZX/qKD
	bLrsGVllmkqUdvAEyAhx9JSdeFZ7Z/k0oludt8ptECa7jnbtxYo6msx76Bfs9I3qQxk/4gU0+UJ
	mJIbSCzhAEZDEub81qa11csCaJY+9dQVs+zi1k6tPIQ==
X-Received: by 2002:a05:6512:108f:b0:5b1:56c7:5753 with SMTP id
 2adb3069b0e04-5b3181ce142mr169420e87.47.1786361416943; Mon, 10 Aug 2026
 04:30:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 07:30:15 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 07:30:15 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <38DD546D-A2DE-40D7-B6A6-0708162EAA55@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com> <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
 <38DD546D-A2DE-40D7-B6A6-0708162EAA55@gmail.com>
Date: Mon, 10 Aug 2026 07:30:15 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfXcL3HLsAmu_JmR2FjhbUDzcaOtCfC41EvA=cUeL4U4Q@mail.gmail.com>
X-Gm-Features: AUfX_mzfEv3hUl6tc30lrv6HjX_Ay321BGCAqN3srNQ_31blZ1Rn7f6BrwC9sLA
Message-ID: <CAMRc=MfXcL3HLsAmu_JmR2FjhbUDzcaOtCfC41EvA=cUeL4U4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v6 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Aug 2026 13:28:56 +0200, Miao Wang <shankerwangmiao@gmail.com> s=
aid:
> Hi,
>
>> 2026=E5=B9=B48=E6=9C=8810=E6=97=A5 18:14=EF=BC=8CBartosz Golaszewski <br=
gl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Tue, 4 Aug 2026 21:14:25 +0200, Miao Wang via B4 Relay
>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>
>>> + gpio_dev_get_fwnode(gdev), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);
>>
>> TBH this could become a GPIOLIB function as gpio_device_get_fwnode().
>
> I wonder if this function should be a static inline function defined
> in gpio/driver.h or a normal function defined in gpiolib.c? I tend
> to the former.
>

Yes, a regular GPL exported function in gpiolib.c please.

Bartosz
