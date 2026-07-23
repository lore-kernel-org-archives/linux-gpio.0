Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB334C77BE;
	Thu, 23 Jul 2026 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812219; cv=none; b=TN2JE/jCJWJeHJPRD7aKjZKi5Ka4GHXl7iHBCg5Aahhc04NSTqHtC917KHv92WQLVF2/qJ1S4Smw8J38GG7QFKwyFS+didemWYnqp/c4TnPrifAZz2HFvM8Jai3HqX97f7b/WnzfRtgNV+ttSJrBgmdk7f6anPwynflkqOTAvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812219; c=relaxed/simple;
	bh=pOvxQOpYtUtLAYxIH+6d6cOe14toLz5qDMDQSHER2WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQXZunGi/RWCZwEp1Q0eARB5Jvc9MTRmM+PknQ5jnTTfFR/pBCr04HroT1GVRjeUT0Wnr+KxQIrvX9GHnTA+9DD9u3nM6psfMLB9glxU4IX8tMQ6A+8p4oMK8PUCsBjhyNG3c3mNiHPMDWcy+4PAmlCWiISRfU2b4tGfGJwuI5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA671F00A3A;
	Thu, 23 Jul 2026 13:10:12 +0000 (UTC)
Date: Thu, 23 Jul 2026 14:10:08 +0100
From: Lee Jones <lee@kernel.org>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Message-ID: <20260723131008.GK3363113@google.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
 <20260723112940.GC3363113@google.com>
 <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
 <2FF2A15C-6170-49A3-9E9F-F5CAAEC67AE4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2FF2A15C-6170-49A3-9E9F-F5CAAEC67AE4@gmail.com>

On Thu, 23 Jul 2026, Miao Wang wrote:

> 
> 
> > 2026年7月23日 20:02，Miao Wang <shankerwangmiao@gmail.com> 写道：
> > 
> > Hi,
> > 
> >> 2026年7月23日 19:29，Lee Jones <lee@kernel.org> 写道：
> >> 
> >> Why is this v3 set still RFC?  What comment are you requesting?
> > 
> > The reason why this is still in RFC is that I am still waiting
> > for response and discussion from Loongson personals on the
> > proposal that adding a DSDT entry for the ls2kbmc device that
> > describes the GPIO pin associated with the device to signal
> > the reset event of that BMC device. As pointed by Ruoyao,
> > such a proposal will need to be discussed with Loongson. I have
> > CC-ed the patch to the relevant maintainers from Loongson but
> > failed to receive any response.
> > 
> > Moreover, I am also in need of comments on the backup method
> > of searching the GPIO device and pin when such a DSDT entry
> > is not available.
> > 
> 
> To complement, the part that I'm in need of comments is the
> 7-th patch of this series. The first 6 patches are focusing on
> fixing the existing issues in this driver. I thought that they
> could be managed to be applied altogether so that the driver
> would become a good, ready-to-use state. If the first 6 patches
> are good to be applied and we still receive no response from
> Loongson personnels, can I split the series into 2 parts?

I don't see any reason why not.

-- 
Lee Jones
