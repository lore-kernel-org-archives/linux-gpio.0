Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701843;
	b=rKXcwN1mHA91532bT2rQ/sUgLkeEadp+dZcGdOc0boEUij3Tl3kk4aLKzJi/M/FilKfh
	 3zf8WHtZydJnOFCOEUvwcw9+xz+1zIXsPwHZxWxUn6ZNhpjB3XmWQaym/ghwBS9Ow0033
	 dXEs31mMIGQJ+KOGhnjtgnvD5WdQJEgoovD2AZFsoLKISPDtSiEv/Awab4jwbkDqfJK9N
	 mWlxEslswFeHg/mWFr1BpRprPdIycxAtR96aWV1gw6LoMjAFrhONzhcZoyNOsiy7QYOky
	 1Uc+UMcdvfdVXoxI7mstZMs3qFkX5vYbutmqm3gbY8hQZAB6uA4i4CXe8GD0kvS+gSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701843;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lNRC/IvzvGYbEJ7+971mhuu+DwvLQq8IqCI2WqjDZhw=;
	b=WzARscbWZuQXvHq4LzDLdbt613T8EOyvWwro2cQxYpcKi3r3H2uhwQKeFWpHHhw4F6vY
	 5qrrKyKAr1DXXg48KVfK4R/V4BsvpDzdXAVEFh7yMw5sX7yusvx0fAmv3PEc//mGDtx2r
	 7NIIVdyaRrJzYd3VpOQo/EPZzdT8S+mxw0sEcmC0dbvQI3iLXR6YX8mSgBkgNW3SV3L3h
	 87Qlo5ALZyCQlRdl8IhAnIAPGU5wibRZLSCOfn6rME5s0t+aIlHlZ/PxjrMIiVjhKTrrq
	 nGtdKYbVuaozrtkDsbaMYJEoKbOQgQF8V9AwCerJvFzath9EBlFnmeTy/pGG3wSdUFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKDksiTh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0C5B3606A31C;
	Thu, 26 Nov 2026 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKDksiTh
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 06A2D1F000C4;
	Thu, 26 Nov 2026 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701842;
	bh=lNRC/IvzvGYbEJ7+971mhuu+DwvLQq8IqCI2WqjDZhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EKDksiThdKQs3ZTM/mzJJ1quIxbzbdwA+ynz577jNodfaoWAxUnxDBwFQWjPIHjQ5
	 Dci0YfJe+acbQ6qk/i00dBuEJDdnVmCbycV9CpMsj+QXyfUTALrUYKZbaVLSoDz4JI
	 d7O09jBok4HV/o9NBM/vt86LClYp6ihMfHQOyB0x0qomama9+mu3sAA5rPQdvt1c1F
	 FsJ1QD1DELS4c0LSnNZKq75X4ELieYoaO6pmfTBOBJPevZAtoV7eg8Q9a5SyYPz4W2
	 /MX1X26jLhKAZtcQEL8HCLu4NZ8kux6j1ukbZH6rkCsJR3VhUWKEMlEqQH4JGvR6ng
	 g61l6E4GXzAWg==
Date: Thu, 26 Nov 2026 15:03:58 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Molokai TLMM driver
Message-ID: <tzeo5wt6luwupkzzdg6eem4c4up7iguvckowsbcngqwymevef5@2k5btdnpgcfo>
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
 <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-molokai-tlmm-v4-2-eed6eeaacc70@yahoo.com>

On Mon, Nov 23, 2026 at 09:33:13PM +0530, Venkat Yadlapati wrote:
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but only 35 of the 205 pins
> have the Kaanapali pin functions and the GPIO to PDC wakeup interrupt map
> has no entry in common with Kaanapali, so the Kaanapali driver cannot be
> reused: with its tables, a wake-capable GPIO interrupt on Molokai is
> routed to the wrong PDC input and never fires.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---

...

> +	[119] = PINGROUP(119, qdss_cti, _, _, _, _, _, _, _, _, _, egpio),
> +	[120] = PINGROUP(120, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[121] = PINGROUP(121, i2s1_sck, sdc2_data, tsense_pwm4, _, _, _, _, _, _, _, _),
> +	[122] = PINGROUP(122, i2s1_data0, sdc2_data, tsense_pwm5, _, _, _, _, _, _, _, _),
> +	[123] = PINGROUP(123, i2s1_ws, sdc2_data, tsense_pwm6, _, _, _, _, _, _, _, _),
> +	[124] = PINGROUP(124, i2s1_data1, sdc2_data, audio_ext_mclk1, _, _, _, _, _, _, _, _),
> +	[125] = PINGROUP(125, audio_ext_mclk0, sd_write_protect, audio_ref_clk, gcc_gp3, _,
> +			atest_usb, _, _, _, _, _),
> +	[126] = PINGROUP(126, i2s0_sck, _, _, _, _, _, _, _, _, _, _),
> +	[127] = PINGROUP(127, i2s0_data0, _, ddr_pxi2, _, _, _, _, _, _, _, _),

I think this needs gp_mn at slot 2, look at commit dd9ecba27b98 ("pinctrl:
qcom: kaanapali: Add gp_mn mux function") in linux-next.

Thanks,
Bartosz
