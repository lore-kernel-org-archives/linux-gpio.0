Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E743498B
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062995; cv=none; b=Q/6/H/76Xpur5luIaSoEjN0jT+35RK1ZFax13Qpx/I1H/SrHZ1b/kDmMCQ83CP+M8jQdwFNKonwi66VPEYTUJzzYInMnbEfpzIPo55V1WMiYnd7aM1w6P178g0XtU6eudg9uV9a521ksK7lqMd+02yUhAs7vZ0se9hcd5CKSg4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062995; c=relaxed/simple;
	bh=Grkpg6QwvGEub0FOHWQG+hEYsY3k1eI0F0dR26tBMeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ojy+XGCqGMbGhkRl0Z9KChyp91ngE8Hu96J9P4P8+KYt9rjYprWydEO1vQIHHyuIkNpA0bTtw82WsHr+nOng/+UgfYiyQAqTzYT4uoDrdopVqtE2xTBW2z3CLov1PW8pLFb7dNfyeGn1SZHNwiw86eOhYM6s9vj+1jyAlggCzw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=MqnwknVN; arc=none smtp.client-ip=62.149.156.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="MqnwknVN"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8v6gxQEfXbk7m8v6gxujqZ; Tue, 22 Sep 2026 09:40:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790062803; bh=Grkpg6QwvGEub0FOHWQG+hEYsY3k1eI0F0dR26tBMeQ=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=MqnwknVNCIwe/LMq9j8eGuY7KR83AP/iKBJ0ZfsPjFjdTTgwGbzMbrlfGQtLpefql
	 Q1DscbwnJfxik2uaUsqGBWe1mab8OLvwWxVZHCYUTRZ+q0GEzwBK2GyrwZERvwQXMV
	 PsfjkMrrwUghzvpaETWeR4rAwhdCScG5pOi90SA1JEuUxUR4/uUs4GtiJZbOGVQgFf
	 G6Ce6Z5f1mDZS53bdwJ0whP5tBqRk4JkvulEie17LZn7gRl8HIlqj1HjXhyBLJ4xPV
	 +Y69vHdVLSBL525Tj7wO8cWgeSUJZtL3qB/yjgjSKkVqkqLnviu/g8H560ZAV3mvC/
	 PV2/9fwv5nuVA==
Message-ID: <6ffa766f-9a99-41d0-b5df-6c517d1e94e6@enneenne.com>
Date: Tue, 22 Sep 2026 09:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] pps-gpio: restore pin mux on unbind and shutdown
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-1-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
In-Reply-To: <20260919171157.5502-1-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKe5A5lEJTTmrC4MYyp1N8ycdHvrlcy/UeRZEGvfMgfp7Taj3aM+znC1YaQZ30GLUxBYTYURwiymJHBmwcXUN/HqOcdVRVx5ThX+5/U7YBoIjKZlwq6A
 IAV8lvQTh5AAIcVHMNxX0IUQPdJAKvIQvH8jV4XNlOD0y24zkcitq7AaEw5vSIEptCNdNT3S+GWZ+qN35QEWsLM0kZcmGZAolbaWn02ezu4Bv6xpdKbPJXaB
 o5q829u1cEzOpdm6j6+8FE0F4XkDUCZkBTjAbDFING/1K1OXc+7F1O/JHUMqNNTIPvPf257RtBVUFy5JArUeDpvoteqz69aLuhAuhhHNO0E9DTfvMa60MTry
 wpKpQ/i4Y70Pl3KQeR8p3Oigxv9RqGgHFRb2vwqO+HVB9cWaQlPxgjkZn9nUQZcEcugD9hJIOyl0rNWh0sRa3Sv3q+jiCub6vJ2yXnxPCB1sWuVzF0frt6sN
 rl0b0Ye4UvzhaISQr5anp/iJSjKybkWWO1HEMGXZaYdGJe7S5D26wA/kxmoi4UwEQ2uq9QlDpNd6jrIVF1shHMiQ21DtcqzQcnKM9Q==

On Sat, Sep 19, 2026 at 05:11:54PM +0000, Eliav Farber wrote:
> Open question for the maintainers (patch 3): a probe that fails before
> pps_gpio_get_pins() has run -- devm_kzalloc() or pps_gpio_setup() -- returns
> without going through err_release_pins, so the pins are left in the
> core-applied "default" state rather than "inactive". I did not change this
> in v4 as I would like your guidance on the preferred approach; the trade-offs
> are laid out at the end of patch 3's changelog. In short:
>
>   A. Move pps_gpio_get_pins() to the top of probe and route the
>      pps_gpio_setup() failure through err_release_pins too, so every path
>      the driver can act on restores "inactive". (The devm_kzalloc() failure
>      is inherently before the driver holds any pinctrl handle, so it cannot
>      be covered by the driver in any option.)
>   B. Keep v4 as-is and treat "inactive" as a successful-ownership concern:
>      a probe that never looked up the state never took the pins, so leaving
>      the core-applied "default" (long-standing behaviour) is acceptable.
>   C. As A, but keep the release helper's existing NULL guard so it is robust
>      regardless of ordering (belt and braces).
>
> I lean towards B (the restore is meaningful only once the driver has taken
> ownership), but I am happy to implement A/C if you prefer uniform failure
> paths.

I would choose option A, keeping the NULL check in the release helper;
I believe this corresponds to your option C. In fact, to me, it
represents the symmetrical counterpart to what the core did on the
driver's behalf.

One thing I would verify on your board before proceeding is this: with
option A, an -EPROBE_DEFER error returned by pps_gpio_setup() would
result in the "inactive" state being selected, and the core would
re-apply "default" on the next attempt. I assume this mux switching is
harmless, but the hardware is available to you, not me.

I wouldn't worry too much about the devm_kzalloc() case.

I also have a couple of observations regarding patches 1/3 and 3/3; I
will send them directly in response to the patches themselves.

Ciao,

Rodolfo
