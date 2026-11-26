Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683177;
	b=WC3hmi8fvLU+rqsoptfyRJuEAvzrOaiP7pkdk64JzVlvf1AKBGwZPgb5VX8zjhV0HGkb
	 1tqESSxEyB0EaVj0wDNGODYz5Sj7gNFZS35R8hw+B26qyJCvLIk30OZaaGvZ7CQr60VUl
	 /vqIkDRjToFz9A3DhfCpheBG8FBvk6ZK0CAt06wo/OLVGNJEL96J5QVTbC7auB5jizyV0
	 PJEHW/KGZFF1Je0vOiFMLwp2y3jYIBy+Ke/ngYd6AqAdzJR4QukOyjwoTr7+kZLdLLkTq
	 TvWB6vj+/2QEok9H3YBroY3ZT+DeXwiCkLM1db/7SIqCdn5WJVLijfmfPRgZH2MNung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683177;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
	b=QkRUKEynNHCov32xLeM4o3IiGwjvQLFqo5C5A/rRZp4xVbeKYVd4EBIMAFJsWtoYyvxz
	 kgPFe4Cn8D4Q+1I8+zRYo1V2vIThEB9fLAhV0TvwJ6gXHSwpbWh/rYUCGLCFySL854ALF
	 OFUMDZVtB2wrOyBp0/C52G2Ot8NpbKUgABOhOpcCm7pPu1qaW4/tW1OcPksMyF9/gx6zk
	 itdpmILrIbILyWH+AKA2NCiRnAzE9Pl7fzufa6Fg4hEniH7p75A8vZt05p44Vi/1F7W6H
	 zEnnQtCjTnkXJxuZmnxsB3KvQTN7m9jlNzLpTIWK4LfIZKV0E+S5KmHuuaihcJFMTqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DE606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 08:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A71DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so4592930e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 00:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683175; x=1796287975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQC7n5UB+twTmoKbhuhV7McngclJ8wPtfQsYLymxWtQ=;
        b=zXK2f8Ctm1rLE7YAMu79IMg6ZcyRSpp6OXMO5H8Cj3Lr0q/+qCwDgbDIu0ADJSkYV4
         1xqE22SsGVoHFGGvgNXNtDJBHStkr41dPEVG95YhxFxNdLn2G6GCHDPX+BKvfGlyvufi
         i3ZPi2rjgqaUkX3kcoGvMv7kFmOvNPkFNUyKF3edV4mKE/IzDQQfD+QXnMOE8YLVd+Z4
         GTHwfSmqtA6zFjDc3dWgqXiFsBvZplM21D4DPpy+8onc2zwpkh5I6YAHjaKUOT0unA6K
         FaCl38Ldzw0iLwIDbwVRTmSC1fTfD2zzmVS2ZIAdMKcPMfSwnmL4b9yZiHMLrRa/XLuQ
         QDsw==
X-Forwarded-Encrypted: i=1; AL+hErFuIrJaZxiBZ9/WhKKNEAuWi1IxgMu+MBQ2TE/Rqz08jOUXYVIBaqtWOomIZVtJ0DsVkiFISb11ywYE@vger.kernel.org
X-Gm-Message-State: APuU4Z8FFhw9vFY34BBGehAbtvTYhdEOzIp2TBcLIHZu4tpriYGOJsLd
	WrJsOnqMRqADkkEc4C4YMGJQV+bWYyB5W2tinYhdqvCjb8q1MBoqAM5+juxWg9tO
