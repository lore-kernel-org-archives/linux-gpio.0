Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3A1371876;
	Fri, 14 Aug 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696004; cv=none; b=cDz3hiOZQ5IFcHjayN0yTp0KxdN5wH/ELc77xlJfKJo5v+igW7oa5T3FII1/jwasETB0R0ejxRDI/HfHCL5YNrjIQj7kAt1aPKKTkfl7KbOG5r296eVbJKj6xDpnNEIuVBjSoTdeC1ZSJedwYmrLyymvJWBYYMDk4DuHxYwTKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696004; c=relaxed/simple;
	bh=0iY93uillYbAEhypGcfpV06of62CUSSszqpwzg+3qJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBggaUwa6Ph1mhgR6aHgJpll6mOL4Ho6DuzyuaxzdoTwwoLRgIWYz6zeJSc/+fpWYVz9HsswpGvUHd++6ISyGOUDETXpXjmNzax52mTpg9ziIX285TAkPsywipGgOdEbDLoGxGxyAUn1o82KAXEg1LlRyNn/DqGyUwYBh3bg90I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gXFzW5dz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gXFzW5dz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E751A1BCA;
	Fri, 14 Aug 2026 01:26:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E89C3F673;
	Fri, 14 Aug 2026 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786695990; bh=0iY93uillYbAEhypGcfpV06of62CUSSszqpwzg+3qJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXFzW5dzsEtfZGFilJ2knhAROo6j21UJgk5LcCLF7uiW2VIaNDMl6GwxWziQI8cBa
	 Hjz0fGc+78RS3pD9uKuFza9mWYD266FKd8ExynCRS96xTU/+HIjdA81fJrgNvbuljY
	 jngJicUpB73C9n9Wq7Qzpsd+C73Cg9mQtSS8lOvg=
Date: Fri, 14 Aug 2026 09:26:23 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Message-ID: <an7RL_mTsznZjeIQ@pluto>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 10:49:31AM -0700, Alex Tran wrote:
> This series refactors the SCMI pinctrl driver to eliminate metadata
> getter callbacks to be replaced with pinctrl and pinmux generics
> provided by the pinctrl core.

Hi Alex,

I gave it a go at this series on an emulated setup and with these
changes I get:

root@deb-guest:~# modprobe pinctrl-scmi
[   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
[   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22

...not debugged any further.

Thanks,
Cristian
