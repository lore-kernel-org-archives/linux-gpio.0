Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447218;
	b=J+NJtQUB3kh1l9p09/0JvrsM9BChYD1KeSJtCCoiSGDrPX8XemJA6Qcix2XRff7w5IwD
	 pcHZgPYQFLFJvUlyq+gb2pX/SqMTYjU+dXryNO33ojXiKFlRud+dEDCPI6jX6MbjLiv99
	 asP9YXxfIQMZMwKuiIEpsdLNI9dBlkOs52Q8gCteuW83UPIXI9PexBFzH8JhKlGB77jC1
	 uf9D4yMM4lz4xk0x5ymR6t2p1KCjQYFFw+4q+40DS82vRBdoun3eIs/AwHV3O302/WS6n
	 h0c+0SxfOrnZpuBwBSJHkCSfflA3R11IaVib5RdDYfAQlyYv99OhGEqPWU+lqltmj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447218;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=X4iAYyAbpITvMWa1l4cLBpO7XONq8a3sZ3g3kHN5HXw=;
	b=rfE2lP+duT3Yb3ABm4T34m/Jra++2yjlApuBNwF2cOO/bmCUDmOBHBMRpFWm0iOUmtEz
	 0H0xEyYR8LaIqSpAYGPFwKesxgpIIBND4WMavrXeHOO2YBy6Z4prqic6LlOHmVV+Xmou4
	 XA+9IcCks6jHKpxhN1OPepI7YQj8XsSZFX9p45IuKRhQGdlsBevm29mUUZrShuY0OsUvz
	 RpMKXdfHhRVuXA6C+KOq6oinOz/ecGvxMxhgw+j3Yx0oTsI8zI8h09JUNgWrTbfh+l1fz
	 t6QOsXVSY7/8ufBXyyO/lrFU3uyrtf+wh5OWTbypa+OqfzxPO7g1EBZq9qzt1oezJRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ajuHb9Ep;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 27AA6606A31E;
	Mon, 23 Nov 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ajuHb9Ep
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 905511F000C0;
	Mon, 23 Nov 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447217;
	bh=X4iAYyAbpITvMWa1l4cLBpO7XONq8a3sZ3g3kHN5HXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ajuHb9EpzKIPhjY2Ym1ftdjK+gVVSYEPA73TqL3rbmmLn+5jpYjSNMccW7s9tu4A+
	 3rIZoRfVqDDl1u7ewz4gMB9DJDAKtWSnDi/wX9Wg59UyYkO0GlNIPFHxW6THvfKJi+
	 xbOOqxoFxeElIgSUIe6h5svqoW9zZVIOSkYtuIgpvCQNjFmYBdSg8DaRCsmgXIJ6sZ
	 WIpBRfw0epua/zac09ahmyqXHpbpbKtwKSmuawshi86HIO0SxySp2D+xHBGnoaHIz4
	 C6bXnrqX+8aMiJiEPt2Fh6nQlJzaOEPt1dzwPCY492P+P4NvGymRuHAuhN2u8w3UPS
	 msb55w7wH3oVQ==
Date: Mon, 23 Nov 2026 16:20:14 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: pocj8ur4in@gmail.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: avoid undersized array bitmap in get fastpath
Message-ID: <4zqxzuvqebas2vutic5j7rfsyrlfr7gpxcx3253dwujhqrnvxy@fqcppul5xegi>
References: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
 <CAD++jLmr3v+SV3yvdH98KK9T5vEDyBBWkrw1p-7Sp=KdA8BQYw@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmr3v+SV3yvdH98KK9T5vEDyBBWkrw1p-7Sp=KdA8BQYw@mail.gmail.com>

On Mon, Nov 23, 2026 at 11:51:57AM +0100, Linus Walleij wrote:
> Hi Kim,
> 
> On Sun, Nov 22, 2026 at 5:38 AM <pocj8ur4in@gmail.com> wrote:
> 
> > The array get fast path passes the caller's value bitmap directly to
> > get_multiple(). The bitmap is sized for the requested array, but
> > providers such as gpio-sim process it for the entire chip. With a
> > 128-line chip and a one-line array on a 64-bit kernel, gpio-sim's
> > bitmap_replace() reads and writes two words when the caller has
> > allocated only one. The second word is accessed even though its mask
> > is zero.
> 
> Isn't that a problem with gpio-sim that should be fixed there?
>

I'm fine sanitizing driver input at the GPIOLIB level but this patch
doesn't apply to linux-next.

Bart
