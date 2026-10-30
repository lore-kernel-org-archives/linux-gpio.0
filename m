Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361909;
	b=qYArwX6MVfjtwLMDaXtiZqxaQic3KWVX+/v0m8ijMINzo3C9+rdXEhA4yHhQKIpUJp/h
	 IxGukHeJVvj6clHHM3RREsyHd5wAcjUU1aSeXGdLbgm9cRK72zkjCOzPKun9jrw39V2cW
	 27YsvVEjzQEPLNueQE798/iTugbc7JE93MugobZeBfAqGi9MkSn82cbBCTbGV+ELpsm8L
	 WptRbZ8UdMF793XZc5rWIX3ll1EL4XOSYhC15/izVKG4COacHqfZvGeT+VeAvFYtKS8ST
	 VeUDA64ffrec7pFw5xDgqWN5pepeUZg/NU9AFFqObs9PU5mLfIlpu7jAcOWVTUHBaRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MKEdR6MwTpftZ6HWG3VgYEs6WlAERRjWBT/IE5pl+qs=;
	b=rqV3v8rh857EOzCIoae98kWWIYKZjI+O/E4DwcECO7CmdKOgqStUdvWIscWHYsyaVEpC
	 BnBLcdpNskHVxpIr7mdHjNqwg2k7FnKzHKPYYj891wXAeoHwnYh6W1obewyibP8a/Eqos
	 v3MkKUdzDA8u3n7ij7sgBWbg/5ag6CNSLlcun1umgddsYFWL4CJCM209u0MSLamvjuo/o
	 G2+78xeHMYbnf0vmRqzQZhMd9ur15TUQ8aUdqnY16KrZonafe1opp/tj/b36Dzyu+5Si9
	 YeiHMvZdQVqjuNT66DD2VGVB/P7u9QNmq6OQG4SL+rvYbjqlBloar80G6plL+Xwva4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=wnTWUNcT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4041606A338
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 12:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4041606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=wnTWUNcT
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b486e1d02eso767840a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 05:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793361907; cv=none;
        d=google.com; s=arc-20260327;
        b=KoeewtKnAESrFa0iIJUpnLVyFBdrkuA3PagwHuymXt1+m18Osm1INoitriGqekPJJe
         Zj/h7WPvgS1R8cwrRvFe42eaJhWNimPQZxAEpeXEc9htoJz2quBvphArUK//ni9NGcbo
         ewRPmY8F2wrngRzkVtlttmEBG/d9hDdSq1X6oZ3Dxuq14vtcthecNwmvUDJGQjH1y1m8
         wr5EdTTEFnBf6PDPiCbekWnFxwsDRhu4GYi/RayDWunNGYfdALC59lNSXNrfuFQK6xAC
         FZ3tCfisdPQdpKoQGgUAPuGDScBzVaPce403vnboZ2cW1r+71LUueWpPy7N1VDMe+zL5
         WTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKEdR6MwTpftZ6HWG3VgYEs6WlAERRjWBT/IE5pl+qs=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=m4e6IKuW+mli6iSSa9s+IP5jMHECV5pfPb01J6X4YxkePBhyxeYuviuKDLATOEGPri
         w33sx1Vhm/7vcUM5CRXQSAGNjk3KMqfQES4NitVBjqu8eI1D7JjowaGKMUpdbVreZTRX
         QSxlHuWz+0qqIGfzWvsBC03ExW4KHPCJCITTblaj5x4Sv7Iy1RlsR/bt9/a7ugHA7QW8
         2dDgHK89nHcLMwfaVz67A80TB60JJ7Eh25sr/T0FRVvIL2Zy9dO98VAXyK19q2tRSNe3
         KLMK+lwG1zrRmYbWzEWeRAUPanr+aTvqXIXH37j2rb99Utnxlkkf58u8ItbW9lH4VNm8
         QN4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793361907; x=1793966707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKEdR6MwTpftZ6HWG3VgYEs6WlAERRjWBT/IE5pl+qs=;
        b=wnTWUNcTNvNE9M6yaax7HRAsC7hVSJc1cNYeZ5Gqgvd8NMuxQB2Ux9E0AqL3HnvvHS
         izDrpnJo/an13KqWYQycQ1zN8araqq7wQQSJMlxdARxB0uVHUbLkNlL6rfL4YQsLAqRk
         DJjQ3W7gjoJBolCqJJAIlcN0Vozt2vbzUAuWqzdShPHQDJi4VyZ2BAhjmfrJnV7VoErF
         rLXzJgWBVBPVm8P6lUrUCIGzw1JFjllSMeYlmZe57yY+JcxWVBjeNqiRq8KZdNwzgKz4
         CTSogdROlJCxzkADF0N1vSJMEfXuNPmK2Mq8g2ClynNoVthyW9xDFocft9m1hMubsJwd
         3pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361907; x=1793966707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKEdR6MwTpftZ6HWG3VgYEs6WlAERRjWBT/IE5pl+qs=;
        b=TNf+TDEcSpwuJhcFqiIHLEdkgtQZahwgMPrHOvdq3r+F+QPZNgU045LSTFc52TtKja
         SNVnRfsEpnKpRNXLKiEdLwX6Pl19D/c9nTCCxdlN/8lY7aQetTfJQsiMmOYQZFOJPcLr
         gFF0JUppSk+6WnrYueof7q5R20Fu6ihJ808CTzzaaQ8JjnMNVc251GHCdJ7qoazdYcAk
         193VHerAzta5pyPB7HIV1g6VhzT79JYBw9+yZ+f5AL0eMD8Jah4EnvP6V8UK5LQ0KPya
         z4XHmmNs6acbE+7qIkznCwzciVDzVCX9s6UVW0X/Z5rcCKmpqrqUY0l/WihgbdM4F8/a
         iVrw==
