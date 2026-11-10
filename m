Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324913;
	b=sn5IRmotAgKARZdh2Ll4rXVfY2X9zOTFaP8sRImPJ1v3pUKHQgl2ZfRiQyCX9J9Nw+Q+
	 CLtsFRxUmU6eqCrBwVf67sNsmR2UUlYn/OHSEbXXtM/uthwJ4OivZctOnRHTiYxEUZM04
	 YTWYKl9829lEgcINkbIhvtc0+1hjPF2xaqOk852DvEUiqav2UZxIJFV/CHuC4YMyKbDu0
	 yOmKkeAGep2i+sybzSs8cAwgz6SnmKMPljKs73H5fOTzwazZp//iVhzxkpafTmmlT7/AA
	 u4xi1TIHhVyLFdFJCiLUr4S4peIBqFViUKYFDNDZPBUH73x835A+VqUhJHj5YOstWfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324913;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=H6y3PWhbhmjJH8XU6/GXMjP5//jRrDgQxTjcYvOrbII=;
	b=0qwCYQLq0/sUGkrLe83tV/HG3q7riyJI9NGOn8Q6EzJR7ml+vy7E+aO1E/r251I/s69N
	 LaXUjymmgrrlYq3FdiZRX15bUSLUQf/Co4SI/vwVLcfwXKomgv+jKKY1UiemxQQ9+VZOD
	 HLedh0sj9ucXnMiL1LPiE0fQ3ZEBSj4OxkHWkEPXYy0Yfs/b0bh03+W02qt/urtJiBSZb
	 L46b1eLuAI42afsaeJHCGNS7q0uKBR9FrANtqu5yOaMFYZ/Ypt3vaOOSecNORJZI4aLB6
	 erlBZzxaozrJdlWD0YWNCOxu58KEeTfiIq2yBbYFcpFvt6EeJirgTO1yBSlkwCwLQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gUpB7Ms6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62CC60A3834;
	Tue, 10 Nov 2026 15:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62CC60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gUpB7Ms6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22C1B1477;
	Tue, 10 Nov 2026 07:35:09 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCD83F85F;
	Tue, 10 Nov 2026 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324912; bh=carP3vbUYgr8qsVNCpHh1imjnhtxGTpLlqbqJ7iqKl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUpB7Ms61i05bC8pBOCmVktL30n76DdrZCKYLCh8SWObKFPJerLKXPU/SaDxKV/x9
	 esE5Z9dOguoSs7rVsiuV5wFfhNxTC/ivfdnVUn3IVcDEvTgceqBYhUkGeUXdVHfgQG
	 X4wRc8iZlpvOnHotbK6aaCzF0hZg8GKH9L4tbHQs=
Date: Tue, 10 Nov 2026 15:35:08 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
Message-ID: <avM5rBHedZDn45kc@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <avL-4lquUqW9lUNh@pluto>
 <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
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
In-Reply-To: <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>

On Tue, Nov 10, 2026 at 03:47:33PM +0100, Clément Le Goffic wrote:
> Hi Cristian,
> 
> On 11/10/26 12:24 PM, Cristian Marussi wrote:
> > On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
> >> A get of a setting that is on or off, the flags and the pulls, returned
> >> 0 as a value, so every one of them showed as set on every pin. Return
> >> -EINVAL when the platform answers 0, which is how pinconf reports a
> >> setting that is not active.
> >>
> >> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> >> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> >> ---
> > 
> > LGTM.
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> I'll apply Andy remarks. Can I keep your Reviewed-by with those fixes?

Sure.

Cristian
