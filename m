Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354290;
	b=fTH2yNuqIpekBegvNZXNl5YNQXBwmm5mglUq9CHxA22L/gDighGhQOPaQQdzpeRTfb/V
	 dt4S87HNCE+a3cmnx5Ye6E+gWe/RvLyT/gGIef2xUELDrwpMrPN5lfclw13J92NjpOPwT
	 Xyw6WMQ+oFTl4h7q3aPQXTB11a2n6CugEID20wzsPwF1r7IFLVCwpn0VWFpFvjGoVy22b
	 1TwI9byI6qm0tvbm7uPl2N0IwsJTNKMUjVfI2/cUxN0lAwnPMfUgIoH6so2pWL6L35LwY
	 3i2BNH64uFAgvqYvKGKCM9t4Neg1J9tgL2OW+p/nEg7sVp1tLzSnU9PZ5PF1TMWBRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354290;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=yNhU8GgQUg1o1nYtT+CT1yyH9rXOeQLdJVtY/2QBf5A=;
	b=ZMHH/dkz9xJjK+a2hIeens56a9JFxg9T/1b1pDOZDBlHLx8JmWuayDKi052HRM3HyaTv
	 bQnrIy8tvvCGTDpBSxPXw46UNMAq78E/3rLUIf+++Wob/r+Yhre9ru/Ij5wyCAuRwFP5b
	 RMjjphR82WPt4UXTPmAro5xXFJzc/vYOrUbwKqVsF+BKhkU7TiUb5DzUq7jpsC0C2x76t
	 CmHvfq4KdvKK+D5HxOc3zGUahFiWZUOSnUrololYRqXW8cGfj4DBh2Cn5O3ppHpDi/GGO
	 zXpkKpVEj+SUlSrfSPq+RZoWGgyHBbOPskvVh4pSA50B+bR50SibSeouPnsk+2FYXrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NtvUXfff;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2921606A31F
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2921606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NtvUXfff
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261030095806euoutp01b68fe6b041ec6fd37aa7f04a47fa18ea~jRjjPG2wc0772107721euoutp01H
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:58:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261030095806euoutp01b68fe6b041ec6fd37aa7f04a47fa18ea~jRjjPG2wc0772107721euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793354286;
	bh=yNhU8GgQUg1o1nYtT+CT1yyH9rXOeQLdJVtY/2QBf5A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NtvUXfff5dKjwBX0uM7X8ZM/3/RbE2GOv0oE+FmvpIbQNd3CHiOOEO4VCDVdLDCJh
	 wXiSS4SadpXPwkLFCjZFTahhsAikSSMdcmoPyeBU7QSd3ZjrRRQ73pTT3c7eqLKjyG
	 d9ZofaBWa24bwsKrH1ZIERUYMC9SzueXqIg4BGmo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261030095806eucas1p1227bd86bd46487d5dfdbe36bd4df8e94~jRjjGqrbL2917029170eucas1p1k;
	Fri, 30 Oct 2026 09:58:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261030095805eusmtip1ac47d4a4931e52d5610654736cf914b2~jRjik2heC1953319533eusmtip1E;
	Fri, 30 Oct 2026 09:58:05 +0000 (GMT)
Message-ID: <01841455-880c-4477-ac69-ea8c117cc6cd@samsung.com>
Date: Fri, 30 Oct 2026 10:58:05 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 1/4] gpio: shared-proxy: Fix race between concurrent
 first users
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261028123448.510401-2-shengchao.guo@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261030095806eucas1p1227bd86bd46487d5dfdbe36bd4df8e94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030095806eucas1p1227bd86bd46487d5dfdbe36bd4df8e94
X-EPHeader: CA
X-CMS-RootMailID: 20261030095806eucas1p1227bd86bd46487d5dfdbe36bd4df8e94
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
	<20261028123448.510401-2-shengchao.guo@oss.qualcomm.com>
	<CGME20261030095806eucas1p1227bd86bd46487d5dfdbe36bd4df8e94@eucas1p1.samsung.com>

On 28.10.2026 13:34, Shawn Guo wrote:
> The proxy lets a consumer set the line direction and reset the
> default value and vote tally only when usecnt == 1, i.e. when it is
> the sole requester. But request() and direction_output() take the
> descriptor mutex separately. When two consumers probe concurrently,
> both request the line before either configures it, both see
> usecnt == 2, both fall into the shared path, read back the still
> unconfigured direction (input) and fail with -EPERM.
>
> On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
> sharing tlmm GPIO 41. They probe asynchronously and intermittently
> both fail, leaving the codecs without supplies:
>
>   reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1
>
> Requesting the line is not evidence that a consumer has claimed it.
> Instead, count proxies that have actually configured the line (set its
> direction or voted for a value) in a new cfgcnt, with a per-proxy
> configured flag, and allow (re)initialization only while no other
> proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
> gpiod_set_value() without ever setting the direction counts as
> configured, so a later user can never reset def_val/votecnt behind its
> vote. The count is dropped when the proxy frees the line.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

I've hit the same issue on RUBIK Pi3 board, see:

https://lore.kernel.org/all/20261028222803.2682808-1-m.szyprowski@samsung.com/

