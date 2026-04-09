Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFD3A1C9;
	Thu,  9 Apr 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740870; cv=none; b=kDFFSkJUdKY8WQPbYEEVfKgwoKppV2mp6D1mkn9weJBqMwgSjQM6a2Pbfc1vRQ6VviwSj6c6PjCaw1CU2cqd2qVQ5fYZfLO/URrWu2Hsjh7kBOJQhmdq0VEsO6cDc0DdhlIjGGMksTqePIPN+sqy37exxOXu91ueeN6JHtgGps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740870; c=relaxed/simple;
	bh=eBU3SA7FLrpN252XLyg4ExTQhtkSjQfIAR1wG6zxNLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsgynWBa7j220ycWR3LX1tBZ/ODJ62gImbBmJIu3fN2UiJRPEzm64tYAtL21KXpO/4NtOeyQpbAiSvpVrAZG4cw8HQHLcMZTe7Qlh0d2CbDkQ/cgxJgZeuwMZRoU7ZTgHjnrzA3z5ks/+kvsP9I8EYCV63XYDtxQsjkpYrpIAOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AorTLUVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AorTLUVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D1FC4CEF7;
	Thu,  9 Apr 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740870;
	bh=eBU3SA7FLrpN252XLyg4ExTQhtkSjQfIAR1wG6zxNLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AorTLUVe78rceNoAvYSepc34X6JYBWvDJMzKPPwsbmzDIrDqmqAwutaGQ8YqQ7u11
	 fOt7dgMK5S9fCTxgMyvSi9M31T5LkNk6o29CCv6txdUfHRl0KjUX8GtdkuZh5Pt+Fr
	 YNuGYIt3QmQTIpwVnYHfrI1QF8Vj4jALaov8civUI23O/r2DwATiuO4snwKRdSb71M
	 6rmDiwmIc2nD++koNuXs8qC+2odlF/sLUMFCzR59FPE5AyitaND40qd5j3PIIeSWFF
	 UWnWQpRRsCHF3VJE2qwshhfXUuaAsNbCIKtaWo3p2ntkWECM6yheTeDMhePXE24N9V
	 Igl0rLOXS7gCA==
Date: Thu, 9 Apr 2026 14:21:05 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/4] gpio: timberdale: remove platform data header
Message-ID: <20260409132105.GD3290953@google.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>

On Fri, 27 Mar 2026, Bartosz Golaszewski wrote:

> There are several GPIO driver header scattered directly under
> include/linux/. I'd like to either remove them or move then under
> include/linux/gpio/. In case of gpio-timberdale, the platform data
> struct can be replaced with generic device properties. This series does
> that. It can go either though the MFD tree or GPIO with an Ack from Lee.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Replace magic values with named defines
> - Move GPIO_NR_PINS into the MFD driver
> - Explain the advantage of using device properties over platform data
> - Link to v2: https://patch.msgid.link/20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com
> 
> Changes in v2:
> - Change the property names to make them consistent with existing ones
>   used by intel
> - Link to v1: https://patch.msgid.link/20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com

Note to self: take as an IB after -rc1

-- 
Lee Jones [李琼斯]
