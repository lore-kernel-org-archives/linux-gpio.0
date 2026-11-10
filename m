Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316855;
	b=WHN3hrhmMu6UMQYzPrPfrv8OwHayrsQL/lFQx+dtUFUZrdFgYYLrufJ52OSUTF/rS4yd
	 t9qg5TLDsF/PecesYeRPsV2M5ZEJvUcvTiib3KZAeGhPRiJBB/WZ19XYEiNRf1uLwaJL6
	 UoaDP0HXQRaizrWf59ZwTrphFTq9UETdVvs50oN2Cb+oE1tTgEUymsWX23eKFQch/cHKH
	 LFRntN9s5stxkSi8KIlzYajancZxKfeDTcLzi/nKuFbyyjLxsoVQ4ESGB5tST/lJx+a4A
	 7o+yBHz754K8DaRGqcH5gJKb2bCq1FIFxZC83xS+v32q1Amd7+1M4jeiRcNOwultHWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316855;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=frrN9eP5VKX7iihEaJrF6vLJxtmPHDqRPsxohmOYZu8=;
	b=x1H4140snUEEJwPqqpn0orCSzujRoBVg8/YjH90ckMj/QMCzghAKajmvqSJShw6ZoVQn
	 y819HU5R1VDuTKpOOIU1foBzsk6o4aunte+f1aCnu+T6YypeBBX7MW14TPCRzjJoG0iN+
	 18UQO+D3n2/IFml2rr9/zFv3lIHoImeyFZSkx9y9uBwXB4eRwpTfeSjtL+KYX5ZbHjQBC
	 zmJY4VMQIvTFW/26Yo0ZLeADuDuQa3JxREA488FsGMxLTfe0qR6i/5R2wUwW2AJ2m1RvW
	 LjZg8H8aFi8i4efluv3H1/4/DsvLoMmGS9I+QqumVZZ4L5FbsDuHapB1nCnEiS8g+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YlrRRqxJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5B0607B10E;
	Tue, 10 Nov 2026 13:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5B0607B10E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YlrRRqxJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3005143D;
	Tue, 10 Nov 2026 05:20:50 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42B2C3F632;
	Tue, 10 Nov 2026 05:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794316853; bh=8xoLOeJ5D5iFRiilyKCfOmsSoEqiyL5IFmDWa/z/4zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlrRRqxJ8JhiltC5XonPWyDKEAZUX9aNRSAVZjMvqQiTyKGuXTb+idFqYGPuwaIag
	 nQ+encbFYzyVaX9z3KOlVt0FSRaLwHkhbY92gqU8sUcKEGir3sgzFj6iCvV90X+KAl
	 weOqY7W88IHI2Z7x31ynnQQgVOS0SOZ+NkZbPO4M=
Date: Tue, 10 Nov 2026 13:20:49 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] firmware: arm_scmi: add an operation to set the
 function of a single pin
Message-ID: <avMaMftPv6MTM6Qx@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:41PM +0100, Clément Le Goffic wrote:
> Add pin_mux_set, which selects a function on a single pin. mux_set only
> works on groups.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 7 +++++++
>  include/linux/scmi_protocol.h       | 3 +++
>  2 files changed, 10 insertions(+)
> 

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

