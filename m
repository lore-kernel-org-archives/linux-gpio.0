Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563362;
	b=sspMYFeyTnwf+PIyxYmXjPiFhY55E0+4sA5kL0gpraBducJImvIRWSTh3qVSS48VhIpt
	 wP0IOCaG7/IpIpx4o3egAPkXUKGV/b/5m8+yQPN1JcRw0vXmJGQlDolrrh1ACxui4+v6s
	 D5wIzMP3z+v8+oZmWZPF1xSz/xPg87M9AISiQyEAvdO2Nd3xAx+3Ah/pl+txZIZDLLpOE
	 IDL2cf9Bv/4W0ZLtFUTJiXqFy85LylGy3SNNaWbUjLXcDv4WjHzeBCEtJrcxsoAejzEC6
	 uKDN2nAIcwKDj3brgEWOXHqBfKagJCnBlIvCevTRYDmBbg/9aH4Yhav2+FXTJzg0BTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563362;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vtUG5x1Gsgp12EK5shxh1dxeTgOZX91zCtZLEgViUuw=;
	b=C7HPbiv3f10u76M84Hz08bZn1eFQyCkdpOnLCi5DbtlOBVz1yBo5wD5rZAdT1ZrHjUiy
	 Zkcp0zpicrKliRouFRWH900OVnTUZx63KOcmGWHYBk2wmjaCESWL2NAK2/rfjWvjVkmJc
	 DsqDJVm4swYE/2qoBqcwJCTRtypNJdyC3BLjq1FozBtUuo49d/MxlVLaGakqyAnQRk4NP
	 bDcMbGCM+QIi+gMU3Q2p7B49x5de0eUqhdJJ+KrEOJmQlStgfEpRAAfcerFTKF15MyPxL
	 Ae1K3YQ6Lysrxhqobm3ECf2ilLU2BJbk5aMKLGQnUKn9FeMtCr+yWEaZvK8CQy1PQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8xyfjFz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 1E7C6606A33E;
	Fri, 13 Nov 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8xyfjFz
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CA3CC1F000C4;
	Fri, 13 Nov 2026 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563361;
	bh=vtUG5x1Gsgp12EK5shxh1dxeTgOZX91zCtZLEgViUuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8xyfjFzvLUnAx5cjUCQgCJvju9j6mEDU80fwVT9aEWjxU+9SXMeFq4OhQJqtc5tS
	 8rBFL4Od7qcr/VtEXG+VfWQ6UJ9QN2X7984ZwulUQmSxtpgKHjSFVsFiM3vSG/8ab4
	 o9abONnkhulN/k6TEEF8sJGyBZNIpdIo+gn40sYXL2JeC7x1dByYTSUiqmhgp7wqKw
	 HoxkkyqDrm/U3mLgB8Zjfwxv4iPLAYx4YyaxZRazEjm8UrSgapmIFSqiLcT9DoJ99Y
	 mDxDcUA2KWkLzf7Ag/I9uwG3sGFlSNQ5mY/uIfs0ANLEMe9yoKcTc3I0vcaOlshQxf
	 7R2JqxYF3D3vA==
Date: Fri, 13 Nov 2026 10:49:17 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 7/7] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <o6i3phl3kkioptwivmiamw5n6bj7a2butqamu7huh35eulx4ta@cbigrjyy4q6o>
References: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com>
 <20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com>
 <sashiko-outbox-195211@kernel.org>
 <qabqccchlj6rz5tki6z3h7py36btm6nepdvlcz6vgbq37enfnl@ez2jmldpo5mz>
 <20261104141501.15473-2-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261104141501.15473-2-aambrozewicz@nvidia.com>

On Wed, Nov 04, 2026 at 04:15:01PM +0200, Adrian Ambrozewicz wrote:
> On Wed, Nov 04, 2026 at 03:00:31PM +0100, Bartosz Golaszewski wrote:
> > Will you address this in v6? I think it's good to go otherwise.
> 
> Yes. For v6 I plan to have gpiochip_remove() tear down the shared
> proxies, so their character devices free their IRQs, before it
> force-frees the remaining ones, and to test it with shared GPIOs on a
> device tree guest first.

Hey! Do you plan to send v6 soon? I'd like to have this upstream by rc5
if possible.

Thanks,
Bartosz