X-Gm-Gg: AZFdTZei9rykeiG7n6XsNw1/R7301LobteTFmEgn3zBvVa1E+yGn1JtbWGCqrEPgN3z
	zZHohDSMHmNyfB3NjeNA5aGXoaHM218PlJA76vvzXWdLWqK4+DyODWtR+JlKXTOm3qnumR8lKOa
	AnXvLxdUWoFHtA9PWXGHh4rFayWoyLTpSXUmUBTEV0tzOOwPtjxOrug4LRdFadRXwbsMgM/7quq
	8wlSdHCCCf9Vqrs65Ke9hGVyVTcg4ApDruPmg5lCz2xhZbcNdm9t8YenrbAo+51sTyegsCknBCE
	eDvyET8xKRzOydxCQQ8cNIro8FLphypW9Mg4au7sNkVcWrZMk6GVmEYILJkSHHv9FEf2Ip0XyBd
	u4exddEKHlm4yvgtQa/Gv4loS79oMtr+iIkTgHbf+duR5K1ByjKQ1cRZz2wy+KnTD8Bcjh3l4vd
	l26IzFIlwtJRn49/tkFoN3ZbW4IHS8Rnv8pyzYUFyFpb+Q3AT2f48JbMWBl3cDDCmk6OlkffybH
	A28rLCsmmonNPYkEeXsyUrgAm9asGKf3f3QUN8YT4fWOFBZiN/YDqTnRjuPVfJF1Lp69A816w9D
	C2Gac2T9iFfDET0APcXxK73OpLsyOzTdcftL3bXQxAk664NSPnJFw4OZ8i4OU8KON70XAB2140g
	nKZzUkTmVHINcnJxh
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id 71dfb90a1353d-5ee8aecb450mr12178988e0c.8.1795683175555;
        Thu, 26 Nov 2026 00:52:55 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm21035783241.7.2026.11.26.00.52.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:52:55 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ee3e658c72so3821158e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 00:52:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHHGmwaV9Msjmg0N2Q04GEehqmr/ejXLtxWX6+AqRtLIi5OgI231NukKiEycEvgvOUkVhwRHDgnA6kc@vger.kernel.org
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12178985e0c.8.1795683175291; Thu, 26 Nov 2026
 00:52:55 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795639368.git.alx@kernel.org> <396395e1d02ca080da67cfd91a1c49058b2676b6.1795639368.git.alx@kernel.org>
 <awdaYz9NNVv5fHv9@ashevche-desk.local> <awddHt_xvc-lIygA@devuan>
In-Reply-To: <awddHt_xvc-lIygA@devuan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 09:52:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
X-Gm-Features: Aa3M54rOnub7bCh_NzEEm3acSwF_6HJABwfoziM7rtzTMFRTInpGyKc2wQ19vKo
Message-ID: <CAMuHMdX9gnV0beBEoh65FzPCwrQy=WpGtK5qKsOF3Tsv9iUj0w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] device property: Fix fwnode_name_eq() for empty
 node names
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Alejandro Colomar <alx@kernel.org>, 
	linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Andreas Schwab <schwab@linux-m68k.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On Wed, 25 Nov 2026 at 23:18, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:

> > Date: 2026-11-26 00:00:03+0200
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > On Wed, Nov 25, 2026 at 10:03:55PM +0100, Alejandro Colomar wrote:
> > > str_has_prefix() returns the prefix length on match and 0 on mismatch=
,
> > > so the mistmatch case can't be told from "empty prefix matched an emp=
ty
> > > string".
> > >
> > > For instance: the OF root node's name as returned by
> > > fwnode_get_name() is "" and will return 0 for any name matched agains=
t
> > > it and since len is 0 too, fwnode_name_eq() will return true.
> > >
> > > Let's use strprefix() instead, which also makes this function simpler=
.
> >
> > ...
> >
> > > Message-ID: <avrSUUM3HMgxTNpl@kekkonen.localdomain>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> > > Message-ID: <nat4ilqmzzpuyrjbuahl367ip22tfnmjorydlppuwqiscxaujo@kf63j=
4lb3flk>
> >
> > What is this?
>
> git-am(1) has --message-id and the corresponding am.messageId, which
> stores the Message-ID from the email header field from which the patch
> is taken, to document where the patch was taken from.  It is stored by
> git-am(1) right below the last trailer tag from the patch (which should
> be the 'Signed-off-by' of the author), and before the 'Signed-off-by'
> appended by git-am(1) itself.
>
>         $ MANWIDTH=3D64 man git-am | grep -A5 messageId
>              am.messageId
>                  Add a Message-ID trailer based on the email header to
>                  the commit when using git=E2=80=90am(1) (see git=E2=80=
=90interpret=E2=80=90
>                  trailers(1)). See also the --message-id and
>                  --no-message-id options.
>
> It's useful to document where those tags come from, in case it's
> historically useful.
>
> I've extended its use to other tags I take from emails.
>
> > Is it documented tag nowadays?
>
> It is not documented in the kernel, AFAIK.  It is documented in
> git-am(1).  I included it, because I find it useful.  Feel free to drop
> it if it's not wanted (I can remove in in v8 if it's not wanted).

Please drop them, the tooling (b4) can find the origin regardless.

BTW, the kernel way to link to emails in commits is using Link:-tags, e.g.
Link: https://lore.kernel.org/avrSUUM3HMgxTNpl@kekkonen.localdomain

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
