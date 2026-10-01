Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747B65221C1;
	Thu,  1 Oct 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867977; cv=none; b=S1i3jMPFsY7KfU8nENsPYxhj1KVMT5r1SyRCESxG/pQbJFUeOeffikaFuJMUlQ4/bEuP4fiVqtV4rPaPI+v2j+VpD/g7KTsjwuaDWqYPzpI9WhNUsFXPo5Q1b8+PIgfq64s/xX1VYVl062GPj/MJckMYI/urcaRhN9EiGNcmaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867977; c=relaxed/simple;
	bh=jEAI/Fjje9du8FEWqAOWFjgV48VPfCKZieRyc17uYxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/GGA/tc68sB4eSrVTd/IcP3UzQ/9zj5ectGI3dJajI/r8PDSIFEVrza4UMwwQIsx5JuAo1hZwRdtDaPwJg2jqixFh3qRHa/RtEA5qAG/dpyZA7fzWHdg28D/YnHg9rPF58lCB1KBL7+sLUdrQn7cil5Il1gnYsBmZDolxDm6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTkXppNF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTkXppNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926F81F000FF;
	Thu,  1 Oct 2026 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867976;
	bh=jJSNW1Nh+jeKu9IM53pNrbZjZk3Gu6JQhB6eRet0GVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTkXppNFnfdRbneNk5ZQklG4UJeAYT9SsZ592rI0v4yG7RZdK+DO4uVF4luR+H12R
	 sacUYdV3ACLBd5CY+QGbC5NCl6vFJPhRRwFiivk4ZTl/hSiMwZmXLCP8VRZECq1CR8
	 8byqY7X7An/9ZTMSiYuKCP73XOPr4dDtEndKThhCIZ2hrOBVKcZhVI1cu/ZmEortri
	 t9EQOuyYKP7RSOnosSMnGNKMQOBj+B+gn8kSi1wNGMtkYsFzl6I8lEgnlDNqjM1Aos
	 jsVOjiwFvQwlI1WqI2+JMB6SqeQKSyO0UscPdjEx64eC91ZgmfBOC79o4zzqauqB52
	 P1iEZZVAqZQqw==
Date: Thu, 1 Oct 2026 16:19:32 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: kconfig: Select generic pinctrl helpers
 for scmi pinctrl
Message-ID: <20261001-steadfast-natural-agouti-fa7842@sudeepholla>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
 <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-3-3eeee364257f@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 03:55:57PM -0700, Alex Tran wrote:
> Select the corresponding pinctrl and pinmux generic Kconfig symbols
> when PINCTRL_SCMI is enabled.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