X-Gm-Message-State: AFq9FYK6xz/S/hb43rVi97NcyVq/dhzq0SMdvcPReFUxDP74OsRJy3go
	0X6S/HNxzeSSv6toPoI5QuinHA/ytTqaSFos9WIwrBo/k/IaORU1yib/yp91QZcVjYd43tHZwn0
	He0UKCUWtsmKoOZaI+K6sI0gI1GsDUqY=
X-Gm-Gg: AYBFou06LiDAn623ljycYSesQewIsYDzLGkOjupOE7BXobGNjZ0EMy5DUpimMBSthOQ
	PM2mTbrLro3L45FCNY5QmQDMLf/RygJsH2lR4fUKCqw7cU2UTAJOrOwtjsJSGRfQrnyRUEjcsxf
	+Ji72j/oQBxRlWJMJAMxLnd21WrXs1BTqduJckvyRxSLM8+FrHRbAVJHDMri8r3NSDmKALSuSYh
	IK3o9D7ddRyfZyvII5m8MckEIWv5nYPgV5/qAFggVzo9id9oGsvE5JW3g5ZBWcOhKC3ww7kZnfq
	A5kZfNeFxN7Y9dI0JDjj6gE3hRLLuYctERi61il5QdIaMRsCKfB2SeT40dVHFcawOPPIYfP2eBR
	dYJXpoEho5lyjl4Pia7xwvXej3r6Y8WNnZckF+Q==
X-Received: by 2002:a05:6402:a505:10b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b4d5537ae9mr978700a12.30.1793361906937; Fri, 30 Oct 2026
 05:05:06 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024123124.3700266-1-yegorslists@googlemail.com>
 <20261030104631.1044556-1-yegorslists@gmail.com> <z6uzdpsuwffjjlca5isgrznpxzlbmfgc5rryvw7keb37r5xogf@aiw7cjkayux6>
 <CAGm1_ktZLP4UrSfie0FOybLX=p3dPodyvg-SmucFtm-2u32ryw@mail.gmail.com> <if2xlew7mmnmc7svjesuycgxfpkkmbckc67fe77dnoeuhmiopo@c6jw6damflxf>
In-Reply-To: <if2xlew7mmnmc7svjesuycgxfpkkmbckc67fe77dnoeuhmiopo@c6jw6damflxf>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 30 Oct 2026 13:05:33 +0100
X-Gm-Features: AclHuK_3AUqrGkK6OxarzSfDGCTxneu0Qe0YyY6Nhm2uoj5D2QidL5nJNNUb_lQ
Message-ID: <CAGm1_kuvESfDh4fsvNeQSBWRqgrGXi12iEw3NtnL+TcQdOcHUw@mail.gmail.com>
Subject: Re: [PATCH libgpiod v3] build: honor default_library for the
 installed libraries
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:51=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, Oct 30, 2026 at 12:39:07PM +0100, Yegor Yefremov wrote:
> > On Fri, Oct 30, 2026 at 12:24=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > >
> > > On Fri, Oct 30, 2026 at 11:46:31AM +0100, Yegor Yefremov wrote:
> > > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > > >
> > > > The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib,
> > > > libgpiodbus and libgpiosim) are built with both_libraries(), so the
> > > > shared variant is always built, even with -Ddefault_library=3Dstati=
c.
> > > > When the toolchain or the environment requests a fully static link
> > > > (e.g. LDFLAGS=3D-static, as done by Buildroot for static-only build=
s),
> > > > linking the shared library then fails:
> > > >
> > > >   FAILED: lib/libgpiod.so.3.1.2
> > > >   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' c=
an not be used when making a shared object; recompile with -fPIC
> > > >
> > >
> > > This is a reply to a previous thead again. :(
> >
> > My bad. The In-Reply-To was embedded into the patch file so I missed it=
 :-(
> >
>
> Please consider using b4 for managing patches.

Interesting tool. Thanks for the hint.

Yegor
