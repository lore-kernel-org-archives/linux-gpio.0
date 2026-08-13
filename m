Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D3A36A367;
	Thu, 13 Aug 2026 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611299; cv=none; b=UTLk/OixOtcPJVf5g8KPluOyu97+hM1HESFYjxK4JFz2rT8rE7rFhcXcIKU8BJF9ytwJubTnsQicETRXFnXharfV1KyFrUjTj3LmmG6hvGZnz1M4oT6uNARgOXUFkareR5yUlPwtb2AovZp+o8NsSHmHtWi9RzJxPh0tc0Tmr1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611299; c=relaxed/simple;
	bh=b1mkjiaYhZ+gOz/GYR4usDUoP9Mm/7s5Uf6KRLoc/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUHsxw8o5v8amzQfSMkIiGdXimd9eFuJvvBpDNvyouKSmC/TYR+Z9cVh1ejYjf/AHPfk/UKLkWHA6QIJZC/8wo3uT75eL+ouTsVKqeOOgBUzFVonlJ2pH4Cp0/PRInMqxd2dfVC28nRnS9W0t92eVvPQNpY6gSjkx4Q1s+7kdTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2bXQPNi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2bXQPNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC1D1F000E9;
	Thu, 13 Aug 2026 08:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786611297;
	bh=djhMMhm4AQ9XAauhB6WGwWYRfna14UGULPtOodmCOI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k2bXQPNiqYoX4vcaImKY+NxSSMWV1eceF/U7rvZCBQWtl2AtvqkPfbk5u8KLJMTMI
	 fMedMNt6M0GC5LmpiGQLJ8gz+heGsAR4J/Hbh/oB2jbc58QACwiDv59QvXu0drSuKE
	 XgRvX1w1B2SXjmU6t4Eo9h9DhJsdgmLstG2K60zyaO3h65ljKYliL2Tv7CNgYvK6nI
	 ZkLuiCJMWV1zTZVtnktorVV0uG5MQJMPkl7ucHrkquGN2aOTAEiH8mxinq1z1fUAae
	 wGxvI/ApPQ7yEHjTd4cbYOL1S+JeiGrF2eUw5jY9uq28kT1GANA+N91a0FuSqX5Fnj
	 HRbeOf+ZbgmPw==
Date: Thu, 13 Aug 2026 09:54:51 +0100
From: Lee Jones <lee@kernel.org>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Corey Minyard <cminyard@mvista.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
Message-ID: <20260813085451.GX1072730@google.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
 <CAMRc=Me=4vhCACibcXWhH1J6OmjxbEmhatPLuUuRE3pFLkT7xw@mail.gmail.com>
 <E22A87D6-F231-442F-83F5-FAE25D0955A2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E22A87D6-F231-442F-83F5-FAE25D0955A2@gmail.com>

On Tue, 11 Aug 2026, Miao Wang wrote:

> Hi,
> 
> > 2026年8月11日 21:47，Bartosz Golaszewski <brgl@kernel.org> 写道：
> > 
> > On Tue, 11 Aug 2026 10:07:24 +0200, Miao Wang via B4 Relay
> > <devnull+shankerwangmiao.gmail.com@kernel.org> said:
> >> Previously, the driver has been introduced to support the Loongson 2K
> >> BMC running on the Loongson Servers, which is essential to prevent
> >> the system from hanging when the BMC is being reset and the default
> >> efi-framebuffer is being used. However, there are some drawbacks in the
> >> driver.
> >> 
> > 
> > I will stop reviewing this series now. I had further comments that I wanted
> > to post after reviewing patch 6/8 but got carried away. When I came back to it,
> > there's another iteration already on the list. This is not the way to do kernel
> > development. Please *don't* send new iterations hourly or daily. Once a week is
> > preferable, twice a week in special cases is acceptable. Anything over that and
> > I'm losing interest.
> 
> I apologize for interrupting your review. I thought you had done the review and
> given the suggestions. The only change in v9 is adding the comments which you
> had requested in the previous review.

What's the plan then, Bartosz?  Have you given up on this series even
post-apology or will you finish your review after a short break?

-- 
Lee Jones
