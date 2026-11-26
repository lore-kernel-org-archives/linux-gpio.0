Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701825;
	b=N0TeZ5PhMvJaF6rxnuju/ZyMC3wOyvnOx3yub9mjXuKc4iPMjpKfW/XzP7NgeFgHSWM1
	 aDxB7uiy9H5RGDMNVfKj5i8x3hPgMSSdGQ+/Ybayafx0CF4x1n4zPL804FoSHd0+ntoYO
	 llgXGpOS0PWYnXJWX/PYWP6v1zWkYFhh8vbuWXkaD8v8nFy3Maklk0ZTjnZIIcdSbOPoD
	 Ap5RQxHUOtXHfuWPlkuJHWMonxy9Bgu2k8r8949xxXyCPOVCux7ffb6Bn/D+DCI5TM4b4
	 UifGYJt1vRXii0JI+uRCQmAb8Nxeae2LylxmzdKuxLkeMf++2ZfOYDTLH+kC/3I+UaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701825;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CQmJN+K2DWg1ta3Pd0qSDV/I7eFiKregSRjAIlFg0LA=;
	b=RQ50SOjmUIzaHy/BaLE6gdlNeA52pK+TAxN+g1kTr2/78DC7/azjABl9UM0pvMwnaqdf
	 NbLbDvEnTcTnXO/wL7/iV17P2y0twzJluQWlG6GU2mDuMFetqVWGMdJzazwIpkoyHr9m4
	 KhCP7bCgrD7Vk/Kd723UT0FAPb4YI4C1DExRcmv6Ofp3c8lv2lqicyG42lV5Zr1afWDe0
	 Lw2nP8+kanw6JZgJZ4sTeNSCvifE6qnEJwPlsMZwaJkBppOU8g8Qu/CUajnFBkFQ0iKj4
	 6px2EkcNc73ne3cCvs1G4v2AgO50yPFV9mhTYXo17tq1P5rwpoqgFNX0d4UuIxBLjTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6wEKaGX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16B606A31E;
	Thu, 26 Nov 2026 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6wEKaGX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6DA1F000C6;
	Thu, 26 Nov 2026 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701824;
	bh=CQmJN+K2DWg1ta3Pd0qSDV/I7eFiKregSRjAIlFg0LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m6wEKaGXyRERWQgso8SRd+SHGpfz4XUnCQIx0dqN5yKwrc1IetWft3BvIDEN6qJTV
	 1S7YeI9WIcLBE7GG9xSL3M497DBa9aQ/8yeB+cVY7zDGFGQ4C54RpM1GhzU4S8OlPk
	 CJliW0TK7rNy/rnrfRQ1X3dknlVbbrFd8T6pwId/l631V4DO0vowGZycZXRV9MDNtu
	 2jeowLoCM/dcNGgIzz7Zf91MYOEGO+rTin6lbLY+tW8BeVuUm3WA75UFT503L6ivrc
	 3ZitzUKjj6kuPeO04VhkxivZJz8POcUwUuoGrZoK7o5fFaxOtigLH2LuyK05PxtOw4
	 SPMcXVJeIaZGg==
Date: Thu, 26 Nov 2026 14:03:40 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
Message-ID: <20261126-maroon-bettong-of-energy-455a9b@sudeepholla>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
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
In-Reply-To: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>

On Wed, Nov 25, 2026 at 07:52:31PM +0100, Linus Walleij wrote:
> Hi Clément,
> 
> On Mon, Nov 23, 2026 at 4:21 PM Clément Le Goffic
> <clegoffic@baylibre.com> wrote:
> 
> 
> > Clément Le Goffic (10):
> >       pinctrl: scmi: report an off setting as not set
> >       pinctrl: scmi: refuse an inexact drive strength in milliamperes
> 
> I applied these two as fixes, waiting for someone else to pick
> the firmware patches (or ACK them).
> 

I have moved the all Arm generic firmware drivers under drivers/firmware/arm
(as you can see in -next). I can pick up 3,4 and 9. If 10 is the only
dependent change:

1. Can it wait for v7.6 ?
   or
2. Would be prefer to have a branch with the code moved shared as baseline ?
   (so that you can take all the changes together for v7.5)
   or
3. Would you want me to pick up 3-10 and send it via arm-soc ?

-- 
Regards,
Sudeep
