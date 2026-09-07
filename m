Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2CD15FA81;
	Mon,  7 Sep 2026 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771243; cv=none; b=EgUfQm8h0j8Q/vc4LIu+U2RjHqYsSL+5hrw/TutblQDbsFwJ/cGHLrLpvZnrrDm9VDlPHu7BGZMJq3/uchhFrRxXTnLE8CB/k7NMyDsRtuhlMmIPF0PkJQ1FP5ZzJMy+1QEl9qJ9VhmvHn+JHGJvMOWBgrIjxcdC9ckn+aPZ8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771243; c=relaxed/simple;
	bh=6r80jEFnm3s1F7dKR76DIRBBJxxvmXwScFtxDT/YU9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKC0kxAhHqgck6ykvZhLm+YnYjknZyGNspse8i16xTeCUTBP299jJTufFkOF/O54kzQzsRps+3g39cksplEBM2M+vxZmTdR96SeOQhIAKPvSR6gnLkjKntQZVPKmXoP+POB8ZWtzNTCvhkI/qwSSG7JdPahIBmmPB4YuPiU4ItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHWtZj1M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHWtZj1M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E6C1F00A3A;
	Mon,  7 Sep 2026 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771241;
	bh=zYZU5RO6CYFxX9eTl7af4fFLgMjpF7i3FvHd4okjQY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LHWtZj1MrbItATH4GpA+a+bccFcr3C+07mOYvNJB5lbc1BCKtwCE7Y+2ZugLzUuP4
	 qYO1C6CogNEN0bLUTjfs+GLnXmV+HHdiLp07WOgtLugL7+MjJPQawTKyoRBxyBlW2T
	 XlL+gxBUUcSjRu1fgLqUqdlL6IPTmpI+RsJw50VPszK/eyqpbfiPXguYAPCjjOuZ4y
	 nK9kkveX1Jmf+oAJIEJR7RX+jjGMQd8yJ5rVBzcFu0n9lt6BPpOBenI4ihEqGuvbqQ
	 OC0BggKLGNnUozcxyAnADkiZe5ymQkYPwQeeLK/xUVLq+doJG7x7lRBYQ9rYksWmqY
	 SLms1cLComjBw==
Date: Mon, 7 Sep 2026 09:53:57 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Message-ID: <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
 <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>

On Fri, Aug 14, 2026 at 05:05:27PM -0700, Alex Tran wrote:
> > Hi Alex,
> >
> > I gave it a go at this series on an emulated setup and with these
> > changes I get:
> >
> > root@deb-guest:~# modprobe pinctrl-scmi
> > [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
> > [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
> >
> > ...not debugged any further.
> >
> > Thanks,
> > Cristian
> Hi Cristian,
> 
> I've tested this series on sa8797p hardware and did not experience any issues
> with registering functions during probe. Can you provide me with the pin
> topology of your emulated setup? I have a hunch that the topology may
> contain a function with 0 groups which is why -EINVAL is being returned.
> The previous pinctrl_scmi_get_function_groups callback considered a function
> with no groups invalid.

I found couple of feedback from sashiko valid, can you take a look at all the
comments there[1] ?

-- 
Regards,
Sudeep

[1] https://sashiko.dev/#/patchset/20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com
