Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C43736E470;
	Wed, 18 Mar 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832081; cv=none; b=lXQFPZb7KsWJrSt1cfr4Y5S/6c+JVa6qWHm0jyL8AhTk50l8whUUeWvUnyqQAPJrQNZpJxsiRdtuKaQk6qrMfuqhu0PjcEoFVPRliDsBJG35ltBvkp+KLbVn4EKJpsBsJsMPrRIZEwWsoP4RcQf2vuRTB2r8EU7wkzUTU1Uxk40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832081; c=relaxed/simple;
	bh=Ihyt4yMDNfjio7njt41g02dClN7EUUumvrGbyySR5T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3wLZj/wTAAkUR+06lbPxJVeomw2fRwiIP7HCNP8RsyiKERI/h9gq1E9emK95QAJPeLcQozad8+Q4/NBw4T+32sptVr1G4wD2N9xdwnBxGt9cY+zszX0PHIAL31CSS4TS9D7GLD2SCY9bUYqeKbTICzpMo20VDJjNzGEKiSDbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 868D21E2F;
	Wed, 18 Mar 2026 04:07:53 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44E783F73B;
	Wed, 18 Mar 2026 04:07:57 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:07:46 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to
 return EOPNOTSUPP
Message-ID: <abqHgv92El36JqnK@pluto>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>

On Tue, Mar 17, 2026 at 05:40:50PM +0300, Dan Carpenter wrote:
> The SCMI protocol specification says that the PINCTRL_REQUEST and
> PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
> -EOPNOTSUPP, then treat that as success and continue.

Hi

a nitpick, this should be

	firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

Thanks,
Cristian

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
> index a020e23d7c49..42cb1aef1fe1 100644
> --- a/drivers/firmware/arm_scmi/pinctrl.c
> +++ b/drivers/firmware/arm_scmi/pinctrl.c
> @@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
>  	tx->flags = cpu_to_le32(type);
>  
>  	ret = ph->xops->do_xfer(ph, t);
> +	if (ret == -EOPNOTSUPP)
> +		ret = 0;
>  	ph->xops->xfer_put(ph, t);
>  
>  	return ret;
> -- 
> 2.51.0
> 