This patch fixes it, so feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/gpio/gpio-shared-proxy.c | 78 ++++++++++++++++++++++++++++----
>  drivers/gpio/gpiolib-shared.h    |  1 +
>  2 files changed, 70 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index bc69b8729d19..2e9ccd8a8d83 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -21,9 +21,37 @@ struct gpio_shared_proxy_data {
>  	struct gpio_chip gc;
>  	struct gpio_shared_desc *shared_desc;
>  	struct device *dev;
> +	bool configured;
>  	bool voted_change;
>  };
>  
> +/*
> + * A proxy may (re)initialize the line - set its direction and reset the
> + * default value and the vote tally - only while no other proxy has set the
> + * direction or voted for a value. Requesting the line is not enough: consumers
> + * may request concurrently, so counting requests lets every one of them
> + * conclude that it is not first.
> + */
> +static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
> +{
> +	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
> +
> +	lockdep_assert_held(&proxy->shared_desc->mutex);
> +
> +	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
> +}
> +
> +static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
> +{
> +	lockdep_assert_held(&proxy->shared_desc->mutex);
> +
> +	if (proxy->configured)
> +		return;
> +
> +	proxy->configured = true;
> +	proxy->shared_desc->cfgcnt++;
> +}
> +
>  static int
>  gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
>  {
> @@ -117,6 +145,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
>  
>  	proxy->shared_desc->usecnt--;
>  
> +	if (proxy->configured) {
> +		proxy->configured = false;
> +		shared_desc->cfgcnt--;
> +	}
> +
>  	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
>  		proxy->shared_desc->usecnt);
>  }
> @@ -131,7 +164,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
>  
>  	guard(mutex)(&shared_desc->mutex);
>  
> -	if (shared_desc->usecnt > 1) {
> +	if (!gpio_shared_proxy_may_init(proxy)) {
>  		if (shared_desc->cfg != cfg) {
>  			dev_dbg(proxy->dev,
>  				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
> @@ -155,15 +188,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
>  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
>  	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
>  	struct gpio_desc *desc = shared_desc->desc;
> -	int dir;
> +	int ret, dir;
>  
>  	guard(mutex)(&shared_desc->mutex);
>  
> -	if (shared_desc->usecnt == 1) {
> +	if (gpio_shared_proxy_may_init(proxy)) {
>  		dev_dbg(proxy->dev,
> -			"Only one user of this shared GPIO, allowing to set direction to input\n");
> +			"No other user configured this shared GPIO, allowing to set direction to input\n");
>  
> -		return gpiod_direction_input(desc);
> +		ret = gpiod_direction_input(desc);
> +		if (ret)
> +			return ret;
> +
> +		gpio_shared_proxy_mark_configured(proxy);
> +
> +		return 0;
>  	}
>  
>  	dir = gpiod_get_direction(desc);
> @@ -176,6 +215,8 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
>  		return -EPERM;
>  	}
>  
> +	gpio_shared_proxy_mark_configured(proxy);
> +
>  	return 0;
>  }
>  
> @@ -189,18 +230,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
>  
>  	guard(mutex)(&shared_desc->mutex);
>  
> -	if (shared_desc->usecnt == 1) {
> +	if (gpio_shared_proxy_may_init(proxy)) {
>  		dev_dbg(proxy->dev,
> -			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
> +			"No other user configured this shared GPIO, allowing to set direction to output with value '%s'\n",
>  			str_high_low(value));
>  
>  		ret = gpiod_direction_output(desc, value);
>  		if (ret)
>  			return ret;
>  
> +		/* Only this proxy can have voted, so the tally is ours to reset */
>  		shared_desc->def_val = value;
>  		shared_desc->votecnt = 0;
>  		proxy->voted_change = false;
> +		gpio_shared_proxy_mark_configured(proxy);
>  
>  		return 0;
>  	}
> @@ -215,7 +258,13 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
>  		return -EPERM;
>  	}
>  
> -	return gpio_shared_proxy_set_unlocked(proxy, value);
> +	ret = gpio_shared_proxy_set_unlocked(proxy, value);
> +	if (ret)
> +		return ret;
> +
> +	gpio_shared_proxy_mark_configured(proxy);
> +
> +	return 0;
>  }
>  
>  static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
> @@ -230,10 +279,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
>  					  unsigned int offset, int value)
>  {
>  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> +	int ret;
>  
>  	guard(mutex)(&proxy->shared_desc->mutex);
>  
> -	return gpio_shared_proxy_set_unlocked(proxy, value);
> +	/*
> +	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
> +	 * count it as configured so a later user can't reset its vote.
> +	 */
> +	ret = gpio_shared_proxy_set_unlocked(proxy, value);
> +	if (ret)
> +		return ret;
> +
> +	gpio_shared_proxy_mark_configured(proxy);
> +
> +	return 0;
>  }
>  
>  static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
> diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> index 618756f6c6aa..ae10506b7029 100644
> --- a/drivers/gpio/gpiolib-shared.h
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -41,6 +41,7 @@ struct gpio_shared_desc {
>  	struct gpio_desc *desc;
>  	unsigned long cfg;
>  	unsigned int usecnt;
> +	unsigned int cfgcnt;
>  	unsigned int votecnt;
>  	int def_val;
>  	struct mutex mutex; /* serializes all proxy operations on this descriptor */

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

