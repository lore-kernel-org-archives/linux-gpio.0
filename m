Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629746;
	b=ieeFXYEMKJyZ/ETH0fNMzLqumxVcxlKA5Ev7jLCdtfgn0bJFkvDguu3DjshrHz9yg351
	 EXz8Jbvvo+/HaZNTR5myyYgSSzW5eVNUtWVOgR74WBbcgptof0+t8ilOvIKz8MgiKdMVa
	 A4IPSQHWSLG1JbRsGp7YpadTCo8Zbc7978ZlksPDvpc0/3uySrESjKEubNcCWowozL4G/
	 bE4OnUedmqNDZGheXmdk8GdyemZbzGTPZTqH567hPJC5Jn9QuitPUY0aGhgCsFvSQVQtw
	 56alakVF2l1NN4A1Scmq7zyfPh36G+/ant+SJ8++LwdBVzr+H3XPEHBEl02rqqmB1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629746;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=trskwCs5YwLoCHSM6E1k7THU0fd/e8roK/7ipB8k6S4=;
	b=esPzTnt0uwqWrlpKOszEX6+MG4ghcjxv/VHBQft5NxrXfWIyuGFVL6X120+yEoPJ19B+
	 uj1DYn7WgVS31Xf+DGEs3IP9oDNjGQFdrKjaab8tXs+KhuPY+vPgVZVBHDhQiVEcpZGGw
	 Kh3r/0z2a4sev4wO4GX7sopK9YNgo3oBDcRolL4rnifWcRp3atVzOP/npLJK3kTO/1ei6
	 nc23FVN5LENx8KiKNt3pNFrCIczzYb4hUSRtK8X1ZFWPgyDjAq83+qqzfp7J8JreoRwiX
	 DjYyqN7oi4pKIzyMKJYc60sI9d1nVF6sgJRvHwtVrq0UCUdZLPM0uLBSKkh4tW58dzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0XXQ+Lv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C405E607032B;
	Mon,  2 Nov 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0XXQ+Lv
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 355351F00A16;
	Mon,  2 Nov 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629745;
	bh=trskwCs5YwLoCHSM6E1k7THU0fd/e8roK/7ipB8k6S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a0XXQ+Lv6WgP8xwIiArABLzHBIYL8bSJKvI1t3B8OaeXoejVBanJe0hac26ZvfBW4
	 NhhqPOaEqqSYkTrmV1gcaXg5vYQDVRF6vzprTe1C75Wge3UVsdnrY9hc830ErAnQVa
	 sOK9RFz0OrOaBN6IxEl4V5SnurMPIhrfU6rqBuhklLY1bmcz4ahNE0EdvHOZXgDgVm
	 4R5dn7Ylrr3vyIQs6lIxMjIndpSeTgOh9uu6KPF5fTCqsn7aQxAAsCiIXFgOFSKdL9
	 MNnSMfs0UCaz+ApeCY3liU4E/SGZvtwpJW/iNuasyiKi7RX07Z/MOXXXd/huFKCS9w
	 ftVXpxmMhRy0A==
Date: Mon, 2 Nov 2026 15:28:57 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] pps-gpio: restore pin mux on unbind and shutdown
Message-ID: <zj2e67x7owt6zzkfumg2ztwi6m3levhbjcm47n7vzg2gnl2bey@gq5zqf7sodgn>
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
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
In-Reply-To: <20260923182243.41060-1-farbere@amazon.com>

On Wed, Sep 23, 2026 at 06:22:39PM +0000, Eliav Farber wrote:
> Some boards route the PPS input GPIO through a pin controller and mux the
> pins to a different function when the pps-gpio driver is not active.
> 
> The driver core already selects the "default" pinctrl state before probe,
> so the pins can be muxed for GPIO/PPS use while the driver is bound without
> any driver change. Nothing, however, hands the pins back when the driver
> is unbound or the system is shut down (for example before kexec), leaving
> them stuck in the GPIO mux for the next kernel.
> 
> This series lets pps-gpio select an optional "inactive" pinctrl state in
> remove() and shutdown(), so a board can describe the alternate mux there
> and have it restored. The state is looked up and selected by the driver
> itself (devm_pinctrl_get() + pinctrl_lookup_state() + pinctrl_select_
> state()), so its meaning is unambiguous and it does not depend on
> CONFIG_PM. It is a no-op for boards that do not describe an "inactive"
> state.
> 

Please stop posting new iterations in reply to previous ones. Preferably
use b4 for managing patch series. Each new iteration should be its own
thread.

Thanks,
Bartosz
