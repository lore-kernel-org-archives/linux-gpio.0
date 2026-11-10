Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308659;
	b=oVb/3oRm/Kip0LDkB6WHa8tEE8FmeqAaT1c/x8I1NhQbkBhLyTAwXm0sOszk9LiXq4Vq
	 4Jqe9kgs2aSrBG/AAWx9wtpTYlyjpfOplAEzgHjXt7z+P/N6/hV3V7gESwq7M+F0lXV07
	 2H9dojjcB76/yc1w3R8LW7BOho+r65pkSJ7lpq94f2ERAKULhIt7OFFXCL5SDr0g1NR7Q
	 2B1iflCuDa5kuX6VCFcoyXkxfru9AcYM80u8Gxh8s7fns2D3+vvOFzAl5GKDSRq414fOD
	 yT52l34euOOiiec5iEv+Egm9EMzV5Znhe+SQOcBkMCcdWAHqH7nA4Awg1usEnktXSlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ZxLXvCJDPTiU3idAYNxvh3COzhc7dqANDF/b6/PgY0o=;
	b=kaTJ7qFSMx9x8FdA+BA2x5sgdBpUk1AWQjmCdSlypqSUekjzphHKR0KCu0XcmogJ07Ji
	 zQx2vmaBNd3GmaB0qFqhiL2JdMCBx76L1HS6Tks6H64djgC0kI6oHdsdLDfb368hft7Ze
	 /P4jsX2yOg1AJHYFfHkYeaYD+EY7C7oS7GFBbPTNiUMS9KPBWw3H1bmBktzbex7Od7yXR
	 ikydfKRm8D6wNpnb8lS8yO+cNN4BMHFBzfEt8xJOvWYE6iKlFk1GXpEj09lc3MgiC12dC
	 fGZeOqkcaX4TZOZ3OJ1eli8lCPaNlh4Zn4j8w6L8YBkYqCvg2o0T04R98dCcUMZ2qpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VcKBDgWF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD8A606A33A;
	Tue, 10 Nov 2026 11:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD8A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VcKBDgWF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730C31BC0;
	Tue, 10 Nov 2026 03:04:15 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80DDD3F632;
	Tue, 10 Nov 2026 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308658; bh=PV8kYHLTSqhDayRyWOJiOaViLS2lBYzQkhuKwTVoj1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcKBDgWFZHDpBmUxcHG/edDP82p6nv5SMsS3gBAaj4Kwg7FvOkiEFUq12Rx60LsiY
	 7GWnmDmhzhv9sPRZ256YUGS4p1w1uUwpV+spDdiqBCn5YLtFTiiEx/Rr4emX3Xm/gi
	 xmOq2kPwAIghEOrtddgGSvBFtq1RITe2iFem46Ys=
Date: Tue, 10 Nov 2026 11:04:13 +0000
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
Subject: Re: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
Message-ID: <avL6LUopS94jB6Ja@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
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
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:33PM +0100, Clément Le Goffic wrote:
> PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
> the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
> INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
> INPUT_SCHMITT and refuse the threshold, the protocol has no type for
> it.
> 

> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

>  drivers/pinctrl/pinctrl-scmi.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 6bc94c68e89a..5de47e060e8c 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
>  	case PIN_CONFIG_INPUT_ENABLE:
>  		*type = SCMI_PIN_INPUT_MODE;
>  		break;
> -	case PIN_CONFIG_INPUT_SCHMITT:
> -		*type = SCMI_PIN_INPUT_SCHMITT;
> -		break;
>  	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> -		*type = SCMI_PIN_INPUT_MODE;
> +		*type = SCMI_PIN_INPUT_SCHMITT;
>  		break;
>  	case PIN_CONFIG_MODE_LOW_POWER:
>  		*type = SCMI_PIN_LOW_POWER_MODE;
> 
> -- 
> 2.56.0
> 
