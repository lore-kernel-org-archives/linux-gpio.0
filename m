Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CAD387569
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842966; cv=none; b=EioXs60C1Rc/MtcQFLDIoqNYq2CEvSFEOzUy8tO20hcts1a9fjginDzmjsnqVf/VSPJ+6VEPBKsQ6ueTX3CB/zy3w0XCK6SuoEVB4m7vG2tcQvW8WELHaAsIDOhqdAy3YxytL41eBYcr+okm6GB0pqFtGsr74rsndpgs853vwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842966; c=relaxed/simple;
	bh=cMVH30seVxDqGNU+JXO7CI9A1iWOcqfw3kUyY5cSpXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G59E+1RZwUEOuQVyrEEaHcPbkBi4Os8cGZ7B5ZsHVufGPZVkhytypnfNb8CavyKrpUFV7rcuMKAZYt/CkVZ9BcY8rVUBRMTCScdQC4BF71Q/c8RRDCBSxIXA65jzK9BH9pmgCiD95xWR6cGXG81koPKTZOhLRIahzTIk8xbPpTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX/8PCT4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX/8PCT4"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8486672f03cso1188944b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784842964; x=1785447764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IPzjE3FNOTGqvDB3QZeC9AMUwCIrsHLR+NHAqkuuNKg=;
        b=GX/8PCT4gj44Hoz7vIJxUbVp28tJd0yDDNPY4GD83psjqXwEta24C5bviRZYCwFaei
         E91nBXJWb7sv3khiPzJ1cmjZeBcHDPbGc1nhFbw3m/sKbhITGco+dSEJAsE8uQ+JGo1R
         b1ZS9n6o0ANZA8HGrIRK8e57evntrGmHWRiINx1kNlPVGIKte8jzJZQW1RWi3hBaK6Zb
         0XqW8xqEF88ikau0EV3oyl7FvLgGgio2s4/aEzzvga/TDoOFQ+/9WU6JZgWv7bEc1Und
         8t/hBcl7zH2UdzG2MC1axazphFnVQK8yxWhIpmwGf2Rsq9q8RhObZFsuHcyXX1lBtq+H
         MBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842964; x=1785447764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPzjE3FNOTGqvDB3QZeC9AMUwCIrsHLR+NHAqkuuNKg=;
        b=IsOyFI98MYltOX4XfXJM8sbCGlBSw6dvUGF8GqkiGpln4VaoAjxZ6CMaGhL0+EuPp3
         o4/lmrCziBd8+t8tlPLWpMrYWhJYgVg9ZfYvC18ThdIfSk/GFDiG9etTaAOHJod93bOz
         gguvaa2Ts6vomQ6B7IXq9xESQhTa5C8s7LbNMbG8pASTFs4kyJn/AeDaJf3nOGYuy7PB
         iVyvYF62qmhgtf0189BI3qmaCJ+B5oMhL6SFTs+y9hM/7KakaU+9xZnB/XhOHAoSe+6r
         0r2LO/YNRaTc8X59JRhS6wjeXwdvoxcDk9n8KeTGPqkXlpqTLKJnfcptNe8GAzu+KmC3
         azNA==
X-Forwarded-Encrypted: i=1; AHgh+RqGDKur/MBIMG31Sfp8bEsyfpGFLqjuw3g4Fds2c9C89FvTohi3oRoTmUU/CPVkWpZSRH26NTg/WLLO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qyNuEeooIN4u6QWYiGHHULiU8wYYjRZhOZqwUh5xMU4e8PDE
	mlUOELqpCF/0TElgojWT2M5ThI1tqLPo2Epw/XeKHvz1NekUHfBOE5Sg
X-Gm-Gg: AR+sD10eq8sVH7il4ylbVAgtIL0wqLdE6c8KUszyzqwei2qF3EoArp6CW9X8u5guDUN
	ujGWAuJWii0jQMCy2aGn/8FtULeAM4lA9LLO5pWVphNFXaRf+xRZl1qXh7rlpR4Stc4oNx6lnN1
	L/dqJnIfc4of9110I9l25jn1zcKT5/1VfIpiuW63QaQV0tQzPbXWSWVr20X7lM6TBoeDOIsVvEV
	Edi6flOx5IP0wpe0Ro4DFWBkGsT0IU8YvZpvh6l/tAKkMDCo9oLN1B4ZRjxdpoSEgt5GrOd3huG
	DXalok/Vne387aD6KNsM1pfi2GEci9oYI2NXP0GpdSvUkShq/upR+ZpLplMj2K1tM9p+bkTnH1X
	+l7pMH/XQT/qGXPLx80dkOf2q905T8Y2wi8uQ8tTl4k48JIpzOxfR4366xG4bPbPddgnFfR+Pjt
	/vQabcYgXajH6xVGY=
X-Received: by 2002:a05:6a00:3c94:b0:848:4859:a45 with SMTP id d2e1a72fcca58-84e2b7ca651mr5747181b3a.2.1784842963810;
        Thu, 23 Jul 2026 14:42:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c32sm3663216b3a.6.2026.07.23.14.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:42:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Jul 2026 14:42:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: kr494167@gmail.com
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: add missing MODULE_DEVICE_TABLE for OF
 match table
Message-ID: <7e86e321-aab2-460c-a864-e6aa7c108bab@roeck-us.net>
References: <20260721055022.34629-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721055022.34629-1-kr494167@gmail.com>

On Tue, Jul 21, 2026 at 11:20:22AM +0530, kr494167@gmail.com wrote:
> From: surendra <kr494167@gmail.com>
> 
> The driver registers ltc4283_of_match as the platform driver's
> .of_match_table so the kernel probes the device when a DT node with
> compatible "adi,ltc4283" is present, but the corresponding
> MODULE_DEVICE_TABLE(of, ...) call is absent.
> 
> Without it the module alias table (modules.alias) does not contain an
> "of:N*T*Cadi,ltc4283" entry, so udev / kmod cannot auto-load the
> module when the DT node appears, breaking modules-based deployments
> while built-in configurations happen to work by accident.
> 
> Add the missing MODULE_DEVICE_TABLE() to fix module auto-loading.
> 
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
> Signed-off-by: surendra <kr494167@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc4283.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> index 9b85293ea664..9ec409bc2648 100644
> --- a/drivers/hwmon/ltc4283.c
> +++ b/drivers/hwmon/ltc4283.c
> @@ -1772,6 +1772,7 @@ static const struct of_device_id ltc4283_of_match[] = {
>  	{ .compatible = "adi,ltc4283" },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, ltc4283_of_match);
>  
>  static const struct i2c_device_id ltc4283_i2c_id[] = {
>  	{ "ltc4283" },
