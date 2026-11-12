Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464841;
	b=EvOHhsGeMU8ODMIubTycNfzNqvUdEfHOXEXtE7KY4EOkNfov4tq0j3tQl7inJPEmiq4Z
	 CPOIFcxfOGf5E2BhUJwFUlWHOHnk7kskqRucKERomz5P6aqD4MgcwWk4AzcXKglnEm7ZY
	 VboVVu1//wr7P9Ag5myiDtKm6hmaZ3T14LNqhXc7GqtVVV/JT8W4BlFApBUzj9WDTbiYm
	 5hX7qS+RwlXTW3pisF1npk1hTnfJaF2+kCceZq2Qjp5TQ7ZSrO5wnWhPcqQ33ubNmGh0O
	 BOTYIedLEsRaeEWD65ophe4B97RdEYeCaB8bO6QmbVHve/f8CppuiAj5P2VIyDa+vxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
	b=NgSkVo0rJpB1A9h5rzp/BD0RNeWsqD/O81aHz0luJKIULlpCg+/Q7V/mrX5fFQrlpSKD
	 SHor5daxjB0lrfOk1HANyYQVKsqJdg04E3oUTBfKNaIJjc3u2kjVb0u/FcDv2VfvlzsaQ
	 X8m3ijIuMngrrsNoHCZy97e2JdU5g4c4ZkJ9pb1yBt0xUeAMmCmV1AFy91D6+cifJJIs8
	 XcUfhIXQIth2DuB5JLf8IQlCfvioAY+qvySU7AEIDkq0NynvNWakxons/XFiIsGFiGEh+
	 I6eT0eqZJm84AUOTQHRFK2ERz07SpdlOqx0p7E6VwZV7V99iB2taibnXvZQGe5PItsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oALOAzYZ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D2606A327
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 06:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133D2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oALOAzYZ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so2128949f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 22:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794464838; x=1795069638; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
        b=oALOAzYZM+oMzDxJH9B2GI5my8j2p0IDL8+qPlDJUCJEYhlsBObm4Pk2X9QbvtFSpZ
         2LyZDB49iDJ9+DtBhTuvu87YPbCsw/OSEJ5hJ2a0O6e7R1UzPKAPJX2NugKrRwtbtuq0
         3xC7W0RvAhGt+Qpx1VejPwHmlIT6VNajbZNU458fy6aueaBfNXqYFMW4jKMc/DI3TQQi
         9Md/6tcZfofUoCwcALJPp26LEblCgoDZsESSyGZKCOdgOe7+3gW0qf0q93u/IoFJUcD+
         uAYr5zfl7Q04WWv1nrxz6w+1RJBlxuYXZud+4X4NC12tJX840RdKGPQLBTmmYRJgKDZn
         l77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464838; x=1795069638;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
        b=xAH+dK6kPrrqprshM6A6YnpuYt+M2PBgr805NiiG7zC2SftiiIU4HDIGn2tF6Kil/I
         QDoDWowQtYjihL7W8QVmGQQpjA4vZGLw9rAZmm48wtaivQ2TiXH5j1cq8j2Cxfx9S7Ud
         v7F4ApyYxYPAoE8/2SrHu0YAOpotLWwwn6HFlDJ5OjTbO5zsoJjtNiVIA0qGkLyacgPl
         MWNBzBUwAWAhWCxRG84AzV4NEdoXcZXU7XpvERYL05AvthicOjA9Okif6OKiAjKPDgVR
         MNc5O7cXNpbcWnpBSwicGyK+xZBbQQOL8wjO/w0T4ycxjQXj8C3NHcwFBguDDh4wPx4J
         8B8A==
X-Forwarded-Encrypted: i=1; AL+hErEYcBppp3xmiDhUVr3Hdomcqzyl8WnVY/jiTtbG3dEubS8b+ubHa8XRlp64AGOiV9bbhzluPXFLGrdL@vger.kernel.org
X-Gm-Message-State: APuU4Z82EiZIJj6eTR0dLKEAtt3guaFW/RS7cl2OJBtArK1tNXBWf5A1
	AOLTs4Qjh3XLNdWeuANIE/v/eGcKGmSz3B9avOAuEfFpYdgH3FDmrm9fAdt5FKl3G1Y=
X-Gm-Gg: AYBFou1LkWyy2LRDBSDi2AF0xRjAJnAmhplH7/QLM8W7SQi1lUJi8wtXsvGnOvSBX4V
	S835DLv6RlU0EmykMbMrW0opIjyyweg5QE2W03s5mZPRnVtwDhDwocIUWsNQHlBWHPe4ocuVyKX
	EQOTbXW3JVNVA7qQqLDz3LrqVqp5y4Lr1B25fnrD4bb2q2mVAL6Raa2KXjlAIcMeIpuS5LEYM+4
	Q8dkpaigMJ4hKbR52WdFHvNij2oKZgKd7hVeH0jID7cQIZI0U3lK1QVg3DSwJkcPGL3HxQa7NIk
	QoNMp0cIZyoDUz0qE0iaQda/i22hDwjeX3pjjlS09tVExXynnC8KB6v2haJFDCR/JhRElLq7a1W
	BzgCjMiwP7W7gMn/dVmlw+ZIJZ4cGY1qTlN1G/TuIIozO2h19JkrcKbChWutpZgeSc3UBtiE42r
	tN55xx79gTgvbzTNobnVMk+AJJGsFI7Ej3WpxVFHgOWUM/RDtpvNxKMybFHCHg8L3xxM2g9imU3
	3hnC1e3lpxh2Fc3dwjvEWmJ9dqwpaF0L2AICBWU2/3liu9ULxnv4SyuWAukvpYT0lirPE1lMY6Z
	f5zaU0X+lXi1L972WGlgQ/Vwto2GYp/rXur7w/6iuo5ulRv/FNbHNsuSoBZCV+kt58yMDKXPiSc
	z/bY=
X-Received: by 2002:a05:6000:460b:b0:493:2eb8:e7fa with SMTP id ffacd0b85a97d-499c888ce81mr7051233f8f.43.1794464838079;
        Wed, 11 Nov 2026 22:27:18 -0800 (PST)
Received: from andrew.office ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm14820585f8f.0.2026.11.11.22.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:27:17 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Lee Jones <lee@kernel.org>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>,  Wells Lu <wellslutw@gmail.com>,
  Linus Walleij <linusw@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-gpio@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH 09/10] pinctrl: sunplus: Validate pin_func index in
 sppctl_dt_node_to_map()
In-Reply-To: <20261111215256.1982044-10-lee@kernel.org> (Lee Jones's message
	of "Wed, 11 Nov 2026 21:51:54 +0000")
References: <20261111215256.1982044-1-lee@kernel.org>
	<20261111215256.1982044-10-lee@kernel.org>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 12 Nov 2026 08:27:11 +0200
Message-ID: <sa6se1636ps.fsf@andrew.office>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Lee Jones <lee@kernel.org> writes:

> In sppctl_dt_node_to_map(), the validation loop checks that pin_num is
> within sppctl_pins_all_sz, but does not validate pin_func (bits 15:8)
> before indexing sppctl_list_funcs[pin_func] for fully-pinmuxed pins.
> Check that pin_func is less than sppctl_list_funcs_sz when pin_type
> selects a mux function.
>
> Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
> Closes: https://sashiko.dev/#/bug/linux-977252d6-b0cc-4d3a-ae2d-59d1e2f8a649
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Andrew Gaylard <ag@ffroot.co.za>
Tested-by: Andrew Gaylard <ag@ffroot.co.za> # on a Figment Design HW84 board
