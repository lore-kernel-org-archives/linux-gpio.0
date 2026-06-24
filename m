Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7C391E7F
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285921; cv=none; b=Oj/bdRUkXdqsIJFXr9q+gmoS7GgDqTVPSibof1Nz0zWuBuet2rP44mdOZhL4Fq1jEdCkSvPeCF42JMMjO6hmUXguKp/pPXYiEgXQXO1lzvzeWHMusFig5C0E3l6AELwofN2+lTum8qEAXc6pl2ggOR5zTRo+4TBUpdYTU/Nz6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285921; c=relaxed/simple;
	bh=nvnhHh47CXixoylXWGOHPJF5vecV8c8rpU9eHVVg6DY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jp8068XP1636Qq9vsBXq0DusJ5F3D1YU8z0+AuZZ1Ph3JsAQbtzZVTdzBvD0eGnzhJZ89jaZBBdOYXqI+yLELmJ+OOp/eRjtmn1iU6CWDF14hqHQvUpZp0Vr/C1/7//eHICyrD1/EVMUQdthbEwz2yRFDPt3eZaWeGijHW/8Uks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWFXAxX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWFXAxX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C2D1F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285920;
	bh=nvnhHh47CXixoylXWGOHPJF5vecV8c8rpU9eHVVg6DY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BWFXAxX/us4DQUK1idO2Ki9uFSo0MO6O6YaIQa8wMrk29Wvl4H/TKJzoVttGSCeLA
	 Fw+NxnPqoQRwnUpQE5C6BudZxSheDVaqnhvWjhUiJPxF+3wV5/YG1rGryzMmQwahlU
	 g9NjlbTZ/7YQdivSYRp7S3AqRIGL90jlIxUVNUJRZFFW6ArNOWjHRg7PiqY/NAdfX8
	 HQf7v9geddz5Kk9Q9Q7J7bBCr2nzd7GKcRobXl10AH10XMpw6KbfBhMixhNlYGlcjz
	 r/5CGXIkZS62mPOoWQs5i5Jr3QhztcfMPaFZuaO2xAcwwVIRpl8hkSLwfX5eKwLyCf
	 ol3EpNlVKoRCA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-396775c2720so5052941fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 00:25:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5TguyklNzai1T9NzT+PgT5gI2h04++35xRm3Nu2ubqR4rAjLXANtcYr5Lz3mpnvxh3FvxAYDMjc/C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uJoshoeyrPncULC9dZCCtuL2khoELhuAi8o/toF5Gre6u5rS
	8Hrg8BpM1uUGYfuReKapUi/rNi5d7uoWo8tHPsSKsRh7RdGoPtQa0qVPwFy3ikuIQVVNDJIRV4a
	/W4DVfBoZcwGTzPnpAYV2ljXbPajGEQ4lE6g2fgMQRQ==
X-Received: by 2002:a05:651c:897:b0:396:b398:5956 with SMTP id
 38308e7fff4ca-39aba22f713mr5033881fa.16.1782285919374; Wed, 24 Jun 2026
 00:25:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 00:25:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 00:25:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com> <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
 <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
Date: Wed, 24 Jun 2026 00:25:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
X-Gm-Features: AVVi8CfWZEwy0Hj6hsY9nADi3QPZuC2gya2F8U2aO77pZ-fX6Cr7FXVhzwvDF28
Message-ID: <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Robin Murphy <robin.murphy@arm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Heiko Stuebner <heiko@sntech.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 17:16:44 +0200, Robin Murphy <robin.murphy@arm.com> said:
> On 11/06/2026 9:26 am, Marek Szyprowski wrote:
>> Hi Viachesla,
>>
>> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
>>> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
>>> the underlying chip's can_sleep, but under that lock it calls config and
>>> direction ops that reach sleeping pinctrl paths. On a controller with
>>> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
>>> runs from atomic context:
>>>

...

>>
>> I've checked this patchset with these two reverted and no warning was reported.
>
> If it hadn't already been fixed (...)
>

About that - Viacheslav, do you still plan to submit v2 of this?

Bart
