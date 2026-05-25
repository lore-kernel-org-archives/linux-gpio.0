Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33198290DBB;
	Mon, 25 May 2026 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736368; cv=none; b=R5MmFKxjYT/jGPjh4VcAmbuZTDaAuR5O+mOeIEA5DYjScv5IeFjv72AfT4asLOqYiZAaQCXn+mXesAvXIdJknDFRYWZ9Z0Cd+S4Ka2h/cyKxWA3nX1cq4sVG3mShRH4dSKqrWfi3rbjv+ucDkLNS+pijPRpvHSIsKb+Yxlkc4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736368; c=relaxed/simple;
	bh=FRDIr3eJNFm0SmvnaqziWLuFY9lmyL+6bCBqdGVchIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNmX94ChpbAti2x+rE8m+SC9yJpERDMTCDtJ5EA9XT2KeJ2fbiCodXSDgCqPL4xO+tCxFppqb4hoWEC2EXakYViVWL8DI7grltZdls4UPlQqpZdn31zzHzEEGdviUKliNHCrQXZiNCni8fa/L6uS9d74yTZPE8XWXnU8YOPdZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o3hOEq4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o3hOEq4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540A01F000E9;
	Mon, 25 May 2026 19:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779736366;
	bh=o4JyCBhL/i96DsZBh+8FLeSCmnWSweT8lWDiTgQw3T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o3hOEq4Q7s12+FwtsvAM1Us2XJ7eTXLf6U2VdjjJ3Tp2XA3Zydo/jn+d+XusDQXa8
	 O28rl7mc+zFKcPkq7Rmsy7L/yg/rrikqNn7eZpaF4Xt6qempTYBBPE6UDEl8/pricf
	 pYm8/Md8VyYwYKxXs4fvGoXcwZmUHisHvWm2Da8g=
Date: Mon, 25 May 2026 21:11:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zain_zhou@realsil.com.cn
Cc: linux-staging@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	wei_wang@realsil.com.cn
Subject: Re: [PATCH v2 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Message-ID: <2026052527-boat-avid-0a74@gregkh>
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
 <20260525125128.297-2-zain_zhou@realsil.com.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525125128.297-2-zain_zhou@realsil.com.cn>

On Mon, May 25, 2026 at 08:51:28PM +0800, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Add driver for Realtek RTS490x series I3C HUB devices.
> 
> The driver supports:
>   - Device Tree based configuration of LDO, pull-up, IO strength
>     and per-port mode (I3C/SMBus/GPIO/disabled)
>   - Logical I3C bus registration per target port
>   - SMBus agent functionality with IBI and polling modes
>   - GPIO chip with IRQ support
>   - DebugFS interface for register access and DT config inspection
>   - IBI (In-Band Interrupt) handling
> 
> The driver is placed in staging as it has known issues to be resolved
> before mainlining; see drivers/staging/rts490x/TODO for details.

No, again, please do this correctly and fix up everything and put it in
the real part of the kernel.  It will only take you more work if it were
to be in staging.

thanks,

greg k-h
