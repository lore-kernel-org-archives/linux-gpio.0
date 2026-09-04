Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710641685A
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500623; cv=none; b=mX+yA4x/1WqBRUD1oWBUlom6G5VSntzqabL3iKqpGlIfP2XgNfQheDvdSWbw84TCs3YfzP8HTpsxu75K5rLmBE+BrO9PbkQ681NolmSdab0jOOmqqVbN4ZfFDkIK9y86gpj/YWPhvzG3ZOj+Fl6glsMnd9U0OBSNrLG/q2cA/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500623; c=relaxed/simple;
	bh=87tW78USOIRu124aJptnXZ1ORwFWyuAoO45i3VE7Rzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRjRl4qPdFqVywjISlVp0zs17IlWEDKktSkYlJ0ADDdgdzD3cDdjM6Z21JpNUaRuCyQf1u8Xx9mcVnLChQID1pAFAuGKGAUiE5fEzqyotxcriN/gzoRprLK3/YPV2MyczsIvG83ms+yoiHSkuuwfVUj22A4iV95E4u4dWoBZSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSWx2XeQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSWx2XeQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d91ff7d9acso5920405ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788500621; x=1789105421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=MSWx2XeQ6YrKYuEm/m5Ku+TmLdgF3ADdeLrlhKjWuUYqYQsk7yysqySZ5F6SyNtK76
         eMAFuO+DBRnJvZ3w3JxHK5UB1g6mtzydM/mwbPM4GNNPVVTllQcKFMbDhAsZ1VzYs7kd
         9rir0tqJ43541t3lwj/+YOxuKm8DgoyrwP9ZFsZxm3Z64vEGHouWTDOTI8vQo1faapcD
         R+gO8HKSRtCVANqMSydPf5Y4iVfwVhxi1kfl9iXlaAecIMF/X2tGYwJ/QgEkWj3dSxdY
         96bHNVPa8OwG+jOZjx+XXNo6AX1S/x7cVET+dDm8PmEyGBD2UenaSmX33BP0hv+auRyg
         iS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500621; x=1789105421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=IY03sfG+QeptkuSFRXmHP9Wjx/Fx9Xft0YxqtvCMQPCu5+1WGDPYpQ4ZStHKPX3bRs
         SMOSNTB5lSp3xxRiUgE622+VAlob8FgovhIM/eB+QJgRRmAvG3ZA6B6qmSZq+hZuS+2F
         WLnFvqpJL/coW070QWOLCQmC7yNpco611sGI4/bD3+7fAKsjGzmxrLvldsm93duH/Cs6
         Z8AjROqEB7DD3mE59FmGV2iEWnKWT9fMQ6v/UwprI98k7Op05GMXYdgI3hL47QKtTxHk
         jZ7ZuEbQ7hSrcztFRZ8PM1/B0mALRB5aR8XLoaVEVebm3Sv8qhmxHfWdkfJfVVFhCx78
         zWtA==
X-Forwarded-Encrypted: i=1; AKwUvBxA1dQ7i0T1QT+hUkC9Dzx6yxD/a3u8Efv9mpB3lR1tc3NCKr6yMR4rG97V5MUgUX6vNQ+OuT3D/U9T@vger.kernel.org
X-Gm-Message-State: AFuF++mDT/gXvsahL9+HmFIZV2BHW7q/J4uq8yB1nWdhY7QGxAdEEIZA
	rYWqso+rGD29l5WzXnp/LU/xHd2RHsmMrsAAsp8yt8aGmGZt63UUwQTnbDSox0hPpSI=
X-Gm-Gg: AYBFou15B8aeG1PCOrM4waP7Zk2ey/9F+MLn17Xn+PNkMhwRrrGt0iCKb/a3VxH48SW
	gaxo7y5fBxnLhfmXpQGKIcol3rx8HCMSQoFjVKIQvJjtu/NpMOVrBez4MzzqbWSnJz7UVICDYdT
	uL1Q8kEVsArrTXjFm9VrhkbzSc9aZN6IQdBbbbfLgXnH5QHXNesDZaVnn1RoYpYnsLM4lRMEJPb
	dho5o2Oly3bAtoZ8SEog+HHLXgsoDf6BFqDxVUt/WGQoPp5WhxZnwGKkIb0zhhAo43aLOldgnKL
	gzBw27f4nvbwyegoD8pyNA+pLj6nF1KdVuW0tFg/1mGsvJpSA3oGFsEww1r224GMt0KXfyFifgZ
	lOYECHzr8FvvEgmUoWJnAWc+CRUvebaul1G2b/a1Uu06l9VF3L7IePAijviisZa+/ueQskghec5
	zSqlJpC2K3QlvWrrclBqsJcn7qABB7jEodxPCChSru2XFMFEDw/KBjoqzWrBw4Bg8=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr5553870a91.9.1788500621351;
        Thu, 03 Sep 2026 22:43:41 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm3885069c88.13.2026.09.03.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <appaikrdwu6GpSGy@vireshk-B250M-D3H>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <apmunD8bkKOu5_Vm@p14s>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmunD8bkKOu5_Vm@p14s>

On 03-09-26, 11:30, Mathieu Poirier wrote:
> I'm proposing something like this:
> 
>                         $(transport) {
>                                 compatible = "$(transport),rpmsg";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 gpio {
>                                         compatible = "virtio,device29";

I would just change a minor thing here:

s/virtio/rpmsg/

This isn't a simple virtio-gpio device, since it doesn't have its own virtqueues
and uses virtqueues of virtio-rpmsg instead. So this may better be a
rpmsg,deviceX (where X is virtio ID) ?

>                                         reg = <3>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                                 gpio {
>                                         compatible = "virtio,device29";
>                                         reg = <4>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                         }

-- 
viresh
