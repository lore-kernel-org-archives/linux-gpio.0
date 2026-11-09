Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240684;
	b=LvGGCtuX/lnVkHCU8fOt1DA0Ee95o49oe3XDE49DHoECMpfPjQV7gmdTArcqd84J3wc+
	 cGWXW2es4ikQlkTghPaLoO8cD6rGIL6oP5/2nrcJW9+dktEetntanUlsaDUAjMuVZCCAw
	 FkOnCawxyPGIlCpn48pNjVMkb008VB0/+oalAVXO4zCCLhWzJgMm7JqcweoV9K0r1OONh
	 9Clt2riW0q+bTK2NHIzlnDtJbjs6xl7o4n8Heh8cw4DYarzoWVJG+KAmoZaebC059wvZA
	 pVUelCCc76RBp1HxwzTJRCY14kjEs06U0grwWe5S2WAjIXhjQ8mReQa7TudKdnhjU9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240684;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tfjLfbWzIl5utptLBiEuNfFdQzt81CBLPqLtjI7x50E=;
	b=3nw0WzRzv8qkGLg1M15j/vkkZKjScyvY0v8ly4CpLrSqkaeZrKAY+FQgjG5nFOaeIp79
	 r00F0g56BkfGY7fF1+uzm6CXoJP9Gm2uXiuRGpI3Bx2PctKKOCNCz8ViJjeByQ1uuLBOS
	 GsYOgs+12JV1lGBgmPJzVfdRxskpBxmAYjuvDlD34NvNGd8nFfBU/fNf+puNYFApNJPXI
	 mMvrQWRW/4YsJrK3huHIJMOPSsrvClJelYAEujOvMd9oPFpBTZDzzACikflYMmunQpRX6
	 qZmiropH4D3BZWiXDJyspLbEmX1osOhekXUtvYiJzFN9hJL+NTeLFw+kBSZhRCvbVjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKaRZarX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7D8A5606A31C;
	Mon,  9 Nov 2026 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKaRZarX
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8F6BA1F0089F;
	Mon,  9 Nov 2026 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240684;
	bh=tfjLfbWzIl5utptLBiEuNfFdQzt81CBLPqLtjI7x50E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKaRZarXnUzLoXvgKGSB/b1nyZSzKAERRGurO4D2xVODtTeQqi78PPS5p0qjNQbnL
	 L+xozzgaep3g5VmvmYPb63PMxf5vHsPPGdKjBgsLIynvIKM3PGkkJXVPSDhsaQCWQ8
	 KLn0HBP4WZX4a49Je2Xko7Pow3Uo3p+KxPqt6BUfmc8lWx+s9faJPf7tLV5iggis2c
	 zHAbzwroKLvbAb4x4thBLg+MQroPI+mI/3n3cXFH5tBVKYCCeuAwKRQvEhrG8hski+
	 8xbNIRCUAjm0Yu9KYrI2TWbbEUoy84umIbH63NOQlQgTmcKqcvssxkd7Ah5USkYvjT
	 K0e1/Abzln1mA==
Date: Mon, 9 Nov 2026 17:11:20 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Peng Fan <peng.fan@linux.dev>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: widen the packed config
 argument to unsigned long
Message-ID: <a5qyjjjwv5dspymkemwb5d5cqii6y7hwl6mb4dqelxja24x3dd@bi34yww74pgf>
References: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>
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
In-Reply-To: <20261109-pinconf-widen-v1-1-469726456c84@nxp.com>

On Mon, Nov 09, 2026 at 08:27:55PM +0800, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The packed pin configuration stores the parameter in the lower 8 bits and
> the argument in the remaining bits of an unsigned long. However, the
> argument was limited to 24 bits: pinconf_to_config_argument() masked it
> with 0xffffff, and pinconf_to_config_packed() took a u32 argument, so even
> on 64-bit systems the left shift in PIN_CONF_PACKED() discarded the upper
> bits. For example, the pad configuration value 0x1080000 used by a new
> i.MX SoC was packed as 0x08000000 and read back as 0x80000.
> 
> Allow the argument to use the full width of unsigned long so that such
> values survive the pack/unpack round trip. Cast the argument in
> PIN_CONF_PACKED() to unsigned long to keep direct users of the macro
> consistent with pinconf_to_config_packed(), and print the full argument
> in the debugfs dumps.
> 
> The packed argument only has BITS_PER_LONG - 8 bits available, so on
> 32-bit systems values above 0xffffff still cannot be represented. Reject
> such firmware properties instead of silently truncating them.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
 
I think it makes sense.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
