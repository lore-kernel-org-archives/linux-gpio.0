Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC92C4CDDF4;
	Mon, 19 Oct 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407491; cv=none; b=n4h0znGQH8PsGDSmbm72xX34b8hYoT9BrbRmpZoiQxKnO7NrFoOr86yngs0UyNPPJ/vbSH4E9HzNBGBn89Lx+Ll/XsJg3ymxZ/BX3+HJfXchYHwqgKlvu6ePcyDN4V4Ac/agwssS/HkVvyhzRGOiGbDSIqf/W+VpkwL+Z2jpFiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407491; c=relaxed/simple;
	bh=ewQ2L/U+T777donZgm1mtkM3BgJTCrtDf8wlLKmxRzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaBdSNwwx/LLhSkYL4elZsiczAiEn7hW6+EXSBDV/QBTEPQsH2uDZKYzUPO/0ffT5a+EMAYDFZv2fbz0whakh7beUduj0jmNHH5d2pN3fcjmQap1rkghQ3a72wSrTXQ/l8/DK07DRIrqfNwjeH84QsQUK5i+o8cuNtMAbeeQgnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dAUaYDvP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MpPdZ/LR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dAUaYDvP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MpPdZ/LR"
Date: Mon, 19 Oct 2026 12:58:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792407487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwKbQZe0ssbC2v1gH5o7qPfZg2R/nJOsGqE8xTOvxCs=;
	b=dAUaYDvPPAZ4i5wUYKPK4fmChdu3Mb1k72b+Mc7s3P/lbzO+U2bEOanXObDKCNSVwXFFUn
	19eJIvai59IG7Zl5Z9F7+P2d8YjLJR3wKRGd8TzfjxgA3HXSywuNySV65PeWSegZeRP9Q7
	ci3HK1s3g48GFNnJ37RN3trmsgmRaD8ofVJ0oKxK0osfO1yrTQnYi4rH2ejfObijPRODs9
	j7HEIj5bLxgMRvRws24tGd1uXJI+TrWxYStFLK2Kd83hIltJJPxIdzOFWDty0mXaSxOgJh
	gFkQEYsgW7v8ymarCH//fCd5YFK4edXUFsHfp9Om/ansHBfrSf4+h9zUKA84Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792407487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwKbQZe0ssbC2v1gH5o7qPfZg2R/nJOsGqE8xTOvxCs=;
	b=MpPdZ/LR8ZBoHgwqyyr4Sb7LvQoTq8J+ppzFIga9CGIBhyw1wTJd9oI3SbaUnT7aCeoh/f
	whJg6yMCyOHg1RAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: constify struct configfs_attribute
Message-ID: <20261019125659-aed31326-8dc6-427f-b8c2-f4a55b622cd2@linutronix.de>
References: <20261019-gpio-sim-const-configfs-attrs-v1-1-e9f919b32f08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019-gpio-sim-const-configfs-attrs-v1-1-e9f919b32f08@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 12:49:50PM +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-sim const and
> use the new st_attrs_const field of struct config_item_type.
> 
> Suggested-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Closes: https://lore.kernel.org/all/20261016105712-707634de-c955-4c66-957a-2bdb84bca3e4@linutronix.de/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-sim.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 0c73bec042670fc5706b4a93700e652cbaf3605e..acfe56af515dfd494f1f08bef5806524a6ef7f01 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -1037,7 +1037,7 @@ gpio_sim_device_config_live_store(struct config_item *item,
>  
>  CONFIGFS_ATTR(gpio_sim_device_config_, live);
>  
> -static struct configfs_attribute *gpio_sim_device_config_attrs[] = {
> +static const struct configfs_attribute *gpio_sim_device_config_attrs[] = {

Here should be a second 'const' after the '*':

static const struct configfs_attribute *const gpio_sim_device_config_attrs[] ...

(Same for the others)

With these:

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>


>  	&gpio_sim_device_config_attr_dev_name,
>  	&gpio_sim_device_config_attr_live,
>  	NULL

(...)
