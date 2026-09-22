Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354151C075
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063219; cv=none; b=OP8ZL+URa/UzU8ZD3zu17bY08AGut+IuLBy7cn3HhdfIyivD7hpbI7oTLrtcAhwpHCJaz1et2RFLNaBQDpVkUP94hV8zHnWqxaUY54yYx4RIJpYBVHDzjXuGRjznVFBAOYQnQ3gwFAthKi725VP+cSwQnq82eh8qhbi/KtoOEmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063219; c=relaxed/simple;
	bh=rAwrZSEnbhAjepFBanz1IEDBQr5LomBIXFm+PqctUXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1e6C6/k/ZY1tauG6Tnjk2UGPAeznuj2bWMHe7y1VHD4mPPXa0Be0zKSwLW79HHWjIBWCT0VLxPLqFwAFJzngIttX6HV4pA1FcEawoFSHf8t46NTgLGh3EXorgFh0Jb1OaOYypAMdZPAQqspdDvhCItuTdM4Vbu65xrd1tCCqlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=IEVYcNoj; arc=none smtp.client-ip=62.149.156.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="IEVYcNoj"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8v7IxQF8Nbk7m8v7IxukAS; Tue, 22 Sep 2026 09:40:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790062841; bh=rAwrZSEnbhAjepFBanz1IEDBQr5LomBIXFm+PqctUXc=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=IEVYcNoj2wde8M6H80ef9P6bxjE4j+VEFCmwWpOnYYJWbhjSzPNhKWK8KoVIfmvD2
	 o6gR1D9tgsaHYne+mS11HDnt6Ptmi4vXk4pweIIuPfZBT4OfFEd3VqeEzMznUgaohj
	 Q1EimCXEUCi/ssPEBIrxuk0y+CRJF9XI1v4hBDGiHqRCvQTlzq5vPDYGl1ssWgTuE0
	 qORGbOl2qZ13W6auCGDaCmjfuG7efw6REbEWbmH0QO6wMjYoWdto6VUyAHmaJtDnAm
	 wqNTEGSl1HMqnaJQJelCOV3vZVJEcCFH+LisezXwN7DbFeSePEr0w3XeoUHQ5yM3pw
	 HddXKphG2/HYw==
Message-ID: <495ec89c-b035-4bc5-9c15-3ddbb108d312@enneenne.com>
Date: Tue, 22 Sep 2026 09:40:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-4-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260919171157.5502-4-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEX+JZyOpmHRZkZKWpq5GHpt+/+Wou9W4ZmO6rpg+1ED4ppI72vV3Co0jMia9LFjD9LfvprRN7xA/bJervz3uRgOxxxPpbAtousLhawyffm02JeSX7cr
 0+jYsJfb3D6enp7usAcO3caOfZG2xuOaui7MT/gkA84J6Sy6jx9j9lmQ1ubRq63tP7FClDujwn+GtTzfE+QzWOmDNUq4gCGkEYX0Ny5yZOZVMMAzbeV7FsI9
 FN1PZtO1Tf16zH1WkUSdiyPKdZA7wU0yf0z/nbrWbyznO3iuaR6+LgYg62TpaXAuSi73cGL4Hp6STH2G8k9hUBMnAWbSPaS3hbQlU2uM5Xfm61os+xiHXZ2X
 QDthuiWqxa/C1tsi5aRWg8zGKBz6fcXwBBjgTkp9gTmCh1S6sH7HhXzu+AqwzlApMcG9vCdnIhttwljJFM5bFKjvELRdTxoeNFoqGvJ/1W2+5sfD7z05doD7
 c+N81iHbdIbECQYnLZBZKVaWHOy/5r4ESmzSTS3ZF9FoafrWqaUO0n6pErjlzseLF9jlKs5wHZ2qH4+EXjcKihLWl9ehoiDfGwr8uQ==

On Sat, Sep 19, 2026 at 05:11:57PM +0000, Eliav Farber wrote:
> +static void pps_gpio_shutdown(struct platform_device *pdev)
> +{
> +	struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
> +
> +	/*
> +	 * The kernel keeps running after device_shutdown() (e.g. to load and
> +	 * start a kexec image), so quiesce the hardware before touching the
> +	 * mux: free the IRQ and stop the echo timer first, then release the
> +	 * pins last, so no callback can drive a pin after it is handed back.
> +	 * The PPS source is left registered; that is a remove-time concern.
> +	 */
> +	free_irq(data->irq, data);
> +	timer_delete_sync(&data->echo_timer);
> +	gpiod_set_value(data->echo_pin, 0);
> +	pps_gpio_release_pins(&pdev->dev);
> +}

The ordering argument convinced me, and I checked it against remove():
free_irq() really is the first thing remove() does, so releasing the
pins last is safe in both.  Good.

The timer_delete_sync() worries me a little, though.  timer_setup()
only runs when data->echo_pin is set, so on a board without echo-gpios
this touches a timer_list that was never initialised.  remove() has
carried the same line for years, but remove() only happens on an
unbind, which hardly anyone does; .shutdown runs on every reboot and
every kexec, on every pps-gpio board there is.  And as far as I can
tell no in-tree DT using pps-gpio describes echo-gpios at all, so that
is the ordinary case rather than the corner one.

Would you mind guarding it with if (data->echo_pin)?  The
gpiod_set_value() beside it is already a no-op for a NULL descriptor,
so that one is fine as it stands.  Whether you want to give remove()
the same guard while you are there is up to you -- it is pre-existing,
so I would not insist on it in this series.

> +/*
> + * Look up the optional "inactive" pinctrl state. It requires a "default"
> + * state (applied by the driver core before probe) and is rejected without
> + * one. Absent pinctrl, or an absent "inactive" state, is not an error.
> + */
> +static int pps_gpio_get_pins(struct device *dev)

The rest of the patch reads well to me, and the comments are the right
length now.  My answer on the probe-failure question is on the cover
letter.

Ciao,

Rodolfo
