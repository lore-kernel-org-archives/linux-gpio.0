Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF37F171BB;
	Thu,  9 Apr 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740845; cv=none; b=kUx8W1UK+xF+JGroJE9gKOMhGCnwt5KiYiL8CmYBCg0+SUt3MFcEOpPMlVvEuA1DXmXaVmzDW5ZFYFk52XQj+KB7oRhwzaJO9u0s0Bt/fHwDhLKmNAFoxixjSuFHVGod1LkC3EM4lPPO+yGZJDNXJGGAu8Is438zHziwvd7fzHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740845; c=relaxed/simple;
	bh=vDUEQz+jWK6nNCzEc3Qli00DGi2hHm9IlibOooKNENA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byit6+f0XdtfNM5k4VyJMjHZLnvRqBJpghOR7dr+qelYoP80Jvg1z1BMmeVp+tkGWOFh4w8GAg5VMxUoo1yCvrp/xvLe2EdxlFfWFWRCWeaKXPd/r/LOUQpFZTKosYwKrRspxhQT3fV741hsxFDs5hlWXIWk8do8/e6CiczsvGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/ep/x0q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/ep/x0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354D7C4CEF7;
	Thu,  9 Apr 2026 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740845;
	bh=vDUEQz+jWK6nNCzEc3Qli00DGi2hHm9IlibOooKNENA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/ep/x0q03bY2RzGB7VL1q2wSTWm4T2nFWd6FVx6bNfjez+BO+QKzfqBSskVKKi/B
	 0dlTQwjPyJ20dGQ2P58YgYDf2Aod8eSw7Y1XWGL3wX6ZrpacJKHqSCjWoBUJiI5tUs
	 pRbN80yqCDyR0IPRvy42waHeHLEc8RE8IP9cSPzwshpEBHoTunGjb2tMAj6x/gESlp
	 QYtXpaRhfNthghhMVG77UZdZqoUxXI6zLgshUwGLHKCJMwws/bggSQixZcyv+tzZJf
	 5K9vU0DdrO2gLum++d1eW0Bh736Q947uIS4kuZgvNO9ewX680HkC8Ccnt01s7SKBk9
	 iyXesEPwFAE+Q==
Date: Thu, 9 Apr 2026 14:20:41 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS into
 the driver
Message-ID: <20260409132041.GC3290953@google.com>
References: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
 <177574072110.3341478.15028296329332074230.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177574072110.3341478.15028296329332074230.b4-ty@b4>

On Thu, 09 Apr 2026, Lee Jones wrote:

> On Fri, 27 Mar 2026 11:49:07 +0100, Bartosz Golaszewski wrote:
> > This symbol is only used inside the timberdale MFD driver. Move into
> > the .c file as there's no need for it to be exposed in a header.
> 
> Applied, thanks!
> 
> [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
>       commit: 13f5997f2bbaee976e1a4a6873d6bd40df9b2637

Ignore this - I actually plan to take the whole set after -rc1.

-- 
Lee Jones [李琼斯]
