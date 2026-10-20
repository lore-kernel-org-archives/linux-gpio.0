Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501355;
	b=H9qvSlg6HYxy6FLHfyCl0MdeXl1z9InF/zOd/FW1W8GD/0XbMDwnEn5UL6VjX4sOiTuF
	 7vdBNzL1KmvBo2LQwFtrsxcQ0JiqkI5hVtGgmJ0EpGIVgB0neBEkvc+8qKr0BlWSj+i1j
	 L6hY8Uohinf5Gc2NzTeRE9z+RaHrAorIMDLiyJGoSGT8Cso6gpnE4dFtUPMkdkRfEYp61
	 5sIT4H4Kpm7vIQNCZAQK7MJuCvWDI3GEgenZyIYKZDMiuctyktTYoozmIxGAS1GJozy/e
	 iz9+uJggd7oZTNC+5Ypua2Bzg14pr3pR5qAsfD/ZvRmz39Cgi6eg9kydxcxj/E8X2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501355;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=fM10J+gC33ICxBxjYGwXT7I0sb7PVdbEauW8Ew7fRaA=;
	b=GSrX9nQRIELrTqfat7096vNzH8xJ6woza0dsfsIJDpCpSgnqE7/GCdS2sScbhkS08FPX
	 RW/TNxqo7F03Jee9JWLIbgVMoN/6ALy8puXjZDN3/DmbwY8pDinUB8+jsD2Ebq3AKE7rB
	 8Gxgj68BmvPJbGzVsx9Xobu/Z5wATrElmREPoRcwuc9tyq8zA19HdP75g8PeNPY6MJG9k
	 Dote++lr3as7tF8YRS7blRI/jFKroFnAFrvJODVE3aqNSeqTAii3PKemKa799lfezym/+
	 vx6XEbaRWthvsBkceMHAx9Jx8XofOconnH8fDoVC75APh/CnMrO0lleSmVw1o0494SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AikElyvL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995E606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AikElyvL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76411F000C5
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501354;
	bh=fM10J+gC33ICxBxjYGwXT7I0sb7PVdbEauW8Ew7fRaA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AikElyvLRjXWzt1UvxucUQELTdBKv4F/g1fqnIG1/AFQVT76iKN14hUQnmx1faweG
	 agtB5waUa9wox8UfsK/BrZKxJJl4kx2aYNsL0kzb/JXVSAaJ7nCikZkvd7aiW770sX
	 o4LrSJG7IJTN9nc3T4xWOoHvzBICLpl14FgF+DYUWVtWSeg3u5VzkLxot28sOk/PH1
	 GHZ0OttYgZ0GulWkzXkCBT3oRDju7y+Zn5hvMhLlitbCCYrZBz93FWiOUX5bPgGV57
	 Gg9CzsZDkV+4QjT267g09mvvU7BbqQpFY9KrzpiU1tTxgN9/xf2TqOtTsNPPg5Ifx6
	 JO73RhOgddg8Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so11898871fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:02:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuF8UoIf73bzgLuKCyCOPpo0EaZrDBZ7qayIaBnMcwxfLjtSH2WVlZPL6paCYyAXW3PrGtKsxj8Nuy@vger.kernel.org
X-Gm-Message-State: AFq9FYKi96WzKWhmUVgjwZPuetRoNPH1OZMENrI0NM40CbU+CiCHm/+N
	YrWPKP/8R4qfD+UqLK4JJCj4ZP+0N1VLKR2d15mqHmHzWBQDsx7hklpv2rQwIejcrsP5v6BsJZR
	sav8nGWC0lISvhwsXScBzFSD94yV3k6PQADNNOfHj5w==
X-Received: by 2002:a2e:be9f:0:b0:3ab:690f:829f with SMTP id
 38308e7fff4ca-3ab690f83e1mr3491281fa.15.1792501353453; Tue, 20 Oct 2026
 06:02:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:02:32 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:02:32 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261020003728.13669-10-vfazio@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <20261020003728.13669-10-vfazio@gmail.com>
Date: Tue, 20 Oct 2026 09:02:32 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdDNWEYkzGPMRw38CL2EE6p2meNJ636VxEgoqs93mdS1g@mail.gmail.com>
X-Gm-Features: AclHuK_qtumXwtjTDni9kglTIE1Ym7KW8cwUsqCuaDPYYgRCjyBCTFcktrR1dr0
Message-ID: <CAMRc=MdDNWEYkzGPMRw38CL2EE6p2meNJ636VxEgoqs93mdS1g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 09/14] bindings: python: chip: use literals for
 dict/list and declare types
To: Vincent Fazio <vfazio@gmail.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 02:37:23 +0200, Vincent Fazio <vfazio@gmail.com> said:
> Use literal constructors for dict ({}) and list ([]) and explicitly type
> the variables accordingly.
>
> There is no functional change here; just minor cleanup to squelch new
> linter warnings.
>
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---

I don't doubt this is the right think to do, otherwise you wouldn't have sent
it but could you just explain to a python noob why we need it?

Bart
